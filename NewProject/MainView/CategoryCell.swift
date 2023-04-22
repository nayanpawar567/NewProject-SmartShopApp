//
//  CategoryCell.swift
//  NewProject
//
//  Created by Nayan Pawar on 21/04/23.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var imgCategory: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgCategory.layer.cornerRadius = 15.0
        imgCategory.clipsToBounds = true
        imgCategory.layer.borderWidth = 1.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     
    }

}
