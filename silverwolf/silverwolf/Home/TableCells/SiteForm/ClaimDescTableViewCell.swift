//
//  ClaimDescTableViewCell.swift
//  silverwolf
//
//  Created by Mac on 14/04/22.
//

import UIKit

class ClaimDescTableViewCell: UITableViewCell {

    @IBOutlet weak var containerStackview: UIStackView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var backview: UIView!
    
    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bottomView: UIView!//{
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
//                self.viewHeightConstraint.constant = 217.0
//            }
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backview.layer.cornerRadius = 10
        backview.layer.borderColor = UIColor.lightGray.cgColor
        backview.layer.borderWidth = 1
        textview.layer.cornerRadius = 10
        textview.layer.borderColor = UIColor.lightGray.cgColor
        textview.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
