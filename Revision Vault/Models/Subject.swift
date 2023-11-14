//
//  Subject.swift
//  Revision Vault
//
//  Created by Charlie Ward on 13/11/2023.
//

import Foundation
import SwiftUI

struct Subject: Hashable, Codable, Identifiable {
    var name: String
    var category: Category
    enum Category: String, CaseIterable, Codable{
        case core = "Core"
    }
    var id: Int
    var gcse: Bool
    var alevel: Bool
    
    var aqaGCSE: Bool
    var aqaALEVEL: Bool
    var edexcelGCSE: Bool
    var edexcelALEVEL: Bool
    
    var isFeatured: Bool

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
}

