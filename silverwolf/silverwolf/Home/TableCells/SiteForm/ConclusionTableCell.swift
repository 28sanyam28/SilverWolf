//
//  ConclusionTableCell.swift
//  silverwolf
//
//  Created by Mac on 20/04/22.
//

import UIKit

class ConclusionTableCell: UITableViewCell {

    @IBOutlet var backview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        backview.layer.cornerRadius = 10
        backview.layer.borderColor = UIColor.lightGray.cgColor
        backview.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
