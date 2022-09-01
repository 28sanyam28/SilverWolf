//
//  MUserDefaults.swift
//  silverwolf
//
//  Created by apple on 17/06/22.
//

import UIKit

class MUserDefaults: NSObject {

    class MUserDefaultsConstants  {
        static let kApproved = "approved"
        static let kIsLoggedIn = "isLoggedIn"
        
        static let kisOTPVerified = "isOTPVerified"
        static let kIsSignedUp = "IsSignedUp"
        static let kPersonalDetailsData = "PersonalDetailsData"
    }
    
    static let Mshared = MUserDefaults()
    
    
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
