//
//  BindTimesheetlistModel.swift
//  silverwolf
//
//  Created by apple on 20/07/22.
//

import Foundation

struct BindTimesheetlistResponseModelElement: Codable {
    let message: String?
    let totalHours: Int?
    let status: Bool?
    let timesheetData: [TimesheetDatum]?

    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case totalHours = "TotalHours"
        case status = "Status"
        case timesheetData = "TimesheetData"
    }
}

// MARK: - TimesheetDatum
struct TimesheetDatum: Codable {
    let id: Int?
    let type: TypeEnum?
    let jobID: Int?
    let jobname: Jobname?
    let employeeID: Int?
    let empname: Empname?
    let clientID: Int?
    let clientname: String?
    let taskID: String?
    let taskName, website, timesheetDatumDescription: String?
    let workTime, workTimeMins: Int?
    let addedBy: String?
    let addedonstr: String?
    let addedonProjectstr: String?
    let addedOn, addeddateOn: AddedOn?
    let updatedBy, updatedOn, toTime, fromTime: String?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case type = "Type"
        case jobID = "JobId"
        case jobname = "Jobname"
        case employeeID = "EmployeeId"
        case empname = "Empname"
        case clientID = "ClientId"
        case clientname = "Clientname"
        case taskID = "TaskId"
        case taskName = "TaskName"
        case website = "Website"
        case timesheetDatumDescription = "Description"
        case workTime = "WorkTime"
        case workTimeMins = "WorkTimeMins"
        case addedBy = "AddedBy"
        case addedonstr = "Addedonstr"
        case addedonProjectstr = "AddedonProjectstr"
        case addedOn = "AddedOn"
        case addeddateOn = "AddeddateOn"
        case updatedBy = "UpdatedBy"
        case updatedOn = "UpdatedOn"
        case toTime = "ToTime"
        case fromTime = "FromTime"
    }
}

enum AddedOn: String, Codable {
    case the00010101T000000 = "0001-01-01T00:00:00"
}

enum Clientname: String, Codable {
    case comp = "comp"
    case empty = ""
    case textra = "Textra"
    
}

enum Empname: String, Codable {
    case leenaBalachandran = "Leena Balachandran"
}

enum Jobname: String, Codable {
    case fizz01 = "Fizz 01"
    case swProjects = "SW Projects"
    case tops01 = "TOPS 01 "
}

enum TypeEnum: String, Codable {
    case common = "Common"
}
