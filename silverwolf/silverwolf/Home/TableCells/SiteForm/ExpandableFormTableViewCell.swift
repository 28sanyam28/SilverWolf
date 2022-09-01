//
//  ExpandableFormTableViewCell.swift
//  silverwolf
//
//  Created by Mac on 14/04/22.
//

import UIKit

class ExpandableFormTableViewCell: UITableViewCell {

    @IBOutlet weak var containerStackview: UIStackView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bottomView: UIView!
//    {
//        didSet {
//            bottomView.isHidden = true
//        }
//    }
//    
//    var isExpanded:Bool = false
//        {
//        didSet
//        {
//            if !isExpanded {
//                self.viewHeightConstraint.constant = 45.0
//
//            } else {
//                self.viewHeightConstraint.constant = 560.0
//            }
//        }
//    }
//    
//    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
