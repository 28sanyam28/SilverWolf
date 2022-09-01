//
//  LoginStringConstants.swift
//  Silverwolf
//
//  Created by Mac on 01/04/22.
//

import Foundation
import UIKit

struct LoginStringConstants {
    static let accountCreatedSuccessfully        = "Account Created Successfully"
}

struct OTPStringConstants {
    static let resendOTP        = "OTP sent to registered phone number"
}

struct LoginColor {
    static let borderColor = "#3C3C3C"
}

struct LoginStoryboard {
    static let login = UIStoryboard(name: "Login", bundle: nil)
}

extension ValidationError {
    static let emptyEmail                       = "Please enter username"
    static let invalidEmail                     = "Please enter valid Email Address"
    
    static let emptyPassword                    = "Password is required"
    static let invalidPasswordChar              = "Password must be of minimum 8 characters."
    static let invalidPassword                  = "Password must contain 8 alphanumeric Characters"
    //static let invalidPassword                  = "Password must contain 8 character include numeric and special character"
    
    static let emptyFullName                    = "Please Enter Your Name"
    static let invalidFullName                  = "Please Enter Valid Name"
    static let invalidFullNameCount             = "Full name should contain 3-50 characters"
    
    static let emptyCountryCode                 = "Please select Country Code"
    
    static let emptyPhoneNumber                 = "Phone number is required"
    static let invalidPhoneNumber               = "Please enter valid phone number"
    static let invalidPhoneNumberChar           = "Phone number length should be in between 9 to 13 digits long."
    
    static let emptyEmailAndPhone               = "Please enter email address or phone number"
    
    static let emptyOTP                         = "Please enter OTP"
    static let invalidOTP                       = "Please Enter Valid OTP"
    
    static let invalidBankNameCount             = "Bank name should not be less than 3 characters"
    static let invalidBankName                  = "Please Enter Valid Bank Name"
    static let invalidBankCodeCount             = "Bank code should not be less than 3 characters"
    static let invalidBankCode                  = "Please Enter Valid Bank Code"
    
    static let emptyPlaylist                    = "Name is required"
    static let invalidPlaylistCount             = "Name should contain 3-50 characters"
    
    static let emptyBankname                    = "Bank Name is required"
    static let emptyBankCode                    = "Bank Code is required"
    static let emptyAccNo                       = "Account Number is required"
    static let emptyAccName                     = "Account Holder Name is required"
    static let invalidAccNo                     = "Account Number must be of 16 characters."
    static let invalidAccountCount              = "Account name should not be less than 3 characters"
    static let invalidAccountName               = "Please Enter Valid Account Name"
    
    static let emptyFeedback                    = "Query field is required"
    static let invalidFeedback                  = "Message must contain 20-500 character"
    
    
    static let newPassword                      = "New password is required"
    static let confirmPassword                  = "Confirm password is required"
    static let passwordMismatch                 = "New password and confirm password do not match"
    
}
