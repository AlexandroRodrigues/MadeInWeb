//
//  SearchController.swift
//  MadeInWeb
//
//  Created by Alexandro Rodrigues on 8/25/21.
//

import UIKit

class SearchController: NSObject {

    
    private let request = Request()
    private var searchYoutubeModel: SearchYoutubeModel?
    
    
    func requestSearchVideo(nameVideo: String, completion: @escaping (Bool) -> Void) {
        request.searchVideo(nameVideo: nameVideo) { [weak self] searchYoutubeModel, success in
            if success {
                self?.searchYoutubeModel = searchYoutubeModel
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func returnSearchYoutubeModel() -> SearchYoutubeModel? {
        return self.searchYoutubeModel
    }
}
