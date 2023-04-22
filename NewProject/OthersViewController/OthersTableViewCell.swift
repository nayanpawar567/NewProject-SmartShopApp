//
//  OthersTableViewCell.swift
//  NewProject
//
//  Created by Nayan Pawar on 22/04/23.
//

import UIKit

class OthersTableViewCell: UITableViewCell {

    @IBOutlet weak var imgOthers: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgOthers.layer.cornerRadius = 20.0
        imgOthers.clipsToBounds = true
        imgOthers.layer.borderWidth = 1.0
    }

 

}
