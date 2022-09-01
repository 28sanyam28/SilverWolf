//
//  SiteRiskVC.swift
//  silverwolf
//
//  Created by apple on 11/07/22.
//

import UIKit

class SiteRiskVC: UIViewController {

    //Enginere
    @IBOutlet var EView: UIView!
    @IBOutlet var wView: UIView!
    @IBOutlet var siteView: UIView!
    @IBOutlet var FView1: UIView!
    @IBOutlet var FView2: UIView!
    @IBOutlet var lView: UIView!
    @IBOutlet var taskView: UIView!
    
    //TaskView
    @IBOutlet var tView: UIView!
    @IBOutlet var workView: UIView!
    @IBOutlet var roofView: UIView!
    @IBOutlet var generalView: UIView!
    
    //General
    @IBOutlet var AaView: UIView!
    @IBOutlet var ExView: UIView!
    @IBOutlet var CoView: UIView!
    @IBOutlet var NoView: UIView!
    @IBOutlet var TrView: UIView!
    @IBOutlet var DuView: UIView!
    @IBOutlet var UVView: UIView!
    @IBOutlet var CuView: UIView!
    @IBOutlet var ElView: UIView!
    @IBOutlet var HaView: UIView!
    
    //Further
    @IBOutlet var FurtherVw1: UIView!
    @IBOutlet var FurtherVw2: UIView!
    
    //Date and Name
    @IBOutlet var dateView: UIView!
    @IBOutlet var nameView: UIView!
    
    
    //Required PPE
    @IBOutlet var vwHi: UIView!
    @IBOutlet var vwHard: UIView!
    @IBOutlet var vwSteel: UIView!
    
    //Assess and complete Risk Rating
    @IBOutlet var btn1or2: UIButton!
    @IBOutlet var btn3or4: UIButton!
    @IBOutlet var btn5or6: UIButton!
    @IBOutlet var btn6: UIButton!
    
    //Submit and Cancel
    @IBOutlet var btnSubmit: UIButton!
    @IBOutlet var btnCancel: UIButton!
    
    
    // Fields and data
    @IBOutlet var txtFEngineerName: UITextField!
    @IBOutlet var txtFWork: UITextField!
    @IBOutlet var txtVSite: UITextView!
    @IBOutlet var txtFLocation: UITextField!
    @IBOutlet var btnHi: UIButton!
    @IBOutlet var btnHard: UIButton!
    @IBOutlet var btnSteel: UIButton!
    
    //CheckBox images
    @IBOutlet var requiredHi: UIImageView!
    @IBOutlet var requiredHard: UIImageView!
    @IBOutlet var requiredSteel: UIImageView!
    @IBOutlet var furtherYes: UIImageView!
    @IBOutlet var furtherNo: UIImageView!
    @IBOutlet var firstYes: UIImageView!
    @IBOutlet var firstNo: UIImageView!
    
    //Buttons
    @IBOutlet var btnFirstYes: UIButton!
    @IBOutlet var btnFirstNo: UIButton!
    @IBOutlet var btnFurtherYes: UIButton!
    @IBOutlet var btnFurtherNo: UIButton!
    
    //String value for button
    var isClicked:Bool? = false
    var clicked:Bool? = false
    var requiredText: String? = "Hi Visibility Vest"
    
    var arrSiteRiskAndControls = NSMutableArray()
    var SiteRiskAndControls = [Any]()
    
    @IBOutlet var txtFName: UITextField!
    
    let viewModel: SSAViewModel = SSAViewModel()
    var dictMyContact = [String:Any]()
    
    @IBOutlet var txtFDate: UIView!
    @IBOutlet var txtFSelectDate: UITextField!
    
    // variable for userdefaults
    var empId: Int?
    var id: Int?
    var name: String?
    
    //Risk Rating
    @IBOutlet var risk1: UITextField!
    @IBOutlet var risk2: UITextField!
    @IBOutlet var risk3: UITextField!
    @IBOutlet var risk4: UITextField!
    @IBOutlet var risk5: UITextField!
    @IBOutlet var risk6: UITextField!
    @IBOutlet var risk7: UITextField!
    @IBOutlet var risk8: UITextField!
    @IBOutlet var risk9: UITextField!
    @IBOutlet var risk10: UITextField!
    @IBOutlet var risk11: UITextField!
    @IBOutlet var risk12: UITextField!
    
    //Controls
    @IBOutlet var controls1: UITextField!
    @IBOutlet var controls2: UITextField!
    @IBOutlet var controls3: UITextField!
    @IBOutlet var controls4: UITextField!
    @IBOutlet var controls5: UITextField!
    @IBOutlet var controls6: UITextField!
    @IBOutlet var controls7: UITextField!
    @IBOutlet var controls8: UITextField!
    @IBOutlet var controls9: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirstRespond()
        requiredHi.image = UIImage(named: "check")
        requiredHard.image = UIImage(named: "empty")
        requiredSteel.image = UIImage(named: "empty")
        furtherYes.image = UIImage(named: "empty")
        furtherNo.image = UIImage(named: "check")
        firstYes.image = UIImage(named: "empty")
        firstNo.image = UIImage(named: "check")
        txtFEngineerName.text = name ?? ""
        btnWork()
        requested()
        further()
        createDatePicker()
        Defaults()
    }
    
    @IBAction func btnSubmitTapped(_ sender: Any) {
        getSiteRisk()
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnCancelTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnFirstYesTapped(_ sender: Any) {
        firstYes.image = UIImage(named: "check")
        firstNo.image = UIImage(named: "empty")
    }
    @IBAction func btnFirstNoTapped(_ sender: Any) {
        firstYes.image = UIImage(named: "empty")
        firstNo.image = UIImage(named: "check")
    }
    @IBAction func btnRequiredHiTapped(_ sender: Any) {
        requiredHi.image = UIImage(named: "check")
        requiredHard.image = UIImage(named: "empty")
        requiredSteel.image = UIImage(named: "empty")
    }
    @IBAction func btnRequiredHardTapped(_ sender: Any) {
        requiredHi.image = UIImage(named: "empty")
        requiredHard.image = UIImage(named: "check")
        requiredSteel.image = UIImage(named: "empty")
    }
    @IBAction func btnRequiredSteelTapped(_ sender: Any) {
        requiredHi.image = UIImage(named: "empty")
        requiredHard.image = UIImage(named: "empty")
        requiredSteel.image = UIImage(named: "check")
    }
    @IBAction func btnFurtherYesTapped(_ sender: Any) {
        furtherYes.image = UIImage(named: "check")
        furtherNo.image = UIImage(named: "empty")
    }
    @IBAction func btnFurtherNoTapped(_ sender: Any) {
        furtherNo.image = UIImage(named: "check")
        furtherYes.image = UIImage(named: "empty")
    }
    
    
    
}
extension SiteRiskVC {
    func getSiteRisk(){
        let workingAsHeights = NSMutableDictionary()
        workingAsHeights.setValue("Working at Heights", forKey: "Task")
        workingAsHeights.setValue(risk1.text, forKey: "RiskRating")
        workingAsHeights.setValue("Falls", forKey: "Risk")
        workingAsHeights.setValue("EWP/Ladder/Drone", forKey: "Controls")
        SiteRiskAndControls.append(workingAsHeights)
        
        let rootInspections = NSMutableDictionary()
        rootInspections.setValue("Roof Inspection", forKey: "Task")
        rootInspections.setValue(risk2.text, forKey: "RiskRating")
        rootInspections.setValue("Falls", forKey: "Risk")
        rootInspections.setValue("Tiled Roof – Do NOT Access Sheet Roof – Light shoes", forKey: "Controls")
        SiteRiskAndControls.append(rootInspections)
        
        let generalInspection = NSMutableDictionary()
        generalInspection.setValue("General Inspection", forKey: "Task")
        generalInspection.setValue(risk3.text, forKey: "RiskRating")
        generalInspection.setValue("Asbestos", forKey: "Risk")
        generalInspection.setValue(controls1.text, forKey: "Controls")
        SiteRiskAndControls.append(generalInspection)
        
        let generalInspection1 = NSMutableDictionary()
        generalInspection1.setValue("General Inspection", forKey: "Task")
        generalInspection1.setValue(risk4.text, forKey: "RiskRating")
        generalInspection1.setValue("Excavations or Trench", forKey: "Risk")
        generalInspection1.setValue(controls2.text, forKey: "Controls")
        SiteRiskAndControls.append(generalInspection1)
        
        let generalInspection2 = NSMutableDictionary()
        generalInspection2.setValue("General Inspection", forKey: "Task")
        generalInspection2.setValue(risk5.text, forKey: "RiskRating")
        generalInspection2.setValue("Confined Space", forKey: "Risk")
        generalInspection2.setValue(controls3.text, forKey: "Controls")
        SiteRiskAndControls.append(generalInspection2)
        
        let generalInspection3 = NSMutableDictionary()
        generalInspection3.setValue("General Inspection", forKey: "Task")
        generalInspection3.setValue(risk6.text, forKey: "RiskRating")
        generalInspection3.setValue("Noise", forKey: "Risk")
        generalInspection3.setValue(controls4.text, forKey: "Controls")
        SiteRiskAndControls.append(generalInspection3)
        
        let generalInspection4 = NSMutableDictionary()
        generalInspection4.setValue("General Inspection", forKey: "Task")
        generalInspection4.setValue(risk7.text, forKey: "RiskRating")
        generalInspection4.setValue("Traffic", forKey: "Risk")
        generalInspection4.setValue(controls5.text, forKey: "Controls")
        SiteRiskAndControls.append(generalInspection4)
        
        let generalInspection5 = NSMutableDictionary()
        generalInspection5.setValue("General Inspection", forKey: "Task")
        generalInspection5.setValue(risk8.text, forKey: "RiskRating")
        generalInspection5.setValue("Dust/Pollution", forKey: "Risk")
        generalInspection5.setValue(controls6.text, forKey: "Controls")
        SiteRiskAndControls.append(generalInspection5)
        
        let generalInspection6 = NSMutableDictionary()
        generalInspection6.setValue("General Inspection", forKey: "Task")
        generalInspection6.setValue(risk9.text, forKey: "RiskRating")
        generalInspection6.setValue("UV Exposure / Radiation", forKey: "Risk")
        generalInspection6.setValue(controls7.text, forKey: "Controls")
        SiteRiskAndControls.append(generalInspection6)
        
        let generalInspection7 = NSMutableDictionary()
        generalInspection7.setValue("General Inspection", forKey: "Task")
        generalInspection7.setValue(risk10.text, forKey: "RiskRating")
        generalInspection7.setValue("Cuts/Abrasions", forKey: "Risk")
        generalInspection7.setValue("Gloves, Long Sleeves, and Long Pants", forKey: "Controls")
        SiteRiskAndControls.append(generalInspection7)
        
        let generalInspection8 = NSMutableDictionary()
        generalInspection8.setValue("General Inspection", forKey: "Task")
        generalInspection8.setValue(risk11.text, forKey: "RiskRating")
        generalInspection8.setValue("Electric Shock", forKey: "Risk")
        generalInspection8.setValue(controls8.text, forKey: "Controls")
        SiteRiskAndControls.append(generalInspection8)
        
        let generalInspection9 = NSMutableDictionary()
        generalInspection9.setValue("General Inspection", forKey: "Task")
        generalInspection9.setValue(risk12.text, forKey: "RiskRating")
        generalInspection9.setValue("Hazardous Substances", forKey: "Risk")
        generalInspection9.setValue(controls9.text, forKey: "Controls")
        SiteRiskAndControls.append(generalInspection9)
        
        
        
//        let dict = NSMutableDictionary()
//        dict.setValue(0, forKey: "ID")
//        dict.setValue(0, forKey: "Task")
//        dict.setValue(0, forKey: "Risk")
//        dict.setValue(0, forKey: "RiskRating")
//        dict.setValue(0, forKey: "Controls")
//        dict.setValue(0, forKey: "SiteRiskAssessmentId")
//        SiteRiskAndControls.append(dict)
        
        dictMyContact = ["ID": 0,
                         "EngName": txtFEngineerName.text ?? "",
                         "siteName": txtVSite.text ?? "",
                         "createdDatestr": txtFSelectDate.text ?? "",
                         "EngineerId": empId ?? 0,
                         "SiteId": 0,
                         "Location": txtFLocation.text ?? "",
                         "RequiredPPE": requiredText ?? "",
                         "WorkDescription": txtFWork.text ?? "",
                         "IsFirstAidBoxAvailableOnsite": clicked ?? false,
                         "FurtherAction": isClicked ?? false,
                         "RiskAssessmentDate": "2022-07-19T08:03:41.243Z",
                         "CreatedBy": id ?? 0,
                         "CreatedAt": "2022-07-19T08:03:41.243Z",
                         "LastEditBy": id ?? 0,
                         "LastEditDate": "2022-07-19T08:03:41.243Z",
                         "IsActive": true,
                         "SiteRiskAndControls": SiteRiskAndControls]
        print(dictMyContact)
        viewModel.getReflection(dictParam: dictMyContact) { response,completed,errorMessage in
        }


    }
    func Defaults() {
        if let empID = UserDefaults.standard.object(forKey: "empId")
        {
            self.empId = empID as? Int
            print(self.empId ?? 0)
        }
        if let ID = UserDefaults.standard.object(forKey: "id")
        {
            self.id = ID as? Int
            print(self.id ?? 0)
        }
        if let fullname = UserDefaults.standard.object(forKey: "fullName")
        {
            self.name = fullname as? String
            print(self.name ?? "")
        }
    }
    func btnWork() {
        if btnFirstYes.isSelected {
            clicked = true
        }
        else {
            clicked = false
        }
    }
    func requested() {
        if btnHi.isSelected {
            requiredText = "Hi Visibility Vest"
        }
        else if btnHard.isSelected {
            requiredText = "Hard Hat"
        }
        else {
            requiredText = "Steel Cap Shoes (Safety Boots)"
        }
    }
    func further() {
        if btnFurtherYes.isSelected {
            isClicked = true
        }
        else {
            isClicked = false
        }
    }
    
}
extension SiteRiskVC {
    func createDatePicker() {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        txtFSelectDate.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
    }
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        txtFSelectDate.text = dateFormatter.string(from: sender.date)
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension SiteRiskVC {
    func FirstRespond() {
        //view
        vwHi.layer.borderWidth = 1
        vwHi.layer.borderColor = UIColor.lightGray.cgColor
        vwHi.layer.cornerRadius = 5
        
        vwHard.layer.borderWidth = 1
        vwHard.layer.borderColor = UIColor.lightGray.cgColor
        vwHard.layer.cornerRadius = 5
        
        vwSteel.layer.borderWidth = 1
        vwSteel.layer.borderColor = UIColor.lightGray.cgColor
        vwSteel.layer.cornerRadius = 5
        
        EView.layer.borderWidth = 1
        EView.layer.borderColor = UIColor.lightGray.cgColor
        EView.layer.cornerRadius = 5
        
        wView.layer.borderWidth = 1
        wView.layer.borderColor = UIColor.lightGray.cgColor
        wView.layer.cornerRadius = 5
        
        siteView.layer.borderWidth = 1
        siteView.layer.borderColor = UIColor.lightGray.cgColor
        siteView.layer.cornerRadius = 5
        
        FView1.layer.borderWidth = 1
        FView1.layer.borderColor = UIColor.lightGray.cgColor
        FView1.layer.cornerRadius = 5
        
        FView2.layer.borderWidth = 1
        FView2.layer.borderColor = UIColor.lightGray.cgColor
        FView2.layer.cornerRadius = 5
        
        lView.layer.borderWidth = 1
        lView.layer.borderColor = UIColor.lightGray.cgColor
        lView.layer.cornerRadius = 5
        
        taskView.layer.borderWidth = 1
        taskView.layer.borderColor = UIColor.lightGray.cgColor
        taskView.layer.cornerRadius = 5
        
        FurtherVw1.layer.borderWidth = 1
        FurtherVw1.layer.borderColor = UIColor.lightGray.cgColor
        FurtherVw1.layer.cornerRadius = 5
        
        FurtherVw2.layer.borderWidth = 1
        FurtherVw2.layer.borderColor = UIColor.lightGray.cgColor
        FurtherVw2.layer.cornerRadius = 5
        
        dateView.layer.borderWidth = 1
        dateView.layer.borderColor = UIColor.lightGray.cgColor
        dateView.layer.cornerRadius = 5
        
        nameView.layer.borderWidth = 1
        nameView.layer.borderColor = UIColor.lightGray.cgColor
        nameView.layer.cornerRadius = 5
        
        let thickness: CGFloat = 1
        let bottomBorder = CALayer()
        
        bottomBorder.frame = CGRect(x:0, y: self.tView.frame.size.height - thickness, width: self.tView.frame.size.width, height:thickness)
        bottomBorder.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        tView.layer.addSublayer(bottomBorder)
        
        bottomBorder.frame = CGRect(x:0, y: self.workView.frame.size.height - thickness, width: self.workView.frame.size.width, height:thickness)
        bottomBorder.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        workView.layer.addSublayer(bottomBorder)
        
        bottomBorder.frame = CGRect(x:0, y: self.roofView.frame.size.height - thickness, width: self.roofView.frame.size.width, height:thickness)
        bottomBorder.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        roofView.layer.addSublayer(bottomBorder)
        
        bottomBorder.frame = CGRect(x:0, y: self.generalView.frame.size.height - thickness, width: self.generalView.frame.size.width, height:thickness)
        bottomBorder.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        generalView.layer.addSublayer(bottomBorder)
        
        bottomBorder.frame = CGRect(x:0, y: self.AaView.frame.size.height - thickness, width: self.AaView.frame.size.width, height:thickness)
        bottomBorder.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        AaView.layer.addSublayer(bottomBorder)
        
        bottomBorder.frame = CGRect(x:0, y: self.ExView.frame.size.height - thickness, width: self.ExView.frame.size.width, height:thickness)
        bottomBorder.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        ExView.layer.addSublayer(bottomBorder)
        
        bottomBorder.frame = CGRect(x:0, y: self.CoView.frame.size.height - thickness, width: self.CoView.frame.size.width, height:thickness)
        bottomBorder.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        CoView.layer.addSublayer(bottomBorder)
        
        bottomBorder.frame = CGRect(x:0, y: self.NoView.frame.size.height - thickness, width: self.NoView.frame.size.width, height:thickness)
        bottomBorder.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        NoView.layer.addSublayer(bottomBorder)
        
        bottomBorder.frame = CGRect(x:0, y: self.TrView.frame.size.height - thickness, width: self.TrView.frame.size.width, height:thickness)
        bottomBorder.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        TrView.layer.addSublayer(bottomBorder)
        
        bottomBorder.frame = CGRect(x:0, y: self.DuView.frame.size.height - thickness, width: self.DuView.frame.size.width, height:thickness)
        bottomBorder.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        DuView.layer.addSublayer(bottomBorder)
        
        bottomBorder.frame = CGRect(x:0, y: self.UVView.frame.size.height - thickness, width: self.UVView.frame.size.width, height:thickness)
        bottomBorder.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        UVView.layer.addSublayer(bottomBorder)
        
        bottomBorder.frame = CGRect(x:0, y: self.CuView.frame.size.height - thickness, width: self.CuView.frame.size.width, height:thickness)
        bottomBorder.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        CuView.layer.addSublayer(bottomBorder)
        
        bottomBorder.frame = CGRect(x:0, y: self.ElView.frame.size.height - thickness, width: self.ElView.frame.size.width, height:thickness)
        bottomBorder.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        ElView.layer.addSublayer(bottomBorder)
        
        //Button
        btn1or2.layer.cornerRadius = 10
        btn3or4.layer.cornerRadius = 10
        btn5or6.layer.cornerRadius = 10
        btn6.layer.cornerRadius = 10
    }
}
