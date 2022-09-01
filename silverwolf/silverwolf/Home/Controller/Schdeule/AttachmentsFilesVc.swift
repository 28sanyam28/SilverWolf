//
//  AttachmentsFilesVc.swift
//  silverwolf
//
//  Created by apple on 20/06/22.
//

import UIKit

class AttachmentsFilesVc: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var backgroundLabel: UILabel!
    
    let viewModel: AttachmentViewModel = AttachmentViewModel()
    var attachmentData = [AttachmentDataResponseModelElement]()
    var arrFiles: [Files] = []
    var arrResponse: Files?
    var dictMyContact = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "FilesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FilesCollectionViewCell")
        getAttachment()
        
        print(arrResponse)
    }

    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension AttachmentsFilesVc: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //Collection View Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrFiles.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilesCollectionViewCell", for: indexPath) as! FilesCollectionViewCell
        if arrFiles.count > 0
        {
            if !(arrFiles[indexPath.row].IsFile!) {
                cell.fileImage.image = UIImage(systemName: "folder.fill")
            }
            else
            {
                cell.fileImage.image = UIImage(named: "doc.fill")
            }
            cell.fileLabel.text = arrFiles[indexPath.row].Name ?? ""
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(arrFiles[indexPath.row].Name ?? "")")
    }
    
    
    
    // View controller functions
    func getAttachment(){
        
        dictMyContact = ["ProjectId": 432, "DocumentPathType": "Documents", "FolderPath": "\(arrResponse?.Name ?? "")"]
        viewModel.getAttachmentData(dictParam: dictMyContact) { [self] (model) in
            
            self.arrFiles = model?.ProjectData?.Files ?? []
            if arrFiles.count > 0 {
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    backgroundView.isHidden = true
                }
            }
            else {
                DispatchQueue.main.async {
                    backgroundView.isHidden = false
                    collectionView.isHidden = true
                }
            }
           
//                print(arrFiles)
//            print(folderName)
        }
    }
}
