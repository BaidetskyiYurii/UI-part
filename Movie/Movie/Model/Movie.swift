//
//  Movie.swift
//  Movie
//
//  Created by Baidetskyi Jurii on 19.09.2022.
//

import Foundation
import UIKit

struct Movie: Codable {
    var name: String
    var raiting: String?
    var imgPath: String?
    var type: String
    var duration: String
}
