//
//  ProfilViewController.swift
//  Swifty_companion
//
//  Created by Thomas VISENTIN on 4/28/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import Foundation
import UIKit

class ProfilViewController : UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var correctionLabel: UILabel!
    
    
    var userInfo = UserInfo()
    
    override func viewDidLoad() {
        print(userInfo)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        initText()
    }
    
    func initText() {
        loginLabel.text = userInfo.login
        nameLabel.text = userInfo.displayName
        phoneLabel.text = userInfo.phoneNumber
        mailLabel.text = userInfo.email
        locationLabel.text = userInfo.location
        correctionLabel.text = String(describing: userInfo.correctionPoint) + " points"
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: URL(string: self.userInfo.imageUrl!)!)
            DispatchQueue.main.async {
//                self.imageView.contentMode = .center
                self.imageView.image = UIImage(data: data!)
                self.imageView.layer.cornerRadius = 45
            }
        }
    }
}
