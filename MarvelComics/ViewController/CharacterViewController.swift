//
//  CharacterViewController.swift
//  MarvelComics
//
//  Created by SYED FARAN GHANI on 02/09/21.
//

import UIKit

class CharacterViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var characterDescriptionLabel: UILabel!
    @IBOutlet var characterImageView: UIImageView!
    @IBOutlet var tableView: UITableView!
    
    var character: Character?
    
    private let viewModel = ComicsViewModel()

    var comics = [Comic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.setupBindingAndGetCharacters()
        self.setCharacterData()
        
    }
    
    func setCharacterData(){
        
        nameLabel.text = character?.name
       
        let imageUrlString = "\(character?.thumbnail!["path"] ?? "")/landscape_incredible.\(character?.thumbnail?["extension"] ?? "")"
        characterImageView.kf.setImage(with: URL(string: imageUrlString), placeholder: UIImage.Comic.placeHolder)
    }

    private func setupBindingAndGetCharacters() {
        //Binding
        viewModel.isBusy.bind { [unowned self] isBusy in
            self.view.showLoader(show: isBusy)
        }
        
        viewModel.comicList.bind { (comicList) in
            
        }
        
        viewModel.error.bind { [unowned self] (error) in
            if let error = error {
                UIAlertController.show(error.localizedDescription, from: self)
            }
        }
        
        viewModel.getComics(id: "\(character?.id ?? 0)", completion: { comics in
            
            self.comics = comics
            self.tableView.reloadData()
        })
    }

}


// MARK: - UITableView Data Source
extension CharacterViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "comicTableViewCell",
                                                       for: indexPath) as? ComicsTableViewCell else {
            fatalError("Unable to dequeue comicTableViewCell.")
        }
        cell.config(comic: comics[indexPath.row])
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185.0
    }
    
}

extension CharacterViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        let comicDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "ComicsDetailViewController") as! ComicsDetailViewController
        
        comicDetailVC.comic = comics[indexPath.row]
        
        self.navigationController?.pushViewController(comicDetailVC, animated: true)
    }
}

