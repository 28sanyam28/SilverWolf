//
//  TUGUIExtension.swift
//  Bumboo
//
//  Created by Nikhil Sharma on 19/02/16.
//  Copyright © 2016 Techugo Pvt Ltd. All rights reserved.
//

import UIKit

var isSave:Bool = false
//var extensionGlobal:TUGUIExtension?

class TUGUIExtension: NSObject
{
    var parentController:UIViewController?
    var activity:UIActivityIndicatorView?

    class var sharedInstance:TUGUIExtension
    {
        struct Values
        {
            static var onceToken=TUGUIExtension()
            static var instance:TUGUIExtension? = TUGUIExtension()
        }
        return Values.instance!
    }

}



 extension UIButton
{
    func setButtonImage(imageName:String)
    {
        self.setImage(UIImage(named: imageName), for: UIControl.State.normal)
    }
    func setButtonTitle(title:String)
    {
        self .setTitle(title, for: UIControl.State.normal )
    
    }
    func setButtonTitleColor(color:UIColor)
    {
        self.setTitleColor(color, for: UIControl.State.normal)
    }
    func setButtonBackgroudImage(imageName:String)
    {
        self.setBackgroundImage(UIImage(named: imageName), for: UIControl.State.normal)
    }
    func setButtonBackgroundColor(color:UIColor)
    {
        self.setBackgroundColor(color: color, state: UIControl.State.normal)
    }
    func setBackgroundColor(color:UIColor,state:UIControl.State)
    {
        self.setBackgroundImage(self.imageWithColor(color: color), for: UIControl.State.normal)
    }
    func imageWithColor(color:UIColor)->UIImage
    {
        let rect:CGRect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context:CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}


extension UITextField
{
    func setNumberKeyboard()
    {
        let numberToolbar:UIToolbar = UIToolbar.init(frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width,height: 50))
        let systemVersion:NSString = UIDevice.current.systemVersion as NSString
        if  systemVersion.floatValue >= 7
        {
          numberToolbar.barTintColor = UIColor(red: 224.0/255.0, green: 225.0/255.0, blue: 226.0/255.0, alpha: 1.0)
        }
        else
        {
            numberToolbar.tintColor = UIColor(red: 224.0/255.0, green: 225.0/255.0, blue: 226.0/255.0, alpha: 1.0)
        }
        
        numberToolbar.items = NSArray(objects:
            UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(UITextField.cancelNumberPad)),
                                      UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil),
                                      UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(UITextField.doneWithNumberPad))) as? [UIBarButtonItem]
        
        numberToolbar.sizeToFit()
        self.inputAccessoryView = numberToolbar
    }
    @objc func cancelNumberPad()
    {
       self.resignFirstResponder()
        self.text = ""
    }
    @objc func doneWithNumberPad()
    {
     self.resignFirstResponder()
    }
    func isBlank()->Bool
    {
        if self.text?.count == 0
        {
            return true
        }
        else
        {
            return false
        }
    }
    func setPadding()
    {
        let paddingView:UIView = UIView(frame:CGRect(x:0, y:0, width:8, height:self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = UITextField.ViewMode.always
        
        let paddingViewRight:UIView = UIView(frame: CGRect(x:0, y:0, width:8, height:self.frame.size.height))
        self.rightView = paddingViewRight
        self.rightViewMode = UITextField.ViewMode.always
    }
    func isValidEmail()->Bool
    {
        let stricterFilter:Bool = true
        if self.text?.count == 0
        {
            return false
        }
        let stricterFilterString:NSString = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
        let laxString:NSString = ".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*"
        let emailRegex:NSString = stricterFilter ? stricterFilterString : laxString
        let emailTest:NSPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self.text)
        
    }
    func isValidEmaill()->Bool
    {
        let stricterFilter:Bool = true
        if self.text?.count == 0
        {
            return true
        }
        let stricterFilterString:NSString = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
        let laxString:NSString = ".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*"
        let emailRegex:NSString = stricterFilter ? stricterFilterString : laxString
        let emailTest:NSPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self.text)
        
    }
    func isVPN() -> Bool
    {
        let emailRegEx = "^[a-zA-Z]{2}[0-9]{20}$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    func changeTextAlignment()
    {
        if self.textAlignment == NSTextAlignment.left
        {
            self.textAlignment = NSTextAlignment.right
        }
        else
        {
            self.textAlignment = NSTextAlignment.left
        }
    }
    func setGrayBorder()
    {
        self.layer.borderColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1.0).cgColor
        self.layer.borderWidth = 1.0
    }
    func setDarkGrayColor()
    {
        self.setValue(UIColor(red: 123.0/255.0, green: 123.0/255.0, blue: 123.0/255.0, alpha: 1.0), forKey: "_placeholderLabel.textColor")
    }
}


extension UIPickerView
{
    func setUpPickerViewWithDoneButton()
    {
        let numberToolbar:UIToolbar = UIToolbar(frame: CGRect(x:0, y:0, width:320, height:44))
        numberToolbar.barStyle = UIBarStyle.blackTranslucent
        numberToolbar.items = NSArray(objects: UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil),
                                      UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(UITextField.doneWithNumberPad))) as? [UIBarButtonItem]
        numberToolbar.sizeToFit()
        self .addSubview(numberToolbar)
    }
    func doneWithNumberPad()
    {
        self.superview!.removeFromSuperview()
    }
}


extension UILabel
{
    func setHeaderFont()
    {
        self.textColor = UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue-Medium", size: 16.0)
    }
    
    func setFont_tiny() {
        self.textColor = UIColor(red: 131.0 / 255.0, green: 131.0 / 255.0, blue: 131.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue", size: 11.0)
    }
    
    func setFont_tiny_data() {
        self.textColor = UIColor(red: 66.0 / 255.0, green: 66.0 / 66.0, blue: 66.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 11.0)
    }
    
    func setFont_small() {
        self.textColor = UIColor(red: 66.0 / 255.0, green: 66.0 / 255.0, blue: 66.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue", size: 12.0)
    }
    
    func setFont_small_data() {
        self.textColor = UIColor(red: 66.0 / 255.0, green: 66.0 / 255.0, blue: 66.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 12.0)
    }
    
    func setFont_medium() {
        self.textColor = UIColor(red: 131.0 / 255.0, green: 131.0 / 255.0, blue: 131.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue", size: 13.0)
    }
    
    func setFont_medium_data() {
        self.textColor = UIColor(red: 131.0 / 255.0, green: 131.0 / 255.0, blue: 131.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
    }
    
    func setFont_medium_fullPage() {
        self.textColor = UIColor(red: 66.0 / 255.0, green: 66.0 / 255.0, blue: 66.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue", size: 13.0)
    }
    
    func setFont_medium_data_fullPage() {
        self.textColor = UIColor(red: 66.0 / 255.0, green: 66.0 / 255.0, blue: 66.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
    }
    
    func setFont_textline_news() {
        self.textColor = UIColor(red: 66.0 / 255.0, green: 66.0 / 255.0, blue: 66.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue", size: 13.0)
    }
    
    func setFont_textline_other() {
        self.textColor = UIColor(red: 131.0 / 255.0, green: 131.0 / 255.0, blue: 131.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue", size: 13.0)
    }
    
    func setFont_label() {
        self.textColor = UIColor(red: 66.0 / 255.0, green: 66.0 / 255.0, blue: 66.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue", size: 16.0)
    }
    
    func setFont_dropdown() {
        self.textColor = UIColor(red: 12.0 / 255.0, green: 101.0 / 255.0, blue: 72.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue", size: 13.0)
    }
    
    func setFont_quotename() {
        self.textColor = UIColor(red: 66.0 / 255.0, green: 66.0 / 255.0, blue: 66.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 16.0)
    }
    
    func setFont_quotename_date() {
        self.textColor = UIColor(red: 131.0 / 255.0, green: 131.0 / 255.0, blue: 131.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue", size: 14.0)
    }
    
    func setFont_title() {
        self.textColor = UIColor(red: 249.0 / 255.0, green: 111.0 / 255.0, blue: 45.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue", size: 16.0)
    }
    
    func setFont_last() {
        self.textColor = UIColor(red: 1.0 / 255.0, green: 120.0 / 255.0, blue: 233.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 16.0)
    }
    
    func setFont_change() {
        self.textColor = UIColor(red: 19.0 / 255.0, green: 179.0 / 255.0, blue: 95.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "Helvetica-Bold", size: 16.0)
    }
    
    func setFont_change_down() {
        self.textColor = UIColor(red: 251.0 / 255.0, green: 37.0 / 255.0, blue: 26.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "Helvetica-Bold", size: 16.0)
    }
    
    func setFont_change_small() {
        self.textColor = UIColor(red: 19.0 / 255.0, green: 179.0 / 255.0, blue: 95.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
    }
    
    func setFont_change_down_small() {
        self.textColor = UIColor(red: 251.0 / 255.0, green: 37.0 / 255.0, blue: 26.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
    }
    
    func setFont_symbolprice() {
        self.textColor = UIColor(red: 1.0 / 255.0, green: 120.0 / 255.0, blue: 233.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 17.0)
    }
    
    func setFont_news_divider() {
        self.textColor = UIColor(red: 249.0 / 255.0, green: 111.0 / 255.0, blue: 45.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue", size: 14.0)
    }
    
    func setFont_column_headline() {
        self.textColor = UIColor(red: 66.0 / 255.0, green: 66.0 / 255.0, blue: 66.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 12.0)
    }
    
    func setFont_coop() {
        self.textColor = UIColor(red: 12.0 / 255.0, green: 101.0 / 255.0, blue: 72.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
    }
    
    func setFont_table_border() {
        self.textColor = UIColor(red: 12.0 / 255.0, green: 101.0 / 255.0, blue: 72.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue", size: 13.0)
    }
    
    func setFont_time_dist() {
        // [self setTextColor:[UIColor colorWithRed:163.0/255.0f green:163.0/255.0f blue:163.0/255.0f alpha:1.0]];
        self.font = UIFont(name: "HelveticaNeue", size: 12.0)
        self.setOrangeColor()
    }
    
    func setFont_headline_full() {
        self.textColor = UIColor(red: 66.0 / 255.0, green: 66.0 / 255.0, blue: 66.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
    }
    
    func setFont_page_title() {
        self.textColor = UIColor(red: 249.0 / 255.0, green: 111.0 / 255.0, blue: 45.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue", size: 14.0)
    }
    
    func setFontHelevetica(size: CGFloat)
    {
        self.font = UIFont(name: "Helvetica", size: size)
    }
    
    func setFontHeleveticaBold(size: CGFloat)
    {
        self.font = UIFont(name: "Helvetica-Bold", size: size)
    }
    
    func setOrangeColor()
    {
        //249, 111, 45
        self.textColor = UIColor(red: 249.0 / 255.0, green: 111.0 / 255.0, blue: 45.0 / 255.0, alpha: 1.0)
    }
    
    func setGray42Color() {
        self.textColor = UIColor(red: 66.0 / 255.0, green: 66.0 / 255.0, blue: 66.0 / 255.0, alpha: 1.0)
    }
    
    func setHoldColor() {
        self.textColor = UIColor(red: 77.0 / 255.0, green: 57.0 / 255.0, blue: 172.0 / 255.0, alpha: 1.0)
    }
    
    func setRedColor() {
        self.textColor = UIColor(red: 251.0 / 255.0, green: 37.0 / 255.0, blue: 26.0 / 255.0, alpha: 1.0)
    }
    
    func setGreenColor() {
        self.textColor = UIColor(red: 19.0 / 255.0, green: 179.0 / 255.0, blue: 95.0 / 255.0, alpha: 1.0)
    }
    
    func setDarkCaptionGreenColor() {
        self.textColor = UIColor(red: 12.0 / 255.0, green: 101.0 / 255.0, blue: 72.0 / 255.0, alpha: 1.0)
    }
    
    func setWhiteColor() {
        self.textColor = UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    }
    
    func setSoftRedColor() {
        self.textColor = UIColor(red: 238.0 / 255.0, green: 105.0 / 255.0, blue: 96.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 11.0)
    }
    
    func setFontSideMenuCell() {
        self.textColor = UIColor(red: 66.0 / 255.0, green: 66.0 / 255.0, blue: 66.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "Helvetica", size: 15.0)
    }
    
    func setFontLeftLabel() {
        self.font = UIFont(name: "Helvetica", size: 16.0)
    }
    
    func setBlueLastColor() {
        self.textColor = UIColor(red: 1.0 / 255.0, green: 120.0 / 255.0, blue: 233.0 / 255.0, alpha: 1.0)
    }
    
    func setDarkGreenColor() {
        self.textColor = UIColor(red: 36.0 / 255.0, green: 67.0 / 255.0, blue: 69.0 / 255.0, alpha: 1.0)
    }
    
    func setLightGreenColor() {
        self.textColor = UIColor(red: 157.0 / 255.0, green: 158.0 / 255.0, blue: 152.0 / 255.0, alpha: 1.0)
    }
    
    func setBlackColor() {
        self.textColor = UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
    }
    
    func changeTextAlignment() {
        if self.textAlignment == .left {
            self.textAlignment = .right
        }
        else {
            self.textAlignment = .left
        }
    }
    
//    func setLabelHeightFit(string: NSString)
//    {
//        if (string is NSNull.self)
//        {
//            return
//        }
//        var labelSize: CGSize = string.sizeWithFont(self.font, constrainedToSize: self.frame.size, lineBreakMode: NSLineBreakMode.ByWordWrapping)
//        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, labelSize.height + 2)
//    }
//    
//    func setLabelToWidthFit(string: NSString)
//    {
//        if (string is NSNull.self)
//        {
//            return
//        }
//        var labelSize: CGSize = string.sizeWithFont(self.font, constrainedToSize: self.frame.size, lineBreakMode: NSLineBreakMode.ByWordWrapping)
//        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, labelSize.width, self.frame.size.height)
//    }
}

extension UIView
{
    func setViewColorSoftRedColor()
    {
       self.backgroundColor = UIColor(red: 238.0 / 255.0, green: 105.0 / 255.0, blue: 96.0 / 255.0, alpha: 1.0)
    }
    func addGradientToViewFromTop()
    {
        let gradient:CAGradientLayer = CAGradientLayer(layer: self)
        gradient.frame = self.bounds
        gradient.colors = [UIColor.darkGray.cgColor,UIColor.clear.cgColor]
        gradient.frame = CGRect(x:0,y:0, width:UIScreen.main.bounds.size.width, height:self.frame.size.height)
        self.layer .insertSublayer(gradient, at: 0)
    }
    func addGradientToViewFromBottom()
    {
        let gradient:CAGradientLayer = CAGradientLayer(layer: self)
        gradient.frame = self.bounds
        gradient.colors = [UIColor.clear.cgColor,UIColor.darkGray.cgColor]
        gradient.frame = CGRect(x:0,y:0, width:UIScreen.main.bounds.size.width, height:self.frame.size.height)
        self.layer .insertSublayer(gradient, at: 0)
    }
    func makeCircularView()
    {
        self.layer.cornerRadius = self.frame.size.height/2
        self.layer.masksToBounds = true
    }
//    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
//        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        self.layer.mask = mask
//    }
}



extension UIImageView
{
    
    
    func loadFromPhotoLibrary(controller: UIViewController)
    {
        self.initilizeImagePickerController(srctyp: .photoLibrary, withController: controller)
    }
    
    func loadFromCamera(controller: UIViewController)
    {
        self.initilizeImagePickerController(srctyp: .camera, withController: controller)
    }
    
    func loadFromPhotoAlbum(controller: UIViewController)
    {
        self.initilizeImagePickerController(srctyp: .savedPhotosAlbum, withController: controller)
    }
    
    func loadAndSaveFromPhotoLibrary(controller: UIViewController)
    {
        isSave = true
        self.loadFromPhotoLibrary(controller: controller)
    }
    
    func loadAndSaveFromCamera(controller: UIViewController) {
        isSave = true
        self.loadFromCamera(controller: controller)
    }
    
    func loadAndSaveFromPhotoAlbum(controller: UIViewController) {
        isSave = true
        self.loadFromPhotoAlbum(controller: controller)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [AnyHashable:Any])
    {
        self.image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage?
        if isSave
        {
            UIImageWriteToSavedPhotosAlbum(self.image!, nil, nil, nil)
        }

        TUGUIExtension.sharedInstance.parentController!.dismiss(animated: true, completion: {() -> Void in
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "imagePickingSucceed"), object: self)
        })
    }
    
    func initilizeImagePickerController(srctyp: UIImagePickerController.SourceType, withController controller: UIViewController)
    {
//        TUGUIExtension.sharedInstance.parentController! = controller
//        let picker: UIImagePickerController = UIImagePickerController()
//        picker.delegate = self
//        picker.sourceType = srctyp
//        controller.presentViewController(picker, animated: true, completion: nil)
    }
    
    func makeCircular()
    {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.masksToBounds = true
    }
    
    func setImageWithURL(url: NSURL, placeholderImage placeholder: UIImage)
    {
        self.setImageWithURL(url: url, placeholderImage: placeholder)
    }
    
    
}
extension String {
    
        
//        let attributedString = try? NSMutableAttributedString(data: self.data(using: String.Encoding.unicode)!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
//        return attributedString

        
        
        
        //        if self.contains("src") {
//            let types: NSTextCheckingResult.CheckingType = .link
//
//            let detector = try? NSDataDetector(types: types.rawValue)
//            
//            guard let detect = detector else {
//                return attStr
//            }
//            
//            let matches = detect.matches(in: self, options: .reportCompletion, range: NSMakeRange(0, self.characters.count))
//            let attachment = NSTextAttachment()
//
//            for match in matches {
//                do {
//                    let imgData = try Data(contentsOf: match.url!)
//                    let img = UIImage(data: imgData)
//                    attachment.image = img
//                    attachment.bounds = CGRect(x: 0, y: 0, width: 50, height: 50)
//
//
//                }
//                catch {
//                    
//                }
//            }
//            
//            attStr = NSAttributedString(attachment: attachment)
//            return attStr
//
//        }
//        else {
//            guard let data = self.data(using: String.Encoding.utf16, allowLossyConversion: false) else { return nil }
//            guard let html = try? NSMutableAttributedString(
//                data: data,
//                options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
//                documentAttributes: nil) else { return nil }
//            return html
//        }
        
//        return html.string

}
//extension UIImage {
//    convenience init(view: UIView) {
//        UIGraphicsBeginImageContext(view.frame.size)
//        view.layer.render(in: UIGraphicsGetCurrentContext()!)
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        self.init(CGImage: (image?.CGImage!)!)
//    }
//}
