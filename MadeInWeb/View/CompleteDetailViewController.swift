//
//  CompleteDetailViewController.swift
//  MadeInWeb
//
//  Created by Alexandro Rodrigues on 8/25/21.
//

import UIKit

class CompleteDetailViewController: UIViewController {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleVideo: UILabel!
    @IBOutlet weak var channelVideo: UILabel!
    @IBOutlet weak var descriptionVideo: UILabel!
    
    var completeDetail = CompleteDetailController()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        titleVideo.text = completeDetail.titleVideo
        channelVideo.text = completeDetail.channelVideo
        descriptionVideo.text = completeDetail.descriptionVideo
        thumbnailImageView.sd_setImage(with: URL(string: completeDetail.imageURLVideo), completed: nil)
    }
    
}
