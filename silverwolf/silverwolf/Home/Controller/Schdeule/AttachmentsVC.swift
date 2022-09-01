//
//  AttachmentsVC.swift
//  silverwolf
//
//  Created by Mac on 11/04/22.
//

import UIKit
import Foundation
import Alamofire
import SDWebImage
import Floaty
import MobileCoreServices
import UniformTypeIdentifiers

class AttachmentsVC: UIViewController {

    //MARK: Outlets, Variables
    
    //Api linkings
    let viewModel: AttachmentViewModel = AttachmentViewModel()
    var attachmentData = [AttachmentDataResponseModelElement]()
    
    //collectionView outlets
    @IBOutlet var collectionviewPhotos: UICollectionView!
    @IBOutlet var collectionviewDocuments: UICollectionView!
    
    @IBOutlet var documentsButton: UIButton!
    @IBOutlet var photosButton: UIButton!
    
    //Animation button view variable
    @IBOutlet var mainVw: UIView!
    @IBOutlet var uploadButton: UIButton!
    var isclicked: Bool! = true
    
    //Upload Document and Image Outlets
    @IBOutlet var imageViewBrowse: UIImageView!
    @IBOutlet var btnBrowse: UIButton!
    var imagePicker = UIImagePickerController()
    var image = UIImage()
    
    //Float Buttons
//    let actionButton = JJFloatingActionButton()
//    let dButton = JJFloatingActionButton()
//    let floaty = Floaty()
    @IBOutlet var floaty: Floaty!
    var projectId = Int()
    
    // Array of files
    var arrFiles: [Files] = []
    var arrPhotos: [Files] = []
    var dictMyContact = [String:Any]()
    
    //View Upload Buttons, views, textfeild Outlets
    @IBOutlet var vwUpload: UIView!
    @IBOutlet var lblUpload: UILabel!
    @IBOutlet var vwFile: UIView!
    @IBOutlet var imgFile: UIImageView!
    @IBOutlet var lblFile: UILabel!
    @IBOutlet var txtFieldEFN: UITextField!
    @IBOutlet var txtFieldF: UITextField!
    @IBOutlet var btnRenovation: UIButton!
    @IBOutlet var btnAddTag: UIButton!
    @IBOutlet var btnCancel: UIButton!
    @IBOutlet var btnDone: UIButton!
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        LoadingFirst()
        getAttachment()
        getAttachmentPhotos()
    }
    
    //Button action
    @IBAction func documentsTapped(_ sender: Any) {
        documentsButton.backgroundColor = UIColor.black
        documentsButton.tintColor = UIColor.white
        photosButton.backgroundColor = UIColor.white
        photosButton.tintColor = UIColor.black
        collectionviewDocuments.isHidden = false
        collectionviewPhotos.isHidden = true
        isclicked = true
    }
    @IBAction func photosTapped(_ sender: Any) {
        photosButton.backgroundColor = UIColor.black
        photosButton.tintColor = UIColor.white
        documentsButton.backgroundColor = UIColor.white
        documentsButton.tintColor = UIColor.black
        collectionviewPhotos.isHidden = false
        collectionviewDocuments.isHidden = true
        isclicked = false
    }
    
    //Buttons On the View Uploads
    @IBAction func btnBrowseTapped(_ sender: Any) {
        if isclicked == true {
            openDocuments()
        }
        else {
            openPhotos()
        }
    }
    @IBAction func renovationTapped(_ sender: Any) {
        
        
    }
    @IBAction func AddTagTapped(_ sender: Any) {
        let file = "(\(UUID().uuidString).txt)"
        let contents = "Some Text...."
        let contents1 = "Hello....."
        let contents2 = "Some Text Here...."
        let contents3 = "Hey....."
        
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = dir.appendingPathComponent(file)
        
        do {
            try contents.write(to: fileURL, atomically: false, encoding: .utf8)
            try contents1.write(to: fileURL, atomically: false, encoding: .utf8)
            try contents2.write(to: fileURL, atomically: false, encoding: .utf8)
            try contents3.write(to: fileURL, atomically: false, encoding: .utf8)
            print("Success")
        }
        catch {
            print("Error: \(error)")
        }
    }
    @IBAction func cancelTapped(_ sender: Any) {
        vwUpload.isHidden = true
        mainVw.isHidden = true
    }
    @IBAction func doneTapped(_ sender: Any) {
        if isclicked == true {
            openDocuments()
        }
        else {
 //           uploadAttachmentPhotos()
            let dictbody = ["projectID":"432","DocumentPathType":"Documents","FolderPath":"/"]
            uploadImage(params: dictbody,img: imageViewBrowse.image!)
//            fetchLeadCardDetails(CaptureImage: image as? UIImage)
        }
    }
    
//    @IBAction func uploadButtonTapped(_ sender: Any) {
//            mainVw.isHidden = false
//            vwUpload.isHidden = false
//            if isclicked == true {
//                self.lblUpload.text = "Upload Documents"
//
//                self.vwFile.backgroundColor = UIColor(hexaString: "#ADD8E6")
//                self.vwFile.layer.borderColor = UIColor.blue.cgColor
//
//                self.imgFile.image = UIImage(systemName: "doc.fill")
//
//                self.lblFile.text = "Browse your file here"
//
//                self.txtFieldF.placeholder = "Folder"
//                self.txtFieldEFN.placeholder = "Enter File Name"
//
//                self.btnRenovation.setTitle("renovation", for: .normal)
//                self.btnRenovation.tintColor = UIColor.link
//
//                self.btnAddTag.setTitle("+ Add Tag", for: .normal)
//                self.btnAddTag.tintColor = UIColor.tertiaryLabel
//
//                self.btnCancel.setTitle("Cancel", for: .normal)
//                self.btnCancel.tintColor = UIColor.black
//
//                self.btnDone.setTitle("Done", for: .normal)
//                self.btnDone.backgroundColor = UIColor.black
//                self.btnDone.tintColor = UIColor.white
//
//            } else {
//                self.lblUpload.text = "Upload Images"
//
//                self.vwFile.backgroundColor = UIColor(hexaString: "#ADD8E6")
//
//                self.imgFile.image = UIImage(systemName: "photo.fill")
//
//                self.lblFile.text = "Browse your file here"
//
//                self.txtFieldF.placeholder = "Folder"
//                self.txtFieldEFN.placeholder = "Enter File Name"
//
//                self.btnRenovation.setTitle("renovation", for: .normal)
//                self.btnRenovation.tintColor = UIColor.link
//
//                self.btnAddTag.setTitle("+ Add Tag", for: .normal)
//                self.btnAddTag.tintColor = UIColor.tertiaryLabel
//
//                self.btnCancel.setTitle("Cancel", for: .normal)
//                self.btnCancel.tintColor = UIColor.black
//
//                self.btnDone.setTitle("Done", for: .normal)
//                self.btnDone.backgroundColor = UIColor.black
//                self.btnDone.tintColor = UIColor.white
//            }
//    }
}

extension AttachmentsVC {
    
    //Api Fetch
    func getAttachment(){
        dictMyContact = ["ProjectId": projectId, "DocumentPathType": "Documents", "FolderPath": "/"]
        viewModel.getAttachmentData(dictParam: dictMyContact) { [self] (model) in
            self.arrFiles = model?.ProjectData?.Files ?? []
            DispatchQueue.main.async {
                self.collectionviewDocuments.reloadData()
            }
//                print(arrFiles)
        }
    }
    
    func getAttachmentPhotos(){
        dictMyContact = ["ProjectId": projectId, "DocumentPathType": "Documents", "FolderPath": "/Photos/"]
        viewModel.getAttachmentData(dictParam: dictMyContact) { [self] (model) in
            self.arrPhotos = model?.ProjectData?.Files ?? []
            DispatchQueue.main.async {
                self.collectionviewPhotos.reloadData()
            }
                print(arrPhotos)
        }
    }
    func uploadAttachmentDocuments(){
        dictMyContact = ["projectID": projectId, "DocumentPathType": "Documents", "FolderPath": "/", "docfile": ""]
        viewModel.uploadAttachmentData(dictParam: dictMyContact) { (model) in
            print(model ?? "")
        }
    }
    func uploadAttachmentPhotos(){
        dictMyContact = ["projectID": projectId, "DocumentPathType": "Documents", "FolderPath": "/", "docfile": "\(image)"]
        viewModel.uploadAttachmentData(dictParam: dictMyContact) { (model) in
            print(model ?? "")
        }
    }
    
    //viewDidLoad functions
    func LoadingFirst() {
        
        //Cell Register (Documents and Photos)
        collectionviewDocuments.register(UINib(nibName: "AttachmentsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AttachmentsCollectionViewCell")
        collectionviewPhotos.register(UINib(nibName: "AttachmentsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AttachmentsCollectionViewCell")
        
        //View
        vwUpload.layer.cornerRadius = 5
        
        //Button Function
        Button()
    }
    func Button() {

        //Button UI
        documentsButton.layer.cornerRadius = 10
        photosButton.layer.cornerRadius = 10

        //Float Button
        
        let item = floaty.addItem(icon: UIImage(named: "upload"), handler: { [self] item in
            
            mainVw.isHidden = false
            vwUpload.isHidden = false
            
            //For Documents
            if isclicked == true {
                self.lblUpload.text = "Upload Documents"
                
                self.vwFile.backgroundColor = UIColor(hexaString: "#ADD8E6")
                self.vwFile.layer.borderColor = UIColor.blue.cgColor
                
                self.imgFile.image = UIImage(systemName: "doc.fill")
                
                self.lblFile.text = "Browse your file here"
                
                self.txtFieldF.placeholder = "Folder"
                self.txtFieldEFN.placeholder = "Enter File Name"
                
                self.btnRenovation.setTitle("renovation", for: .normal)
                self.btnRenovation.tintColor = UIColor.link
                
                self.btnAddTag.setTitle("+ Add Tag", for: .normal)
                self.btnAddTag.tintColor = UIColor.tertiaryLabel
                
                self.btnCancel.setTitle("Cancel", for: .normal)
                self.btnCancel.tintColor = UIColor.black
                
                self.btnDone.setTitle("Done", for: .normal)
                self.btnDone.backgroundColor = UIColor.black
                self.btnDone.tintColor = UIColor.white
            }
            //For Photos
            else {
                self.lblUpload.text = "Upload Images"
                
                self.vwFile.backgroundColor = UIColor(hexaString: "#ADD8E6")
                
                self.imgFile.image = UIImage(systemName: "photo.fill")
                
                self.lblFile.text = "Browse your file here"
                
                self.txtFieldF.placeholder = "Folder"
                self.txtFieldEFN.placeholder = "Enter File Name"
                
                self.btnRenovation.setTitle("renovation", for: .normal)
                self.btnRenovation.tintColor = UIColor.link
                
                self.btnAddTag.setTitle("+ Add Tag", for: .normal)
                self.btnAddTag.tintColor = UIColor.tertiaryLabel
                
                self.btnCancel.setTitle("Cancel", for: .normal)
                self.btnCancel.tintColor = UIColor.black
                
                self.btnDone.setTitle("Done", for: .normal)
                self.btnDone.backgroundColor = UIColor.black
                self.btnDone.tintColor = UIColor.white
            }
            floaty.close()
            
        })
        item.buttonColor = UIColor.red
        self.view.bringSubviewToFront(floaty)

        floaty.tintColor = UIColor.red

    }
    func openPhotos()
    {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    func openDocuments()
    {
        let documentPicker = UIDocumentPickerViewController(documentTypes: [kUTTypeFolder as String], in: .open)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        present(documentPicker, animated: true, completion: nil)
    }
}

extension AttachmentsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //CollectionView Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionviewPhotos {
            return arrPhotos.count
        }
        else {
            return arrFiles.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AttachmentsCollectionViewCell", for: indexPath) as! AttachmentsCollectionViewCell
        if collectionView == self.collectionviewPhotos {
            if arrPhotos.count > 0
            {

                if !(arrPhotos[indexPath.row].IsFile!) {
                    cell.FolderImage.image = UIImage(systemName: "folder.fill")
                }
                else
                {
                    cell.FolderImage.image = UIImage(named: "Image")
                    
                }
                cell.FolderName.text = arrPhotos[indexPath.row].Name ?? ""
            }
        }
        else {
            if arrFiles.count > 0
            {
                if !(arrFiles[indexPath.row].IsFile!) {
                    cell.FolderImage.image = UIImage(systemName: "folder.fill")
                }
                else
                {
                    cell.FolderImage.image = UIImage(systemName: "doc.fill")
                }
                cell.FolderName.text = arrFiles[indexPath.row].Name ?? ""
            }
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionviewPhotos {
            return CGSize(width: self.collectionviewPhotos.frame.size.width / 3 - 10, height: 150.0)
        }
        else {
            return CGSize(width: self.collectionviewDocuments.frame.size.width / 3 - 10, height: 150.0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionviewPhotos {
            print("\(arrPhotos[indexPath.row].Name ?? "")")
        }
        else {
            print("\(arrFiles[indexPath.row].Name ?? "")")
            let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "AttachmentsFilesVc") as? AttachmentsFilesVc
            vc?.arrResponse = self.arrFiles[indexPath.row]
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}
extension AttachmentsVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageViewBrowse.image = image
            self.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }

}
extension AttachmentsVC: UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let selectedFileURL = urls.first else {
            return
        }
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let sandboxFileURL = dir.appendingPathComponent(selectedFileURL.lastPathComponent)
        
        if FileManager.default.fileExists(atPath: sandboxFileURL.path) {
            print("Already Exist")
        }
        else {
            do {
                try FileManager.default.copyItem(at: selectedFileURL, to: sandboxFileURL)
                imageViewBrowse.isHidden = true
                self.lblFile.text = "Folder"
                self.imgFile.image = UIImage(systemName: "folder.fill")
                print("File copied")
            }
            catch {
                print("Error: \(error)")
            }
        }
    }
 }
extension AttachmentsVC {
    
    //Upload Image
    func uploadImage(params:[String:Any],img:UIImage)
    {
               var userdata = NSData()
               if img != nil
               {
                   let compressedimage = compressedImage(img:img)
                   userdata = (compressedimage.pngData()! as Data?)! as NSData
               }
               let objRequest = RequestManager()
               let realURL: URL = URL(string: APIUrl.UserApis.attachmentUploadData)!
               let url: Alamofire.URLConvertible = realURL
               let urlRequest: Alamofire.URLRequestConvertible = URLRequest(url: realURL)
               objRequest.upload(image: userdata as Data, to: urlRequest, params: params)
    }
    func compressedImage(img:UIImage) -> UIImage {

            let oldImage = img
            var imageData =  Data(oldImage.pngData()!)
            print("***** Uncompressed Size \(imageData.description) **** ")
            imageData = oldImage.jpegData(compressionQuality: 0.090)!
            print("***** Compressed Size \(imageData.description) **** ")
            let image = UIImage(data: imageData)
            return image!

        }
    
//    func fetchLeadCardDetails(CaptureImage: UIImage?) {
//
//            let url = APIUrl.UserApis.attachmentUploadData
//            let dictbody = ["projectID":"432","DocumentPathType":"Documents","FolderPath":"/"]
//            guard let selectedImage = CaptureImage else { return }
//            RequestManager().requestCommonPostMultipartMethod(strAPIName: url, strMethodType: "POST", profileImage: selectedImage,parms:dictbody) { (result, isSuccess, error) in
//                let executionTime = Date().timeIntervalSince(Date())
//                print("Execution Time\(executionTime)")
//                DispatchQueue.main.async {
//                        if isSuccess
//                        {
//                        }
//                        else
//                        {
//
//                        }
//                    }
//
//                 }
//        }
}
