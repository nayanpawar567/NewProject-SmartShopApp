//
//  ShoesDetailPageVC.swift
//  NewProject
//
//  Created by Nayan Pawar on 22/04/23.
//

import UIKit

class ShoesDetailPageVC: UIViewController {

    var shoes:BaseModel?
    
    @IBOutlet weak var imgShoe: UIImageView!
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
        
        let imgUrl = URL(string: (shoes?.images?[0])!)
        imgShoe.kf.setImage(with: imgUrl)
        
        lblTitle.text = shoes?.title
        lblName.text = shoes?.category?.name
        if let price = shoes?.price{
            lblPrice.text = "Rs : \(price)"
        }
        lblDescription.text = shoes?.description
        
    }


}
