//
//  Snippet.swift
//  MadeInWeb
//
//  Created by Alexandro Rodrigues on 8/25/21.
//

import UIKit

// MARK: - Snippet
struct Snippet: Codable {
    let publishedAt: String?
    let channelID, title, snippetDescription: String?
    let thumbnails: Thumbnails?
    let channelTitle, liveBroadcastContent: String?
    let publishTime: String?

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID = "channelId"
        case title
        case snippetDescription = "description"
        case thumbnails, channelTitle, liveBroadcastContent, publishTime
    }
}
