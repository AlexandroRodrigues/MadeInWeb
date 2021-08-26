//
//  ID.swift
//  MadeInWeb
//
//  Created by Alexandro Rodrigues on 8/25/21.
//

import UIKit

// MARK: - ID
struct ID: Codable {
    let kind, videoID, playlistID: String?

    enum CodingKeys: String, CodingKey {
        case kind
        case videoID = "videoId"
        case playlistID = "playlistId"
    }
}
