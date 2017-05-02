//
//  SkillsTableViewController.swift
//  Swifty_companion
//
//  Created by Thomas VISENTIN on 5/2/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import Foundation
import UIKit

class SkillsTableViewController : UITableViewController {
    
    @IBOutlet weak var itemTabBar: UITabBarItem!
    var userInfo = UserInfo()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfo.skills.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let skills = userInfo.skills
        let cell = tableView.dequeueReusableCell(withIdentifier: "SkillsCell") as! SkillsTableViewCell
        cell.skillNameLabel.text = skills[indexPath.row].name
        if let level = skills[indexPath.row].level {
            cell.skillLevelLabel.text = String(level)
        }
        cell.progressBar.setProgress((skills[indexPath.row].level! / 20), animated: true)
        return cell
    }
}
