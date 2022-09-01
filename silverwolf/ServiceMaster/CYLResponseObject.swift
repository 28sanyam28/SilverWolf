
import Foundation

import UIKit

class CYLResponseObject: NSObject
{
    
    var data:Data?
    var error:NSError?
    var statusCode:Int?
    var errorCode:Int?
    var isValid:Bool=false
    var urlRequest:NSMutableURLRequest?
    var httpResponse:HTTPURLResponse?
    var stringValue:String?
    var object:AnyObject?
    var headerFilds:AnyObject?
    var requestNotification:String?
    
}
