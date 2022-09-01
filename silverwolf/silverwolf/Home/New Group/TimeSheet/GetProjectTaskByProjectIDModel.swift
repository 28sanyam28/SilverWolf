//
//  GetProjectTaskByProjectIDModel.swift
//  silverwolf
//
//  Created by apple on 19/07/22.
//

import Foundation

struct GetProjectTaskByProjectIDResponseModelElement: Codable {
    let message: String?
    let status: Bool?
    let projectData: [ProjectDatum]?

    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case status = "Status"
        case projectData = "ProjectData"
    }
}

// MARK: - ProjectDatum
struct ProjectDatum: Codable {
    let id, projectID: Int?
    let taskName: String?
    let entryBy: Int?
    let entryDate: String?
    let assignTo, remarks: String?
    let status: Int?
    let priority: String?
    let isActive: Bool?
    let lastEditBy, lastEditDate, isDeleted: String?
    let projectType: Int?
    let projectTypeName: String?
    let projectStatusName: String?
    let isDefault: Bool?
    let assignToRole, assignBy, assignDate: String?
    let assignToName, permanentProjectStatusName: String?
    let projectJobID, client: String?
    let clientID: Int?
    let siteContact: String?
    let siteContactID: Int?
    let assignee: String?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case projectID = "ProjectID"
        case taskName = "TaskName"
        case entryBy = "EntryBy"
        case entryDate = "EntryDate"
        case assignTo = "AssignTo"
        case remarks = "Remarks"
        case status = "Status"
        case priority = "Priority"
        case isActive = "IsActive"
        case lastEditBy = "LastEditBy"
        case lastEditDate = "LastEditDate"
        case isDeleted = "IsDeleted"
        case projectType = "ProjectType"
        case projectTypeName = "ProjectTypeName"
        case projectStatusName = "ProjectStatusName"
        case isDefault = "IsDefault"
        case assignToRole = "AssignToRole"
        case assignBy = "AssignBy"
        case assignDate = "AssignDate"
        case assignToName = "AssignToName"
        case permanentProjectStatusName = "PermanentProjectStatusName"
        case projectJobID = "ProjectJobID"
        case client = "Client"
        case clientID = "ClientID"
        case siteContact = "SiteContact"
        case siteContactID = "SiteContactID"
        case assignee = "Assignee"
    }
}
