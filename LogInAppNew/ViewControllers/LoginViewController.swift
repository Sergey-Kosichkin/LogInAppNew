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
    
    private let user = User.getUser()
    
    
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
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.systemPink.cgColor,
                                UIColor.systemBlue.cgColor]
        gradient.opacity = 0.3
        
        
        guard let tabBarController = segue.destination as? UITabBarController else {
            return
        }
        
        guard let viewControllers = tabBarController.viewControllers else {
            return
        }
        
        viewControllers[1].tabBarItem.title = "\(user.data.name) \(user.data.surname)"
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
                welcomeVC.gradient = gradient
            } else if let navigationVC = viewController as? UINavigationController {
                
                if let infoVC = navigationVC.topViewController as? InfoViewController {
                    infoVC.user = user
                    infoVC.gradient = gradient
                }
                
            }
            
        }
        
    }
    
    
    @IBAction func logInAction() {
        guard userTF.text == user.login, passwordTF.text == user.password else {
            showAlert(withTitle: "Error!",
                      andMessage: "Wrong user name or password")
            passwordTF.text = ""
            return
        }
        performSegue(withIdentifier: "welcomeVC", sender: nil)
        
    }
    
    @IBAction func forgotUserNameAction() {
        showAlert(withTitle: "Error!", andMessage: "Your name is \(user.login)")
    }
    
    @IBAction func forgotPasswordAction() {
        showAlert(withTitle: "Error!", andMessage: "Your password is \(user.password)")
        
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

