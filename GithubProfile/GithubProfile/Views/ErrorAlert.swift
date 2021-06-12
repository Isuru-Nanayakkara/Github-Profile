//
//  ErrorAlert.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-12.
//

import UIKit

struct ErrorAlert {
    var title: String? = ""
    let message: String
    var buttonTitle: String = "OK"
    
    let handler: (() -> Void)? = nil
    
    func present(in viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .cancel) { _ in
            self.handler?()
        }
        alert.addAction(action)
        
        viewController.present(alert, animated: true)
    }
}
