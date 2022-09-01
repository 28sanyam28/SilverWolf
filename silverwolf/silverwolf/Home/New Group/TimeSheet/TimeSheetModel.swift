//
//  TimeSheetModel.swift
//  silverwolf
//
//  Created by apple on 18/07/22.
//

import Foundation
import UIKit

struct TimeSheetDataResponseModelElement: Codable {
      let Message: String?
      let TotalHours: Int?
      let Status: Bool?
      let TimesheetData: [timesheetData]?
}
struct timesheetData: Codable {
        let ID: Int?
        let EmployeeId: Int?
        let Employeename: String?
        let TaskId: Int?
        let Title: String?
        let Description: String?
        let ScheduleStart: String?
        let ScheduleEnd: String?
        let CreatedBy: Int?
        let CreatedAt: String?
        let LastEditBy: String?
        let LastEditDate: String?
        let Details1: String?
        let Task: String?
        let FirstName: String?
        let LastName: String?
        let Jobname: String?
        let ContactNumber: String?
        let Email: String?
}
