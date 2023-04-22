//
//  ElectronicsTableViewCell.swift
//  NewProject
//
//  Created by Nayan Pawar on 22/04/23.
//

import UIKit

class ElectronicsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgElectronics: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgElectronics.layer.cornerRadius = 20.0
        imgElectronics.clipsToBounds = true
        imgElectronics.layer.borderWidth = 1.0
    }


}
