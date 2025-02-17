//
//  PhoneValidator.swift
//  Explora
//
//  Created by Gaurav Patel on 17/02/25.
//

import Foundation

class PhoneValidator {
    let phoneNumberRegex = "^[0-9]{10}$"
    
    func isValidPhoneNumber(_ phone: String) -> Bool {
        // Using a simple regex for phone number validation (e.g., 10 digits)
        let predicate = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        return predicate.evaluate(with: phone)
    }
}
