//
//  LoadDataByEmployeeModel.swift
//  silverwolf
//
//  Created by apple on 19/07/22.
//

import Foundation

struct LoadDataByEmployeeResponseModelElement: Codable {
    let id, employeeID, taskID: Int?
    let title, welcomeDescription, scheduleStart, scheduleEnd: String?
    let createdBy: Int?
    let createdAt: String?
    let lastEditBy, lastEditDate: String?
    let projectName, taskName, employeeName: String?
    let projectID: Int?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case employeeID = "EmployeeId"
        case taskID = "TaskId"
        case title = "Title"
        case welcomeDescription = "Description"
        case scheduleStart = "ScheduleStart"
        case scheduleEnd = "ScheduleEnd"
        case createdBy = "CreatedBy"
        case createdAt = "CreatedAt"
        case lastEditBy = "LastEditBy"
        case lastEditDate = "LastEditDate"
        case projectName = "ProjectName"
        case taskName = "TaskName"
        case employeeName = "EmployeeName"
        case projectID = "ProjectID"
    }
}

typealias LoadDataByEmployeeResponseModel = [LoadDataByEmployeeResponseModelElement]
