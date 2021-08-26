//
//  DetailSearchViewController.swift
//  MadeInWeb
//
//  Created by Alexandro Rodrigues on 8/25/21.
//

import UIKit

class DetailSearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchVideoTextField: UITextField!
    
    var detailController = DetailController()
    let messageError = MessageError()
    var canLoadPage = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.tableFooterView = UIView()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    @IBAction func btnSearch(_ sender: Any) {
        self.searchVideoTextField.resignFirstResponder()
        detailController.requestSearchVideo(nameVideo: searchVideoTextField.text ?? "") { success in
            if success {
                self.tableView.reloadData()
            } else {
                self.messageError.showError(viewController: self)
            }
        }
    }
    
    func goToCompleteDetailScreen(indexPath: IndexPath) {
        if let viewController = self.storyboard?.instantiateViewController(identifier: "CompleteDetailViewController") as? CompleteDetailViewController {
            viewController.completeDetail.setItemSelected(item: detailController.itemForRowAt(indexPath: indexPath))
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension DetailSearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailController.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SearchVideoTableViewCell {
            
            cell.setup(item: detailController.itemForRowAt(indexPath: indexPath))
            return cell
        }
        return UITableViewCell()
    }
    
}

extension DetailSearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.goToCompleteDetailScreen(indexPath: indexPath)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
           if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height )) {
            if canLoadPage {
                canLoadPage = false
                detailController.requestSearchVideoPage(nameVideo: detailController.titleSearch, page: detailController.nextPage()) { success in
                    if success {
                        self.tableView.reloadData()
                        self.canLoadPage = true
                    }
                }
            }
           }
       }
}
