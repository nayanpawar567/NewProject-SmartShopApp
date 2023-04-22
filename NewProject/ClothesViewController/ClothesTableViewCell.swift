//
//  ClothesTableViewCell.swift
//  NewProject
//
//  Created by Nayan Pawar on 21/04/23.
//

import UIKit

class ClothesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgClothes: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgClothes.layer.cornerRadius = 20.0
        imgClothes.clipsToBounds = true
        imgClothes.layer.borderWidth = 1.0
    }



}
