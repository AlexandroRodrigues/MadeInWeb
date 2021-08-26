
import Foundation

// MARK: - SearchYoutubeModel
struct SearchYoutubeModel: Codable {
    var nextPageToken: String?
    let kind, etag, regionCode: String?
    let pageInfo: PageInfo?
    var items: [Item]?
}
