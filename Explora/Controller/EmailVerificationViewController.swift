//
//  EmailVerificationViewController.swift
//  Explora
//
//  Created by Gaurav Patel on 13/02/25.
//

import UIKit

class EmailVerificationViewController: UIViewController {

    @IBOutlet weak var lblEmailCode: UILabel!
    
    @IBOutlet weak var txtDigitOne: UITextField!
    @IBOutlet weak var txtDigitTwo: UITextField!
    @IBOutlet weak var txtDigitThree: UITextField!
    @IBOutlet weak var txtDigitFour: UITextField!
    @IBOutlet weak var txtDigitFive: UITextField!
    @IBOutlet weak var txtDigitSix: UITextField!
    @IBOutlet weak var btnVerify: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnVerify.layer.cornerRadius = 15
        btnVerify.layer.masksToBounds = true
        
        txtDigitOne.delegate = self
        txtDigitTwo.delegate = self
        txtDigitThree.delegate = self
        txtDigitFour.delegate = self
        txtDigitFive.delegate = self
        txtDigitSix.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func btnVerifyPressed(_ sender: UIButton) {
        // Get the text from each text field
        let D1 = txtDigitOne.text ?? ""
        let D2 = txtDigitTwo.text ?? ""
        let D3 = txtDigitThree.text ?? ""
        let D4 = txtDigitFour.text ?? ""
        let D5 = txtDigitFive.text ?? ""
        let D6 = txtDigitSix.text ?? ""

        let enteredCode = D1 + D2 + D3 + D4 + D5 + D6

        if enteredCode == "697549" {
            // Valid
            AlertManager.shared.showAlert(on: self, title: "Login Succesful !", message: "")
        } else {
            // Invalid
            AlertManager.shared.showAlert(on: self, title: "Invalid OTP !", message: Constants.invalidOTP)
        }
    }
    
    @IBAction func btnBackPressed(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }

}


// MARK: - OTP validation
extension EmailVerificationViewController: UITextFieldDelegate {

    // This method is called whenever the text in a text field is about to change
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let newText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if isValidSingleDigit(newText) {
            textField.text = newText
            moveToNextTextField(after: textField)
            return false // Return false because we have already updated the text
        }
        
        if newText.count == 0 {
            return true
        }
        
        return false // Prevent any non-digit input or more than 1 character
    }

    
    func isValidSingleDigit(_ text: String) -> Bool {
        return text.count == 1 && text.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
    }

    // Move to the next text field
    func moveToNextTextField(after currentTextField: UITextField) {
        if currentTextField == txtDigitOne {
            txtDigitTwo.becomeFirstResponder()
        } else if currentTextField == txtDigitTwo {
            txtDigitThree.becomeFirstResponder()
        } else if currentTextField == txtDigitThree {
            txtDigitFour.becomeFirstResponder()
        } else if currentTextField == txtDigitFour {
            txtDigitFive.becomeFirstResponder()
        } else if currentTextField == txtDigitFive {
            txtDigitSix.becomeFirstResponder()
        } else if currentTextField == txtDigitSix {

            txtDigitSix.resignFirstResponder()
        }
    }
    
    // Move to the prev text field
    func moveToPreviousTextField(before currentTextField: UITextField) {
        if currentTextField == txtDigitTwo {
            txtDigitOne.becomeFirstResponder()
        } else if currentTextField == txtDigitThree {
            txtDigitTwo.becomeFirstResponder()
        } else if currentTextField == txtDigitFour {
            txtDigitThree.becomeFirstResponder()
        } else if currentTextField == txtDigitFive {
            txtDigitFour.becomeFirstResponder()
        } else if currentTextField == txtDigitSix {
            txtDigitFive.becomeFirstResponder()
        }
    }

    // begins editing a text field
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = nil
    }
}
