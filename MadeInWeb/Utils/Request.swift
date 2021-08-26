//
//  Request.swift
//  MadeInWeb
//
//  Created by Alexandro Rodrigues on 8/25/21.
//

import Foundation
import Alamofire

class Request: NSObject {
    
    var baseURL: String {
        return Bundle.main.object(forInfoDictionaryKey: "baseURL") as? String ?? ""
    }
    
    var apiKey: String {
        return Bundle.main.object(forInfoDictionaryKey: "apiKey") as? String ?? ""
    }
    
    private let searchVideoEndPoint = "/search"
    
    func searchVideo(nameVideo: String, page: String = "", completion: @escaping (SearchYoutubeModel?, Bool) -> Void) {
        
        let param = ["part":"id,snippet",
                     "q":nameVideo,
                     "key":apiKey,
                     "maxResults": "20",
                     "pageToken": page
        ]

        AF.request(baseURL+searchVideoEndPoint, method: .get, parameters: param).responseJSON { response in
            switch response.result {
            case .success:
                let searchYoutubeModel = try? JSONDecoder().decode(SearchYoutubeModel.self, from: response.data ?? Data())
                completion(searchYoutubeModel, true)
            case .failure:
                completion(nil, false)
            }
        }
    }
}
