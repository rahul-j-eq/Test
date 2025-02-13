//
//  EmailValidator.swift
//  Explora
//
//  Created by Gaurav Patel on 13/02/25.
//

import Foundation

class EmailValidator {
    
    // Regular expression for validating email format
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    
    func isValidEmail(_ email: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: email)
    }
    
    // check if email is empty
    func isEmailEmpty(_ email: String) -> Bool {
        return email.isEmpty
    }
}

