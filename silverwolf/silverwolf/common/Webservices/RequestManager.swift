


import Alamofire
import UIKit


struct WebServiceError {
    let statusCode : Int?
    let errorCode : Int?
    let errorMsg : String?
}

class RequestManager: NSObject, URLSessionDelegate {

    let apologiesMessage = "We apologize this service is temporarily unavailable.Please try later."
    
    //MARK: - api call for get- post- put- apis
    /// common method is used for "Get" type of request
    ///
    /// - Parameters:
    ///   - strAPIName: api name (procedure name)
    ///   - strParameterName: param (always be empty)
    ///   - completion: return type
    ///
    ///
    ///
    
    lazy var urlSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
      }()

    
    func requestCommonApiMethodCall_WithParam(strAPIName :String ,strMethodType:String,strParameterName : [String:Any] ,dictHeader : [String :Any]  ,completion:@escaping (_ response: [String:Any],_ completed:Bool,_ errorMessage : String)->Void)  {
        let url : String = strAPIName// "\(MMUrlConstants.CommonUrl)\(strAPIName)"
        
        //let headers = strHeader
        var headers = [String:Any]()
        headers = dictHeader
        headers["Content-Type"] = "application/json"
        
//        DispatchQueue.main.async {
        do{
            let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 60.0)
            if strMethodType == "GET"
            {
                request.httpMethod = "GET"
            }
            else
            {
                request.httpMethod = (strMethodType == "POST" ? "POST" : "PUT")
            }
            
            request.allHTTPHeaderFields = headers as? [String : String]
            
            if strMethodType == "POST" || strMethodType == "PUT" {
                let postData = try JSONSerialization.data(withJSONObject: strParameterName, options: [])
                request.httpBody = postData as Data
            }
            let session = URLSession.shared
            
            
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    completion(["":""],false,error as? String ?? self.apologiesMessage )
                } else {
                    
                        let httpResponse = response as! HTTPURLResponse
                        let statusCode = httpResponse.statusCode

                            if (statusCode == 200) {
                                guard let data = data else { return }
                                do {
                                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? Any else {
                                        return
                                    }

                                    if let code = json as? Array<Any> //Check for the array
                                    {
                                        let dictata : [String: Any] = ["data" : code]
                                        completion(dictata,true, self.apologiesMessage)
                                    }
                                    else if let jsonData = json as? [String:Any] //Check for the code tag
                                    {
                                        if let IsError = jsonData["IsError"] as? Bool , IsError == false
                                        {
                                            completion(jsonData,true, self.apologiesMessage)
                                        }
                                        else
                                        {
                                            completion(jsonData,false, jsonData["ErrorMessage"] as? String ?? self.apologiesMessage)
                                        }
                                        
                                        
                                    }
                                    else
                                    {
                                        completion(["":""],true, self.apologiesMessage)
                                    }

                                } catch let jsonErr {
                                    print("Error serializing json:", jsonErr)//No Value in JSON
                                    completion(["":""],true,error as? String ?? self.apologiesMessage )
                                }
                            }
                            else if(statusCode == 400)
                            {
                                completion(["":""],false,error as? String ?? self.apologiesMessage )
                            }
//                            else if(statusCode == 403) //session Expire
//                            {
//                                print("session expire")
//                                self.navigatetoRootScreen()
//                            }
                            else
                            {
                                completion(["":""],false,error as? String ?? self.apologiesMessage)
                        }
                    }
//                }
            })
            dataTask.resume()
        }catch {
            print("Error with Json: \(error)")
            completion(["":""],false,error as? String ?? self.apologiesMessage)
        }
    }
    
    func requestCommonApiMethodCall_WithParamDemo(strAPIName :String ,strMethodType:String,strParameterName : [String:Any] ,dictHeader : [String :Any]  ,completion:@escaping (_ response: [String:Any],_ completed:Bool,_ errorMessage : String)->Void)  {
        let url : String =  strAPIName// "\(MMUrlConstants.CommonUrl)\(strAPIName)"
        
        //let headers = strHeader
        var headers = [String:Any]()
        headers = dictHeader
        headers["Content-Type"] = "application/json"
        
//        DispatchQueue.main.async {
        do{
            let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 60.0)
            if strMethodType == "GET"
            {
                request.httpMethod = "GET"
            }
            else
            {
                request.httpMethod = (strMethodType == "POST" ? "POST" : "PUT")
            }
            
            request.allHTTPHeaderFields = headers as? [String : String]
            
            if strMethodType == "POST" || strMethodType == "PUT" {
                let postData = try JSONSerialization.data(withJSONObject: strParameterName, options: [])
                request.httpBody = postData as Data
            }
            let session = URLSession.shared
            
            
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    completion(["":""],false,error as? String ?? self.apologiesMessage )
                } else {
                    
                        let httpResponse = response as! HTTPURLResponse
                        let statusCode = httpResponse.statusCode

                            if (statusCode == 200) {
                                guard let data = data else { return }
                                do {
                                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? Any else {
                                        return
                                    }

                                    if let code = json as? Array<Any> //Check for the array
                                    {
                                        let dictata : [String: Any] = ["data" : code]
                                        completion(dictata,true, self.apologiesMessage)
                                    }
                                    else if let jsonData = json as? [String:Any] //Check for the code tag
                                    {
                                        if let IsError = jsonData["IsError"] as? Bool , IsError == false
                                        {
                                            completion(jsonData,true, self.apologiesMessage)
                                        }
                                        else
                                        {
                                            completion(jsonData,false, jsonData["ErrorMessage"] as? String ?? self.apologiesMessage)
                                        }
                                        
                                        
                                    }
                                    else
                                    {
                                        completion(["":""],true, self.apologiesMessage)
                                    }

                                } catch let jsonErr {
                                    print("Error serializing json:", jsonErr)//No Value in JSON
                                    completion(["":""],true,error as? String ?? self.apologiesMessage )
                                }
                            }
                            else if(statusCode == 400)
                            {
                                completion(["":""],false,error as? String ?? self.apologiesMessage )
                            }
//                            else if(statusCode == 403) //session Expire
//                            {
//                                print("session expire")
//                                self.navigatetoRootScreen()
//                            }
                            else
                            {
                                completion(["":""],false,error as? String ?? self.apologiesMessage)
                        }
                    }
//                }
            })
            dataTask.resume()
        }catch {
            print("Error with Json: \(error)")
            completion(["":""],false,error as? String ?? self.apologiesMessage)
        }
    }

    
    
    func requestCommonApiMethodCall_WithParam1<T:Decodable>(requestUrl: String, strMethodType:String, strParameterName : [String:Any] ,dictHeader : [String :Any], resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void)  {
    let url : String = requestUrl// "\(MMUrlConstants.CommonUrl)\(strAPIName)"
    
    //let headers = strHeader
    var headers = [String:Any]()
    headers = dictHeader
    headers["Content-Type"] = "application/json"
    
//        DispatchQueue.main.async {
    do{
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 60.0)
        if strMethodType == "GET"
        {
            request.httpMethod = "GET"
        }
        else
        {
            request.httpMethod = (strMethodType == "POST" ? "POST" : "PUT")
        }
        
        request.allHTTPHeaderFields = headers as? [String : String]
        
        if strMethodType == "POST" || strMethodType == "PUT" {
            let postData = try JSONSerialization.data(withJSONObject: strParameterName, options: [])
            request.httpBody = postData as Data
        }
        let session = URLSession.shared
        
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
              //  completion([:],false,error as? String ?? self.apologiesMessage )
            } else {
                
                    let httpResponse = response as! HTTPURLResponse
                    let statusCode = httpResponse.statusCode

                        if (statusCode == 200) {
                            guard let data = data else { return }
                            do {
                                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? Any else {
                                    return
                                }
                                let decoder = JSONDecoder()
                                do {
                                    let result = try decoder.decode(T.self, from: data)
                                    _=completionHandler(result)
                                }
                                catch let error{
                                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                                }

//                                if let code = json as? Array<Any> //Check for the array
//                                {
//                                    let dictata : [String: Any] = ["data" : code]
//                                    completion(dictata,true, self.apologiesMessage)
//                                }
//                                else if let jsonData = json as? [String:Any] //Check for the code tag
//                                {
//                                    if let IsError = jsonData["IsError"] as? Bool , IsError == false
//                                    {
//                                        completion(jsonData,true, self.apologiesMessage)
//                                    }
//                                    else
//                                    {
//                                        completion(jsonData,false, jsonData["ErrorMessage"] as? String ?? self.apologiesMessage)
//                                    }
//
                                    
//                                }
//                                else
//                                {
//                                    completion(["":""],true, self.apologiesMessage)
//                                }

                            } catch let jsonErr {
                                print("Error serializing json:", jsonErr)//No Value in JSON
                               // completion(["":""],true,error as? String ?? self.apologiesMessage )
                            }
                        }
                        else if(statusCode == 400)
                        {
                           // completion(["":""],false,error as? String ?? self.apologiesMessage )
                        }
//                            else if(statusCode == 403) //session Expire
//                            {
//                                print("session expire")
//                                self.navigatetoRootScreen()
//                            }
                        else
                        {
                           // completion(["":""],false,error as? String ?? self.apologiesMessage)
                    }
                }
//                }
        })
        dataTask.resume()
    }catch {
        print("Error with Json: \(error)")
       // completion(["":""],false,error as? String ?? self.apologiesMessage)
    }
}
    
    //MARK: For The Body
    func requestCommonApiMethodCall_WithParam2<T:Decodable>(requestUrl: String, strMethodType:String, strParameterName : [String:Any] ,dictHeader : [String :Any],dictBody : [String:String], resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void)  {

           var dict = Dictionary<String, Any>()

            dict = dictBody
            var  jsonData = NSData()
            var headers = [String:Any]()
            headers = dictHeader
           // var dataString2 :String = ""
            do {
                 jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) as NSData
                // you can now cast it with the right type
            } catch {
                print(error.localizedDescription)
            }


            let url:URL = URL(string: requestUrl)!
            let session = URLSession.shared
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
           // request.setValue("\(jsonData.length)", forHTTPHeaderField: "Content-Length")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.allHTTPHeaderFields = headers as? [String : String]
            request.httpBody = jsonData as Data

            let task = session.dataTask(with: request as URLRequest) {
                (
                data, response, error) in

                guard let data = data, let _:URLResponse = response, error == nil else {
                    print("error")
                    return
                }
                let dataString =  String(data: data, encoding: String.Encoding.utf8)
                print("no data",dataString ?? "no data")
            }
            task.resume()
    
    }
    func upload(image: Data, to url: Alamofire.URLRequestConvertible, params: [String: Any])
      {
             let urlString = APIUrl.UserApis.attachmentUploadData
             let url = URL(string: urlString)!
             guard let requestURL = URL(string: urlString) else {
                 return
             }

             // prepare request
             var request = URLRequest(url: requestURL)
             let dictHeader = ["Authorization": "Bearer \(ATUserDefaults.ATshared.apiAccessToken)"]
             request.allHTTPHeaderFields = dictHeader
             request.httpMethod = "POST"

             let boundary = generateBoundaryString()

             request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
             // built data from img
             //if let imageData = image.jpegData(compressionQuality: 1) {
                 request.httpBody = createBodyWithParameters(parameters: params, filePathKey: "docfile", imageDataKey: image, boundary: boundary)
            // }

             let task =  URLSession.shared.dataTask(with: request,
                                                    completionHandler: { (data, _, error) -> Void in

                                                     if let data = data {
                                                         do {
                                                             guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? Any else {
                                                                 return
                                                             }
                                                             print(json)
                                                            }catch
                                                            {
                                                               print("error")
                                                            }
                                                         debugPrint("image uploaded successfully \(data)")

                                                     } else if let error = error {
                                                         debugPrint(error.localizedDescription)
                                                     }
             })
             task.resume()
          
    }
    func createBodyWithParameters(parameters: [String: Any],

                                              filePathKey: String,
                                              imageDataKey: Data,
                                              boundary: String) -> Data {
        
        
                 var body = Data()
       
                 parameters.forEach { (key, value) in
                      body.append("--\(boundary)\r\n")
                      body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                      body.append("\(value)\r\n")
                 }
                let mimetype = "image/jpg"

                body.append("--\(boundary)\r\n".data(using: .utf8) ?? Data())
                body.append("Content-Disposition: form-data; name=\"\(filePathKey)\"; filename=\"\(filePathKey)\"\r\n".data(using: .utf8) ?? Data())
                body.append("Content-Type: \(mimetype)\r\n\r\n".data(using: .utf8) ?? Data())
                body.append(imageDataKey)
                body.append("\r\n".data(using: .utf8) ?? Data())

                body.append("--\(boundary)--\r\n".data(using: .utf8) ?? Data())

                return body as Data
            }

    private func generateBoundaryString() -> String {
            return "Boundary-\(Int.random(in: 1000 ... 9999))"
    }
    

    func requestCommonPostMultipartMethod(strAPIName :String,parms:[String:Any],strMethodType:String,profileImage: UIImage ,completion:@escaping ( _ response: [String:Any], _ completed:Bool,_ webServiceError : WebServiceError?)->Void)
        {
            
            let imageData = profileImage.jpegData(compressionQuality: 1.0)
            if let url: URL = URL(string: APIUrl.UserApis.attachmentUploadData) {
            let request1: NSMutableURLRequest = NSMutableURLRequest(url: url )
            request1.httpMethod =  "POST"
            let boundary = generateBoundary()
            let fullData = photoDataToFormData(data: imageData! as NSData,boundary:boundary,fileName:"fileName.jpg")
                request1.setValue("multipart/form-data; boundary=" + boundary,
                                     forHTTPHeaderField: "Content-Type")
               request1.setValue(String(fullData.length), forHTTPHeaderField: "Content-Length")
               request1.httpBody = fullData as Data
             do
             {
                if strMethodType == "POST" || strMethodType == "PUT" || strMethodType == "PATCH"{
                        let postData = try JSONSerialization.data(withJSONObject: parms, options: [])
                        request1.httpBody = postData as Data
             }
             }catch{
                 print("error")
             }
                
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request1 as URLRequest, completionHandler: { (data, response, error) -> Void in
                    if (error != nil) {
                        completion(["":""],false,WebServiceError(statusCode: nil, errorCode: nil, errorMsg: self.apologiesMessage) )
                    } else {
                        
                        let httpResponse = response as! HTTPURLResponse
                        let statusCode = httpResponse.statusCode
                        
                        if (statusCode == 200 || statusCode == 204) {
                            guard let data = data else { return }
                            do {
                                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? Any else {
                                    return
                                }
                                
                                if let code = json as? Array<Any> //Check for the array
                                {
                                    let dictata : [String: Any] = ["data" : code]
                                    completion(dictata,true, nil)
                                }
                                else if let jsonData = json as? [String:Any] //Check for the code tag
                                {
                                    
                                    completion(jsonData,true,nil)
                                    
                                }
                                else
                                {
                                    completion(["":""],true,nil)
                                }
                                
                            } catch let jsonErr {
                                completion(["":""],true,WebServiceError(statusCode: nil, errorCode: nil, errorMsg: self.apologiesMessage) )
                            }
                        }
                        else if(statusCode == 400)
                        {
                            completion(["":""],false,WebServiceError(statusCode: statusCode, errorCode: nil, errorMsg: self.apologiesMessage) )
                        }
                        else if(statusCode == 401) //session Expire
                        {
                            completion(["":""],false,WebServiceError(statusCode: statusCode, errorCode: nil, errorMsg: self.apologiesMessage) )
                        }
                        else
                        {
                            completion(["":""],false,WebServiceError(statusCode: statusCode, errorCode: nil, errorMsg: self.apologiesMessage))
                        }
                    }
                    
                })
                dataTask.resume()
            }
            
        }

     func generateBoundary() -> String
        {
            return "Boundary-\(NSUUID().uuidString)"
        }
        
        func photoDataToFormData(data:NSData,boundary:String,fileName:String) -> NSData {
            let fullData = NSMutableData()
            
            // 1 - Boundary should start with --
            let lineOne = "--" + boundary + "\r\n"
            fullData.append(lineOne.data(
                using: String.Encoding.utf8,
                allowLossyConversion: false)!)
            
            // 2
            let lineTwo = "Content-Disposition: form-data; name=\"image\"; filename=\"" + fileName + "\"\r\n"
            //NSLog(lineTwo)
            fullData.append(lineTwo.data(
                using: String.Encoding.utf8,
                allowLossyConversion: false)!)
            
            // 3
            let lineThree = "Content-Type: image/jpg\r\n\r\n"
            fullData.append(lineThree.data(
                using: String.Encoding.utf8,
                allowLossyConversion: false)!)
            
            // 4
            fullData.append(data as Data)
            
            // 5
            let lineFive = "\r\n"
            fullData.append(lineFive.data(
                using: String.Encoding.utf8,
                allowLossyConversion: false)!)
            
            // 6 - The end. Notice -- at the start and at the end
            let lineSix = "--" + boundary + "--\r\n"
            fullData.append(lineSix.data(
                using: String.Encoding.utf8,
                allowLossyConversion: false)!)
            
            return fullData
        }
    
    
    //multipart New
//    func postApiDataWithMultipartForm<T:Decodable>(requestUrl: String, strMethodType:String, strParameterName : [String:Any] ,dictHeader : [String :Any],dictBody : [String:String], resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void)  {
//        let url : String = requestUrl
//        let lineBreak = "\r\n"
//        url.httpMethod = "post"
//    }
//    

}
extension NSMutableData {

func appendString(_ string: String) {
       if let data = string.data(using: String.Encoding.utf8,
          allowLossyConversion: true) {
             append(data)
        }
     }
 }
extension Data {
    
    /// Append string to Data
    ///
    /// Rather than littering my code with calls to `data(using: .utf8)` to convert `String` values to `Data`, this wraps it in a nice convenient little extension to Data. This defaults to converting using UTF-8.
    ///
    /// - parameter string:       The string to be added to the `Data`.
    
    mutating func append(_ string: String, using encoding: String.Encoding = .utf8) {
        if let data = string.data(using: encoding) {
            append(data)
        }
    }
}
extension RequestManager {
    func requestNativeImageUpload(image: UIImage) {

        let url = URL(string: "https://api.pixlab.io/facedetect")
        let boundary = "Boundary-\(NSUUID().uuidString)"
        var request = URLRequest(url: url!)

        let parameters = ["key" : "YOUR API KEY"]

        guard let mediaImage = Media(withImage: image, forKey: "file") else { return }

        request.httpMethod = "POST"

        request.allHTTPHeaderFields = [
                    "X-User-Agent": "ios",
                    "Accept-Language": "en",
                    "Accept": "application/json",
                    "Content-Type": "multipart/form-data; boundary=\(boundary)",
                    "ApiKey": "YOUR API KEY"
                ]

        let dataBody = createDataBody(withParameters: parameters, media: [mediaImage], boundary: boundary)
        request.httpBody = dataBody

        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }

            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
            }.resume()
    }

    func createDataBody(withParameters params: [String: String]?, media: [Media]?, boundary: String) -> Data {

        let lineBreak = "\r\n"
        var body = Data()

        if let parameters = params {
            for (key, value) in parameters {
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
                body.append("\(value + lineBreak)")
            }
        }

        if let media = media {
            for photo in media {
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(photo.key)\"; filename=\"\(photo.fileName)\"\(lineBreak)")
                body.append("Content-Type: \(photo.mimeType + lineBreak + lineBreak)")
                body.append(photo.data)
                body.append(lineBreak)
            }
        }

        body.append("--\(boundary)--\(lineBreak)")

        return body
    }
}

extension Data {
        mutating func append(_ string: String) {
            if let data = string.data(using: .utf8) {
                append(data)
            }
        }
}


struct Media {
    let key: String
    let fileName: String
    let data: Data
    let mimeType: String
//    let projectID: Int
//    let DocumentPathType: String
//    let FolderPath: String

    init?(withImage image: UIImage, forKey key: String) {
        self.key = key
        self.mimeType = "image/jpg"
        self.fileName = "\(arc4random()).jpeg"

        guard let data = image.jpegData(compressionQuality: 0.1) else { return nil }
        self.data = data
    }
}
