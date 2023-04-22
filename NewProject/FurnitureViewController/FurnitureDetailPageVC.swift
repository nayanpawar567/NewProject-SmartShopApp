//
//  FurnitureDetailPageVC.swift
//  NewProject
//
//  Created by Nayan Pawar on 22/04/23.
//

import UIKit

class FurnitureDetailPageVC: UIViewController {

    var furniture:BaseModel?
    
    @IBOutlet weak var imgFurniture: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        // Do any additional setup after loading the view.
    }
    
    func setData(){
        
        let imgUrl = URL(string: (furniture?.images?[0])!)
        imgFurniture.kf.setImage(with: imgUrl)
        
        lblTitle.text = furniture?.title
        lblName.text = furniture?.category?.name
        if let price = furniture?.price{
            lblPrice.text = "Rs : \(price)"
        }
        lblDescription.text = furniture?.description
        
    }



}
