//
//  ProfileVC.swift
//  Silverwolf
//
//  Created by Mac on 04/04/22.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var lblProfileName: UILabel!
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var btnLogout: UIView!
    
    @IBOutlet var txtFUsername: UITextField!
    @IBOutlet var txtFEmail: UITextField!
    @IBOutlet var txtFPhone: UITextField!
    @IBOutlet var txtFDesignation: UITextField!
//    @IBOutlet var txtFAddress: UITextField!
    @IBOutlet var txtFAddress: UITextView!
    
    var firstName = String()
    var lastName = String()
    var email = String()
    var phone = String()
    var designation = String()
    var address = String()
    var username: String?
    var password: String?
    var RememberMe: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirstResponse()
        profileImages()
        profileImage?.layer.cornerRadius = (profileImage?.frame.size.width ?? 0.0) / 2
        profileImage?.clipsToBounds = true
        profileImage?.layer.borderWidth = 3.0
        profileImage?.layer.borderColor = UIColor.white.cgColor
        if ((tabBarController?.tabBar.isHidden) != nil) {
            viewWillAppear(true)
        }
        self.tabBarController?.tabBar.isHidden = false
        btnLogout.layer.cornerRadius = 5
        btnLogout.layer.borderWidth = 1
        btnLogout.layer.borderColor = UIColor.black.cgColor
        rememberMe()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    override func viewDidLayoutSubviews() {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Navigation

    @IBAction func actionOnBtnLogout(_ sender: UIButton) {
        
        self.tabBarController?.tabBar.isHidden = true
        
        let sb = UIStoryboard(name: SWConstants.shared.sbLogin, bundle: nil)
        if let vc = sb.instantiateViewController(withIdentifier: SWConstants.shared.LoginVC) as? LoginVC {
            vc.rUsername = username ?? ""
            vc.rPassword = password ?? ""
            vc.modalPresentationStyle = .overCurrentContext
//            vc.tabBarController?.tabBar.isHidden = true
            if let bundleID = Bundle.main.bundleIdentifier {
                UserDefaults.standard.removePersistentDomain(forName: bundleID)
            }
            UserDefaults.standard.set(RememberMe, forKey: "remember")
            UserDefaults.standard.set(username, forKey: "rUser")
            UserDefaults.standard.set(password, forKey: "rPass")
            self.present(vc, animated: true, completion: nil)
        }
        
    }
}
extension ProfileVC {
    func FirstResponse() {
        let mail = UserDefaults.standard.string(forKey: "email")
        let role = UserDefaults.standard.string(forKey: "role")
        let phn = UserDefaults.standard.string(forKey: "phone")
        let adr = UserDefaults.standard.string(forKey: "address")
        lblProfileName.text = firstName + " " + lastName
        txtFUsername.text = firstName + " " + lastName
        txtFEmail.text = mail
        txtFPhone.text = phn
        txtFDesignation.text = role
        txtFAddress.text = adr
//        backView.clipsToBounds = true
//        backView.layer.cornerRadius = 30
//        backView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // Top right corner, Top left corner respectively
        
        mainView.clipsToBounds = true
        mainView.layer.cornerRadius = 30
        mainView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // Top right corner, Top left corner respectively
        self.navigationController?.navigationBar.isHidden = true
    }
    func rememberMe() {
        self.RememberMe = UserDefaults.standard.string(forKey: "rememberMe")
        if RememberMe == "1" {
            self.username = UserDefaults.standard.string(forKey: "userMail") ?? ""
            self.password = UserDefaults.standard.string(forKey: "userPassword") ?? ""
        }
        else {
           print("Nothing")
        }
    }
}
extension ProfileVC {
    func profileImages() {
        if let data = UserDefaults.standard.string(forKey: "profileImg")
        {
//            self.profileImg = data
            data.stringsToImages {(image) in
                DispatchQueue.main.async {
                    self.profileImage.image = image
                }
            }
        }
    }
}
extension String {

    func stringsToImages(_ handler: @escaping ((UIImage?)->())) {
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

