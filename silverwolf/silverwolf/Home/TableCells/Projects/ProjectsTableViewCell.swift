//
//  ProjectsTableViewCell.swift
//  Silverwolf
//
//  Created by Mac on 04/04/22.
//

import UIKit

class ProjectsTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var btn: UIButton!
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btn.layer.cornerRadius = btn.frame.height/2
        backView.layer.cornerRadius = 15
        backView.layer.borderColor = UIColor(hexaString: "#EBEEF5").cgColor
        backView.layer.borderWidth = 1.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
