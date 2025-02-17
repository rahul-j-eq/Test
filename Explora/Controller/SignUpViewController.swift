//
//  SignUpViewController.swift
//  Explora
//
//  Created by Gaurav Patel on 12/02/25.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var imgGetStarted: UIImageView!
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPhoneNumber: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnNext.layer.cornerRadius = 10
        btnNext.layer.masksToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBAction func btnAgreeToTermsPressed(_ sender: Any) {
    }
    
    // MARK: - Next Button Tapped
    
    @IBAction func btnNextPressed(_ sender: UIButton) {
        
        guard let email = txtEmail.text, !email.isEmpty else {
            let Alert = AlertManager.shared
            Alert.showAlert(on: self, title: "Empty Email!", message: "Please enter email address.")
            return
        }
        
        if EmailValidator().isValidEmail(email) == false {
            let Alert = AlertManager.shared
            Alert.showAlert(on: self, title: "Invalid Email!", message: Constants.invalidEmail)
            return
        }
        
        guard let password = txtPassword.text, !password.isEmpty else {
            let alert = AlertManager.shared
            alert.showAlert(on: self, title: "Empty Password!", message: Constants.emptyPassword)
            return
        }
        
        guard password.count >= 8 else {
            let alert = AlertManager.shared
            alert.showAlert(on: self, title: "Password Too Short!", message: Constants.passwordError)
            return
        }
        
        // Phone number validation
        guard let phone = txtPhoneNumber.text , !phone.isEmpty else {
            let Alert = AlertManager.shared
            Alert.showAlert(on: self, title: "Empty Phone Number!", message: Constants.emptyPhone)
            return
        }
        
        if PhoneValidator().isValidPhoneNumber(phone) == false {
            let Alert = AlertManager.shared
            Alert.showAlert(on: self, title: "Phone number!", message: Constants.invaildPhone)
            return
        }
        
        
        // Name validation
        guard let name = txtName.text, !name.isEmpty else {
            let alert = AlertManager.shared
            alert.showAlert(on: self, title: "Empty Name!", message: Constants.emptyName)
            return
        }
        
        // You can also validate that the name has at least 2 characters
        guard name.count >= 2 else {
            let alert = AlertManager.shared
            alert.showAlert(on: self, title: "Invalid Name!", message: Constants.invalidName)
            return
        }
        
        print(" Name: \(name) , Email: \(email), Phone Number: \(phone) , Password: \(password)")
        
        // All checks passed, now show welcome scene to user.
        let EmailCodeVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.EmailVerificationVC) as! EmailVerificationViewController
        self.navigationController?.pushViewController(EmailCodeVC, animated: true)
        
    }
    
    @IBAction func btnLoginPressed(_ sender: UIButton) {
    }
    
}
