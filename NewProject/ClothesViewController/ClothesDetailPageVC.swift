//
//  DetailPageViewController.swift
//  NewProject
//
//  Created by Nayan Pawar on 20/04/23.
//

import UIKit

class ClothesDetailPageVC: UIViewController {

    var clothes:BaseModel?
    
    @IBOutlet weak var imgClothes: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
//        print(clothes)

        // Do any additional setup after loading the view.
    }
    
    func setData(){
        
        let imgUrl = URL(string: (clothes?.images?[0])!)
        imgClothes.kf.setImage(with: imgUrl)
        
        lblTitle.text = clothes?.title
        lblName.text = clothes?.category?.name
        if let price = clothes?.price{
            lblPrice.text = "Rs : \(price)"
        }
        lblDescription.text = clothes?.description
        
    }


}
