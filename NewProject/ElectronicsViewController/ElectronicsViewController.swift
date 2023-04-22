//
//  ElectronicsViewController.swift
//  NewProject
//
//  Created by Nayan Pawar on 21/04/23.
//

import UIKit

class ElectronicsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var electronics:[BaseModel] = []
    
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
        return electronics.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "electronicsCell", for: indexPath) as? ElectronicsTableViewCell else {fatalError()}
         
        let imgUrl = URL(string: (electronics[indexPath.row].images?[0])!)
        cell.imgElectronics.kf.setImage(with: imgUrl)
        cell.lblTitle.text = electronics[indexPath.row].title
        cell.lblName.text = electronics[indexPath.row].category?.name
        cell.lblPrice.text = "Rs : \(electronics[indexPath.row].price!)"
        
                return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let electronicsData = electronics[indexPath.row]
        print(electronicsData)
        performSegue(withIdentifier: "toElectronicsDetails", sender: electronicsData )
    }
    
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let destination =  segue.destination as? ElectronicsDetailPageVC{
           destination.electronics = (sender as! BaseModel)
        }
    
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }

}
