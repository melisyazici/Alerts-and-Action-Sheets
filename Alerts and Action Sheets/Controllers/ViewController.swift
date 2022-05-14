//
//  ViewController.swift
//  Alerts and Action Sheets
//
//  Created by Melis Yazıcı on 14.05.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func registerPressed(_ sender: UIButton) {
        
//        emailTextfield.textContentType = .emailAddress
//        passwordTextfield.textContentType = .password
        
        let password = passwordTextfield.text
        if let email = emailTextfield.text {
            if isValidEmail(email) {
                if password!.count > 6 {
                    performSegue(withIdentifier: "goToSecond", sender: self)
                } else if password!.count < 6 {
                    showPasswordAlert()
                }
            } else {
                showEmailAlert()
            }
        }
        
        
        
        //isValidEmail(emailTextfield.text!)
        
//        if emailTextfield.textContentType != .emailAddress || emailTextfield.text == "" {
//            showEmailAlert()
//        } else if passwordTextfield.textContentType != .password || passwordTextfield.text == "" {
//            showPasswordAlert()
//        } else {
//            performSegue(withIdentifier: "goToSecond", sender: self)
//        }
        
        
        
    }
    
    // Valid Email
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    // Alerts
    func showEmailAlert() {
        let alert = UIAlertController(title: "Email", message: "Please enter a valid email adress.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
            print("tapped Dismiss")
        }))
        present(alert, animated: true)
    }
    
    func showPasswordAlert() {
        let alert = UIAlertController(title: "Password", message: "The password must be 6 characters long or more.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
            print("tapped Dismiss")
        }))
        present(alert, animated: true)
    }
    
}

