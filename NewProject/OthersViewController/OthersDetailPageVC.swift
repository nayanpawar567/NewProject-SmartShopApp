//
//  OthersDetailPageVC.swift
//  NewProject
//
//  Created by Nayan Pawar on 22/04/23.
//

import UIKit

class OthersDetailPageVC: UIViewController {

    var others:BaseModel?
    
    @IBOutlet weak var imgOthers: UIImageView!
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
        
        let imgUrl = URL(string: (others?.images?[0])!)
        imgOthers.kf.setImage(with: imgUrl)
        
        lblTitle.text = others?.title
        lblName.text = others?.category?.name
        if let price = others?.price{
            lblPrice.text = "Rs : \(price)"
        }
        lblDescription.text = others?.description
        
    }


    

}
