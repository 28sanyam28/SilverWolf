//
//  SDUserDefaults.swift
//  silverwolf
//
//  Created by Mac on 05/04/22.
//

import UIKit

class SDUserDefaults: NSObject {

    class SDUserDefaultsConstants  {
        static let kApproved = "approved"
        static let kIsLoggedIn = "isLoggedIn"
        
        static let kisOTPVerified = "isOTPVerified"
        static let kIsSignedUp = "IsSignedUp"
        static let kPersonalDetailsData = "PersonalDetailsData"
    }
    
    static let shared = SDUserDefaults()
    
    
    //MARK:- String
    var apiAccessToken:String{
        get{
            return("\(UserDefaults.standard.value(forKey: "accessToken") ?? "")")
        }
        set(newValue){
            UserDefaults.standard.set(newValue, forKey: "accessToken")
        }
    }
    
    
}
