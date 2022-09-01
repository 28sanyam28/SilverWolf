

import Foundation
import UIKit


class CYLServices: NSObject
{
    class func requestToAddPhotoForAttachemnts(dict:NSDictionary,image:Data,imgkey:String)->CYLRequestObject
        {
            let request:CYLRequestObject=CYLRequestObject()
            request.serviceURL = BASE_URL + "User"
            request.serviceMethod=ServiceMethod.METHOD_IMAGE
            request.addParamDictonary(dict: dict)
            request.addImageData(data: image as NSData!, withName: "jpg", forKey:imgkey)
            return request
        }
}
