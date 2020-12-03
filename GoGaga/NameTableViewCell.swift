//
//  NameTableViewCell.swift
//  GoGaga
//
//  Created by Kavya Sri on 24/11/20.
//

import UIKit

class NameTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
