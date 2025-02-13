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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func btnVerifyPressed(_ sender: UIButton) {
    }
    
    @IBAction func btnBackPressed(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
}
