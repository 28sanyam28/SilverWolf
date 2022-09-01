//
//  WebConstants.swift

import Foundation
import UIKit
//http://3.98.196.122:3000/
//https://api.fitsentive.com/
struct APIConstants {
    static let statusCode               = "statusCode"
    static let response                 = "response"
    static let data                     = "data"
    static let message                  = "message"
    static let responseType             = "responseType"
    
    
}

struct GenericErrorMessages {
    static let internalServerError      = "Something went wrong. Try again."
    static let noInternet               = "No internet connection."
}

struct APIUrl {
    
    static let host                     = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as! String
    static let baseUrlWithOutHttp       = Bundle.main.object(forInfoDictionaryKey: "BASE_URL_WITHOUT_HTTP") as! String
        
    static var baseUrl: String {
        return host + "api/"
    }
    struct UserApis {
        private static let basePreFix               = baseUrl            + "User/"
        private static let basePreSchdeule          = baseUrl            + "Schedule/"
        private static let baseDocuments            = baseUrl            + "Project/"
        private static let baseMap                  = baseUrl            + "Project/"
        private static let baseTimesheet            = baseUrl            + "Timesheet/"
        private static let baseAssessment           = baseUrl            + "SiteRiskAssessment/"
        
        static let login                            = basePreFix         + "UserLogin"
        static let forgotPassword                   = basePreFix         + "ForgotPassword"
        static let resetPassword                    = basePreFix         + "ResetPassword"
        static let resetPasswordSubmit              = basePreFix         + "ResetPasswordSubmit"
        static let scheduleLoadData                 = basePreSchdeule    + "LoadData"
        static let ChecklinkResetpassword           = basePreFix         + "ChecklinkResetpasswordExpiredOrnot"
        static let detailsData                      = baseDocuments      + "GetProjectDetails"
        static let attachmentLoadData               = baseDocuments      + "GetDocumentsListByProject"
        static let attachmentUploadData             = baseDocuments      + "UploadProjectDocuments"
        static let GetAllProjectLocation            = baseMap            + "GetAllProjectLocation"
        static let GetEMPProjectLocation            = baseMap            + "GetEMPProjectLocation"
        static let mapData                          = baseMap            + "GetsitecontactLocation"

        static let AddSiteRiskAssessment            = baseAssessment     + "AddSiteRiskAssessment"
        
        static let submitTimesheet                  = baseTimesheet      + "SubmitTimesheet"
        static let TaskByJOb                        = baseTimesheet      + "GetTaskByJObID"
        static let EmployeeByTask                   = baseTimesheet      + "GetEmployeeByTaskID"
        static let LoadDataByEmployee               = basePreSchdeule    + "LoadDataByEmployee"
        static let GetProjectTaskByProjectID        = basePreSchdeule    + "GetProjectTaskByProjectID"
        static let BindTimesheetlist                = baseTimesheet      + "BindTimesheetlist"
    }
}
