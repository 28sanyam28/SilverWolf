//
//  TimesheetCell.swift
//  silverwolf
//
//  Created by apple on 13/07/22.
//

import UIKit

class TimesheetCell: UITableViewCell {

    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblView: UIView!
    @IBOutlet var lblLowerView: UIView!
    @IBOutlet var mainlblsView: UIView!
    @IBOutlet var lblsView: UIView!
    @IBOutlet var lblCompany: UILabel!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblStart: UILabel!
    @IBOutlet var lblSWP: UILabel!
    @IBOutlet var shodowView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        mainlblsView.layer.cornerRadius = 5
        
        
        shodowView.layer.cornerRadius = 10
        shodowView.layer.shadowColor = UIColor.black.cgColor
        shodowView.layer.shadowOpacity = 0.2
        shodowView.layer.shadowOffset = CGSize.zero
        shodowView.layer.shadowRadius = 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
