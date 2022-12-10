//
//  WelcomeViewController.swift
//  LogInAppNew
//
//  Created by Sergey Kosichkin on 08.12.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var user: User!
    var gradient: CAGradientLayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user.data.name) \(user.data.surname)!"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.layer.insertSublayer(gradient, at: 0)
    }
    
}
