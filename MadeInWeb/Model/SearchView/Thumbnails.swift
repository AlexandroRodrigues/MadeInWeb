//
//  Thumbnails.swift
//  MadeInWeb
//
//  Created by Alexandro Rodrigues on 8/25/21.
//

import UIKit

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let thumbnailsDefault, medium, high: Default?

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high
    }
}
