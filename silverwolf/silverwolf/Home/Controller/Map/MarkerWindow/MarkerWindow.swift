//
//  MarkerWindow.swift
//  silverwolf
//
//  Created by apple on 25/06/22.
//

import UIKit

class MarkerWindow: UIView {

    @IBOutlet var backView: UIView!
    @IBOutlet var PostalCode: UILabel!
    @IBOutlet var SiteName: UILabel!
    @IBOutlet var Address: UILabel!
    var navigateClciked: (() -> ())?
    
    @IBOutlet var btnNavigation: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 10
    }

//    @IBAction func btnToNavigateClciked(_ sender: Any) {
//        navigateClciked!()
//    }
    
}
