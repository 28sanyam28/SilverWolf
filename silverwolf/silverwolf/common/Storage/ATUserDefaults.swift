//
//  ATUserDefaults.swift
//  silverwolf
//
//  Created by apple on 17/06/22.
//

import Foundation
import UIKit

class ATUserDefaults: NSObject {

    class ATUserDefaultsConstants  {
        static let kApproved = "approved"
        static let kIsLoggedIn = "isLoggedIn"
        
        static let kisOTPVerified = "isOTPVerified"
        static let kIsSignedUp = "IsSignedUp"
        static let kPersonalDetailsData = "PersonalDetailsData"
    }
    
    static let ATshared = ATUserDefaults()
    
    
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
