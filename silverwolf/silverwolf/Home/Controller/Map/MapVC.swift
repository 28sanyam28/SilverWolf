//
//  MapVC.swift
//  silverwolf
//
//  Created by apple on 08/06/22.
//

import UIKit
import MapKit
import GoogleMaps

class MapVC: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    
    //Outlets
    @IBOutlet var viewMap: UIView!
    @IBOutlet var navigationButton: UIButton!
    //Models
    let mapViewModel: MapViewModel = MapViewModel()
    var mapData = [MapDataResponseModelElement]()
    
    //Map Outlets and Variables
    var markers = [GMSMarker]()
    @IBOutlet var mapView: GMSMapView!
    var locationManager = CLLocationManager()
    var isClicked: Bool!
    var buttonOption: Bool = false
    
    var SProjectId = Int()
    
    var annotationLocations: [MapDataResponseModelElement] = []
    var annotationLocation: MapDataResponseModelElement?
    var currentLat:CLLocationDegrees?
    var currentLong:CLLocationDegrees?
    var currentMarkerData:MapDataResponseModelElement?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        navigationButton.isHidden = true
        if isClicked == true {
            getMap()
        }
        else {
            getSingleMap()
        }
        if buttonOption == false{
            navigationButton.isHidden = true
        }
    }
    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnNavigationTapped(_ sender: Any) {
        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {  //if phone has an app

            if let url = URL(string: "comgooglemaps-x-callback://?saddr=&daddr=\(currentMarkerData?.lat ?? 0.0),\(currentMarkerData?.lng ?? 0.0)&directionsmode=driving") {
                            UIApplication.shared.open(url, options: [:])
                   }}
              else {
                     //Open in browser
                  if let urlDestination = URL.init(string: "https://www.google.co.in/maps/dir/?saddr=&daddr=\(currentMarkerData?.lat ?? 0.0),\(currentMarkerData?.lng ?? 0.0)&directionsmode=driving") {
                                       UIApplication.shared.open(urlDestination)
                                   }
                        }

                }
    @IBAction func gestureClicked(_ sender: Any) {
        navigationButton.isHidden = true
    }
}

extension MapVC {
    func showLocationsOnMap(){
        
        let camera = GMSCameraPosition.camera(withLatitude: annotationLocations[0].lat ?? 0.0, longitude: annotationLocations[0].lng ?? 0.0, zoom: 1.0) //Set default lat and long
        
        DispatchQueue.main.async { [self] in
            
            mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: self.viewMap.frame.size.width, height: self.viewMap.frame.size.height), camera: camera)
            mapView.delegate = self
            
                self.viewMap.addSubview(mapView!)
            
                for data in annotationLocations{
                    
                    let location = CLLocationCoordinate2D(latitude: data.lat ?? 0.0, longitude: data.lng ?? 0.0)
                    let newMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: data.lat ?? 0.0, longitude: data.lng ?? 0.0))
                    markers.append(newMarker)
                    print("location: \(location)")
                    let marker = GMSMarker()
                    marker.position = location
                    marker.userData = data
                    marker.title = data.SiteName!
                    marker.snippet = data.Address!
                    marker.map = mapView
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        self.showLocationsOnMap()
        self.showLocationOnMap()
    }
    
    func getMap(){
//        let dictMyContact = [String: Any]()
        let key = "empId"
        if let retrievedCodableObject = UserDefaults.standard.object(forKey: key) {
            mapViewModel.getMapData(dictParam: "\(retrievedCodableObject)") { [self] (model) in
                self.annotationLocations = model ?? []
                print(annotationLocations)
                
                showLocationsOnMap()

            }
        }
    }
    func showLocationOnMap(){
        
        let camera = GMSCameraPosition.camera(withLatitude: annotationLocation?.lat ?? 0.0, longitude: annotationLocation?.lng ?? 0.0, zoom: 1.0) //Set default lat and long
        
        DispatchQueue.main.async { [self] in
            
            mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: self.viewMap.frame.size.width, height: self.viewMap.frame.size.height), camera: camera)
            mapView.delegate = self
            
                self.viewMap.addSubview(mapView!)
                    
                    let location = CLLocationCoordinate2D(latitude: annotationLocation?.lat ?? 0.0, longitude: annotationLocation?.lng ?? 0.0)
                    let newMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: annotationLocation?.lat ?? 0.0, longitude: annotationLocation?.lng ?? 0.0))
                    markers.append(newMarker)
                    print("location: \(location)")
                    let marker = GMSMarker()
                    marker.position = location
                    marker.userData = annotationLocation
                    marker.title = annotationLocation?.SiteName
                    marker.snippet = annotationLocation?.Address
                    marker.map = mapView
        }
    }
    func getSingleMap(){
        let dictMyContacts = SProjectId
        mapViewModel.getSingleMapData(dictParam: dictMyContacts) { [self] (model) in
            self.annotationLocation = model
            print(annotationLocation!)
            showLocationOnMap()

        }
    }
}
extension MapVC {
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        buttonOption = true
        let view = Bundle.main.loadNibNamed("MarkerWindow", owner: self, options: nil)![0] as! MarkerWindow
        
        let data = marker.userData as? MapDataResponseModelElement
//        let location = CLLocationCoordinate2D(latitude: marker.position.latitude, longitude: marker.position.longitude)
        currentMarkerData = data
        if SProjectId>0 {
            view.PostalCode.text = "\(SProjectId)"
        }
        else {
            view.PostalCode.text = data?.PostalCode
        }
        view.SiteName.text = data?.SiteName
        view.Address.text = data?.Address
        
        let frame = CGRect(x: 0, y: 0, width: 250, height: 150)
        view.frame = frame
        navigationButton.isHidden = false
        return view
    }
    func mapView(_ mapView: GMSMapView, didTap overlay: GMSOverlay) {
        
    }
    func mapView(_ mapView: GMSMapView, didCloseInfoWindowOf marker: GMSMarker) {
        navigationButton.isHidden = true
    }
}
