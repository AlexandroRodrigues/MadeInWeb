//
//  ViewController.swift
//  MadeInWeb
//
//  Created by Alexandro Rodrigues on 8/25/21.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    let controller = SearchController()
    let messageError = MessageError()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func searchButton(_ sender: Any) {
        self.searchTextField.resignFirstResponder()
        controller.requestSearchVideo(nameVideo: searchTextField.text ?? "") { [weak self] success in
            guard let self = self else { return }
            if success {
                self.searchTextField.text = ""
                self.goToDetailScreen()
            } else {
                self.messageError.showError(viewController: self)
            }
        }
    }
    
    func goToDetailScreen() {
        if let viewController = self.storyboard?.instantiateViewController(identifier: "DetailSearchViewController") as? DetailSearchViewController {
            viewController.detailController.setTitleSearch(titleSearch: searchTextField.text ?? "")
            viewController.detailController.setSearchYoutubeModel(searchYoutubeModel: controller.returnSearchYoutubeModel())
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func showError() {
        let alert = UIAlertController(title: "Error", message: "Alguma coisa deu errada, tente novamente!!!", preferredStyle: .alert)
        let btnOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(btnOk)
        self.present(alert, animated: true, completion: nil)
    }
    
}

