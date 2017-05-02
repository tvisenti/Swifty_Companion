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
    
    let authentification = Oauth.sharedInstance
    var userInfo = UserInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    
    }
    
    override func viewWillAppear(_ animated : Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initView() {
        buttonText.layer.cornerRadius = 5;
    }

    @IBAction func buttonAction() {
        if let login = textField.text {
            authentification.connectToAPI(completionHandler: { (hasSucceed, error) in
                if hasSucceed {
                    print("Connection to API is a success")
                    self.authentification.getUserInfo(login: login, completionHandler: { (hasSucceed, error, user) in
                        if hasSucceed {
                            print("Get User Info is a success")
                            self.userInfo = user!
                            let controller = self.storyboard?.instantiateViewController(withIdentifier: "ProfilViewControllerID") as! ProfilViewController
                            controller.userInfo = self.userInfo
                            self.navigationController!.pushViewController(controller, animated: false)
                        } else {
                            print("Error (getUserInfo/buttonAction): \(error)")
                        }
                    })
                    
                } else {
                    print("Error (connectToAPI/buttonAction): \(error)")
                }
            })
        }
    }
}

