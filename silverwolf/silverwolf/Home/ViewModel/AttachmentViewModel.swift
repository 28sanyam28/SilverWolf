//
//  AttachmentViewModel.swift
//  silverwolf
//
//  Created by apple on 17/06/22.
//

import Foundation
import UIKit

class AttachmentViewModel: NSObject {

    func loadDataApiCall(_ result:@escaping(AttachmentDataResponseModelElement?) -> Void){
        DispatchQueue.main.async {
            Progress.instance.show()
        }
        let headers: [String: String] = ["Authorization": "Bearer \(ATUserDefaults.ATshared.apiAccessToken)"]
        ApiManager<AttachmentDataResponseModelElement>.makeApiCall(APIUrl.UserApis.attachmentLoadData, params: [:], headers: headers, method: .post) { (response, model) in
            DispatchQueue.main.async {
                Progress.instance.hide()
            }
            print(response)
            result(model)
//            if model?.statusCode == 200{
//                result(model)
//            }else{
//                showMessage(with: response?["message"] as? String ?? "")
//            }
        }
    }
    
    func getReflection(dictParam:[String:Any],completion:@escaping (_ response: [String:Any],_ completed:Bool,_ errorMessage : String)->Void)
    {
        
        let objRequest = RequestManager()
        let strUrl = APIUrl.UserApis.attachmentUploadData
        
        let dictHeader = ["Authorization": "Bearer \(ATUserDefaults.ATshared.apiAccessToken)"]
        objRequest.requestCommonApiMethodCall_WithParam(strAPIName: strUrl, strMethodType: "POST", strParameterName: dictParam, dictHeader: dictHeader)
        { (result, isSuccess, error) in
            
            DispatchQueue.main.async {
                if isSuccess{
                    print(result)
                    //CCELog.shared.showLog(strDesc:result)
                    completion(result,true, error)
             }
                else
                {
                    completion(["":""],false, error)
                }
         }
     }
    }
  
    func getAttachmentData(dictParam:[String:Any],_ result:@escaping(AttachmentDataResponseModelElement?) -> Void) {
            
            let objRequest = RequestManager()
            let strUrl = APIUrl.UserApis.attachmentLoadData
            let dictHeader = ["Authorization": "Bearer \(ATUserDefaults.ATshared.apiAccessToken)"]
            objRequest.requestCommonApiMethodCall_WithParam1(requestUrl: strUrl,strMethodType: "POST", strParameterName: dictParam, dictHeader: dictHeader, resultType: AttachmentDataResponseModelElement.self) { (model) in
                
                print(model)
                result(model)
            
        }
    }
    
    func uploadAttachmentData(dictParam:[String:Any],_ result:@escaping(AttachmentDataResponseModelElement?) -> Void) {
        
        let objRequest = RequestManager()
        let strUrl = APIUrl.UserApis.attachmentUploadData
        let dictHeader = ["Authorization": "Bearer \(ATUserDefaults.ATshared.apiAccessToken)"]
        objRequest.requestCommonApiMethodCall_WithParam1(requestUrl: strUrl,strMethodType: "POST", strParameterName: dictParam, dictHeader: dictHeader, resultType: AttachmentDataResponseModelElement.self) { (model) in
            
            print(model)
            result(model)
        }
    }
//    func uploadData(image:UIImage,fileName:String,dictParam:[String:Any],_ result:@escaping(AttachmentDataResponseModelElement?) -> Void) {
//        
//        let objRequest = RequestManager()
//        let strUrl = APIUrl.UserApis.attachmentUploadData
//        let dictHeader = ["Authorization": "Bearer \(ATUserDefaults.ATshared.apiAccessToken)"]
//        objRequest.upload(image: image, to: <#T##URLRequestConvertible#>, params: dictParam) { (model) in
//            
//            print(model)
//            result(model)
//        }
//    }
}
