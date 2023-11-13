/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A representation of a single landmark.
*/

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

//    private var imageName: String
//    var image: Image {
//        Image(imageName)
//    }
}

