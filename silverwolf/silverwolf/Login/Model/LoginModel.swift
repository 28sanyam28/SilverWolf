//
//  LoginModel.swift
//  Silverwolf
//
//  Created by Mac on 01/04/22.
//

import Foundation

class LoginModel {
    var email: String = ""
    var password: String = ""
    
    
    init() {
    }
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
       
    }
}
