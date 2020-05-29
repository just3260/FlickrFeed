//
//  SearchViewController.swift
//  ALLIED
//
//  Created by Andrew on 2020/5/26.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchKeyTF: UITextField!
    
    @IBOutlet weak var searchCountTF: UITextField!

    @IBOutlet weak var searchBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        self.view.addGestureRecognizer(tap)
        
        // add listener for textField changed
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldChanged), name: UITextField.textDidChangeNotification, object: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            if let tabBarController = segue.destination as? UITabBarController,
                let vc = tabBarController.viewControllers?.first as? ResultViewController {
                vc.key = searchKeyTF.text ?? ""
                vc.count = searchCountTF.text ?? ""
            }
        }
    }
    
    
    // MARK: Private
    @objc func textFieldChanged() {
        // check textField value here
        if let key = searchKeyTF.text, let page = searchCountTF.text {
            searchBtn.isEnabled = (key.count > 0 && page.count > 0)
            self.searchBtn.backgroundColor = self.searchBtn.isEnabled ? #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1) : #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
    
    @objc func dismissKeyBoard() {
        self.view.endEditing(true)
    }

}


// MARK: - UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

