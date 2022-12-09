//
//  WelcomeViewController.swift
//  LogInAppNew
//
//  Created by Sergey Kosichkin on 08.12.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemPink.cgColor,
                                UIColor.systemBlue.cgColor]
        gradientLayer.opacity = 0.5
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        welcomeLabel.text = "Welcome, \(userName ?? "User")!"
        
    }
    
}
