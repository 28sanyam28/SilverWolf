//
//  SchedualTableViewCell.swift
//  silverwolf
//
//  Created by apple on 29/07/22.
//

import UIKit

class SchedualTableViewCell: UITableViewCell {

    @IBOutlet var lblJobId: UILabel!
    @IBOutlet weak var lblTaskName: UILabel!
    
    @IBOutlet weak var lblProjectName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblEmployeeName: UILabel!
    
    @IBOutlet weak var lblScheduleStartEnd: UILabel!
    
    @IBOutlet weak var btnMapLocation: UIButton!
    
    
    @IBOutlet weak var lblCreatedAt: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
