//
//  ChecklinkResetpasswordModel.swift
//  silverwolf
//
//  Created by Mac on 27/04/22.
//

import Foundation
// MARK: - ChecklinkResetpasswordModel
struct ChecklinkResetpasswordModel: Codable {
    var empID: Int?
    var message: String?
    var status: Bool?
    var userData: CheckUserData?

    enum CodingKeys: String, CodingKey {
        case empID = "EmpID"
        case message = "Message"
        case status = "Status"
        case userData = "UserData"
    }
}

// MARK: - UserData
struct CheckUserData: Codable {
    var id: Int?
    var userName, password, firstName, lastName: String?
    var role: Int?
    var roleName: String?
    var isLocked: Bool?
    var invalidAttemptCount: Int?
    var email, contactNumber: String?
    var confirmPassword: String?
    var rememberMe: Bool?
    var resetPasswordString: String?
    var isActive: Bool?
    var token: String?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case userName = "UserName"
        case password = "Password"
        case firstName = "FirstName"
        case lastName = "LastName"
        case role = "Role"
        case roleName = "RoleName"
        case isLocked = "IsLocked"
        case invalidAttemptCount = "InvalidAttemptCount"
        case email = "Email"
        case contactNumber = "ContactNumber"
        case confirmPassword = "ConfirmPassword"
        case rememberMe = "RememberMe"
        case resetPasswordString = "ResetPasswordString"
        case isActive = "IsActive"
        case token = "Token"
    }
}
