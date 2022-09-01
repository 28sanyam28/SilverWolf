//
//  TUGHelpers.swift
//  Bumboo
//
//  Created by Nikhil Sharma on 19/02/16.
//  Copyright © 2016 Techugo Pvt Ltd. All rights reserved.
//

import UIKit
//import FBSDKShareKit

class TUGHelpers: NSObject
{
//    func shareOnFacebook(object: FBSDKShareOpenGraphObject, controller: UIViewController) {
//        let action = FBSDKShareOpenGraphAction()
//        action.actionType = "og.shares"
//        action.setObject(object, forKey: "object")
//        let content = FBSDKShareOpenGraphContent()
//        content.action = action
//        content.previewPropertyName = "object"
//        FBSDKShareDialog.show(from: controller, with: content, delegate: nil)
//
//    }
    func getCompressedImage(image:UIImage) -> UIImage {
        // Reducing file size to a 10th
        
        var actualHeight : CGFloat = image.size.height
        var actualWidth : CGFloat = image.size.width
//        let maxHeight : CGFloat = 1136.0
//        let maxWidth : CGFloat = 640.0
        let maxHeight : CGFloat = 800.0
        let maxWidth : CGFloat = 800.0
        var imgRatio : CGFloat = actualWidth/actualHeight
        let maxRatio : CGFloat = maxWidth/maxHeight
        var compressionQuality : CGFloat = 0.5
        
        if (actualHeight > maxHeight || actualWidth > maxWidth){
            if(imgRatio < maxRatio){
                //adjust width according to maxHeight
                imgRatio = maxHeight / actualHeight
                actualWidth = imgRatio * actualWidth
                actualHeight = maxHeight
            }
            else if(imgRatio > maxRatio){
                //adjust height according to maxWidth
                imgRatio = maxWidth / actualWidth
                actualHeight = imgRatio * actualHeight
                actualWidth = maxWidth
            }
            else{
                actualHeight = maxHeight
                actualWidth = maxWidth
                compressionQuality = 1
            }
        }
        
        let rect:CGRect = CGRect(x:0.0,y:0.0,width:actualWidth,height:actualHeight)
        UIGraphicsBeginImageContext(rect.size)
        image.draw(in: rect)
        let img:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        let imageData:NSData = img.jpegData(compressionQuality: compressionQuality)! as NSData
        UIGraphicsEndImageContext()
        return UIImage(data: imageData as Data)!
    }
    
    
//      func isNull(_ text: String?) -> Bool
//      {
//        
//        if (text?.isEqual(NSNull()))! || (text == "") || (text == "(null)") || (text == "<null>") || (text == "null") || text == nil || (text == "nil") || (text == "<nil>") || (text?.isEqual(NSNull.self))!  {
//            return true
//        }
//        else {
//            return false
//        }
//    }
    
    func saveDictionary(dict:NSDictionary, key: String){
        let preferences = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: dict)
        preferences.set(encodedData, forKey: key)
    }
    func getDictionary(key: String) -> NSDictionary
    {
        let preferences = UserDefaults.standard
        if preferences.object(forKey: key) != nil{
            let decoded = preferences.object(forKey: key)  as! Data
            let decodedDict = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! NSDictionary
            
            return decodedDict
        } else {
            let emptyDict = NSDictionary()
            return emptyDict
        }
    }
    func createButtonGradientLayerOnServicesWithAlpha(myView:UIView) {
        let gradientLayer = CAGradientLayer()
        
        var layerToRemove = CAGradientLayer()
        
        gradientLayer.frame = myView.bounds
        if myView.layer.sublayers != nil
        {
            for aLayer: CALayer in myView.layer.sublayers! {
                if (aLayer is CAGradientLayer) {
                    layerToRemove = (aLayer as? CAGradientLayer)!
                    layerToRemove.removeFromSuperlayer()
                }
            }
        }
        gradientLayer.colors = [UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.85).cgColor,UIColor.clear.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        //
        myView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func isNull(_ text: String?) -> Bool
    {
        
        if ((text == nil) || (text == "nil") || (text == "<nil>") || (text == "") || (text?.isEqual(NSNull.self))!)
        {
            return true
        }
        else {
            return false
        }
    }
    
//    func normalAlert(msg: String, view : UIView) {
//        let alert = UIAlertController(title: APP_NAME, message: msg, preferredStyle: .alert)
//
//        let dismiss = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
//
//        alert.addAction(dismiss)
//        view.window?.rootViewController?.present(alert, animated: true, completion: nil)
//
//    }
    func checkRating(rating: String) -> String {
        if rating != "R" && rating != "PG-13" && rating != "PG" && rating != "G" {
            return "NR"

        }
        else {
            return rating

        }
    }
    
//    func isNtworkReachable() -> Bool
//    {
//        let currentReachabiltyStatus = Reachability()?.currentReachabilityStatus
//        if currentReachabiltyStatus?.description == "No Connection"
//        {
//            return false
//        }
//        else
//        {
//            return true
//        }
//      
//    }
    
//    func createGradientLayerWithAlpha(myView:UIView,masterView:UIView) {
//        let gradientLayer = CAGradientLayer()
//
//        var layerToRemove = CAGradientLayer()
//        gradientLayer.frame = myView.bounds
//
//        for aLayer: CALayer in myView.layer.sublayers! {
//            if (aLayer is CAGradientLayer) {
//                layerToRemove = (aLayer as? CAGradientLayer)!
//                   layerToRemove.removeFromSuperlayer()
//            }
//        }
//
//        gradientLayer.colors = [UIColor().colorWithHexString(hex: COLOR_CERULEAN1).cgColor, UIColor().colorWithHexString(hex: COLOR_CERULEAN1).cgColor,UIColor().colorWithHexString(hex: COLOR_CERULEAN2).cgColor]
////
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
////
//        myView.layer.insertSublayer(gradientLayer, at: 0)
//    }
//
//    func createGradientReverseLayerWithAlpha(myView:UIView,masterView:UIView) {
//        let gradientLayer = CAGradientLayer()
//
//        var layerToRemove = CAGradientLayer()
//        gradientLayer.frame = myView.bounds
//
//        for aLayer: CALayer in myView.layer.sublayers! {
//            if (aLayer is CAGradientLayer) {
//                layerToRemove = (aLayer as? CAGradientLayer)!
//                layerToRemove.removeFromSuperlayer()
//            }
//        }
//
//           gradientLayer.colors = [UIColor().colorWithHexString(hex: COLOR_CERULEAN2).cgColor, UIColor().colorWithHexString(hex: COLOR_CERULEAN2).cgColor,UIColor().colorWithHexString(hex: COLOR_CERULEAN1).cgColor]
//        //
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
//        //
//        myView.layer.insertSublayer(gradientLayer, at: 0)
//    }
//
//    func createButtonGradientLayerWithAlpha(myView:UIView)
//    {
//        let gradientLayer = CAGradientLayer()
//        var layerToRemove = CAGradientLayer()
//        gradientLayer.frame = myView.bounds
//        if myView.layer.sublayers != nil
//        {
//        for aLayer: CALayer in myView.layer.sublayers!
//        {
//            if (aLayer is CAGradientLayer)
//            {
//                layerToRemove = (aLayer as? CAGradientLayer)!
//                layerToRemove.removeFromSuperlayer()
//            }
//        }
//        }
//        gradientLayer.colors = [UIColor().colorWithHexString(hex: COLOR_CERULEAN1).cgColor,UIColor().colorWithHexString(hex: COLOR_CERULEAN2).cgColor]
//        //
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
//        //
//        myView.layer.insertSublayer(gradientLayer, at: 0)
//    }
//    func createButtonGradientLayerWithAlphaEditProfile(myView:UIView)
//    {
//        let gradientLayer = CAGradientLayer()
//        var layerToRemove = CAGradientLayer()
//        gradientLayer.frame = myView.bounds
//        if myView.layer.sublayers != nil
//        {
//            for aLayer: CALayer in myView.layer.sublayers!
//            {
//                if (aLayer is CAGradientLayer)
//                {
//                    layerToRemove = (aLayer as? CAGradientLayer)!
//                    layerToRemove.removeFromSuperlayer()
//                }
//            }
//        }
//        gradientLayer.colors = [UIColor().colorWithHexString(hex: COLOR_CERULEAN1).cgColor,UIColor().colorWithHexString(hex: COLOR_CERULEAN2).cgColor]
//        //
//        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
//        //
//        myView.layer.insertSublayer(gradientLayer, at: 0)
//    }
//
//
//    func createButtonGradientLayerWithSideMenu(myView:UIView)
//    {
//        let gradientLayer = CAGradientLayer()
//        var layerToRemove = CAGradientLayer()
//        gradientLayer.frame = myView.bounds
//        if myView.layer.sublayers != nil
//        {
//            for aLayer: CALayer in myView.layer.sublayers! {
//                if (aLayer is CAGradientLayer) {
//                    layerToRemove = (aLayer as? CAGradientLayer)!
//                    layerToRemove.removeFromSuperlayer()
//                }
//            }
//        }
//        gradientLayer.colors = [UIColor().colorWithHexString(hex: COLOR_CERULEAN1).cgColor,UIColor().colorWithHexString(hex: COLOR_CERULEAN2).cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.3)
//        gradientLayer.endPoint = CGPoint(x: 0.5, y:1.0)
//        myView.layer.insertSublayer(gradientLayer, at: 0)
//    }
//
//    func createButtonGradientLayerWithAlphahorizentals(myView:UIView)
//    {
//        let gradientLayer = CAGradientLayer()
//
//        var layerToRemove = CAGradientLayer()
//
//
//
//
//        gradientLayer.frame = myView.bounds
//        if myView.layer.sublayers != nil
//        {
//            for aLayer: CALayer in myView.layer.sublayers! {
//                if (aLayer is CAGradientLayer) {
//                    layerToRemove = (aLayer as? CAGradientLayer)!
//                    layerToRemove.removeFromSuperlayer()
//                }
//            }
//        }
//        gradientLayer.colors = [UIColor().colorWithHexString(hex: COLOR_CERULEAN1).cgColor,UIColor().colorWithHexString(hex: COLOR_CERULEAN2).cgColor]
//        //
//        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.2)
//        //
//        myView.layer.insertSublayer(gradientLayer, at: 0)
//    }
//
//
//
//
//
//
//
//    func createButtonGradientLayerWithAlphaHorizontal(myView:UIView) {
//        let gradientLayer = CAGradientLayer()
//
//        var layerToRemove = CAGradientLayer()
//
//
//
//
//        gradientLayer.frame = myView.bounds
//        if myView.layer.sublayers != nil
//        {
//            for aLayer: CALayer in myView.layer.sublayers! {
//                if (aLayer is CAGradientLayer) {
//                    layerToRemove = (aLayer as? CAGradientLayer)!
//                    layerToRemove.removeFromSuperlayer()
//                }
//            }
//        }
//        gradientLayer.colors = [UIColor().colorWithHexString(hex: COLOR_CERULEAN1).cgColor,UIColor().colorWithHexString(hex: COLOR_CERULEAN2).cgColor]
//        //
//        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
//        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
//        //
//        myView.layer.insertSublayer(gradientLayer, at: 0)
//    }
//    func createButtonAlternateCalndar(myView:UIView) {
//        let screenSize = UIScreen.main.bounds.size
//        let gradientLayer = CAGradientLayer()
//
//        var layerToRemove = CAGradientLayer()
//
//        let frame =  CGRect(x: screenSize.width, y: 0, width: screenSize.width, height: myView.bounds.size.height)
//
//
//        gradientLayer.frame = frame
//        if myView.layer.sublayers != nil
//        {
//            for aLayer: CALayer in myView.layer.sublayers! {
//                if (aLayer is CAGradientLayer) {
//                    layerToRemove = (aLayer as? CAGradientLayer)!
//                    layerToRemove.removeFromSuperlayer()
//                }
//            }
//        }
//        gradientLayer.colors = [UIColor().colorWithHexString(hex: COLOR_CERULEAN1).cgColor,UIColor().colorWithHexString(hex: COLOR_CERULEAN2).cgColor]
//        //
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.2)
//        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
//        //
//        myView.layer.insertSublayer(gradientLayer, at: 0)
//    }
//
//
//
//    func createCalendarGradientLayerWithAlpha(myView:UIView)
//    {
//        let screenSize = UIScreen.main.bounds.size
//        let gradientLayer = CAGradientLayer()
//
//        var layerToRemove = CAGradientLayer()
//
//        let frame = CGRect(x: myView.frame.origin.x, y: myView.frame.origin.y, width: screenSize.width, height: myView.frame.size.height)
//
//        gradientLayer.frame = frame
//        if myView.layer.sublayers != nil
//        {
//            for aLayer: CALayer in myView.layer.sublayers! {
//                if (aLayer is CAGradientLayer) {
//                    layerToRemove = (aLayer as? CAGradientLayer)!
//                    layerToRemove.removeFromSuperlayer()
//                }
//            }
//        }
//        gradientLayer.colors = [UIColor().colorWithHexString(hex: COLOR_CERULEAN1).cgColor,UIColor().colorWithHexString(hex: COLOR_CERULEAN2).cgColor]
//        //
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
//        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
//        //
//        myView.layer.insertSublayer(gradientLayer, at: 0)
//    }
//    func setTextFieldBorder(_ txtField: UITextField) {
//        txtField.borderStyle = .none
//        let border = CALayer()
//        let borderwidth: CGFloat = 1.0
//        border.borderColor = UIColor(red: 243 / 255.0, green: 243 / 255.0, blue: 244 / 255.0, alpha: 1.0).cgColor
//        border.frame = CGRect(x: 0, y: txtField.frame.size.height - borderwidth, width: txtField.frame.size.width, height: txtField.frame.size.height)
//        border.borderWidth = borderwidth
//        txtField.layer.addSublayer(border)
//        txtField.layer.masksToBounds = true
//    }
//
//
//
//    func checkWithinRange(index: Int, range: NSRange) -> Bool {
//        if (range.toRange()?.contains(index))! {
//            return true
//        }
//        else {
//            return false
//        }
//
//    }
//
//    func getStartAndEndPosition(combination : NSMutableAttributedString, mainWord: String) -> NSRange {
//        if combination.length != 0 {
//            let startIndex = combination.length
//            let endIndex = mainWord.characters.count
//            let range = NSRange(location: startIndex, length: endIndex)
//            return range
//        }
//        else {
//            return NSRange(location: 0, length: mainWord.characters.count)
//        }
//    }

    
//    func convertHtmlStringToNormalString(html_str:String)->String
//    {
//        do {
//            let dataLocal = html_str.data(using: .utf8, allowLossyConversion: true)
//            if let d = dataLocal {
//
//                let str = try NSAttributedString(data: d,
//                                                 options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
//                                                 documentAttributes: nil)
//                return str.string
//            }
//        } catch {
//        }
//        return ""
//    }
//    
    
    func getAppDelegateObject() -> AppDelegate
    {
        let appObj = UIApplication.shared.delegate as! AppDelegate
        return appObj
    }
 
    
    
    // function to check network availability
//    func isNetworkAvailable()->Bool
//    {
//        let reachability: Reachability
//        do
//        {
//            reachability = try Reachability.NetworkReachable
//        }
//        catch
//        {
//            print("Unable to create Reachability")
//            return false
//        }
//        let networkStatus = reachability.currentReachabilityStatus
//        return networkStatus != .NotReachable
//    }
    
    // function to get time difference from nsdate
//    func getTimeDifferenceFromDate(dte:Int)->NSString
//    {
//        let timeScale:[NSString:Int]=["just now":1,"m":60,"h":3600,"d":86400,"w":605800,"M":2629743,"Y":31556926]
//        var scale:NSString?
//        var timeAgo:Int=Int(NSDate().timeIntervalSince1970*1000) - dte
//        if timeAgo < 60
//        {
//        scale = "just now"
//        }
//        else if timeAgo < 3600
//        {
//        scale = "m"
//        }
//        else if timeAgo < 86400
//        {
//        scale = "h"
//        }
//        else if timeAgo < 605800
//        {
//        scale = "d"
//        }
//        else if timeAgo < 2629743
//        {
//        scale = "w"
//        }
//        else if timeAgo < 31556926
//        {
//        scale = "M"
//        }
//        else
//        {
//        scale = "Y"
//        }
//       // timeAgo = timeAgo / [[timeScale objectForKey:scale] integerValue];
//        timeAgo = timeAgo / timeScale[scale!]!
//        if ((scale?.isEqual(to: "just now")) != nil)
//        {
//            return scale!
//        }
//        var s:NSString = ""
//        if timeAgo > 1
//        {
//          s = "s"
//        }
//        return String(format: "%d%@%@ ago",timeAgo,scale!,s) as NSString
//    }
    
//    function to get time difference from nsdate
    func getTimeDifferenceFromDate(dte:Int)->String
    {
        let timeScale:[NSString:Int]=["just now":1,"min":60,"hr":3600,"day":86400,"week":605800,"month":2629743,"Year":31556926]
        var scale:NSString?
        var timeAgo=Int(NSDate().timeIntervalSince1970*1000) - dte
        if timeAgo < 60
        {
            scale = "just now"
        }
        else if timeAgo < 3600
        {
            scale = "min"
        }
        else if timeAgo < 86400
        {
            scale = "hr"
        }
        else if timeAgo < 605800
        {
            scale = "day"
        }
        else if timeAgo < 2629743
        {
            scale = "week"
        }
        else if timeAgo < 31556926
        {
            scale = "month"
        }
        else
        {
            scale = "Year"
        }
        // timeAgo = timeAgo / [[timeScale objectForKey:scale] integerValue];
        timeAgo = timeAgo / timeScale[scale!]!
        if scale == "just now"
        {
            return scale! as String
        }
        var s:NSString = ""
        if timeAgo > 1
        {
            s = "s"
        }
        let strOuput = "\(timeAgo)\(scale!)\(s) ago"
        return strOuput
        //  return String(format: "%d%@%@ ago",timeAgo,scale!,s)
    }
    func showAlertWithTitle(alertTitle:String,messageBody:String,controller:UIViewController)
    {
        let value = TUGHelpers().getDictionary(key:"getLanguage") as? [String:Any] ?? [:]
        if value.count != 0
        {
        DispatchQueue.main.async()
        {
            let alertController = UIAlertController(title: alertTitle, message:
                messageBody, preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title:value["Ok"] as? String ?? "", style: UIAlertAction.Style.default,handler: nil))
            controller.present(alertController, animated: true, completion: nil)
        }
        }
    }
    func getLocalisedString(strKey:String)->String
    {
        let strValue = NSLocalizedString(strKey, comment: "")
        
        return strValue
    }

}
extension UIColor
{
    func colorWithHexString(hex:String)->UIColor
    {
        let alpha:CGFloat = 1
        assert(hex[hex.startIndex] == "#", "Expected hex string of format #RRGGBB")
        
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 1  // skip #
        
        var rgb: UInt32 = 0
        scanner.scanHexInt32(&rgb)
        
        return UIColor(
            red:   CGFloat((rgb & 0xFF0000) >> 16)/255.0,
            green: CGFloat((rgb &   0xFF00) >>  8)/255.0,
            blue:  CGFloat((rgb &     0xFF)      )/255.0,
            alpha: alpha)
    }
}
extension NSString
{
    //function to validate email address
    
    func isValidEmail() -> Bool
    {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidEmail(text:String) -> Bool
    {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isHavingSpace()->Bool
    {
        let spaceCount:Int = self.components(separatedBy: " ").count - 1
        if spaceCount == 0
        {
            // Zero spaces, Do Something
            return false
        }
        else
        {
            return true
        }
    }
}
extension Date
{
    func toLocalTime()->Date
    {
        let tz:NSTimeZone = NSTimeZone.default as NSTimeZone
        let seconds:TimeInterval = TimeInterval(tz.secondsFromGMT(for: self as Date))
        return Date(timeInterval: seconds, since: self as Date)
    }
    func toGlobalTime()->Date
    {
        let tz:NSTimeZone = NSTimeZone.default as NSTimeZone
        let seconds:TimeInterval = TimeInterval(-tz.secondsFromGMT(for: self as Date))
        return Date(timeInterval: seconds, since: self as Date)
    }
}
extension NSDate
{
    func toLocalTime()->NSDate
    {
        let tz:NSTimeZone = NSTimeZone.default as NSTimeZone
        let seconds:TimeInterval = TimeInterval(tz.secondsFromGMT(for: self as Date))
        return NSDate(timeInterval: seconds, since: self as Date)
    }
    func toGlobalTime()->NSDate
    {
        let tz:NSTimeZone = NSTimeZone.default as NSTimeZone
        let seconds:TimeInterval = TimeInterval(-tz.secondsFromGMT(for: self as Date))
        return NSDate(timeInterval: seconds, since: self as Date)
    }
}
extension DateFormatter
{
    func timeSince(from: NSDate, numericDates: Bool = false) -> String
    {
        let calendar = Calendar.current
        let now = NSDate()
        let dateLocal = now.toLocalTime()
        let earliest = dateLocal.earlierDate(from as Date)
        let latest = earliest == dateLocal as Date ? from : dateLocal
        let components = calendar.dateComponents([.year, .weekOfYear, .month, .day, .hour, .minute, .second], from: earliest.toLocalTime(), to: latest as Date)
        
        var result = ""
        
        if components.year! >= 2 {
            result = "\(components.year!) years ago"
        } else if components.year! >= 1 {
            if numericDates {
                result = "1 year ago"
            } else {
                result = "Last year"
            }
        } else if components.month! >= 2 {
            result = "\(components.month!) months ago"
        } else if components.month! >= 1 {
            if numericDates {
                result = "1 month ago"
            } else {
                result = "Last month"
            }
        } else if components.weekOfYear! >= 2 {
            result = "\(components.weekOfYear!) weeks ago"
        } else if components.weekOfYear! >= 1 {
            if numericDates {
                result = "1 week ago"
            } else {
                result = "Last week"
            }
        } else if components.day! >= 2 {
            result = "\(components.day!) days ago"
        } else if components.day! >= 1 {
            if numericDates {
                result = "1 day ago"
            } else {
                result = "Yesterday"
            }
        } else if components.hour! >= 2 {
            result = "\(components.hour!) hours ago"
        } else if components.hour! >= 1 {
            if numericDates {
                result = "1 hour ago"
            } else {
                result = "an hour ago"
            }
        } else if components.minute! >= 2 {
            result = "\(components.minute!) minutes ago"
        } else if components.minute! >= 1 {
            if numericDates {
                result = "1 minute ago"
            } else {
                result = "a minute ago"
            }
        } else if components.second! >= 3 {
            result = "\(components.second!) seconds ago"
        } else {
            result = "Just now"
        }
        
        return result
    }
    
     func timeSinceDiffrence(from: NSDate, numericDates: Bool = false) -> String
     {
        let calendar = Calendar.current
        let now = NSDate()
        let dateLocal = now.toLocalTime()
        let earliest = dateLocal.earlierDate(from as Date)
        let components = calendar.dateComponents([.year, .weekOfYear, .month, .day, .hour, .minute, .second], from: earliest.toLocalTime(), to: dateLocal as Date)
        
        var result = ""
        
        if components.year! >= 2 {
            result = "\(components.year!) years ago"
        } else if components.year! >= 1 {
            if numericDates {
                result = "1 year ago"
            } else {
                result = "Last year"
            }
        } else if components.month! >= 2 {
            result = "\(components.month!) months ago"
        } else if components.month! >= 1 {
            if numericDates {
                result = "1 month ago"
            } else {
                result = "Last month"
            }
        } else if components.weekOfYear! >= 2 {
            result = "\(components.weekOfYear!) weeks ago"
        } else if components.weekOfYear! >= 1 {
            if numericDates {
                result = "1 week ago"
            } else {
                result = "Last week"
            }
        } else if components.day! >= 2 {
            result = "\(components.day!) days ago"
        } else if components.day! >= 1 {
            if numericDates {
                result = "1 day ago"
            } else {
                result = "Yesterday"
            }
        } else if components.hour! >= 2 {
            result = "\(components.hour!) hours ago"
        } else if components.hour! >= 1 {
            if numericDates {
                result = "1 hour ago"
            } else {
                result = "an hour ago"
            }
        } else if components.minute! >= 2 {
            result = "\(components.minute!) minutes ago"
        } else if components.minute! >= 1 {
            if numericDates {
                result = "1 minute ago"
            } else {
                result = "a minute ago"
            }
        } else if components.second! >= 3 {
            result = "\(components.second!) seconds ago"
        } else {
            result = "Just now"
        }
        
        return result
    }

    
    
}



