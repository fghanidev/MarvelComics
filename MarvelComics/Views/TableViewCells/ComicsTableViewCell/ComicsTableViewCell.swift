//
//  ComicsTableViewCell.swift
//  MarvelComics
//
//  Created by SYED FARAN GHANI on 02/09/21.
//

import UIKit
import Kingfisher

class ComicsTableViewCell: UITableViewCell {

    @IBOutlet var baseView: UIView!
    @IBOutlet var comicImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var creatorsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(comic: Comic) {
        let viewModel = ComicViewModel(comic: comic)
        
        titleLabel.text = viewModel.title
        descriptionLabel.text = "Description - " + viewModel.description
        if let items = viewModel.characters["items"] as? [[String: Any]]{
            var creators = "Creators - "
            for item in items {
                
                creators.append("\(item["name"] ?? ""), ")
            }
            creatorsLabel.text = creators

        }
        let imageUrlString = "\(viewModel.thumbnail["path"] ?? "")/portrait_incredible.\(viewModel.thumbnail["extension"] ?? "")"
        comicImageView.kf.setImage(with: URL(string: imageUrlString), placeholder: UIImage.Comic.placeHolder)

    }

}
