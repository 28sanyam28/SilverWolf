 //
 //  TUGGlobals.swift
 //  Bumboo
 //
 //  Created by Nikhil Sharma on 19/02/16.
 //  Copyright © 2016 Techugo Pvt Ltd. All rights reserved.
 //
 
 import UIKit
 import CoreLocation
 import Darwin
 //import GooglePlaces
 ////import KYDrawerController

 
 class TUGGlobals: NSObject,CLLocationManagerDelegate
 {
    var screenHeight:CGFloat=0.0
    var screenWidth:CGFloat=0.0
    var colorYellow:UIColor!
    var HOME_LOCATION = ""
    var COLLEGE_LOC = ""
    var cameFromShareRide = false
    var skippedAddInfo = false
    var isActiveRideAvailable = false
    var isComefromForgotPassword:Bool = false
    var locationManager = CLLocationManager()
    var arrCheckIn = NSMutableArray()
    var eventId:String = ""
    var userLocCoordinate = CLLocationCoordinate2D()
    var deviceId:String = ""
    var languageCode = "en"
    var arrContacts = NSArray()
    var deviceToken = ""
    //var drawerControllerGlobal:KYDrawerController?
     //var drawerControllerGlobal : KYDrawerController?
    
    class var sharedInstance:TUGGlobals
    {
        struct Values
        {
            //static var drawerController:KYDrawerController?
            static var onceToken=TUGGlobals()
            static var instance:TUGGlobals? = TUGGlobals()
        }
        return Values.instance!
    }
    class ib:UIView
    {
    @IBInspectable var cornerRadius: CGFloat = 0
    {
        didSet
        {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    }
  
    
    
 }
