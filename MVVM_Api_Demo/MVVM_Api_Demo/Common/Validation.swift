//
//  StringValidation.swift
//  Ventura
//
//  Created by Apple on 18/09/24.
//

import Foundation
import SwiftUI

//MARK: - String Validation
extension String {
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }

    var isValidPassword: Bool {
        return self.count >= 6
    }
}

