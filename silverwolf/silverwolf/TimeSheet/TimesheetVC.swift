//
//  TimesheetVC.swift
//  Silverwolf
//
//  Created by Mac on 04/04/22.
//

import UIKit
import FSCalendar

class TimesheetVC: UIViewController {

    @IBOutlet var profileImage: UIImageView!
    //Update Label
    @IBOutlet var lblAddUpdate: UILabel!
    
    @IBOutlet var vwToolBar: UIView!
    @IBOutlet var pickerViewNew: UIPickerView!
    @IBOutlet weak var timeSheetTV: UITableView!
    
    @IBOutlet weak var calender: FSCalendar!
    
    @IBOutlet var blurView: UIView!
    
    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet var lblUsername: UILabel!
    
    @IBOutlet var detailsView: UIView!
    
    @IBOutlet var btnPlus: UIButton!
    
    //Plus button variable and outlets
    @IBOutlet var txtFJobId: UITextField!
    @IBOutlet var txtFClientName: UITextField!
    
    @IBOutlet var txtFDatepicker: UITextField!
    @IBOutlet var txtFStartTime: UITextField!
    @IBOutlet var txtFStopTime: UITextField!
    @IBOutlet var txtFTask: UITextField!
    
    @IBOutlet var txtVDescription: UITextView!
    //var pickerView = UIPickerView()
    let toolbar = UIToolbar()
    
    @IBOutlet var btnJobId: UIButton!
    @IBOutlet var btnTaskName: UIButton!
    @IBOutlet var btnClientName: UIButton!
    //Button Round
    @IBOutlet var btnCancel: UIButton!
    @IBOutlet var btnDone: UIButton!
    
    
    
    
    let dict = NSMutableDictionary()
    var dictMyContact = [String:Any]()
    let viewModel: TimesheetViewModel = TimesheetViewModel()
    var TimesheetData = [timesheetData]()
    var LoadDataByEmployee = [LoadDataByEmployeeResponseModelElement]()
    var GetProjectTaskByProjectID = [ProjectDatum]()
    var Title = [String]()
    var JobId = [Int]()
    var taskid = [Int]()
    var taskName = [String]()
    var clientid = [Int]()
    var clientName = [String]()
    var pickerClicked:String = "1"
    var taskIdSendToApi:Int?
    var jobIdSendToApi:Int?
    var clientIdSendToApi:Int?
    
    
    //Variable Username
    var firstName = String()
    var lastName = String()
    var id = Int()
    var empId = Int()
    var arrTimeSheet:[TimesheetDatum]?
    
    //Date Time
    var date:String?
    var stime:String?
    var stTime:String?
    
    let datePickerView = UIDatePicker()
    let fTimePickerView = UIDatePicker()
    let tTimePickerView = UIDatePicker()
    
    var AddUpdate: Bool! = false
    var updateId:Int?
    var updateAddedOn:String?
    var updateStartTime:String?
    var updateStopTime:String?
    
    var selectedDate:Bool = false
    var saveDate: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImages()
        pickerViewNew.isHidden = true
        vwToolBar.isHidden = true
        lblUsername.text = firstName + " " + lastName
        profileImage?.layer.cornerRadius = (profileImage?.frame.size.width ?? 0.0) / 2
        profileImage?.clipsToBounds = true
        profileImage?.layer.borderWidth = 3.0
        profileImage?.layer.borderColor = UIColor.white.cgColor
        self.calender.scope = .week
        timeSheetTV.register(UINib(nibName: "TimesheetCell", bundle: nil), forCellReuseIdentifier: "TimesheetCell")
        //TimeSheet
        
        pickerViewNew.delegate = self
        pickerViewNew.dataSource = self
        toolbar.sizeToFit()
        viewButton()
        self.createDatePicker()
        self.createStartTimePicker()
        self.createStopTimePicker()
        txtVDescription.delegate = self
        txtVDescription.text = "Enter your text.."
        txtVDescription.textColor = UIColor.lightGray
        //getTimeSheetE()
       // getProjectTaskByProjectID()
       // StoreDetails()
        
        
        
        detailsView.layer.cornerRadius = 10
        btnCancel?.layer.cornerRadius = 5
        btnCancel?.clipsToBounds = true
        btnDone?.layer.cornerRadius = 5
        btnDone?.clipsToBounds = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        timeSheetTV.reloadData()
        bindTimesheetlist()
        StoreDetails()
        //getTimeSheet()
        //getTimeSheetE()
        loadDataByEmployee()
        //getProjectTaskByProjectID()
        self.tabBarController?.tabBar.layer.cornerRadius = 20
        self.tabBarController?.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    @IBAction func btnPlusTapped(_ sender: Any) {
        AddUpdate = false
        lblAddUpdate.text = "Add Timesheet"
        detailsView.isHidden = false
        blurView.isHidden = false
        if Title.count>0 {
            txtFJobId.text = Title[0]
            txtFTask.text = taskName[0]
            txtFClientName.text = clientName[0]
            txtFDatepicker.text = ""
            txtFStopTime.text = ""
            txtFStartTime.text = ""
        }
        else {
            txtFJobId.text = ""
            txtFTask.text = ""
            txtFClientName.text = ""
            txtFDatepicker.text = ""
            txtFStopTime.text = ""
            txtFStartTime.text = ""
        }
        pickerViewNew.selectRow(0, inComponent: 0, animated: false)
    }
    @IBAction func cancelTapped(_ sender: Any) {
        detailsView.isHidden = true
        blurView.isHidden = true
    }
    @IBAction func doneTapped(_ sender: Any) {
//        doneTap()
        detailsView.isHidden = true
        blurView.isHidden = true
        if txtFJobId.text != "" && txtFClientName.text != "" && txtFDatepicker.text != "" && txtFStartTime.text != "" && txtFStopTime.text != "" && txtFTask.text != "" && txtVDescription.text != ""
        {
            showMessage(with: "Timesheet Added Successfully", theme: .success)
            submitTimesheet()
            viewWillAppear(true)
            timeSheetTV.reloadData()
        }
        self.timeSheetTV.reloadData()
    }
    
    @IBAction func btnToJobId(_ sender: Any) {
        if Title.count > 0
        {
            pickerClicked = "1"
            pickerViewNew.isHidden = false
            vwToolBar.isHidden = false
            pickerViewNew.reloadAllComponents()
            self.view.endEditing(true)
            
        }
        
    }
    
    @IBAction func btnToClientName(_ sender: Any) {
        if clientName.count > 0
        {
            pickerClicked = "3"
            pickerViewNew.isHidden = false
            vwToolBar.isHidden = false
            pickerViewNew.reloadAllComponents()
//            datePickerView.isHidden = true
//            fTimePickerView.isHidden = true
//            tTimePickerView.isHidden = true
        }
        
    }
    
    @IBAction func btnToTaskId(_ sender: Any) {
        if taskName.count > 0
        {
            pickerClicked = "2"
            pickerViewNew.isHidden = false
            vwToolBar.isHidden = false
            pickerViewNew.reloadAllComponents()
           // pickerViewNew.isHidden = true
//            datePickerView.isHidden = true
//            fTimePickerView.isHidden = true
//            tTimePickerView.isHidden = true
        }
    }
    
    @IBAction func btnToDoneClciked(_ sender: Any)
    {
        pickerViewNew.isHidden = true
        vwToolBar.isHidden = true
    }
    
    @IBAction func btnToCancelClciked(_ sender: Any)
    {
        pickerViewNew.isHidden = true
        vwToolBar.isHidden = true
    }
}
extension TimesheetVC {
    func viewButton() {
        //textView
        
    }
    func StoreDetails() {

        if let arrOfCompany = UserDefaults.standard.object(forKey: "companyName") as? [Any]
        {
//            companyName = arrOfCompany
//            timeSheetTV.reloadData()
//            print("anadar h hai")
//            print(companyName)
//            timeSheetTV.isHidden = false
        }
        else
        {
            print("bhar aagya")
            timeSheetTV.isHidden = true
        }
    }
}

extension TimesheetVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTimeSheet?.count ?? 0 //companyName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let index = companyName[indexPath.row] as? NSDictionary
        
        let cell = timeSheetTV.dequeueReusableCell(withIdentifier: "TimesheetCell", for: indexPath) as! TimesheetCell
        let dict = arrTimeSheet?[indexPath.row]
        let dateString2 = dict?.fromTime ?? ""

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        //dateFormatter.locale = Locale(identifier: "en_US_POSIX")

        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        if let date = dateFormatter.date(from: dateString2){
            let newDateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a" // or "HH:mm a"
            let newStr = newDateFormatter.string(from: date)
            print("Dateobj: \(dateFormatter.string(from: date))")
            cell.lblTime.text = "\(dateFormatter.string(from: date))"
        }
 //
        cell.lblCompany.text = dict?.jobname?.rawValue ?? ""
        cell.lblName.text = dict?.taskName ?? ""
        cell.lblStart.text = dict?.timesheetDatumDescription ?? ""
        cell.lblSWP.text = "Job Id- " + "\(dict?.jobID ?? 0)"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return UITableView.automaticDimension
       
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AddUpdate = true
        let dict = arrTimeSheet?[indexPath.row]
        print(dict ?? [])
        detailsView.isHidden = false
        blurView.isHidden = false
        lblAddUpdate.text = "Update Timesheet"
        updateId = dict?.id ?? 0
        txtFJobId.text = dict?.jobname?.rawValue ?? ""
        txtFTask.text = dict?.taskName ?? ""
        txtFClientName.text = dict?.clientname ?? ""
        txtFDatepicker.text = dict?.addedonstr ?? ""
        updateAddedOn = dict?.addedonstr ?? ""
        updateStartTime = dict?.fromTime ?? ""
        updateStopTime = dict?.toTime ?? ""
        txtVDescription.text = dict?.timesheetDatumDescription ?? ""
        
        let dateString2 = dict?.fromTime ?? ""
        let dateString3 = dict?.toTime ?? ""

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        //dateFormatter.locale = Locale(identifier: "en_US_POSIX")

        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        if let fromDate = dateFormatter.date(from: dateString2), let toDate = dateFormatter.date(from: dateString3){
            let newDateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a" // or "HH:mm a"
            let newStr = newDateFormatter.string(from: fromDate)
            print("Dateobj: \(dateFormatter.string(from: fromDate))")
            txtFStartTime.text = "\(dateFormatter.string(from: fromDate))"
            let toStr = newDateFormatter.string(from: toDate)
            print("Dateobj: \(dateFormatter.string(from: toDate))")
            txtFStopTime.text = "\(dateFormatter.string(from: toDate))"
        }
        else {
            //nothing
        }
    }
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let lastSectionIndex = tableView.numberOfSections - 1
//        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
//        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
//           // print("this is the last cell")
//            let spinner = UIActivityIndicatorView(style: .medium)
//            spinner.startAnimating()
//            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
//
//            self.timeSheetTV.tableFooterView = spinner
//            self.timeSheetTV.tableFooterView?.isHidden = false
//        }
//    }
    
}
extension TimesheetVC: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        selectedDate = true
        print("Selected")
        print(calendar.currentPage)
        let mytime = calendar.currentPage
        let format = DateFormatter()
        format.dateFormat = "y-MM-dd'T'HH:mm:ss.SSSS'Z'"
        saveDate = format.string(from: mytime)
        print(format.string(from: mytime))
        bindTimesheetlist()
        timeSheetTV.reloadData()
    }
}

extension TimesheetVC {
    //Date Picker
    func createDatePicker() {
        pickerViewNew.isHidden = true
        datePickerView.preferredDatePickerStyle = .inline
        datePickerView.datePickerMode = .date
        txtFDatepicker.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
    }
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        pickerViewNew.isHidden = true
        let dateFormatter = DateFormatter()
        let dateFormatters = DateFormatter()
        dateFormatters.dateFormat = "dd MMM yyyy"
        dateFormatter.dateFormat = "y-MM-dd'T'HH:mm:ss.SSSS'Z'"
        date = dateFormatter.string(from: sender.date)
        txtFDatepicker.text = dateFormatters.string(from: sender.date)
        print(txtFDatepicker.text ?? "")
        txtFDatepicker.endEditing(true)
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Time Picker
    func createStartTimePicker() {
        
        fTimePickerView.preferredDatePickerStyle = .wheels
        fTimePickerView.datePickerMode = .time
        txtFStartTime.inputView = fTimePickerView
        fTimePickerView.addTarget(self, action: #selector(handleStartTimePicker(sender:)), for: .valueChanged)
    }
    
    @objc func handleStartTimePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        let dateFormatters = DateFormatter()
        dateFormatters.dateFormat = "hh:mm a"
        dateFormatter.dateFormat = "y-MM-dd'T'HH:mm:ss.SSSS'Z'"
        stime = dateFormatter.string(from: sender.date)
        txtFStartTime.text = dateFormatters.string(from: sender.date)
        print(txtFStartTime.text ?? "")
        txtFStartTime.endEditing(true)
        
    }
    func createStopTimePicker() {
        
        tTimePickerView.preferredDatePickerStyle = .wheels
        tTimePickerView.datePickerMode = .time
        txtFStopTime.inputView = tTimePickerView
        tTimePickerView.addTarget(self, action: #selector(handleStopTimePicker(sender:)), for: .valueChanged)
    }
    
    @objc func handleStopTimePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        let dateFormatters = DateFormatter()
        dateFormatters.dateFormat = "hh:mm a"
        dateFormatter.dateFormat = "y-MM-dd'T'HH:mm:ss.SSSS'Z'"
        stTime = dateFormatter.string(from: sender.date)
        txtFStopTime.text = dateFormatters.string(from: sender.date)
        print(txtFStopTime.text ?? "")
        txtFStopTime.endEditing(true)
    }
    
}
extension TimesheetVC {
    
    func submit() {
        if txtFJobId.text != "" && txtFClientName.text != "" && txtFDatepicker.text != "" && txtFStartTime.text != "" && txtFStopTime.text != "" && txtFTask.text != "" && txtVDescription.text != ""
        {
            let jobid = txtFJobId.text
            let clientname = txtFDatepicker.text
            let datapicker = txtFDatepicker.text
            let starttime = txtFStartTime.text
            let stoptime = txtFStopTime.text
            
//            let jobId = txtFJobId.text
//            let clientName = txtFClientName.text
//            let datePicker = txtFDatepicker.text
//            let startTime = txtFStartTime.text
//            let stopTime = txtFStopTime.text
//            let task = txtFTask.text
//            let description = txtVDescription.text
//            let jobId: Int? = Int(txtFJobId.text ?? "")
//            let clientName = txtFClientName.text
//            let datePicker = txtFDatepicker.text
//            let startTime = txtFStartTime.text
//            let stopTime = txtFStopTime.text
//            let task = txtFTask.text
//            let description = txtVDescription.text
        }
    }
    func getTimeSheet(){
        dictMyContact = ["id": id,"empId": empId]
        viewModel.getTimesheetData(dictParam: dictMyContact) { (model) in
            print(model)
//            self.arrFiles = model?.ProjectData?.Files ?? []
//            DispatchQueue.main.async {
//                self.collectionviewDocuments.reloadData()
//            }
////                print(arrFiles)
        }
    }
    func getTimeSheetE(){
        self.clientid.removeAll()
        self.clientName.removeAll()
        dictMyContact = ["id": taskIdSendToApi ?? 0]
        print(dictMyContact)
        viewModel.getTimesheetEData(dictParam: dictMyContact) { (model) in
            if let modeldata = model {
                if modeldata.TimesheetData?.count ?? 0 > 0
                {
                    self.TimesheetData = modeldata.TimesheetData!
                    for i in self.TimesheetData {
                        self.clientid.append(i.EmployeeId ?? 0)
                        self.clientName.append(i.Employeename ?? "")
                        self.clientIdSendToApi = self.clientid[0]
                }
                }
            }
        }
    }
    func loadDataByEmployee(){
        let key = "empId"
        self.Title.removeAll()
        self.JobId.removeAll()
        if let retrievedCodableObject = UserDefaults.standard.object(forKey: key) {
            viewModel.LoadDataByEmployee(dictParam: "\(retrievedCodableObject)") { (model) in
                if let modeldata = model {
                self.LoadDataByEmployee = modeldata
                    for i in modeldata {
                        self.Title.append(i.projectName ?? "")
                        self.JobId.append(i.projectID ?? 0)
                        self.jobIdSendToApi = self.JobId[0]
                        //Pickers
                        print(self.Title)
                        print(self.JobId)
                        DispatchQueue.main.async{ self.pickerViewNew.reloadAllComponents()}
                       
                    }
                    self.getProjectTaskByProjectID()
                }
            }
            
        } else {
          print("Not yet saved with key \(key)")
        }
        
    }
    func getProjectTaskByProjectID(){
        self.taskName.removeAll()
        self.taskid.removeAll()
        viewModel.GetProjectTaskByProjectID(dictParam: jobIdSendToApi ?? 0) { (model) in
            print(model ?? "")
            if let modelData = model {
                if modelData.projectData?.count ?? 0 > 0
                {
                    self.GetProjectTaskByProjectID = modelData.projectData!
                    for i in self.GetProjectTaskByProjectID {
                        self.taskName.append(i.taskName ?? "")
                        self.taskid.append(i.id ?? 0)
                        self.taskIdSendToApi = self.taskid[0]
                    }
                    self.getTimeSheetE()
                }
            }
        }
    }
    func submitTimesheet() {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "hh:mm a"
//        let xmas = formatter.date(from: txtFStopTime.text ?? "0")
//        let newYear = formatter.date(from: txtFStartTime.text ?? "0")
//        let workTime = xmas!.timeIntervalSinceReferenceDate - newYear!.timeIntervalSinceReferenceDate
//        print(workTime)
        if let empID = UserDefaults.standard.object(forKey: "empId") {
            print(empID)
            if AddUpdate
            {
                dictMyContact = ["ID": updateId ?? 0,
                                 "Type": "Common",
                                 "JobId": jobIdSendToApi ?? 0,
                                 "EmployeeId": empID,
                                 "ClientId": clientIdSendToApi ?? 0,
                                 "TaskId": taskIdSendToApi ?? 0,
                                 "Website": "",
                                 "Description": txtVDescription.text ?? "",
                                 "WorkTime": 0,
                                 "WorkTimeMins": 0,
                                 "AddedBy": firstName + " " + lastName,
                                 "AddedOn": date ?? "",
                                 "UpdatedBy": "",
                                 "UpdatedOn": "",
                                 "ToTime": stTime ?? updateStopTime ?? 0,
                                 "FromTime": stime ?? updateStartTime ?? 0]
            }
            else {
                dictMyContact = ["ID": 0,
                                 "Type": "Common",
                                 "JobId": jobIdSendToApi ?? 0,
                                 "EmployeeId": empID,
                                 "ClientId": clientIdSendToApi ?? 0,
                                 "TaskId": taskIdSendToApi ?? 0,
                                 "Website": "",
                                 "Description": txtVDescription.text ?? "",
                                 "WorkTime": 0,
                                 "WorkTimeMins": 0,
                                 "AddedBy": firstName + " " + lastName,
                                 "AddedOn": date ?? "",
                                 "UpdatedBy": "",
                                 "UpdatedOn": "",
                                 "ToTime": stTime ?? "",
                                 "FromTime": stime ?? ""]
            }
            print(dictMyContact)
        }
        viewModel.SubmitTimesheet(dictParam: dictMyContact) { response,completed,errorMessage in
            self.timeSheetTV.reloadData()
            //self.bindTimesheetlist()
            if completed {
                self.bindTimesheetlist()
                self.timeSheetTV.reloadData()
            }
            else {
                print(errorMessage)
            }
        }
            
    }
    func bindTimesheetlist() {
        self.arrTimeSheet?.removeAll()
        let key = "empId"
        if let retrievedCodableObject = UserDefaults.standard.object(forKey: key) {
            if selectedDate {
                dictMyContact = ["emplID": "\(retrievedCodableObject)",
                                 "CID": 0,
                                 "TID": 0,
                                 "selectedmonth": saveDate ?? ""]
            }
            else {
                let mytime = Date()
                let format = DateFormatter()
                format.dateFormat = "y-MM-dd'T'HH:mm:ss.SSSS'Z'"
                saveDate = format.string(from: mytime)
                print(format.string(from: mytime))
                dictMyContact = ["emplID": "\(retrievedCodableObject)",
                                 "CID": 0,
                                 "TID": 0,
                                 "selectedmonth": saveDate ?? ""]
            }
        }
        print(dictMyContact)
        viewModel.BindTimesheetlist(dictParam: dictMyContact) { [self] (model) in
            print(model ?? "")
            DispatchQueue.main.async {
            if model?.timesheetData?.count ?? 0 > 0
            {
                self.arrTimeSheet = model?.timesheetData
                self.timeSheetTV.isHidden = false
                self.timeSheetTV.reloadData()
            }
            else
            {
                self.timeSheetTV.isHidden = true
                
            }
            
            
                self.timeSheetTV.reloadData()
            }
            
        }
    }
}


extension TimesheetVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerClicked == "1"
        {
            return Title.count
        }
        else if pickerClicked == "2"
        {
            return taskName.count
        }
        else
        {
            return clientName.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerClicked == "1"
        {
            return Title[row]
        }
        else if pickerClicked == "2"
        {
            return taskName[row]
        }
        else
        {
            return clientName[row]
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        if pickerClicked == "1"
        {
            jobIdSendToApi = JobId[row]
            txtFJobId.text = Title[row]
            txtFJobId.endEditing(true)
            getProjectTaskByProjectID()
            txtFTask.text = ""
            txtFClientName.text = ""
            self.view.endEditing(true)
        }
        else if pickerClicked == "2"
        {
            taskIdSendToApi = taskid[row]
            print(taskIdSendToApi ?? 0)
            txtFTask.text = taskName[row]
            getTimeSheetE()
            txtFClientName.text = ""
            self.view.endEditing(true)
        }
        else
        {
            clientIdSendToApi = clientid[row]
            txtFClientName.text = clientName[row]
            self.view.endEditing(true)
            txtFClientName.endEditing(true)
            txtFClientName.resignFirstResponder()
            pickerViewNew.resignFirstResponder()
        }
        //txtFClientName.endEditing(true)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
extension TimeInterval {
    func asMinutes() -> Double { return self / (60.0) }
    func asHours()   -> Double { return self / (60.0 * 60.0) }
    func asDays()    -> Double { return self / (60.0 * 60.0 * 24.0) }
    func asWeeks()   -> Double { return self / (60.0 * 60.0 * 24.0 * 7.0) }
    func asMonths()  -> Double { return self / (60.0 * 60.0 * 24.0 * 30.4369) }
    func asYears()   -> Double { return self / (60.0 * 60.0 * 24.0 * 365.2422) }
}
extension TimesheetVC:UITextViewDelegate
{
    func textViewDidBeginEditing(_ textView: UITextView) {

        if txtVDescription.textColor == UIColor.lightGray {
            txtVDescription.text = ""
            txtVDescription.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {

        if txtVDescription.text == "" {
            txtVDescription.text = "Enter your text.."
            txtVDescription.textColor = UIColor.lightGray
        }
    }
}
extension TimesheetVC {
    func profileImages() {
        if let data = UserDefaults.standard.string(forKey: "profileImg")
        {
//            self.profileImg = data
            data.stringToImages {(image) in
                DispatchQueue.main.async {
                    self.profileImage.image = image
                }
            }
        }
    }
}
extension String {

    func stringToImages(_ handler: @escaping ((UIImage?)->())) {
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
