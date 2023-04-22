//
//  FurnitureViewController.swift
//  NewProject
//
//  Created by Nayan Pawar on 21/04/23.
//

import UIKit

class FurnitureViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var furniture:[BaseModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        // Do any additional setup after loading the view.
    }
    
    func setUpUI(){
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return furniture.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "furnitureCell", for: indexPath) as? FurnitureTableViewCell else {fatalError()}
         
        let imgUrl = URL(string: (furniture[indexPath.row].images?[0])!)
        cell.imgFurniture.kf.setImage(with: imgUrl)
        cell.lblTitle.text = furniture[indexPath.row].title
        cell.lblName.text = furniture[indexPath.row].category?.name
        cell.lblPrice.text = "Rs : \(furniture[indexPath.row].price!)"
        
                return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let furnitureData = furniture[indexPath.row]
        print(furnitureData)
        performSegue(withIdentifier: "toFurnitureDetails", sender: furnitureData )
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let destination =  segue.destination as? FurnitureDetailPageVC{
           destination.furniture = (sender as! BaseModel)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }



}
