//
//  SSAViewModel.swift
//  silverwolf
//
//  Created by apple on 19/07/22.
//

import Foundation

class SSAViewModel: NSObject {
    
    func getReflection(dictParam:[String:Any],completion:@escaping (_ response: [String:Any],_ completed:Bool,_ errorMessage : String)->Void)
    {
        let objRequest = RequestManager()
        let strUrl = APIUrl.UserApis.AddSiteRiskAssessment
        
       
        let dictHeader = ["Authorization": "Bearer \(SDUserDefaults.shared.apiAccessToken)"]
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
