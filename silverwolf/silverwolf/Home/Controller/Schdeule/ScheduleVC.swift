//
//  ScheduleVC.swift
//  Silverwolf
//
//  Created by Mac on 04/04/22.
//

import UIKit

class ScheduleVC: UIViewController {

    @IBOutlet var profileImage: UIImageView!
    
    @IBOutlet weak var scheduleTV: UITableView!
    
    @IBOutlet weak var backViewSearch: UIView!
    
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var txtSearch: UITextField!
    
    @IBOutlet weak var btnAdd: UIButton!
    
    @IBOutlet var lblUsername: UILabel!
    
    var mapValue: Bool!
    var profileImg: String?
    var searching = false
    
    let viewModel: ScheduleViewModel = ScheduleViewModel()
    var scheduleData = [ScheduleDataResponseModelElement]()
    var scheduleDataSearch = [ScheduleDataResponseModelElement]()
    var LoadDataByEmployee = [LoadDataByEmployeeResponseModelElement]()
    var LoadDataSearch = [LoadDataByEmployeeResponseModelElement]()
    
    //Variable Username
    var firstName = String()
    var lastName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblUsername.text = firstName + " " + lastName

        txtSearch.delegate = self
        getSchedule()
       
        self.scheduleTV.register(UINib(nibName: "SchedualTableViewCell", bundle: nil), forCellReuseIdentifier: "SchedualTableViewCell")
        
        profileImage?.layer.cornerRadius = (profileImage?.frame.size.width ?? 0.0) / 2
        profileImage?.clipsToBounds = true
        profileImage?.layer.borderWidth = 3.0
        profileImage?.layer.borderColor = UIColor.white.cgColor
      //  self.allLeadTV.register(UINib(nibName: "NewLeadsTableCell", bundle: nil), forCellReuseIdentifier: "NewLeadsTableCell")
         
         locationView.layer.cornerRadius = 5
         backViewSearch.layer.cornerRadius = backViewSearch.frame.height/2
         
        profileImages()
    }
    @IBAction func btnToClickMap(_ sender: Any) {
        let map = self.storyboard!.instantiateViewController(withIdentifier: "MapVC") as! MapVC
        map.isClicked = true
        self.navigationController!.pushViewController(map, animated: true)
    }
}


extension ScheduleVC
{
    
    func getSchedule(){
            let key = "empId"
            if let retrievedCodableObject = UserDefaults.standard.object(forKey: key) {
                self.viewModel.LoadDataByEmployee(dictParam: "\(retrievedCodableObject)") { (model) in
                    if let modeldata = model {
                    self.LoadDataByEmployee = modeldata
                        self.LoadDataSearch = self.LoadDataByEmployee
                        DispatchQueue.main.async {
                            self.scheduleTV.reloadData()
                        }
                        
                    }
                }
                
            } else {
              print("Not yet saved with key \(key)")
           }
//        let dictMyContact = [String:Any]()
//        viewModel.getSchdeuleData(dictParam: dictMyContact) { (model) in
//
//            if let modeldata = model {
//            self.scheduleData = modeldata
//            self.scheduleDataSearch = self.scheduleData
//            print(self.scheduleData)
//                DispatchQueue.main.async {
//                    self.scheduleTV.reloadData()
//                }
//
//            }
//
//        }
    }
}
    
 
extension ScheduleVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return self.LoadDataSearch.count
        }
        else {
            return self.LoadDataByEmployee.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = scheduleTV.dequeueReusableCell(withIdentifier: "SchedualTableViewCell", for: indexPath) as! SchedualTableViewCell
        if searching {
            let ent = self.LoadDataSearch[indexPath.row]
            cell.lblProjectName?.text = ent.projectName
        }
        else {
            let ent = self.LoadDataByEmployee[indexPath.row]
            cell.lblJobId.text = "SWP# \(ent.id ?? 0)"
            cell.lblTaskName.text = ent.taskName
            cell.lblProjectName.text = ent.projectName
            cell.lblDescription.text = ent.welcomeDescription
            cell.lblEmployeeName.text = ent.employeeName
            cell.lblCreatedAt.text = ent.createdAt
            
            cell.btnMapLocation.tag = indexPath.row
            cell.btnMapLocation.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)
            
            let start = SWUtility.shared.stringToStringDate(strDate: ent.scheduleStart ?? "", strcurrentFormat: "yyyy-MM-dd'T'HH:mm:ss", strExpectedFormat: "h:mm a")
            let end = SWUtility.shared.stringToStringDate(strDate: ent.scheduleEnd ?? "", strcurrentFormat: "yyyy-MM-dd'T'HH:mm:ss", strExpectedFormat: "h:mm a")
           // let start =
            cell.lblScheduleStartEnd.text = "\(start) - \(end)"
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ent = self.LoadDataByEmployee[indexPath.row]
        print(ent.projectID ?? 0)
        let user = ent.taskName ?? ""
        UserDefaults.standard.set(user, forKey: "taskName")
        let pId = ent.projectID ?? 0
        UserDefaults.standard.set(pId, forKey: "projectId")
        let sb = UIStoryboard(name: SWConstants.shared.sbHome, bundle: nil)
        if let vc = sb.instantiateViewController(withIdentifier: SWConstants.shared.ScheduleDetailsVC) as? ScheduleDetailsVC {
            vc.name = ent.projectName ?? ""
            vc.projectID = ent.projectID ?? 0
            vc.ID = ent.id ?? 0
            vc.EmployeeId = ent.employeeID ?? 0
            vc.TaskId = ent.taskID ?? 0
            vc.JobId = ent.projectID ?? 0
            let detailVC = sb.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC
//            detailVC?.ID = ent.id ?? 0
//            detailVC?.EmployeeId = ent.employeeID ?? 0
//            detailVC?.TaskId = ent.taskID ?? 0
//            detailVC?.JobId = ent.projectID ?? 0
           // self.navigationController?.pushViewController(detailVC!, animated: true)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return 255
       
        }
    
    @objc func connected(sender: UIButton){
//        let buttonPosition = sender.convert(CGPoint.zero, to: self.scheduleTV)
//         let indexPath = self.scheduleTV.indexPathForRow(at:buttonPosition)
//        let cell = self.scheduleTV.cellForRow(at: indexPath!) as! ScheduleTableCell
        let button = self.LoadDataByEmployee[sender.tag]
        print(button.projectID ?? 0)
        let map = self.storyboard!.instantiateViewController(withIdentifier: "MapVC") as! MapVC
        map.SProjectId = button.projectID ?? 0
        map.isClicked = false
        self.navigationController!.pushViewController(map, animated: true)
    }
    
    
}



extension ScheduleVC : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtSearch.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        //input text
//           let searchText  = textField.text! + string
//          //add matching text to arrya
//           LoadDataSearch = self.LoadDataByEmployee.filter({(($0["projectName"] as! String).localizedCaseInsensitiveContains(searchText))})
//
//          if(LoadDataSearch.count == 0){
//            searching = false\
        
//          }else{
//            searching = true
//         }
//          self.scheduleTV.reloadData()
//
//          return true
//    }
        if let text = textField.text,
           let textRange = Range(range, in: text) {
           let updatedText = text.replacingCharacters(in: textRange,
                                                       with: string)
            if updatedText == ""
            {
                searching = false
                self.LoadDataSearch = self.LoadDataByEmployee
            }
            else
            {
                searching = true
                self.LoadDataSearch = self.LoadDataByEmployee.filter
                { ent in
                    let strName : String = ent.projectName ?? ""
                    return strName.lowercased().hasPrefix(updatedText.lowercased())
                }
            }
            self.scheduleTV.reloadData()
        }
        return true
    }
}
extension ScheduleVC {
    func profileImages() {
        if let data = UserDefaults.standard.string(forKey: "profileImg")
        {
//            self.profileImg = data
            data.stringToImage {(image) in
                DispatchQueue.main.async {
                    self.profileImage.image = image
                }
            }
        }
    }
}
extension String {

    func stringToImage(_ handler: @escaping ((UIImage?)->())) {
        if let url = URL(string: self) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    let image = UIImage(data: data)
                    handler(image)
                }
            }.resume()
        }
    }
}
