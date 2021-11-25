//
//  ListModel.swift
//  IIaBankTest
//
//  Created by Zalak on 25/11/21.
//

import Foundation
import UIKit

//MARK: - List Model - Main Model
struct ListModel {
    var stationery  : [DetailModel]
    var signs       : [DetailModel]
    var mathSigns   : [DetailModel]
}

//MARK: - DetailModel
struct DetailModel: Codable {
    var label       : String
    var iconStr     : String
}

extension DetailModel {
    //computed property
    var iconImage: UIImage {
        return UIImage(systemName: iconStr) ?? UIImage()
    }
}

//MARK: - Header Image Model
struct imageModel {
    var imageStr    : String
    var type        : ListTypes
}

extension imageModel {
    //computed property
    var image: UIImage {
        return UIImage(named: imageStr) ?? UIImage()
    }
}

//MARK: - List Types
enum ListTypes: CaseIterable {
    case stationery
    case signs
    case mathsSigns
}
