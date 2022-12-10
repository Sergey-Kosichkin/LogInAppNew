//
//  InfoViewController.swift
//  LogInAppNew
//
//  Created by Sergey Kosichkin on 10.12.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    var user: User!
    var gradient: CAGradientLayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.layer.insertSublayer(gradient, at: 0)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let moreInfoVC = segue.destination as? MoreInfoViewController  else {
            return
        }
        
        moreInfoVC.user = user
        moreInfoVC.gradient = gradient
        
        let backButton = UIBarButtonItem()
        backButton.title = "\(user.data.name) \(user.data.surname)"
        navigationItem.backBarButtonItem = backButton
    }
}
