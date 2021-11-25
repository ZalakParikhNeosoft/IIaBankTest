//
//  String+Extension.swift
//  IIaBankTest
//
//  Created by Zalak on 25/11/21.
//

import Foundation

extension String{
    
    var trimmed: String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func containsIgnoringCase(find: String) -> Bool {
        return range(of: find, options: .caseInsensitive, range: nil, locale: nil) != nil
    }
}
