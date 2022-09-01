//
//  AttachmentModels.swift
//  silverwolf
//
//  Created by apple on 17/06/22.
//

import UIKit
import Foundation

struct AttachmentDataResponseModelElement: Codable {
    let Message: String?
    let Status: Bool?
    let ProjectData: projectData?
}

struct projectData: Codable {
    let CWD: cwd?
    let Files: [Files]?
    let Error: String?
    let Details: String?
}

struct cwd: Codable {
    let Path: String?
    let Action: String?
    let NewName: String?
    let Names: String?
    let Name: String?
    let Size: Int?
    let PreviousName: String?
    let DateModified: String?
    let DateCreated: String?
    let HasChild: Bool?
    let IsFile: Bool?
    let `Type`: String?
    let Id: String?
    let FilterPath: String?
    let FilterId: String?
    let ParentId: String?
    let TargetPath: String?
    let RenameFiles: String?
    let UploadFiles: String?
    let CaseSensitive: Bool?
    let SearchString: String?
    let ShowHiddenItems: Bool?
    let Data: String?
    let TargetData: String?
    let Permission: String?
}

struct Files: Codable {
    let Path: String?
    let Action: String?
    let NewName: String?
    let Names: String?
    let Name: String?
    let Size: Int?
    let PreviousName: String?
    let DateModified: String?
    let DateCreated: String?
    let HasChild: Bool?
    let IsFile: Bool?
    let `Type`: String?
    let Id: String?
    let FilterPath: String?
    let FilterId: String?
    let ParentId: String?
    let TargetPath: String?
    let RenameFiles: String?
    let UploadFiles: String?
    let CaseSensitive: Bool?
    let SearchString: String?
    let ShowHiddenItems: Bool?
    let Data: String?
    let TargetData: String?
    let Permission: String?
}
