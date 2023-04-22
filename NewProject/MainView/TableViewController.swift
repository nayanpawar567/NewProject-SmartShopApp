//
//  TableViewController.swift
//  NewProject
//
//  Created by Nayan Pawar on 21/04/23.
//

import UIKit

class TableViewController: UITableViewController {

    var clothes : [BaseModel] = []
    var electronics : [BaseModel] = []
    var furniture : [BaseModel] = []
    var shoes : [BaseModel] = []
    var others : [BaseModel] = []
    
    var data = [BaseModel]()
    
    let catList = ["Clothes","Electronics","Furniture", "Shoes", "Others"]
    let images = [UIImage(named: "clothes"),
                  UIImage(named: "electronics"),
                  UIImage(named: "furniture"),
                  UIImage(named: "shoes"),
                  UIImage(named: "others")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getData()
    }
    
    
    func getData() {
        // show loader
        NetworkManager.shared.getProductData { data, error in
            
            // Decoded data is called from completion handler
//            print(data)
            print("data is passed from completion handler")
            //            print(error)
            
            guard let data else{return}
            
            // Append the data to empty array

            self.data.append(contentsOf: data)
            print("data is appended to empty array")
            
            // Sort data according to category
            let temp1 = self.data.filter { $0.category?.id == 1 }
            self.clothes = temp1
            
            let temp2 = self.data.filter { $0.category?.id == 2 }
            self.electronics = temp2
            
            let temp3 = self.data.filter { $0.category?.id == 3 }
            self.furniture = temp3
            
            let temp4 = self.data.filter { $0.category?.id == 4 }
            self.shoes = temp4
            
            let temp5 = self.data.filter { $0.category?.id == 5 }
            self.others = temp5
            
            
            // dissmiss loader
            DispatchQueue.main.async {
                self.tableView.reloadData()
                print("data is reloaded to collectionView")
            }
            
        }
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return catList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryCell else { fatalError("Unable to create categoryCell")}
        cell.imgCategory.image = images[indexPath.row]
        cell.lblCategory.text = catList[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "toClothes", sender: self)
        }
        if indexPath.row == 1 {
            performSegue(withIdentifier: "toElectronics", sender: self)
        }
        if indexPath.row == 2 {
            performSegue(withIdentifier: "toFurniture", sender: self)
        }
        if indexPath.row == 3 {
            performSegue(withIdentifier: "toShoes", sender: self)
        }
        if indexPath.row == 4 {
            performSegue(withIdentifier: "toOthers", sender: self)
        }
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toClothes":
            if let destination = segue.destination as? ClothsViewController {
                destination.clothes = self.clothes
            }
        case "toElectronics":
            if let destination = segue.destination as? ElectronicsViewController {
                destination.electronics = self.electronics
            }
        case "toFurniture":
            if let destination = segue.destination as? FurnitureViewController {
                destination.furniture = self.furniture
            }
        case "toShoes":
            if let destination = segue.destination as? ShoesViewController {
                destination.shoes = self.shoes
            }
        case "toOthers":
            if let destination = segue.destination as? OthersViewController {
                destination.others = self.others
            }
        default:
            break
        }
    }

}
