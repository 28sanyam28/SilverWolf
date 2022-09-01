//
//  TimesheetViewModel.swift
//  silverwolf
//
//  Created by apple on 15/07/22.
//

import Foundation
import UIKit

class TimesheetViewModel: NSObject {

    func loadDataApiCall(_ result:@escaping(TimeSheetDataResponseModelElement?) -> Void){
        DispatchQueue.main.async {
            Progress.instance.show()
        }
        let headers: [String: String] = ["Authorization": "Bearer \(ATUserDefaults.ATshared.apiAccessToken)"]
        ApiManager<TimeSheetDataResponseModelElement>.makeApiCall(APIUrl.UserApis.attachmentLoadData, params: [:], headers: headers, method: .post) { (response, model) in
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
        let strUrl = APIUrl.UserApis.submitTimesheet
        
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
  
    func getTimesheetData(dictParam:[String:Any],_ result:@escaping(TimeSheetDataResponseModelElement?) -> Void) {
            
            let objRequest = RequestManager()
            let strUrl = APIUrl.UserApis.TaskByJOb
            let dictHeader = ["Authorization": "Bearer \(ATUserDefaults.ATshared.apiAccessToken)"]
            objRequest.requestCommonApiMethodCall_WithParam1(requestUrl: strUrl,strMethodType: "POST", strParameterName: dictParam, dictHeader: dictHeader, resultType: TimeSheetDataResponseModelElement.self) { (model) in
                
                print(model)
                result(model)
            
        }
    }
    func getTimesheetEData(dictParam:[String:Any],_ result:@escaping(TimeSheetDataResponseModelElement?) -> Void) {
            
            let objRequest = RequestManager()
            let strUrl = APIUrl.UserApis.EmployeeByTask
            let dictHeader = ["Authorization": "Bearer \(ATUserDefaults.ATshared.apiAccessToken)"]
            objRequest.requestCommonApiMethodCall_WithParam1(requestUrl: strUrl,strMethodType: "POST", strParameterName: dictParam, dictHeader: dictHeader, resultType: TimeSheetDataResponseModelElement.self) { (model) in
                DispatchQueue.main.async {
                    Progress.instance.hide()
                }
                print(model)
                result(model)
            
        }
    }
    func LoadDataByEmployee(dictParam:String,_ result:@escaping(LoadDataByEmployeeResponseModel?) -> Void) {
           DispatchQueue.main.async {
               Progress.instance.show()
           }
            let objRequest = RequestManager()
            let strUrl = APIUrl.UserApis.LoadDataByEmployee + "?EmpID=" + "\(dictParam)"
            let dictHeader = ["Authorization": "Bearer \(ATUserDefaults.ATshared.apiAccessToken)"]
            objRequest.requestCommonApiMethodCall_WithParam1(requestUrl: strUrl,strMethodType: "GET", strParameterName: [:], dictHeader: dictHeader, resultType: LoadDataByEmployeeResponseModel.self) { (model) in
                print(model)
                result(model)
            
        }
    }
    func GetProjectTaskByProjectID(dictParam:Int,_ result:@escaping(GetProjectTaskByProjectIDResponseModelElement?) -> Void) {
            
        let objRequest = RequestManager()
        let strUrl = APIUrl.UserApis.GetProjectTaskByProjectID + "?ProjectID=" + "\(dictParam)"
    let dictHeader = ["Authorization": "Bearer \(ATUserDefaults.ATshared.apiAccessToken)"]
    objRequest.requestCommonApiMethodCall_WithParam1(requestUrl: strUrl,strMethodType: "POST", strParameterName: [:], dictHeader: dictHeader, resultType: GetProjectTaskByProjectIDResponseModelElement.self) { (model) in
            
            print(model)
            result(model)
            
        }
    }
    
    func SubmitTimesheet(dictParam:[String:Any],completion:@escaping (_ response: [String:Any],_ completed:Bool,_ errorMessage : String)->Void)
    {
        
        let objRequest = RequestManager()
        let strUrl = APIUrl.UserApis.submitTimesheet
        
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
    func BindTimesheetlist(dictParam:[String:Any],_ result:@escaping(BindTimesheetlistResponseModelElement?) -> Void) {
            
            let objRequest = RequestManager()
            let strUrl = APIUrl.UserApis.BindTimesheetlist
            let dictHeader = ["Authorization": "Bearer \(ATUserDefaults.ATshared.apiAccessToken)"]
            objRequest.requestCommonApiMethodCall_WithParam1(requestUrl: strUrl,strMethodType: "POST", strParameterName: dictParam, dictHeader: dictHeader, resultType: BindTimesheetlistResponseModelElement.self) { (model) in
                
                print(model)
                result(model)
            
        }
    }
}
