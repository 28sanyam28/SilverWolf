//
//  ScheduleDetailsVC.swift
//  silverwolf
//
//  Created by Mac on 11/04/22.
//

import UIKit

class ScheduleDetailsVC: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var lblCompanyName: UILabel!
    
    @IBOutlet weak var containerDetails: UIView!
    @IBOutlet weak var containerSSA: UIView!
    @IBOutlet weak var containerAttachments: UIView!
    
    
    
    var name = String()
    var projectID = Int()
    var ID = Int()
    var EmployeeId = Int()
    var TaskId = Int()
    var JobId = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblCompanyName.text = name
        add(asChildViewController: detailsVC, views: containerDetails)
        setupView()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("test")
    }
    
    @IBAction func actionOnBtnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
    
    private func setupView() {
        setupSegmentedControl()
        segmentedControl.defaultConfiguration()
        // or provide paramater as per your requirement
        segmentedControl.selectedConfiguration(color: .red)
    }
    
    private func setupSegmentedControl() {
        // Configure Segmented Control
        segmentedControl.removeAllSegments()
        segmentedControl.insertSegment(withTitle: "Details", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "SSA", at: 1, animated: false)
        segmentedControl.insertSegment(withTitle: "Attachments", at: 2, animated: false)
        segmentedControl.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)

        // Select First Segment
        segmentedControl.selectedSegmentIndex = 0
    }
    
    @objc func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }
    
    private lazy var detailsVC: DetailVC = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)

        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        viewController.projectID = projectID
        viewController.ID = ID
        viewController.EmployeeId = EmployeeId
        viewController.TaskId = TaskId
        viewController.JobId = JobId
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController, views: containerDetails )

        return viewController
    }()

    private lazy var sSAVC: SSAVC = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)

        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "SSAVC") as! SSAVC

        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController, views: containerSSA)

        return viewController
    }()
    
    private lazy var attachmentsVC: AttachmentsVC = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)

        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "AttachmentsVC") as! AttachmentsVC
        viewController.projectId = projectID

        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController, views: containerAttachments)

        return viewController
    }()

    
    private func add(asChildViewController viewController: UIViewController,views:UIView) {
        // Add Child View Controller
        addChild(viewController)

        // Add Child View as Subview
        views.addSubview(viewController.view)

        // Configure Child View
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)

        // Remove Child View From Superview
        viewController.view.removeFromSuperview()

        // Notify Child View Controller
        viewController.removeFromParent()
    }
    
    private func updateView() {
        if segmentedControl.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.containerDetails.alpha = 1
                self.containerSSA.alpha = 0
                self.containerAttachments.alpha = 0
                self.remove(asChildViewController: self.sSAVC)
                self.remove(asChildViewController:  self.attachmentsVC)
                self.add(asChildViewController: self.detailsVC, views: self.containerDetails)
                       })
        } else if segmentedControl.selectedSegmentIndex == 1{
            UIView.animate(withDuration: 0.5, animations: {
                self.containerSSA.alpha = 1
                self.containerDetails.alpha = 0
                self.containerAttachments.alpha = 0
                self.remove(asChildViewController:  self.detailsVC)
                self.remove(asChildViewController:  self.attachmentsVC)
                self.add(asChildViewController: self.sSAVC, views: self.containerSSA)
                       })
        }else {
            UIView.animate(withDuration: 0.5, animations: {
                self.containerAttachments.alpha = 1
                self.containerSSA.alpha = 0
                self.containerDetails.alpha = 0
                self.remove(asChildViewController:  self.detailsVC)
                self.remove(asChildViewController:  self.sSAVC)
                self.add(asChildViewController: self.attachmentsVC, views: self.containerAttachments)
                       })
        }
    }
    
//    func setupView() {
//        setupSegmentedControl()
//
//        updateView()
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
