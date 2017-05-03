//
//  ViewController.swift
//  Swifty_companion
//
//  Created by Thomas VISENTIN on 4/25/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var buttonText: UIButton!
    @IBOutlet weak var spinnerActivity: UIActivityIndicatorView!
    
    let authentification = Oauth.sharedInstance
    var userInfo = UserInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonText.layer.cornerRadius = 5;
        spinnerActivity.isHidden = !spinnerActivity.isHidden
    }
    
    override func viewWillAppear(_ animated : Bool) {
        self.navigationController?.navigationBar.isHidden = true
        textField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showSpinner() {
        spinnerActivity.startAnimating()
        spinnerActivity.isHidden = false
        buttonText.isHidden = true
    }
    
    func hideSpinner() {
        spinnerActivity.stopAnimating()
        spinnerActivity.isHidden = true
        buttonText.isHidden = false
    }

    @IBAction func buttonAction() {
        showSpinner()
        
        if let login = textField.text {
            if login.isEmpty {
                self.hideSpinner()
                return
            }
            authentification.connectToAPI(completionHandler: { (hasSucceed, error) in
                if hasSucceed {
                    print("Connection to API is a success")
                    self.authentification.getUserInfo(login: login, completionHandler: { (hasSucceed, error, user) in
                        if hasSucceed {
                            print("Get User Info is a success")
                            self.hideSpinner()
                            self.userInfo = user!
                            self.performSegue(withIdentifier: "SearchToProfilSegue", sender: self)
                        } else {
                            print("Error (getUserInfo/buttonAction): \(error)")
                            self.hideSpinner()
                        }
                    })
                } else {
                    print("Error (connectToAPI/buttonAction): \(error)")
                    self.hideSpinner()
                }
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SearchToProfilSegue" {
            let tabVc = segue.destination as! UITabBarController
            let profilVc = tabVc.viewControllers?[0] as! ProfilViewController
            profilVc.userInfo = userInfo
            profilVc.itemTabBar.image = UIImage(named: "user_icon")
            let projectsVC = tabVc.viewControllers?[1] as! ProjectsTableViewController
            projectsVC.userInfo = userInfo
            projectsVC.itemTabBar.image = UIImage(named: "project_icon")
            let skillsVc = tabVc.viewControllers?[2] as! SkillsTableViewController
            skillsVc.userInfo = userInfo
            skillsVc.itemTabBar.image = UIImage(named: "skill_icon")
        }
    }
}

