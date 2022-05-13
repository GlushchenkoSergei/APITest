//
//  NetworkManage.swift
//  APITest
//
//  Created by mac on 04.05.2022.
//

import Foundation
import UIKit
import Alamofire

class NetworkManage {
    static let shared = NetworkManage()
    
    
    func fetchDataDog(url: String, with completion: @escaping(Dog) -> Void ) {
        AF.request(url)
            .validate()
            .responseData { data in
                guard let dataJson = try? JSONSerialization.jsonObject(with: data.data ?? Data()) else { return }
                
                guard let dataForDog = dataJson as? [String: Any] else { return }
                
                guard let urlImage = URL(string: dataForDog["message"] as? String ?? "") else { return }
                guard let imageData = try? Data(contentsOf: urlImage) else { return }
                
                let dog = Dog(message: dataForDog["message"] as? String ?? "", imageData: imageData)
                
                DispatchQueue.main.async {
                    completion(dog)
                }
            }
    }
    
    private init() {}
}

