//
//  MoreInfoViewController.swift
//  LogInAppNew
//
//  Created by Sergey Kosichkin on 10.12.2022.
//

import UIKit

class MoreInfoViewController: UIViewController {
    
    @IBOutlet var infoLabel: UILabel!
    
    var user: User!
    var gradient: CAGradientLayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoLabel.text = """
My name is \(user.data.name) \(user.data.surname)
I am \(user.data.age) years old
My profession is \(user.data.profession)
I want to become \(user.data.desiredProfession)
"""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.layer.insertSublayer(gradient, at: 0)
    }
    
}
