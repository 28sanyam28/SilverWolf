//
//  Global.swift
//  VedioCoverLetter
//
//  Created by AkashB on 01/12/18.
//  Copyright © 2018 AkashB. All rights reserved.
//

import Foundation
import UIKit
class Global
{
func alertMessage(message:String,viewController:UIViewController){
    //UIAlertController.Style.alert
    let alert = UIAlertController(title:"UR Cover", message: message, preferredStyle:UIAlertController.Style.alert )
    
    
    
    let attributedText = NSMutableAttributedString(string: message)
    
    let range = NSRange(location: 0, length: attributedText.length)
    alert.addAction(UIAlertAction(title:"Ok",style: UIAlertAction.Style.default, handler: {
        (action: UIAlertAction!) in
        
    }))
    
    alert.view.tintColor = hexStringToUIColor(hex:"#000000")
    
    viewController.present(alert, animated: true, completion: nil)
 }
 func hexStringToUIColor (hex:String) -> UIColor {
    
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#"))
    {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6)
    {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
     func validateEmail(email : String) -> Bool {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if email.count == 0
        {
            return false
        }
            
        else if !emailTest.evaluate(with: email)
        {
            return false
        }
            
        else
        {
            return true
        }
    }
}
//extension UIColor
//{
//    func colorWithHexString(hex:String)->UIColor
//    {
//        let alpha:CGFloat = 1
//        assert(hex[hex.startIndex] == "#", "Expected hex string of format #RRGGBB")
//
//        let scanner = Scanner(string: hex)
//        scanner.scanLocation = 1  // skip #
//
//        var rgb: UInt32 = 0
//        scanner.scanHexInt32(&rgb)
//
//        return UIColor(
//            red:   CGFloat((rgb & 0xFF0000) >> 16)/255.0,
//            green: CGFloat((rgb &   0xFF00) >>  8)/255.0,
//            blue:  CGFloat((rgb &     0xFF)      )/255.0,
//            alpha: alpha)
//    }
//}
