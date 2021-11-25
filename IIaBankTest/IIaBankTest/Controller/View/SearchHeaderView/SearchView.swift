//
//  SearchView.swift
//  IIaBankTest
//
//  Created by Zalak on 25/11/21.
//

import UIKit

class SearchView: UIView {
    
    //MARK: - Outlets
    @IBOutlet private weak var searchTextField: UITextField!
    
    //CallBack
    var searchText: ((String) -> Void)?
    
    //MARK: - Variable
    static var shared: SearchView {
        return SearchView().getXIB(type: SearchView.self)
    }
    
}

//MARK: - UITextFieldDelegate
extension SearchView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        setTextAlignment(textField.text ?? "")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            let currentText = (text as NSString).replacingCharacters(in: range, with: string)
            setTextAlignment(currentText)
            searchText?(currentText)
            return true
        }
        return false
    }
    
    private func setTextAlignment(_ text: String) {
        searchTextField.textAlignment = (text.trimmed.isEmpty) ? .center : .left
    }
}


