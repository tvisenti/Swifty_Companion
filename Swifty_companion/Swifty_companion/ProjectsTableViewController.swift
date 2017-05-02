//
//  ProjectsTableViewController.swift
//  Swifty_companion
//
//  Created by Thomas VISENTIN on 5/2/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import Foundation
import UIKit

class ProjectsTableViewController : UITableViewController {
    
    @IBOutlet weak var itemTabBar: UITabBarItem!
    var userInfo = UserInfo()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfo.projects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let projects = userInfo.projects
        print(projects)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectsCell") as! ProjectsTableViewCell
        if projects[indexPath.row].succeed == true {
            cell.projectImageView?.image = UIImage(named: "success")
        } else {
            cell.projectImageView?.image = UIImage(named: "error")
        }
        cell.projectNameLabel?.text = projects[indexPath.row].name
        if let level = projects[indexPath.row].mark {
            cell.projectLevelLabel?.text = String(level)
        }
        cell.projectStatutLabel.text = projects[indexPath.row].status
        cell.progressBar.setProgress((Float(projects[indexPath.row].mark!) / 100), animated: true)
        return cell
    }
}
