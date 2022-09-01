//
//  MapDataResponseModel.swift
//  silverwolf
//
//  Created by apple on 16/06/22.
//

import Foundation
import Alamofire

struct MapDataResponseModelElement: Codable {
    let lat: Double?
    let lng: Double?
    let Address: String?
    let PostalCode: String?
    let SiteName: String?
}
typealias MapDataResponseModel = [MapDataResponseModelElement]
