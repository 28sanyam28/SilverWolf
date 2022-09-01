//
//  DetailVC.swift
//  silverwolf
//
//  Created by apple on 14/06/22.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet var topLeft: UILabel!
    @IBOutlet var topRight: UILabel!
    @IBOutlet var siteName: UILabel!
    
    @IBOutlet var address: UILabel!
    @IBOutlet var phoneNo: UIButton!
    let viewModel: DetailsViewModel = DetailsViewModel()
    var attachmentData = [DetailsDataResponseModelElement]()
    var dictBody = [String:Any]()

    @IBOutlet weak var ContactView: UIView!
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet var startStopWork: UIButton!
    
    var projectID = Int()
    
    var timer:Timer = Timer()
    var count:Int = 0
    var timerCounting:Bool = false
    
    //Store string come from api
    var projectName = String()
    var projectId = Int()
    var phone = String()
    var siteAddress = String()
    
    //TimeSheet refer data
    var name = [String]()
    var id = [Int]()
    var startTime = [String]()
    var stopTime = [String]()
    var time = [String]()
    var start = String()
    var exactTime = String()
    var companyName = [Any]()
    var Cname = String()
    var ClientId = [Int]()
    var Cid = Int()
    let dict = NSMutableDictionary()
    
    
    // submit
    var dictMyContact = [String:Any]()
    var ID = Int()
    var EmployeeId = Int()
    var TaskId = Int()
    var JobId = Int()
    var Id: Int?
    
    var Travel: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(projectID)
        getDetails()
//        print(ID)
//        Id = ID
//        print(Id ?? 0)
//        if let arrOfCompany = UserDefaults.standard.object(forKey: "companyName") as? [Any]
//        {
//            companyName = arrOfCompany
//            print("anadar h hai")
//        }
//        else
//        {
//            print("bhar aagya")
//        }
    }
    
    //Button Actions
    @IBAction func btnToClickMoreContacts(_ sender: Any) {
        ContactView.isHidden = false
    }
    
    @IBAction func btnToClickBack(_ sender: Any) {
        ContactView.isHidden = true
    }
    @IBAction func btnToClickStartTravel(_ sender: Any) {
        let mytime = Date()
        let format = DateFormatter()
        let formatter = DateFormatter()
        print(Id ?? 0)
        if(timerCounting)
        {
            self.Travel = "Start Travel"
            timerCounting = false
            timer.invalidate()
            startStopButton.setTitle("Start Travel", for: .normal)
            format.timeStyle = .long
            format.dateStyle = .short
            print(TimerLabel!.text!)
            formatter.timeStyle = .medium
            formatter.dateFormat = "y-MM-dd'T'HH:mm:ss.SSSS'Z'"
            self.exactTime = formatter.string(from: mytime)
            submitTimesheet()
            showMessage(with: "Timesheet Added Successfully", theme: .success)
            startStopWork.isEnabled = true
        }
        else
        {
            format.dateFormat = "y-MM-dd'T'HH:mm:ss.SSSS'Z'"
            self.start = format.string(from: mytime)
            print(start)
            timerCounting = true
            startStopButton.setTitle("Stop Travel", for: .normal)
            startStopButton.setTitleColor(UIColor.white, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
            startStopWork.isEnabled = false
        }
    }
    @IBAction func btnStartWorkTapped(_ sender: Any) {
//        startStopButton.tintColor = UIColor.black
        travelWork()
    }
}

extension DetailVC {
    func getDetails(){
       print(projectID)
        let inspection = UserDefaults.standard.object(forKey: "taskName")
            
        viewModel.getDetailsData(dictParam: "\(projectID)") { [self] (model) in
            projectId = model?.projectData?.projectID ?? 0
            projectName = model?.projectData?.projectTitle ?? ""
            phone = model?.projectData?.clientDetail?.contactNumber ?? ""
            Cname = model?.projectData?.clientDetail?.companyName ?? ""
            Cid = model?.projectData?.clientDetail?.clientDetailID ?? 0
            siteAddress = model?.projectData?.clientDetail?.billingAddress ?? ""
            print(Cid)
    
            DispatchQueue.main.async {
                self.topLeft.text = inspection as? String
                self.topRight.text = "SWP# " + "\(projectID)"
                self.siteName.text = projectName
                self.address.text = siteAddress
                phoneNo.setTitle(phone, for: .normal)
            }
        }
    }
    func submitTimesheet() {
        dictMyContact = ["ID": 0,
                             "Type": "Common",
                             "JobId": JobId,
                             "EmployeeId": EmployeeId,
                             "ClientId": EmployeeId,
                             "TaskId": TaskId,
                             "Website": "",
                             "Description": Travel ?? "",
                             "WorkTime": 1,
                             "WorkTimeMins": 0,
                             "AddedBy": 1,
                             "AddedOn": start,
                             "UpdatedBy": "",
                             "UpdatedOn": "",
                             "ToTime": exactTime,
                             "FromTime": start]
        print(dictMyContact)
        viewModel.SubmitTimesheet(dictParam: dictMyContact) { response,completed,errorMessage in
            
        }

    }
    
    //Timer
    @objc func timerCounter() -> Void
    {
        count = count + 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimerString(hours: time.0, minutes: time.1, seconds: time.2)
        TimerLabel.text = timeString
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int)
    {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func makeTimerString(hours: Int, minutes: Int, seconds: Int) -> String
    {
        var timerString = ""
        timerString += String(format: "%02d", hours)
        timerString += " : "
        timerString += String(format: "%02d", minutes)
        timerString += " : "
        timerString += String(format: "%02d", seconds)
        return timerString
    }
    
}
extension DetailVC {
    func travelWork() {
        let mytime = Date()
        let format = DateFormatter()
        let formatter = DateFormatter()
        print(Id ?? 0)
        if(timerCounting)
        {
            self.Travel = "Start Work"
            timerCounting = false
            timer.invalidate()
            startStopWork.setTitle("Start Work", for: .normal)
            format.timeStyle = .long
            format.dateStyle = .short
            print(TimerLabel!.text!)
            formatter.timeStyle = .medium
            formatter.dateFormat = "y-MM-dd'T'HH:mm:ss.SSSS'Z'"
            self.exactTime = formatter.string(from: mytime)
            submitTimesheet()
            showMessage(with: "Timesheet Added Successfully", theme: .success)
            startStopButton.isEnabled = true
        }
        else
        {
            format.dateFormat = "y-MM-dd'T'HH:mm:ss.SSSS'Z'"
            self.start = format.string(from: mytime)
            print(start)
            timerCounting = true
            startStopWork.setTitle("Stop Work", for: .normal)
            startStopWork.setTitleColor(UIColor.black, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
            startStopButton.isEnabled = false
        }
    }
}
