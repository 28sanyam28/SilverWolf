//
//  SWUtility.swift
//  silverwolf
//
//  Created by Mac on 06/04/22.
//

import Foundation
import UIKit
import SystemConfiguration

class SWUtility
{
    static var shared = SWUtility()
    
    private init()
    {}
    

    
    //MARK: - show alert on the screen
//    func showAlertWith(Title:String, Message:String,onVC:UIViewController){
////        let alertMessage = UIAlertController.init(title: Title, message: Message, preferredStyle: .alert)
////        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
////            //println("you have pressed OK button");
////        }
////        alertMessage.addAction(OKAction)
////        onVC.present(alertMessage, animated: true, completion: nil)
//        onVC.view.makeToast(message: Message)
//    }
    
    func shareActivityControl(strSub:String,strAlert:String,viwContainer:UIView,vc:UIViewController)
    {
                    let strSubject = strSub
                    let strDesc = strAlert
                    let strReceipient = ""//NSURL(string: "mailto:\(txtEmail.text ?? "")")//URL(string: "mailto:\(txtEmail.text ?? "")")
        
        
        let shareItems:Array = [strDesc,strReceipient] as [Any]
                    let activityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
                    activityViewController.setValue(strSubject, forKey: "subject")
        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.print, UIActivity.ActivityType.postToWeibo, UIActivity.ActivityType.copyToPasteboard, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.postToVimeo,UIActivity.ActivityType.saveToCameraRoll,UIActivity.ActivityType.assignToContact]
        
                    if let popoverController = activityViewController.popoverPresentationController {
                        popoverController.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
                        popoverController.sourceView = viwContainer
                        popoverController.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
                    }
         vc.present(activityViewController, animated: true, completion: nil)
        
        
    }
    
    //MARK: - Add dotted dash line
    func addDashLineInBorder(viw : UIView ,borderColor:UIColor = .white)
    {
        let shapeLayer = CAShapeLayer()

        shapeLayer.frame = CGRect(x: 0, y: 0, width: viw.frame.size.width, height: viw.frame.size.height)
        shapeLayer.position = CGPoint(x: viw.frame.size.width / 2, y: viw.frame.size.height / 2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = borderColor.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [7,4]
        shapeLayer.path = UIBezierPath.init(rect: CGRect(x: 0, y: 0, width: viw.frame.size.width, height: viw.frame.size.height)).cgPath
        viw.layer.addSublayer(shapeLayer)

    }
    
    func stringToDate(strDate:String,strFormat:String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = strFormat//"dd-MM-yyyy HH:mm:ss"
        let date = dateFormatter.date(from: strDate) //date string
        print(date ?? "") //Convert String to Date
        return date!
    }
    func stringToStringDate(strDate:String,strcurrentFormat:String,strExpectedFormat:String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = strcurrentFormat//"dd/MM/yyyy HH:mm:ss a"
        
        let date = dateFormatter.date(from: strDate) //date string
        print(date ?? "") //Convert String to Date
        if date == nil
        {
            return ""
        }
        dateFormatter.dateFormat = strExpectedFormat
        let dateString = dateFormatter.string(from: date!)
        return dateString
    }
    func dateToString(date:Date,strFormat:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = strFormat//"dd-MM-yyyy"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    //To calculate height for label based on text size and width
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text

        label.sizeToFit()
        return label.frame.height
    }
}

