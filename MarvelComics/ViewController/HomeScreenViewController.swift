//
//  ViewController.swift
//  MarvelComics
//
//  Created by SYED FARAN GHANI on 01/09/21.
//

import UIKit
import CoreData

class HomeScreenViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    // MARK: - Private Properties
    
    private let viewModel = CharactersViewModel()
    
    var characters = [Character]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setupBindingAndGetCharacters()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    private func setupBindingAndGetCharacters() {
        //Binding
        viewModel.isBusy.bind { [unowned self] isBusy in
            self.view.showLoader(show: isBusy)
        }
        
        viewModel.characterList.bind { (characterList) in
            
        }
        
        viewModel.error.bind { [unowned self] (error) in
            if let error = error {
                UIAlertController.show(error.localizedDescription, from: self)
            }
        }
        
        viewModel.getCharacters { characters in
            
            self.characters = characters
            self.tableView.reloadData()
        }
    }

}


// MARK: - UITableView Data Source
extension HomeScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterTableViewCell",
                                                       for: indexPath) as? CharacterTableViewCell else {
            fatalError("Unable to dequeue characterTableViewCell.")
        }
        cell.config(character: characters[indexPath.row])
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210.0
    }
}

extension HomeScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        let characterVC = self.storyboard?.instantiateViewController(withIdentifier: "CharacterViewController") as! CharacterViewController
        
        characterVC.character = characters[indexPath.row]
        
        self.navigationController?.pushViewController(characterVC, animated: true)
    }
}
