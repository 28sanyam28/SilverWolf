//
//  AttachmentsCollectionViewCell.swift
//  silverwolf
//
//  Created by apple on 16/06/22.
//

import UIKit

class AttachmentsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var FolderImage: UIImageView!
    @IBOutlet weak var FolderName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func optionTapped(_ sender: Any) {
        //Tapping on the button for the options
    }
}
