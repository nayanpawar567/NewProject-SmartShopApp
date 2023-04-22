//
//  NetworkManager.swift
//  NewProject
//
//  Created by Nayan Pawar on 20/04/23.
//

import Foundation
import Alamofire



class NetworkManager{
    static let shared = NetworkManager()
    private init (){}
    
    

            func getProductData(completionHandler: @escaping ([BaseModel]?, String?)-> Void){
                let url = "https://api.escuelajs.co/api/v1/products"
                
                AF.request(url).response {
                    response in
                    switch response.result{
                    case .success(let data):
                        guard let data else { return}
                        do{
                            let decodedData = try JSONDecoder().decode([BaseModel].self, from: data)
                            print(decodedData)
                            print("decodedData from json")
                            completionHandler(decodedData, nil)
                        }catch{
//                            completionHandler(nil, error.localizedDescription)
                            print(#function, " error decoding\(error.localizedDescription)")
                        }
                    case .failure(let error):
                        completionHandler(nil, error.localizedDescription)
                    }
                    
                }
                
            }
        }
    
