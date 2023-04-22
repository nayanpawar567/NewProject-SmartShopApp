//
//  ElectronicsDetailPageVC.swift
//  NewProject
//
//  Created by Nayan Pawar on 22/04/23.
//

import UIKit

class ElectronicsDetailPageVC: UIViewController {

    
    var electronics:BaseModel?
    
    @IBOutlet weak var imgElectronics: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
//        imgElectronics.layer.cornerRadius = 20.0
//        imgElectronics.clipsToBounds = true
//        imgElectronics.layer.borderWidth = 1.0
        // Do any additional setup after loading the view.
    }
    
    func setData(){
        
        let imgUrl = URL(string: (electronics?.images?[0])!)
        imgElectronics.kf.setImage(with: imgUrl)
        
        lblTitle.text = electronics?.title
        lblName.text = electronics?.category?.name
        if let price = electronics?.price{
            lblPrice.text = "Rs : \(price)"
        }
        lblDescription.text = electronics?.description
        
    }


}
