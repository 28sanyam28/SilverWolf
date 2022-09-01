//
//  ScheduleViewModel.swift
//  silverwolf
//
//  Created by Mac on 05/04/22.
//

import UIKit

class ScheduleViewModel: NSObject {

    func loadDataApiCall(_ result:@escaping(ScheduleDataResponseModel?) -> Void){
        DispatchQueue.main.async {
            Progress.instance.show()
        }
        let headers: [String: String] = ["Authorization": "Bearer \(SDUserDefaults.shared.apiAccessToken)"]
        ApiManager<ScheduleDataResponseModel>.makeApiCall(APIUrl.UserApis.scheduleLoadData, params: [:], headers: headers, method: .get) { (response, model) in
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
        let strUrl = APIUrl.UserApis.scheduleLoadData
        
       
        let dictHeader = ["Authorization": "Bearer \(SDUserDefaults.shared.apiAccessToken)"]
        objRequest.requestCommonApiMethodCall_WithParam(strAPIName: strUrl, strMethodType: "GET", strParameterName: dictParam, dictHeader: dictHeader)
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
  
    func getSchdeuleData(dictParam:[String:Any],_ result:@escaping(ScheduleDataResponseModel?) -> Void) {
            
            let objRequest = RequestManager()
            let strUrl = APIUrl.UserApis.scheduleLoadData
            let dictHeader = ["Authorization": "Bearer \(SDUserDefaults.shared.apiAccessToken)"]
            objRequest.requestCommonApiMethodCall_WithParam1(requestUrl: strUrl,strMethodType: "GET", strParameterName: dictParam, dictHeader: dictHeader, resultType: ScheduleDataResponseModel.self) { (model) in
                
                print(model)
                result(model)
               
           
            
        }
    }
    func LoadDataByEmployee(dictParam:String,_ result:@escaping(LoadDataByEmployeeResponseModel?) -> Void)
    {
            DispatchQueue.main.async {
                Progress.instance.show()
            }
            let objRequest = RequestManager()
            let strUrl = APIUrl.UserApis.LoadDataByEmployee + "?EmpID=" + "\(dictParam)"
            let dictHeader = ["Authorization": "Bearer \(ATUserDefaults.ATshared.apiAccessToken)"]
            objRequest.requestCommonApiMethodCall_WithParam1(requestUrl: strUrl,strMethodType: "GET", strParameterName: [:], dictHeader: dictHeader, resultType: LoadDataByEmployeeResponseModel.self) { (model) in
                DispatchQueue.main.async {
                   Progress.instance.hide()
                }
                print(model)
                result(model)
            
        }
        DispatchQueue.main.async {
           Progress.instance.hide()
        }
    }
}
