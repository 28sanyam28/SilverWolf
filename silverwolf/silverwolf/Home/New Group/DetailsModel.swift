//
//  DetailsModel.swift
//  silverwolf
//
//  Created by apple on 04/07/22.
//

import Foundation

// MARK: - DetailsDataResponseModelElement
struct DetailsDataResponseModelElement: Codable {
        let message: String?
        let status: Bool?
        let projectData: ProjectData?

        enum CodingKeys: String, CodingKey {
            case message = "Message"
            case status = "Status"
            case projectData = "ProjectData"
        }
    }

    // MARK: - ProjectData
    struct ProjectData: Codable {
        let id: Int?
        let projectTitle: String?
        let projectType: Int?
        let projectTypeName: String?
        let projectStatus: Int?
        let projectStatusName: String?
        let entryBy: Int?
        let entryDate: String?
        let lastEditBy, lastEditDate, isActive: String?
        let clientDetail: ClientDetail?
        let sitecontactDetail: SitecontactDetail?
        let principalDetail: ClientDetail?
        let principalDetailList: [ClientDetail]?
        let subcontractorlist, clientlist, subContractorDetail, projectTasks: String?
        let projectTasksDate: String?
        let clientName, siteName: String?
        let creationStartDate, creationEndDate: String?
        let projectStartDate, projectEndDate, budgetedHours, budgetedCost: String?
        let remark: String?
        let jobID: String?
        let srNoForJobID, projectID, itemNo: Int?
        let requestMessage: String?
        let addedOn: String?

        enum CodingKeys: String, CodingKey {
            case id = "ID"
            case projectTitle = "ProjectTitle"
            case projectType = "ProjectType"
            case projectTypeName = "ProjectTypeName"
            case projectStatus = "ProjectStatus"
            case projectStatusName = "ProjectStatusName"
            case entryBy = "EntryBy"
            case entryDate = "EntryDate"
            case lastEditBy = "LastEditBy"
            case lastEditDate = "LastEditDate"
            case isActive = "IsActive"
            case clientDetail = "ClientDetail"
            case sitecontactDetail = "SitecontactDetail"
            case principalDetail = "PrincipalDetail"
            case principalDetailList = "PrincipalDetailList"
            case subcontractorlist = "Subcontractorlist"
            case clientlist
            case subContractorDetail = "SubContractorDetail"
            case projectTasks = "ProjectTasks"
            case projectTasksDate = "ProjectTasksDate"
            case clientName = "ClientName"
            case siteName = "SiteName"
            case creationStartDate = "CreationStartDate"
            case creationEndDate = "CreationEndDate"
            case projectStartDate = "ProjectStartDate"
            case projectEndDate = "ProjectEndDate"
            case budgetedHours = "BudgetedHours"
            case budgetedCost = "BudgetedCost"
            case remark = "Remark"
            case jobID = "JobID"
            case srNoForJobID = "SrNoForJobID"
            case projectID = "ProjectID"
            case itemNo = "ItemNo"
            case requestMessage = "RequestMessage"
            case addedOn = "AddedOn"
        }
    }

    // MARK: - ClientDetail
    struct ClientDetail: Codable {
        let clientDetailID: Int?
        let clientType: String?
        let companyName: String?
        let abnNumber: String?
        let billingAddress: String?
        let billingPostalCode: String?
        let billingCityID: Int?
        let billingCityName: String?
        let billingStateID: Int?
        let billingStateName, billingCountryCode: String?
        let billingCountryID: Int?
        let billingCountryName: String?
        let contactPerson, contactNumber: String?
        let hqAddress, hqPostalCode, hqCityID, hqCityName: String?
        let hqStateID, hqStateName, hqCountryID, hqCountryName: String?
        let hqCountryCode: String?
        let email: String?
        let createdBy: Int?
        let createdDate: String?
        let updatedBy, updatedDate: String?
        let isActive: Bool?
        let role: Int?
        let webSite, password: String?
        let projectID: Int?
        let clientID, leadID: Int?
        let isProjectEdit: Bool?
        let lastChanged: String?
        let id: Int?
        let principalType: String?

        enum CodingKeys: String, CodingKey {
            case clientDetailID = "Id"
            case clientType = "ClientType"
            case companyName = "CompanyName"
            case abnNumber = "ABNNumber"
            case billingAddress = "BillingAddress"
            case billingPostalCode = "BillingPostalCode"
            case billingCityID = "BillingCityId"
            case billingCityName = "BillingCityName"
            case billingStateID = "BillingStateId"
            case billingStateName = "BillingStateName"
            case billingCountryCode = "BillingCountryCode"
            case billingCountryID = "BillingCountryId"
            case billingCountryName = "BillingCountryName"
            case contactPerson = "ContactPerson"
            case contactNumber = "ContactNumber"
            case hqAddress = "HQAddress"
            case hqPostalCode = "HQPostalCode"
            case hqCityID = "HQCityId"
            case hqCityName = "HQCityName"
            case hqStateID = "HQStateId"
            case hqStateName = "HQStateName"
            case hqCountryID = "HQCountryId"
            case hqCountryName = "HQCountryName"
            case hqCountryCode = "HQCountryCode"
            case email = "Email"
            case createdBy = "CreatedBy"
            case createdDate = "CreatedDate"
            case updatedBy = "UpdatedBy"
            case updatedDate = "UpdatedDate"
            case isActive = "IsActive"
            case role = "Role"
            case webSite = "WebSite"
            case password = "Password"
            case projectID = "ProjectId"
            case clientID = "ClientId"
            case leadID = "LeadId"
            case isProjectEdit = "IsProjectEdit"
            case lastChanged
            case id = "ID"
            case principalType = "PrincipalType"
        }
    }

    // MARK: - SitecontactDetail
    struct SitecontactDetail: Codable {
        let id: Int?
        let siteName: String?
        let contactPersonFName, contactPersonLName, contactNo, email: String?
        let address: String?
        let countryID: Int?
        let countryName: String?
        let stateID: Int?
        let stateName: String?
        let cityID: Int?
        let cityName, postalCode, countryCode, phoneNumber: String?
        let createdBy: Int?
        let createdDate: String?
        let updatedBy, updatedDate, isActive, role: String?
        let password: String?
        let contactLen, projectID: Int?

        enum CodingKeys: String, CodingKey {
            case id = "ID"
            case siteName = "SiteName"
            case contactPersonFName = "ContactPersonFName"
            case contactPersonLName = "ContactPersonLName"
            case contactNo = "ContactNo"
            case email = "Email"
            case address = "Address"
            case countryID = "CountryID"
            case countryName = "CountryName"
            case stateID = "StateID"
            case stateName = "StateName"
            case cityID = "CityID"
            case cityName = "CityName"
            case postalCode = "PostalCode"
            case countryCode = "CountryCode"
            case phoneNumber = "PhoneNumber"
            case createdBy = "CreatedBy"
            case createdDate = "CreatedDate"
            case updatedBy = "UpdatedBy"
            case updatedDate = "UpdatedDate"
            case isActive = "IsActive"
            case role = "Role"
            case password = "Password"
            case contactLen = "ContactLen"
            case projectID = "ProjectId"
        }
    }
