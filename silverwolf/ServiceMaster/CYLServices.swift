

import Foundation
import UIKit


class CYLServices: NSObject
{
    //Login
    class func requestToLogin(dict:NSDictionary)->CYLRequestObject
    {
        let request:CYLRequestObject=CYLRequestObject()
        request.serviceURL = "https://www.gate2wallet.com/en/development/ViewApp/api"
        request.serviceMethod=ServiceMethod.METHOD_POST_JSON
        request.addParamDictonary(dict: dict)
        return request
    }
    class func requestToGetProfile(dict:NSDictionary)->CYLRequestObject
    {
        let request:CYLRequestObject=CYLRequestObject()
        request.serviceURL = "https://www.gate2wallet.com/en/development/ViewApp/api"
        request.serviceMethod=ServiceMethod.METHOD_POST_JSON
        request.addParamDictonary(dict: dict)
        return request
    }
    class func requestToGetLanguage(dict:NSDictionary)->CYLRequestObject
    {
        let request:CYLRequestObject=CYLRequestObject()
        request.serviceURL = "https://www.gate2wallet.com/en/development/ViewApp/api"
        request.serviceMethod=ServiceMethod.METHOD_POST_JSON
        request.addParamDictonary(dict: dict)
        return request
    }
    class func requestToGetNotification(dict:NSDictionary)->CYLRequestObject
    {
        let request:CYLRequestObject=CYLRequestObject()
        request.serviceURL = "https://www.gate2wallet.com/en/development/ViewApp/api"
        request.serviceMethod=ServiceMethod.METHOD_GET
        request.addParamDictonary(dict: dict)
        return request
    }
    //Register
    class func requestTOUserRegister(dict:NSDictionary)->CYLRequestObject
    {
        let request:CYLRequestObject=CYLRequestObject()
        request.serviceURL = "https://e-ventexe.com/VideoCL/index.php/V1/" + "user_register"
        request.serviceMethod=ServiceMethod.METHOD_POST_JSON
//        let user = headerUser
//        let password = headerPass
//        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
//        let base64Credentials = credentialData.base64EncodedString(options: [])
//        //let headers = ["Authorization": "Basic \(base64Credentials)"]
//        request.addHeader(value:"Basic \(base64Credentials)" as AnyObject, forKey:"Authorization")
        request.addParamDictonary(dict: dict)
        return request
    }
    //GetCoverLetter
    class func requestTOGetCoverLetter(dict:NSDictionary)->CYLRequestObject
    {
        let request:CYLRequestObject=CYLRequestObject()
        request.serviceURL = "https://e-ventexe.com/VideoCL/index.php/V1/" + "get_cover_letter"
        request.serviceMethod=ServiceMethod.METHOD_POST_JSON
//        let user = headerUser
//        let password = headerPass
//        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
//        let base64Credentials = credentialData.base64EncodedString(options: [])
//        //let headers = ["Authorization": "Basic \(base64Credentials)"]
//        request.addHeader(value:"Basic \(base64Credentials)" as AnyObject, forKey:"Authorization")
        request.addParamDictonary(dict: dict)
        return request
    }
    //GetCoverLetter
    class func requestTOGetDelete(dict:NSDictionary)->CYLRequestObject
    {
        let request:CYLRequestObject=CYLRequestObject()
        request.serviceURL = "https://e-ventexe.com/VideoCL/index.php/V1/" + "delete_cover_letter"
        request.serviceMethod=ServiceMethod.METHOD_POST_JSON
//        let user = headerUser
//        let password = headerPass
//        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
//        let base64Credentials = credentialData.base64EncodedString(options: [])
//        //let headers = ["Authorization": "Basic \(base64Credentials)"]
//        request.addHeader(value:"Basic \(base64Credentials)" as AnyObject, forKey:"Authorization")
        request.addParamDictonary(dict: dict)
        return request
    }
    //
   
//    class func requestToGetAllCategories(dict:NSDictionary,image:Data,imgkey:String)->CYLRequestObject
//    {
//        let request:CYLRequestObject=CYLRequestObject()
//        request.serviceURL = BASE_URL + "Quiz"
//        request.serviceMethod=ServiceMethod.METHOD_IMAGE
//        request.addParamDictonary(dict: dict)
//        request.addImageData(data: image as NSData!, withName: "jpg", forKey:imgkey)
//        return request
//    }
   
}
