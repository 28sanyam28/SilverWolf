//
//  SWConstants.swift
//  silverwolf
//
//  Created by Mac on 11/04/22.
//

import Foundation
import UIKit


class SWConstants
{
    static let shared = SWConstants()
    
    let GLOBAL_APPDELEGATE = UIApplication.shared.delegate as? AppDelegate
    
    static let APP_DEL : AppDelegate = UIApplication.shared.delegate as! AppDelegate
   
    
    private init()
    {}
    
   
    
    //Storyboard Name
    let sbHome = "Home"
    let sbLogin = "Login"
    let sbProfile = "Profile"
   

    // Login
    let LoginVC = "LoginVC"
    
    ///Home
    let ScheduleDetailsVC = "ScheduleDetailsVC"
    let DetailsVC = "DetailsVC"
    let SSAVC = "SSAVC"
    let AttachmentsVC = "AttachmentsVC"
    
    // Profile
    let ProfileVC = "ProfileVC"
    
}
