//
//  ClothsViewController.swift
//  NewProject
//
//  Created by Nayan Pawar on 21/04/23.
//

import UIKit
import Kingfisher

class ClothsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var clothes:[BaseModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(clothes)
        setUpUI()
    }
    
    func setUpUI(){
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clothes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "clothesCell", for: indexPath) as? ClothesTableViewCell else {fatalError()}
         
        let imgUrl = URL(string: (clothes[indexPath.row].images?[0])!)
        cell.imgClothes.kf.setImage(with: imgUrl)
        cell.lblTitle.text = clothes[indexPath.row].title
        cell.lblName.text = clothes[indexPath.row].category?.name
        cell.lblPrice.text = "Rs : \(clothes[indexPath.row].price!)"
        
                return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let clothesData = clothes[indexPath.row]
        print(clothesData)
        performSegue(withIdentifier: "toClothesDetails", sender: clothesData )
    }
    
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let destination =  segue.destination as? ClothesDetailPageVC{
           destination.clothes = (sender as! BaseModel)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}
