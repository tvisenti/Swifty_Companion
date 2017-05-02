//
//  ProjectsTableViewCell.swift
//  Swifty_companion
//
//  Created by Thomas VISENTIN on 5/2/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import UIKit

class ProjectsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var projectImageView: UIImageView!
    @IBOutlet weak var projectLevelLabel: UILabel!
    @IBOutlet weak var projectStatutLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
