//
//  CharacterTableViewCell.swift
//  MarvelComics
//
//  Created by SYED FARAN GHANI on 02/09/21.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet var baseView: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var characterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func config(character: Character) {
        let viewModel = CharacterViewModel(character: character)
        
        nameLabel.text = viewModel.name
       
        let imageUrlString = "\(viewModel.thumbnail["path"] ?? "")/landscape_incredible.\(viewModel.thumbnail["extension"] ?? "")"
//        print(imageUrlString)
        characterImageView.kf.setImage(with: URL(string: imageUrlString), placeholder: UIImage.Comic.placeHolder)

    }
}
