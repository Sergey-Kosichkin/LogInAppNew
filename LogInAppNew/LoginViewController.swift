//
//  ViewController.swift
//  LogInAppNew
//
//  Created by Sergey Kosichkin on 08.12.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var userTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    
    private let userName = "n"
    private let password = "m"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInButton.layer.cornerRadius = 5
        
        userTF.delegate = self
        passwordTF.delegate = self
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {
            return
        }
        welcomeVC.userName = userTF.text
    }
    
    
    @IBAction func logInAction() {
        guard userTF.text == userName, passwordTF.text == password else {
            showAlert(withTitle: "Error!",
                      andMessage: "Wrong user name or password")
            passwordTF.text = ""
            return
        }
        performSegue(withIdentifier: "welcomeVC", sender: nil)
        
    }
    
    @IBAction func forgotUserNameAction() {
        showAlert(withTitle: "Error!", andMessage: "Your name is \(userName)")
    }
    
    @IBAction func forgotPasswordAction() {
        showAlert(withTitle: "Error!", andMessage: "Your password is \(password)")
        
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userTF.text = ""
        passwordTF.text = ""
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            logInAction()
            textField.resignFirstResponder()
        }

        return true
    }
    
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
}

