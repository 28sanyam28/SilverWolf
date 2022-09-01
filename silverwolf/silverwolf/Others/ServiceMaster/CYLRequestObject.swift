//
//
//import Foundation
//import UIKit
//
//    
//let  CONTENT_TYPE_KEY:String                        = "Content-Type"
//
//let  HEADER_CONTENT_TYPE :String                    = "application/json"
//let  HEADER_CONTENT_TYPE_ENCODE :String             = "application/x-www-form-urlencoded"
//let  ERROR_TITLE :String                            = "ERROR"
//
//
//enum ServiceMethod:Int
//{
//        case METHOD_GET=0
//        case METHOD_POST=1
//        case METHOD_PUT=2
//        case METHOD_DELETE=3
//        case METHOD_IMAGE=4
//        case METHOD_POST_JSON=5
//    }
//
//    
//class CYLRequestObject: NSObject
//{
//    
//    var dictHeader = [String:Any]()
//    
//        var paramDictionary:[String:Any]=[:]
//        var headerDictionary:[String:String]=[:]
//    
////        var arrayImage:[Data]=[]
//    var arrayImage:[AnyObject]=[]
//    var notificationName:String=""
//        var serviceMethod:ServiceMethod!
//        var serviceURL:String=""
//    
//    
//    
//    
//        func addParam( value:AnyObject?,forKey key:String?)
//        {
//            var value = value
//            if value == nil { value = "" as AnyObject?}
//            self.paramDictionary[key!] = value
//            //self.paramDictionary.setValue(value, forKey: key!)
//        }
//        func addHeader(value:AnyObject?,forKey key:String?)
//        {
//            if value == nil {return}
//           // self.headerDictionary.setValue(value, forKey: key!)
//            self.headerDictionary[key!]=value as! String?
//        }
//        /*func addImageData(data:NSData!, withName name:String!, forKey key:String!)
//        {
//            let imageObject:TUGImageObject=TUGImageObject().initWithName(name: name, withKey: key, andData: data) as! TUGImageObject
//            self.arrayImage.append(imageObject)
//        }*/
//        func addParamDictonary(dict:NSDictionary!)
//        {
//            if (dict != nil)
//            {
//                //self.paramDictionary=(dict as NSDictionary).mutableCopy() as! NSMutableDictionary
//                for (key,value) in dict
//                {
//                    self.paramDictionary[key as! String] = value
//                }
//            }
//        }
//    func addImageData(data:NSData!, withName name:String!, forKey key:String!)
//    {
//        let imageObject:CYLImageObject=CYLImageObject().initWithName(name: name, withKey: key, andData: data) as! CYLImageObject
//        self.arrayImage.append(imageObject)
//        print(self.arrayImage)
//        
//    }
////    func addBookId(data:String!, withName name:String!, forKey key:String!)
////    {
////        let imageObject:CYLImageObject=CYLImageObject().initWithName(name: name, withKey: key) as! CYLImageObject
////        self.arrayImage.append(imageObject)
////        print(self.arrayImage)
////        
////    }
//    
//    
//        func setHeaders(request:NSMutableURLRequest)
//        {
//            if(self.headerDictionary.keys.count > 0)
//            {
//                let keyArray =  [String] (self.headerDictionary.keys)
//                for i in 1 ..< keyArray.count
//                {
//                    let key=keyArray[i]
//                    request.setValue(self.headerDictionary[key], forHTTPHeaderField: key)
//                }
//            }
//        }
//    
//        func urlCodedParams()->String
//        {
//            var paramString:String=""
//            if self.paramDictionary.keys.count>0
//            {
//                paramString=self.getStringTypeBodyFromDict(dict: (self.paramDictionary as NSDictionary).mutableCopy() as! NSMutableDictionary);
//            }
//    
//            return paramString as String
//        }
//    
//        func jsonParams()->String
//        {
//            var jsonData:NSData=NSData()
//            do{
//                jsonData = try JSONSerialization.data(withJSONObject: self.paramDictionary, options: JSONSerialization.WritingOptions()) as NSData
//            }
//            catch
//            {
//                print("ended with error")
//            }
//            let convertedString = NSString(data: jsonData as Data, encoding: String.Encoding.utf8.rawValue)
//    
//            return  convertedString! as String
//        }
//    
//    
//        func getStringTypeBodyFromDict(dict:NSDictionary)->String
//        {
//            let params:String=self.makeParamtersString(parameters: dict, withEncoding: String.Encoding.utf8)!
//            return params as String
//        }
//    
//        func makeParamtersString(parameters:NSDictionary?, withEncoding encoding:String.Encoding)->String?
//        {
//            if parameters == nil || parameters!.count == 0
//            { return nil }
//    
//            let stringOfParamters:NSMutableString=NSMutableString()
//            for i in 0 ..< (parameters?.allKeys.count)!
//            {
//                var key:String=(parameters?.allKeys[i])! as? String ?? ""
//                var value:String=(parameters?.allValues[i])! as? String ?? ""
//                key=self.URLEscaped(strIn: key, withEncoding: String.Encoding.utf8)
//                value=self.URLEscaped(strIn: value, withEncoding: String.Encoding.utf8)
//                let keyValue:String="\(key)=\(value)&"
//                stringOfParamters.append(keyValue)
//    
//            }
//            let finalStr:NSString = stringOfParamters.substring(to: stringOfParamters.length-1) as NSString
//            return finalStr as String
//    
//        }
//    
//        func URLEscaped(strIn:String!, withEncoding encoding:String.Encoding)->String
//        {
//            let value = strIn as NSString
//            let escaped = value.addingPercentEncoding(withAllowedCharacters:.urlQueryAllowed)
//            return escaped! as String;
//        }
//    }
//
