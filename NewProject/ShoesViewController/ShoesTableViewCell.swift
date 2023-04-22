//
//  ShoesTableViewCell.swift
//  NewProject
//
//  Created by Nayan Pawar on 22/04/23.
//

import UIKit

class ShoesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgShoes: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgShoes.layer.cornerRadius = 20.0
        imgShoes.clipsToBounds = true
        imgShoes.layer.borderWidth = 1.0
    }



}
