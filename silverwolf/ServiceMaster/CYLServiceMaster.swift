
import Foundation
import UIKit
import Alamofire

typealias CYLResponse=(_ serviceResponse:CYLResponseObject?)->Void
typealias CYLNetworkError=(_ isNetworkFailure:Bool?)->Void
typealias CYLError=(_ error:NSError?)->Void



class CYLServiceMaster: NSObject
{
    
    class var sharedInstance:CYLServiceMaster
    {
        struct Values
        {
            static var onceToken=CYLServiceMaster()
            static var instance:CYLServiceMaster? = CYLServiceMaster()
        }
        return Values.instance!
    }
    
    
    
    func callDataUploadServiceWithRequests(rqst:CYLRequestObject, withResponse completion:@escaping CYLResponse, withError error:@escaping CYLError, andNetworkErr ntwrkErr:CYLNetworkError)
    {
        if rqst.arrayImage.count != 0
        {
            
            //let obj = rqst.arrayImage[0] as! CYLImageObject
            
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                // multipartFormData.append(obj.imageData! as Data, withName: obj.imageKey, fileName: "file", mimeType: "image/jpg")
                for objImage in rqst.arrayImage
                {
                    let obj = objImage as! CYLImageObject
                    print(objImage)
                    multipartFormData.append(obj.imageData! as Data, withName: obj.imageKey, fileName: "file.jpg", mimeType: "image/jpg")
                    
                }
                for (key, value) in rqst.paramDictionary
                {
                    multipartFormData.append((value as AnyObject).data!(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
                
            }, to: rqst.serviceURL,method: HTTPMethod.post, headers: rqst.headerDictionary, encodingCompletion: { (encodingResult) in
                
                switch encodingResult {
                case .success(let upload, _, _):
                    
                    upload.responseJSON { response in
                        
                        let respString:String=String(data: (response.data)!, encoding: String.Encoding.utf8)!
                        print(respString)
                        var object:AnyObject
                        let responseObj:CYLResponseObject=CYLResponseObject()
                        responseObj.data=response.data as Data?
                        responseObj.statusCode=response.response?.statusCode
                        responseObj.error=response.result.error as NSError?
                        //responseObj.urlRequest=rqst
                        responseObj.stringValue=respString
                        responseObj.headerFilds=response.response?.allHeaderFields as AnyObject?
                        responseObj.requestNotification=rqst.notificationName
                        do{
                            object = try JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! NSDictionary
                            responseObj.object=object
                            responseObj.errorCode=response.response?.statusCode
                            
                        }
                        catch
                        {
                            print("ended with error")
                        }
                        print("\n\n ***************************\n ########################### \n *************************** \n")
                        print("Request URL is=\(rqst.serviceURL)\n\n")
                        self.printPostBodyForRequest(rqst: rqst)
                        print("Response Body is")
                        print("***************************\n")
                        print("\(response.description)")
                        print("***************************")
                        print("\n\n ***************************\n ########################### \n *************************** \n")
                        if  responseObj.errorCode != 200
                        {
                            responseObj.isValid=false
                        }
                        else {
                            responseObj.isValid=true
                        }
                        
                        if responseObj.error != nil
                        {
                            // do code to return connection error
                            error(responseObj.error as NSError?)
                        }
                        else
                        {
                            // do code to success response
                            completion(responseObj)
                        }
                        
                        
                        if (response.result.value != nil)
                        {
                            //                        let jsonResponse = JSON(data: response.data!)
                            //                        print(jsonResponse)
                            //                        result(jsonResponse, nil)
                        }
                        else
                        {
                            //  result(nil, response.result.error as NSError?)
                        }
                    }
                    
                case .failure(let encodingError):
                    print(encodingError)
                }
                
            })
        }
    }
    

    func callWebServiceWithRequest(rqst:CYLRequestObject, withResponse completion:@escaping CYLResponse, withError error:@escaping CYLError, andNetworkErr ntwrkErr:@escaping CYLNetworkError)
    {
//        if TUGHelpers().isNetworkAvailable()
//        {
        var serviceMethod:HTTPMethod?
        
        let serviceRequest:NSMutableURLRequest=NSMutableURLRequest()
        
        rqst.setHeaders(request: serviceRequest)
        if rqst.serviceMethod == ServiceMethod.METHOD_GET
        {
            serviceMethod = HTTPMethod.get
            
//            let parmdic:String=rqst .urlCodedParams()
         //  serviceRequest.setValue(HEADER_CONTENT_TYPE_ENCODE, forHTTPHeaderField: CONTENT_TYPE_KEY)
//            rqst.serviceURL=(rqst.serviceURL as NSString).appending("?")
//            rqst.serviceURL=(rqst.serviceURL as NSString).appending(parmdic)
//            serviceRequest.httpMethod="GET"
        }
        else if rqst.serviceMethod == ServiceMethod.METHOD_POST
        {
              serviceMethod = HTTPMethod.post
            
//            request.httpMethod="POST"
            //request.setValue(HEADER_CONTENT_TYPE_ENCODE, forHTTPHeaderField: CONTENT_TYPE_KEY)
//            let paramDic:String=rqst.urlCodedParams()
//            request.httpBody=paramDic.data(using: String.Encoding.utf8)
            
        }
        else if rqst.serviceMethod == ServiceMethod.METHOD_POST_JSON
        {
            
              serviceMethod = HTTPMethod.post
            
//            request.setValue(HEADER_CONTENT_TYPE, forHTTPHeaderField:CONTENT_TYPE_KEY)
//            let paramDic:String=rqst.jsonParams()
//            request.httpBody=paramDic.data(using: String.Encoding.utf8)
//            request.httpMethod="POST"
        }
        else if rqst.serviceMethod == ServiceMethod.METHOD_PUT
        {
             serviceMethod = HTTPMethod.put
            
//            request.httpMethod="PUT"
//            request.httpBody=rqst.urlCodedParams().data(using: String.Encoding.utf8)
        }
        else if(rqst.serviceMethod ==  ServiceMethod.METHOD_DELETE)
        {
            serviceMethod = HTTPMethod.delete
            
            //request.httpMethod="DELETE"
        }
        Alamofire.request(rqst.serviceURL, method: serviceMethod!, parameters: rqst.paramDictionary , headers: rqst.headerDictionary).responseData
                {
                    response in
                    
                    if response.response != nil
                    {
                    let respString:String=String(data: (response.data)!, encoding: String.Encoding.utf8)!
                        let responseObj:CYLResponseObject=CYLResponseObject()
                        responseObj.data=response.data as Data?
                        responseObj.statusCode=response.response?.statusCode
                        responseObj.error=response.result.error as NSError?
                        //responseObj.urlRequest=rqst
                        responseObj.stringValue=respString
                        responseObj.headerFilds=response.response?.allHeaderFields as AnyObject?
                        responseObj.requestNotification=rqst.notificationName
                    
                    var object:AnyObject
                    do{
                        object = try JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! NSDictionary
                        responseObj.object=object
                        responseObj.errorCode = responseObj.object?.value(forKey: "status") as? Int
                    }
                    catch
                    {
                        print("ended with error")
                    }
                    
                        print("\n\n ***************************\n ########################### \n *************************** \n")
                        print("Request URL is=\(rqst.serviceURL)\n\n")
                        self.printPostBodyForRequest(rqst: rqst)
                        print("Response Body is")
                        print("***************************\n")
                        print("\(response.description)")
                        print("\(respString)")
                        print("***************************")
                        print("\n\n ***************************\n ########################### \n *************************** \n")
                        if  responseObj.errorCode != 200 
                        {
                            responseObj.isValid=false
                        }
                        else {
                            responseObj.isValid=true
                        }
                        
                        if responseObj.error != nil
                        {
                            // do code to return connection error
                            error(responseObj.error as NSError?)
                        }
                        else
                        {
                            // do code to success response
                            completion(responseObj)
                        }
                    
        }
        else
        {
                 ntwrkErr(true)       
        }
        }
        
//        }
//        else
//        {
//            ntwrkErr(true)
//        }
        }
    
    
    func callGoogleServiceWithRequest(rqst:CYLRequestObject, withResponse completion:@escaping CYLResponse, withError error:@escaping CYLError, andNetworkErr ntwrkErr:@escaping CYLNetworkError)
    {
        //        if TUGHelpers().isNetworkAvailable()
        //        {
        var serviceMethod:HTTPMethod?
        
        let serviceRequest:NSMutableURLRequest=NSMutableURLRequest()
        
        rqst.setHeaders(request: serviceRequest)
        if rqst.serviceMethod == ServiceMethod.METHOD_GET
        {
            serviceMethod = HTTPMethod.get
            
            //            let parmdic:String=rqst .urlCodedParams()
            //  serviceRequest.setValue(HEADER_CONTENT_TYPE_ENCODE, forHTTPHeaderField: CONTENT_TYPE_KEY)
            //            rqst.serviceURL=(rqst.serviceURL as NSString).appending("?")
            //            rqst.serviceURL=(rqst.serviceURL as NSString).appending(parmdic)
            //            serviceRequest.httpMethod="GET"
        }
        else if rqst.serviceMethod == ServiceMethod.METHOD_POST
        {
            serviceMethod = HTTPMethod.post
            
            //            request.httpMethod="POST"
            //request.setValue(HEADER_CONTENT_TYPE_ENCODE, forHTTPHeaderField: CONTENT_TYPE_KEY)
            //            let paramDic:String=rqst.urlCodedParams()
            //            request.httpBody=paramDic.data(using: String.Encoding.utf8)
            
        }
        else if rqst.serviceMethod == ServiceMethod.METHOD_POST_JSON
        {
            
            serviceMethod = HTTPMethod.post
            
            //            request.setValue(HEADER_CONTENT_TYPE, forHTTPHeaderField:CONTENT_TYPE_KEY)
            //            let paramDic:String=rqst.jsonParams()
            //            request.httpBody=paramDic.data(using: String.Encoding.utf8)
            //            request.httpMethod="POST"
        }
        else if rqst.serviceMethod == ServiceMethod.METHOD_PUT
        {
            serviceMethod = HTTPMethod.put
            
            //            request.httpMethod="PUT"
            //            request.httpBody=rqst.urlCodedParams().data(using: String.Encoding.utf8)
        }
        else if(rqst.serviceMethod ==  ServiceMethod.METHOD_DELETE)
        {
            serviceMethod = HTTPMethod.delete
            
            //request.httpMethod="DELETE"
        }
        Alamofire.request(rqst.serviceURL, method: serviceMethod!, parameters: rqst.paramDictionary , headers: rqst.headerDictionary).responseData
            {
                response in
                
                if response.response != nil
                {
                    let respString:String=String(data: (response.data)!, encoding: String.Encoding.utf8)!
                    let responseObj:CYLResponseObject=CYLResponseObject()
                    responseObj.data=response.data as Data?
                    responseObj.statusCode=response.response?.statusCode
                    responseObj.error=response.result.error as NSError?
                    //responseObj.urlRequest=rqst
                    responseObj.stringValue=respString
                    responseObj.headerFilds=response.response?.allHeaderFields as AnyObject?
                    responseObj.requestNotification=rqst.notificationName
                    
                    var object:AnyObject
                    do{
                        object = try JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! NSDictionary
                        responseObj.object=object
                        responseObj.errorCode = responseObj.object?.value(forKey: "status") as? Int
                    }
                    catch
                    {
                        print("ended with error")
                    }
                    
                    print("\n\n ***************************\n ########################### \n *************************** \n")
                    print("Request URL is=\(rqst.serviceURL)\n\n")
                    print("Response Body is")
                    print("***************************\n")
                    print("\(response.description)")
                    print("\(respString)")
                    print("***************************")
                    print("\n\n ***************************\n ########################### \n *************************** \n")
                    if  responseObj.statusCode != 200
                    {
                        responseObj.isValid=false
                    }
                    else {
                        responseObj.isValid=true
                    }
                    
                    if responseObj.error != nil
                    {
                        // do code to return connection error
                        error(responseObj.error as NSError?)
                    }
                    else
                    {
                        // do code to success response
                        completion(responseObj)
                    }
                    
                }
                else
                {
                    ntwrkErr(true)
                }
        }
        
        //        }
        //        else
        //        {
        //            ntwrkErr(true)
        //        }
    }

    
       func callDataUploadServiceWithRequest(rqst:CYLRequestObject, withResponse completion:@escaping CYLResponse, withError error:@escaping CYLError, andNetworkErr ntwrkErr:CYLNetworkError)
      {
        if rqst.arrayImage.count != 0
        {
        
        var obj = rqst.arrayImage[0] as! CYLImageObject
            var obj1 = CYLImageObject()
            if rqst.arrayImage.count > 1 {
                 obj1 = rqst.arrayImage[1] as! CYLImageObject

            }

        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(obj.imageData! as Data, withName: obj.imageKey, fileName: "file", mimeType: "image/jpg")
            

            if rqst.arrayImage.count > 1
            {
                multipartFormData.append(obj1.imageData! as Data, withName: obj1.imageKey, fileName: "file", mimeType: "image/jpg")
                
            }
            for (key, value) in rqst.paramDictionary
            {
                multipartFormData.append((value as AnyObject).data!(using: String.Encoding.utf8.rawValue)!, withName: key)
            }
            
        }, to: rqst.serviceURL,method: HTTPMethod.post, headers: rqst.headerDictionary, encodingCompletion: { (encodingResult) in
            
            switch encodingResult {
            case .success(let upload, _, _):
                
                upload.responseJSON { response in
                    
                     let respString:String=String(data: (response.data)!, encoding: String.Encoding.utf8)!
                    print(respString)
                    var object:AnyObject
                     let responseObj:CYLResponseObject=CYLResponseObject()
                    responseObj.data=response.data as Data?
                    responseObj.statusCode=response.response?.statusCode
                    responseObj.error=response.result.error as NSError?
                    //responseObj.urlRequest=rqst
                    responseObj.stringValue=respString
                    responseObj.headerFilds=response.response?.allHeaderFields as AnyObject?
                    responseObj.requestNotification=rqst.notificationName
                    do{
                        object = try JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! NSDictionary
                        responseObj.object=object
                        responseObj.errorCode=response.response?.statusCode
                        
                    }
                    catch
                    {
                        print("ended with error")
                    }
                    print("\n\n ***************************\n ########################### \n *************************** \n")
                    print("Request URL is=\(rqst.serviceURL)\n\n")
                    self.printPostBodyForRequest(rqst: rqst)
                    print("Response Body is")
                    print("***************************\n")
                    print("\(response.description)")
                    print("***************************")
                    print("\n\n ***************************\n ########################### \n *************************** \n")
                    if  responseObj.errorCode != 200
                    {
                        responseObj.isValid=false
                    }
                    else {
                        responseObj.isValid=true
                    }
                    
                    if responseObj.error != nil
                    {
                        // do code to return connection error
                        error(responseObj.error as NSError?)
                    }
                    else
                    {
                        // do code to success response
                        completion(responseObj)
                    }

                    
                    if (response.result.value != nil)
                    {
//                        let jsonResponse = JSON(data: response.data!)
//                        print(jsonResponse)
//                        result(jsonResponse, nil)
                    }
                    else
                    {
                      //  result(nil, response.result.error as NSError?)
                    }
                }
                
            case .failure(let encodingError):
                print(encodingError)
            }
            
        })
        }
    }

        func printPostBodyForRequest(rqst:CYLRequestObject)
        {
            
            if rqst.serviceMethod == ServiceMethod.METHOD_GET
            {
                let parmdic:String=rqst .urlCodedParams()
                print("GET body is")
                print("***************************")
                print("\(parmdic)")
                print("***************************")
            }
            else if rqst.serviceMethod == ServiceMethod.METHOD_POST
            {
                let paramDic:String=rqst.urlCodedParams()
                print("Post body is")
                print("***************************")
                print("\(paramDic)")
                print("***************************")
            }
            else if rqst.serviceMethod == ServiceMethod.METHOD_POST_JSON
            {
                let paramDic:NSString=rqst.jsonParams() as NSString
                print("Post body is")
                print("***************************")
                print("\(paramDic)")
                print("***************************")
            }
            else if rqst.serviceMethod == ServiceMethod.METHOD_IMAGE
            {
            let paramDic:NSString=rqst.jsonParams() as NSString
            print("Post body is")
            print("***************************")
            print("\(paramDic)")
            print("***************************")
            }
            
        }
    }





    class CYLImageObject: NSObject
    {
        
        var  imageKey:String=""
        var imageName:String=""
        var imageData:NSData?
        
        
        func initWithName(name:String, withKey key:String, andData data:NSData)->AnyObject
        {
            self.imageKey=key;
            self.imageData=data;
            self.imageName=name;
            return self;
        }
        //Add a comment to this line
}
