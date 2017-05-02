//
//  SkillsTableViewCell.swift
//  Swifty_companion
//
//  Created by Thomas VISENTIN on 5/2/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import UIKit

class SkillsTableViewCell: UITableViewCell {

    @IBOutlet weak var skillNameLabel: UILabel!
    @IBOutlet weak var skillLevelLabel: UILabel!
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
