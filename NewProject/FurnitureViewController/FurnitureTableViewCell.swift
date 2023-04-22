//
//  FurnitureTableViewCell.swift
//  NewProject
//
//  Created by Nayan Pawar on 22/04/23.
//

import UIKit

class FurnitureTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgFurniture: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgFurniture.layer.cornerRadius = 20.0
        imgFurniture.clipsToBounds = true
        imgFurniture.layer.borderWidth = 1.0
    }

 

}
