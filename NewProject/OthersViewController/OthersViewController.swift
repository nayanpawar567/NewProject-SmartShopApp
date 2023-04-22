//
//  OthersViewController.swift
//  NewProject
//
//  Created by Nayan Pawar on 21/04/23.
//

import UIKit

class OthersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var others:[BaseModel] = []
    
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
        return others.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "othersCell", for: indexPath) as? OthersTableViewCell else {fatalError()}
         
        let imgUrl = URL(string: (others[indexPath.row].images?[0])!)
        cell.imgOthers.kf.setImage(with: imgUrl)
        cell.lblTitle.text = others[indexPath.row].title
        cell.lblName.text = others[indexPath.row].category?.name
        cell.lblPrice.text = "Rs : \(others[indexPath.row].price!)"
        
                return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let othersData = others[indexPath.row]
        print(othersData)
        performSegue(withIdentifier: "toOtherDetails", sender: othersData )
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let destination =  segue.destination as? OthersDetailPageVC{
           destination.others = (sender as! BaseModel)
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }


}
