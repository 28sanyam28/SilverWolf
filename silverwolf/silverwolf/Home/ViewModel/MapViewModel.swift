//
//  MapViewModel.swift
//  silverwolf
//
//  Created by apple on 14/06/22.
//

import UIKit

class MapViewModel: NSObject {

    func loadDataApiCall(_ result:@escaping(MapDataResponseModelElement?) -> Void){
        DispatchQueue.main.async {
            Progress.instance.show()
        }
        let headers: [String: String] = ["Authorization": "Bearer \(MUserDefaults.Mshared.apiAccessToken)"]
        ApiManager<MapDataResponseModelElement>.makeApiCall(APIUrl.UserApis.mapData, params: [:], headers: headers, method: .get) { (response, model) in
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
        let strUrl = APIUrl.UserApis.mapData
        
       
        let dictHeader = ["Authorization": "Bearer \(MUserDefaults.Mshared.apiAccessToken)"]
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
  
    func getMapData(dictParam:String,_ result:@escaping(MapDataResponseModel?) -> Void) {
            
            let objRequest = RequestManager()
//            let strUrl = "https://api.silverwolf.dweb.in/api/Project/GetAllProjectLocation"
            let strUrl = APIUrl.UserApis.GetEMPProjectLocation + "?EmpID=" + "\(dictParam)"         //?EmpID=133
            let dictHeader = ["Authorization": "Bearer \(MUserDefaults.Mshared.apiAccessToken)"]
        objRequest.requestCommonApiMethodCall_WithParam1(requestUrl: strUrl,strMethodType: "GET", strParameterName: [:], dictHeader: dictHeader, resultType: MapDataResponseModel.self) { (model) in
                
                print(model)
                result(model)
            
        }
    }
    func getSingleMapData(dictParam:Int,_ result:@escaping(MapDataResponseModelElement?) -> Void) {
            
            let objRequest = RequestManager()
//            let strUrl = "https://api.silverwolf.dweb.in/api/Project/GetsitecontactLocation?projectID=432"
//            let strUrl = "https://api.silverwolf.dweb.in/api/Project/GetsitecontactLocation?projectID=432"
        let strUrl = APIUrl.UserApis.mapData + "?projectID=" + "\(dictParam)"
            let dictHeader = ["Authorization": "Bearer \(MUserDefaults.Mshared.apiAccessToken)"]
        objRequest.requestCommonApiMethodCall_WithParam1(requestUrl: strUrl,strMethodType: "GET", strParameterName: [:], dictHeader: dictHeader, resultType: MapDataResponseModelElement.self) { (model) in
                
                print(model)
                result(model)
            
        }
    }
}
