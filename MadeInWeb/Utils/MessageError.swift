//
//  MessageError.swift
//  MadeInWeb
//
//  Created by Alexandro Rodrigues on 8/25/21.
//

import UIKit

class MessageError: NSObject {

    func showError(viewController: UIViewController) {
        let alert = UIAlertController(title: "Error", message: "Alguma coisa deu errada, tente novamente!!!", preferredStyle: .alert)
        let btnOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(btnOk)
        viewController.present(alert, animated: true, completion: nil)
    }
}
