//
//  Request.swift
//  MadeInWeb
//
//  Created by Alexandro Rodrigues on 8/25/21.
//

import Foundation
import Alamofire

class Request: NSObject {
    
    
    private let baseURL = "https://www.googleapis.com/youtube/v3"
    private let searchVideoEndPoint = "/search"
    
    private let api_Key = "AIzaSyDWRM7nhXnex_2HGd7gulBc2S2JEOr1UDc"
    
    func searchVideo(nameVideo: String, page: String = "", completion: @escaping (SearchYoutubeModel?, Bool) -> Void) {
        
        let param = ["part":"id,snippet",
                     "q":nameVideo,
                     "key":api_Key,
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
