//
//  Item.swift
//  MadeInWeb
//
//  Created by Alexandro Rodrigues on 8/25/21.
//

import UIKit

// MARK: - Item
struct Item: Codable {
    let kind, etag: String?
    let id: ID?
    let snippet: Snippet?
}
