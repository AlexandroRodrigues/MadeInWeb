//
//  CompleteDetailController.swift
//  MadeInWeb
//
//  Created by Alexandro Rodrigues on 8/25/21.
//

import UIKit

class CompleteDetailController: NSObject {

    private var itemSelected: Item?

    var titleVideo: String {
        return self.itemSelected?.snippet?.title ?? ""
    }
    
    var channelVideo: String {
        return self.itemSelected?.snippet?.channelTitle ?? ""
    }
    
    var descriptionVideo: String {
        return self.itemSelected?.snippet?.snippetDescription ?? ""
    }
    
    var imageURLVideo: String {
        return self.itemSelected?.snippet?.thumbnails?.medium?.url ?? ""
    }
    
    func setItemSelected(item: Item?) {
        self.itemSelected = item
    }
}
