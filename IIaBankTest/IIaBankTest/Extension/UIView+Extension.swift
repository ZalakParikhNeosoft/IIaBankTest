//
//  UIView+Extension.swift
//  IIaBankTest
//
//  Created by Zalak on 25/11/21.
//

import Foundation
import UIKit

extension UIView {
    
    //MARK: - Get XIB
    func getXIB<T:UIView>(type:T.Type) -> T {
        guard let XIB = Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: [:])?.first as? T else {
            fatalError(String(describing: T.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return XIB
    }
}
