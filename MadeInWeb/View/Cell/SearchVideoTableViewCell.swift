//
//  SearchVideoTableViewCell.swift
//  MadeInWeb
//
//  Created by Alexandro Rodrigues on 8/25/21.
//

import UIKit
import SDWebImage

class SearchVideoTableViewCell: UITableViewCell {

    @IBOutlet weak var searchVideoImagem: UIImageView!
    @IBOutlet weak var searchVideoTitle: UILabel!
    @IBOutlet weak var searchVideoDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(item: Item?) {
        searchVideoTitle.text = item?.snippet?.title ?? ""
        searchVideoDescription.text = item?.snippet?.snippetDescription ?? ""
        searchVideoImagem.sd_setImage(with: URL(string: item?.snippet?.thumbnails?.medium?.url ?? ""), completed: nil)
    }
}
