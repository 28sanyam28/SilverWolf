//
//  ScheduleDataResponseModel.swift
//  silverwolf
//
//  Created by Mac on 05/04/22.
//

import Foundation

// MARK: - ScheduleDataResponseModelElement
struct ScheduleDataResponseModelElement: Codable {
    var id, employeeID, taskID: Int?
    var title, scheduleDataResponseModelDescription, scheduleStart, scheduleEnd: String?
    var createdBy: Int?
    var createdAt: String?
    var lastEditBy: Int?
    var lastEditDate: String?
    var projectName, taskName, employeeName: String?
    var projectID: Int?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case employeeID = "EmployeeId"
        case taskID = "TaskId"
        case title = "Title"
        case scheduleDataResponseModelDescription = "Description"
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

typealias ScheduleDataResponseModel = [ScheduleDataResponseModelElement]

