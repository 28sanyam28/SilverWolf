//
//  Date.swift
//  silverwolf
//
//  Created by Mac on 06/04/22.
//

import Foundation
import UIKit

extension Date {
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func serverToLocal(date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = .current
        if let localDate = dateFormatter.date(from: date) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d/MM/yyyy hh:mm:ss"
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            let dateStr = dateFormatter.string(from: localDate)
            return dateStr
        } else {
            return ""
        }
    }
    
    
    func dateToTime(date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = .current
        if let localDate = dateFormatter.date(from: date) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "h:mm a"
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            let dateStr = dateFormatter.string(from: localDate)
            return dateStr
        } else {
            return ""
        }
    }
}

//h:mm a
