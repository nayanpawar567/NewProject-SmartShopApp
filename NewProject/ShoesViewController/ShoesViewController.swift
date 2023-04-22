//
//  ShoesViewController.swift
//  NewProject
//
//  Created by Nayan Pawar on 21/04/23.
//

import UIKit

class ShoesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var shoes:[BaseModel] = []
    
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
        return shoes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoesCell", for: indexPath) as? ShoesTableViewCell else {fatalError()}
         
        let imgUrl = URL(string: (shoes[indexPath.row].images?[0])!)
        cell.imgShoes.kf.setImage(with: imgUrl)
        cell.lblTitle.text = shoes[indexPath.row].title
        cell.lblName.text = shoes[indexPath.row].category?.name
        cell.lblPrice.text = "Rs : \(shoes[indexPath.row].price!)"
        
                return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let shoesData = shoes[indexPath.row]
        print(shoesData)
        performSegue(withIdentifier: "toShoesDetails", sender: shoesData )
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let destination =  segue.destination as? ShoesDetailPageVC{
           destination.shoes = (sender as! BaseModel)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }


}
