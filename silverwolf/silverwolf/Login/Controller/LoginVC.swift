//
//  LoginVC.swift
//  Silverwolf
//
//  Created by Mac on 31/03/22.
//

import UIKit
import IQKeyboardManagerSwift

class LoginVC: UIViewController {

    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var txtResetPasswordStr: UITextField!
    @IBOutlet weak var blurview: UIView!
    //  MARK: - Login View
    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnPassword: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet var imgRememberMe: UIImageView!
    @IBOutlet var btnRememberMe: UIButton!
    
    //  MARK: - Forgot Password View
    @IBOutlet weak var forgotPasswordView: UIView!
    @IBOutlet weak var txtEmailId: UITextField!
    @IBOutlet weak var btnSend: UIButton!
    
    
    //  MARK: - ResetPassword View
    @IBOutlet weak var resetPasswordView: UIView!
    
    //@IBOutlet weak var txtResetPassword: UITextField!
    @IBOutlet weak var txtNewPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    @IBOutlet weak var btnDone: UIButton!
    
    //MARK: - VARIABLES
    let viewModel: LoginViewModel = LoginViewModel()
    var userData: UserData?
    var resetPasswordStr = String()
    var username = String()
    var firstName = String()
    var lastName = String()
    var email = String()
    var phone = String()
    var designation = String()
    var address = String()
    var id = Int()
    var empId = Int()
    
    let button = UIButton(type: .custom)
    
    var rememberMe:Bool = false
    
    var rUsername = String()
    var rPassword = String()
    
    var profileImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        txtUsername.text = rUsername
        txtPassword.text = rPassword
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        btnHidePassword()
////        self.blurview.isHidden = true
        txtEmailId.delegate = self
        txtPassword.delegate = self
//
        btnLogin.layer.cornerRadius = 8
        btnSend.layer.cornerRadius = 8
        btnDone.layer.cornerRadius = 8
////        btnReset.layer.cornerRadius = 8
//
        hideKeyboardWhenTappedAround()
         loginView.layer.cornerRadius = 30.0
        //loginView.roundCorners([.topLeft, .topRight], radius: 30)
        forgotPasswordView.layer.cornerRadius = 30.0
//        forgotPasswordView.roundCorners([.topLeft, .topRight], radius: 30)
        resetPasswordView.layer.cornerRadius = 30.0
//        resetPasswordView.roundCorners([.topLeft, .topRight], radius: 30)
//
        forgotPasswordView.isHidden = true
        resetPasswordView.isHidden = true
        IQKeyboardManager.shared.enable = true
        CheckAndAdd()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if UserDefaults.standard.string(forKey: "remember") == "1" {
            if let check = UIImage(named: "check"){
                imgRememberMe.image = check
            }
            rememberMe = true
            self.txtUsername.text = UserDefaults.standard.string(forKey: "userMail") ?? ""
            self.txtPassword.text = UserDefaults.standard.string(forKey: "userPassword") ?? ""
        }
        else {
            if let uncheck = UIImage(named: "empty") {
                imgRememberMe.image = uncheck
            }
            rememberMe = false
        }
        txtUsername.text = UserDefaults.standard.string(forKey: "rUser")
        txtPassword.text = UserDefaults.standard.string(forKey: "rPass")

        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func btnHidePassword() {
            button.setImage(UIImage(named: "closePassword"), for: .normal)
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
            button.frame = CGRect(x: CGFloat(txtPassword.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
            button.addTarget(self, action: #selector(self.revealPassword), for: .touchUpInside)

            txtPassword.isSecureTextEntry = true
            txtPassword.rightView = button
            txtPassword.rightViewMode = .always
        }
    // MARK: - @IBActions
    
       
    @IBAction func gestureClicked(_ sender: Any) {
        loginView.isHidden = false
        blurview.isHidden = true
    }
    
    
        @objc func revealPassword(_ sender: Any) {
            txtPassword.isSecureTextEntry = !txtPassword.isSecureTextEntry
            if txtPassword.isSecureTextEntry {
                button.setImage(UIImage(named: "closePassword"), for: .normal)
            } else {
                button.setImage(UIImage(named: "seePassword"), for: .normal)
            }
        }
    
    func getCheckResetPass() {
        let param = ["ResetpasswordString":txtResetPasswordStr.text ?? ""]
        viewModel.checkResetPasswordApiCall(param) { (model) in
            if model?.status == true {
                self.resetPasswordStr = model?.userData?.resetPasswordString ?? ""
                self.username = model?.userData?.email ?? ""
                self.blurview.isHidden = true
                self.forgotPasswordView.isHidden = true
                self.resetPasswordView.isHidden = false
                self.loginView.isHidden = true
                
            }else {
                if let errorMsg = model?.message {
                    showMessage(with: errorMsg)
                    self.blurview.isHidden = true
                    self.forgotPasswordView.isHidden = false
                    self.resetPasswordView.isHidden = true
                    self.loginView.isHidden = true
                }
            }
        }
    }
   
    // MARK: - Login View Button Action

    @IBAction func actionOnBtnPassword(_ sender: Any) {
        
    }
    
    @IBAction func actionOnBtnReset(_ sender: Any) {
        getCheckResetPass()
    }
    
    @IBAction func actionOnBtnForgotPassword(_ sender: Any) {
        
        self.loginView.isHidden = true
        forgotPasswordView.isHidden = false
       // self.resetPasswordView.isHidden = true
    }
    
    @IBAction func actionOnBtnLogin(_ sender: Any) {
       //self.gotoHome()
        if validateLogin(){
            let email = self.txtUsername.text?.trimmed ?? ""
            let password = self.txtPassword.text?.trimmed ?? ""
            let params = ["UserName":email,"Password":password]
        viewModel.loginUserApiCall(params) { (model) in
            if model?.status == true {

                self.userData = model?.userData
                SDUserDefaults.shared.apiAccessToken = model?.userData?.token ??  ""
                self.firstName = model?.userData?.firstName ?? ""
                self.lastName = model?.userData?.lastName ?? ""
                self.email = model?.userData?.email ?? ""
                self.phone = model?.userData?.contactNumber ?? ""
                self.designation = model?.userData?.roleName ?? ""
                self.address = model?.userData?.address ?? ""
                self.id = model?.userData?.id ?? 0
                self.empId = model?.empID ?? 0
                self.profileImage = model?.userData?.profilepath ?? ""
                
                
                UserDefaults.standard.set(self.email, forKey: "email")
                UserDefaults.standard.set(self.designation, forKey: "role")
                UserDefaults.standard.set(self.phone, forKey: "phone")
                UserDefaults.standard.set(self.address, forKey: "address")
                
                UserDefaults.standard.set(self.profileImage, forKey: "profileImg")
                UserDefaults.standard.set(self.empId, forKey: "empId")
                UserDefaults.standard.set(self.id, forKey: "id")
                UserDefaults.standard.set(self.firstName + " " + self.lastName, forKey: "fullName")
                print(self.empId)
                let key = "UserData"
                UserDefaults.standard.setCodableObject(self.userData, forKey: key)
                self.gotoHome()
               // showMessage(with: model?.message ?? "User Successfully Login")
            }else {
                showMessage(with: model?.message ?? "Error")
            }
        }
        }
        
        if rememberMe {
            UserDefaults.standard.set("1", forKey: "rememberMe")
            UserDefaults.standard.set(txtUsername.text, forKey: "userMail")
            UserDefaults.standard.set(txtPassword.text, forKey: "userPassword")
        }
        else {
            UserDefaults.standard.set("2", forKey: "rememberMe")
        }
       
    }
    
    func gotoHome(){
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
       // self.navigationController?.pushViewController(vc, animated: true)
        vc.Firstname = firstName.self
        vc.Lastname = lastName.self
        vc.Email = email.self
        vc.Phone = phone.self
        vc.Designation = designation.self
        vc.Address = address.self
        vc.id = id.self
        vc.empId = empId.self
        let navVC = UINavigationController(rootViewController: vc)

        navVC.navigationBar.isHidden = true
        navVC.navigationBar.tintColor = .white
        navVC.navigationBar.barStyle = .black
        navVC.navigationBar.barTintColor = .black
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = navVC
        }
        
        
    }
    
    // MARK: - ForgotPassword View Button Action
    @IBAction func actionOnBtnSend(_ sender: Any) {
        
        let email = self.txtEmailId.text ?? ""
        self.username = email
        let params = ["UserName":self.txtEmailId.text ?? ""] as [String : Any]
        
        viewModel.forgotPasswordApiCall(params) { (model) in
            if model?.status == true {
                self.forgotPasswordView.isHidden = true
                self.resetPasswordView.isHidden = false
                self.loginView.isHidden = true
//                self.blurview.isHidden = false
                let userData = model?.userData
                showMessage(with: model?.message ?? "User forgot password", theme: .success)
            }else {
                showMessage(with: model?.message ?? "Error",theme: .error)
            }
        }
        
        
        
    }
    
    
    
    // MARK: - ResetPassword View Button Action
    @IBAction func actionOnBtnDone(_ sender: Any) {
        
         if validResetPassword()
        {
             let param = ["UserName":self.username, "Password":txtNewPassword.text ?? "","ConfirmPassword":txtConfirmPassword.text ?? "","ResetPasswordString":txtResetPasswordStr.text ?? ""]
             print(param)
            viewModel.ResetPasswordApiCall(param) { (model) in
//                self.getCheckResetPass()
                if model?.status == true {
                    showMessage(with: model?.message ?? "Success",theme: .success)
                    self.loginView.isHidden = false
                    self.forgotPasswordView.isHidden = true
                    self.resetPasswordView.isHidden = true
                }else {
                    if let errorMsg = model?.message {
                        showMessage(with: errorMsg,theme: .error)
                    }
                }
            }
        }
        
    }
    
    @IBAction func actionOnBtnBackToLogin(_ sender: Any) {
        self.loginView.isHidden = false
        self.forgotPasswordView.isHidden = true
        self.resetPasswordView.isHidden = true
    }
    
    @IBAction func btnRememberMeTapped(_ sender: Any) {
        if rememberMe == false {
            if let check = UIImage(named: "check") {
                imgRememberMe.image = check
            }
            rememberMe = true
        }
        else {
            if let uncheck = UIImage(named: "empty") {
                imgRememberMe.image = uncheck
            }
            rememberMe = false
        }
    }
}


//========================================
// MARK: - UITextFieldDelegate
extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtEmailId {
            textField.keyboardType = .emailAddress
            textField.resignFirstResponder()
            txtPassword.becomeFirstResponder()
        } else if textField == txtPassword {
            textField.resignFirstResponder()
        }
        return true
    }
}
//========================================
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    //-----------------------------------------
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    //-----------------------------------------
}


extension LoginVC {
    
    func validateLogin() -> Bool    
    {
        if txtUsername.text == ""
        {
            showMessage(with: ValidationError.emptyEmail)
            return false
        }else if let email = txtUsername.text , email.isValidEmailAddress == false {
            showMessage(with: ValidationError.invalidEmail)
            return false
        }
        
        if txtPassword.text == ""
        {
            showMessage(with: ValidationError.emptyPassword)
            return false
        }else if let password = txtPassword.text , password.isValidPassword == false {
            showMessage(with: ValidationError.invalidPassword)
            return false
        }
       
        
        return true
    }
    
    func validResetPassword() -> Bool
    {
        if txtResetPasswordStr.text == ""
        {
            showMessage(with: ValidationError.emptyOTP)
            return false
        }
        if txtNewPassword.text == ""
        {
            showMessage(with: ValidationError.newPassword)
            return false
        }
        if txtConfirmPassword.text == ""
        {
            showMessage(with: ValidationError.confirmPassword)
            return false
        }
        if txtNewPassword == txtConfirmPassword
        {
            showMessage(with: ValidationError.passwordMismatch)
            return false
        }
        return true
    }
}
extension UserDefaults {
  func setCodableObject<T: Codable>(_ data: T?, forKey defaultName: String) {
    let encoded = try? JSONEncoder().encode(data)
    set(encoded, forKey: defaultName)
  }
}
extension LoginVC {
    func CheckAndAdd() {
        if UserDefaults.standard.string(forKey: "rememberMe") == "1" {
            if let check = UIImage(named: "check") {
                imgRememberMe.image = check
            }
            rememberMe = true
            self.txtUsername.text = UserDefaults.standard.string(forKey: "userMail") ?? ""
            self.txtPassword.text = UserDefaults.standard.string(forKey: "userPassword") ?? ""
        }
        else {
            if let uncheck = UIImage(named: "empty") {
                imgRememberMe.image = uncheck
            }
            rememberMe = false
        }
    }
}
