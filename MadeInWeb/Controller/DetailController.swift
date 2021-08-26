//
//  DetailController.swift
//  MadeInWeb
//
//  Created by Alexandro Rodrigues on 8/25/21.
//

import Foundation

class DetailController: NSObject {
    
    var titleSearch = ""
    var searchYoutubeModel: SearchYoutubeModel?
    private let request = Request()
    
    func setSearchYoutubeModel(searchYoutubeModel: SearchYoutubeModel?) {
        self.searchYoutubeModel = searchYoutubeModel
    }
    
    func setTitleSearch(titleSearch: String) {
        self.titleSearch = titleSearch
    }
    
    func numberOfRowsInSection() -> Int {
        return searchYoutubeModel?.items?.count ?? 0
    }
    
    func itemForRowAt(indexPath: IndexPath) -> Item? {
        return searchYoutubeModel?.items?[indexPath.row]
    }
    
    func nextPage() -> String {
        return searchYoutubeModel?.nextPageToken ?? ""
    }
    
    func requestSearchVideoPage(nameVideo: String, page: String, completion: @escaping (Bool) -> Void) {
        request.searchVideo(nameVideo: nameVideo, page: page) { [weak self] searchYoutubeModel, success in
            if success {
                self?.searchYoutubeModel?.items?.append(contentsOf: searchYoutubeModel?.items ?? [])
                self?.searchYoutubeModel?.nextPageToken = searchYoutubeModel?.nextPageToken
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func requestSearchVideo(nameVideo: String, completion: @escaping (Bool) -> Void) {
        request.searchVideo(nameVideo: nameVideo) { searchYoutubeModel, success in
            if success {
                self.searchYoutubeModel = searchYoutubeModel
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
