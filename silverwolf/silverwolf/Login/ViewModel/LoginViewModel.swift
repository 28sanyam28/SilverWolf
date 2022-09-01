//
//  LoginViewModel.swift
//  Silverwolf
//
//  Created by Mac on 01/04/22.
//

import Foundation


class LoginViewModel {
    var model: LoginModel = LoginModel()
    
    var error: String? = .none
    
   
    
    func validateLoginModel(completion: (_ success:[String: Any]?, _ error: String?) -> Void) {
        error = nil
     
            if model.email.isEmpty {
                error = ValidationError.emptyEmail
                completion(nil, error)
                return
            } else if !model.email.isValidEmailAddress {
                error = ValidationError.invalidEmail
                completion(nil, error)
                return
            }
//     
//        if model.password.isEmpty {
//            error = ValidationError.emptyPassword
//            completion(nil, error)
//        } else if !model.password.isValidPassword {
//            error = ValidationError.invalidPasswordChar
//            completion(nil, error)
//        }
    }
}

//Web Services implementation
extension LoginViewModel {
    func loginUserApiCall(_ params :[String:Any],_ result:@escaping(LoginResponseModel?) -> Void){
        Progress.instance.show()
        ApiManager<LoginResponseModel>.makeApiCall(APIUrl.UserApis.login, params: params, headers: nil, method: .post) { (response, resultModel) in
            Progress.instance.hide()
            if resultModel?.status == true{
                result(resultModel)
            }
            else{
                showMessage(with: response?["Message"] as? String ?? "")
            }
        }
    }
    
    
    func forgotPasswordApiCall(_ params :[String:Any],_ result:@escaping(LoginResponseModel?) -> Void){
        Progress.instance.show()
        ApiManager<LoginResponseModel>.makeApiCall(APIUrl.UserApis.forgotPassword, params: params, headers: nil, method: .post) { (response, resultModel) in
            Progress.instance.hide()
            if resultModel?.status == true{
                result(resultModel)
            }
            else{
                showMessage(with: response?["Message"] as? String ?? "")
            }
        }
    }
    
    func checkResetPasswordApiCall(_ params :[String:Any],_ result:@escaping(ChecklinkResetpasswordModel?) -> Void){
        Progress.instance.show()
        ApiManager<ChecklinkResetpasswordModel>.makeApiCall(APIUrl.UserApis.ChecklinkResetpassword, params: params, headers: nil, method: .post) { (response, resultModel) in
            Progress.instance.hide()
            if resultModel?.status == true{
                result(resultModel)
            }
            else{
                showMessage(with: response?["Message"] as? String ?? "")
            }
        }
    }
    func ResetPasswordApiCall(_ params :[String:Any],_ result:@escaping(ChecklinkResetpasswordModel?) -> Void){
        Progress.instance.show()
        ApiManager<ChecklinkResetpasswordModel>.makeApiCall(APIUrl.UserApis.resetPasswordSubmit, params: params, headers: nil, method: .post) { (response, resultModel) in
            Progress.instance.hide()
            if resultModel?.status == true{
                result(resultModel)
            }
            else{
                showMessage(with: response?["Message"] as? String ?? "")
            }
        }
    }
    
}
