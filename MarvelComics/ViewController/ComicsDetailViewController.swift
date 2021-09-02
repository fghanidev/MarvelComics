//
//  ComicsDetailViewController.swift
//  MarvelComics
//
//  Created by SYED FARAN GHANI on 02/09/21.
//

import UIKit

class ComicsDetailViewController: UIViewController {

    @IBOutlet var comicImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var comicDescriptionLabel: UILabel!
    @IBOutlet var creatorsLabel: UILabel!
    
    var comic: Comic?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setComicData()
    }
    

  
    func setComicData(){
        
        titleLabel.text = comic!.title
        comicDescriptionLabel.text = comic!.description
        if let items = comic!.characters!["items"] as? [[String: Any]]{
            var creators = ""
            for item in items {
                
                creators.append("\(item["name"] ?? ""), ")
            }
            creatorsLabel.text = creators

        }
        let imageUrlString = "\(comic!.thumbnail!["path"] ?? "")/landscape_incredible.\(comic!.thumbnail!["extension"] ?? "")"
        comicImageView.kf.setImage(with: URL(string: imageUrlString), placeholder: UIImage.Comic.placeHolder)

    }

}
