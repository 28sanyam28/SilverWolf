//
//  String.swift
//  Silverwolf
//
//  Created by Mac on 01/04/22.
//

import Foundation

extension String {
//    func sha1() -> String {
//        let data = Data(self.utf8)
//        var digest = [UInt8](repeating: 0, count:Int(CC_SHA1_DIGEST_LENGTH))
//        data.withUnsafeBytes {
//            _ = CC_SHA1($0.baseAddress, CC_LONG(data.count), &digest)
//        }
//        let hexBytes = digest.map { String(format: "%02hhx", $0) }
//        return hexBytes.joined()
//    }
//
    var isValidEmailAddress: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let testEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return testEmail.evaluate(with: self)
    }
    
    var isPhoneNumber: Bool {
        let PHONE_REGEX = "^[0-9][0-9]{8,12}$";
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }

    var isValidName: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9_. ]", options: .regularExpression) == nil
    }
    
    var isValidNameCount: Bool {
        return !isEmpty && self.count >= 3 && self.count <= 50
    }
    
    var isValidAccountNameCount: Bool {
        return !isEmpty && self.count == 16
    }
    
    var isValidBankCodeCount: Bool {
        return  !isEmpty && self.count >= 3 && self.count <= 30
    }
    
    var isValidNameCharactersOnly: Bool {
        return !isEmpty && range(of: ".*[^A-Za-z].*", options: .regularExpression) == nil
    }
    
    var isValidPhone: Bool {
        return self.count > 8 && self.count < 14 && isDigits
    }
    
    var isValidTextViewCount: Bool {
        return self.count >= 20 && self.count < 501
    }
    
    var isValidPassword: Bool {
        return !isEmpty && self.count >= 6
    }
    
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    var isDigits: Bool {
        let notDigits = NSCharacterSet.decimalDigits.inverted
        if rangeOfCharacter(from: notDigits,
                            options: String.CompareOptions.literal,
                            range: nil) == nil {
            return true
        }
        return false
    }
    
    var isContainsNumericAndSpecialCharacters: Bool {
        let numbers = CharacterSet.decimalDigits
        let punctuationChar = CharacterSet.punctuationCharacters
        
        if self.rangeOfCharacter(from: numbers) == nil || self.rangeOfCharacter(from: punctuationChar) == nil {
            return false
        }
        return true
    }
    
    var isValidAccountNumber: Bool {
        return !isEmpty && self.count >= 16
    }
    
    func isValidUrl() -> Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
            // check if the string has link inside
            return detector.numberOfMatches(in: self, options: [], range: .init( location: 0, length: utf16.count)) > 0
        } catch {
            print("Error during NSDatadetector initialization \(error)" )
        }
        return false
    }
    
}

extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
