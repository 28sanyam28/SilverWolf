//
//  DetailsViewModel.swift
//  silverwolf
//
//  Created by apple on 04/07/22.
//

import Foundation
import UIKit

class DetailsViewModel: NSObject {

    func loadDataApiCall(_ result:@escaping(DetailsDataResponseModelElement?) -> Void){
        DispatchQueue.main.async {
            Progress.instance.show()
        }
        let headers: [String: String] = ["Authorization": "Bearer \(ATUserDefaults.ATshared.apiAccessToken)"]
        ApiManager<DetailsDataResponseModelElement>.makeApiCall(APIUrl.UserApis.attachmentLoadData, params: [:], headers: headers, method: .post) { (response, model) in
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
        let strUrl = APIUrl.UserApis.detailsData
        
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
  
//    func getDetailsData(dictParam:[String:Any],dictBody:[String:String],_ result:@escaping(DetailsDataResponseModelElement?) -> Void) {
//
//            let objRequest = RequestManager()
//            let strUrl = APIUrl.UserApis.detailsData
//
//        let dictHeader = ["Authorization": "Bearer \(ATUserDefaults.ATshared.apiAccessToken)"]
//        objRequest.requestCommonApiMethodCall_WithParam2(requestUrl: strUrl, strMethodType: "POST", strParameterName: dictParam, dictHeader: dictHeader, dictBody: dictBody, resultType: DetailsDataResponseModelElement.self) { (model) in
//
//                print(model)
//                result(model)
//
//        }
//    }
    func getDetailsData(dictParam:String,_ result:@escaping(DetailsDataResponseModelElement?) -> Void) {
            
        DispatchQueue.main.async {
            Progress.instance.show()
        }
            let objRequest = RequestManager()
//        let strUrl = "https://api.silverwolf.dweb.in/api/Project/GetProjectDetails
            let strUrl = APIUrl.UserApis.detailsData + "?ProjectID=" + "\(dictParam)"
            let dictHeader = ["Authorization": "Bearer \(ATUserDefaults.ATshared.apiAccessToken)"]
            objRequest.requestCommonApiMethodCall_WithParam1(requestUrl: strUrl,strMethodType: "POST", strParameterName: [:], dictHeader: dictHeader, resultType: DetailsDataResponseModelElement.self) { (model) in
                DispatchQueue.main.async {
                    Progress.instance.hide()
                }
                print(model)
                result(model)
            
        }
    }
    func SubmitTimesheet(dictParam:[String:Any],completion:@escaping (_ response: [String:Any],_ completed:Bool,_ errorMessage : String)->Void)
    {
        
        let objRequest = RequestManager()
        let strUrl = APIUrl.UserApis.submitTimesheet
        
        let dictHeader = ["Authorization": "Bearer \(ATUserDefaults.ATshared.apiAccessToken)"]
        print(dictHeader)
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
}
