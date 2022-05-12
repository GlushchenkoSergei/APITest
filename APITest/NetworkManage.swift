//
//  NetworkManage.swift
//  APITest
//
//  Created by mac on 04.05.2022.
//

import Foundation
import UIKit

class NetworkManage {
    static let shared = NetworkManage()
    
    
    func fetchDataDog(url: String, with completion: @escaping(Dog) -> Void ) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Ошибка без описания")
                return
            }
            
            guard let dataResponse = try? JSONSerialization.jsonObject(with: data, options: []) else { return }
            guard let dataForDog = dataResponse as? [String: Any] else { return }
          
//            В данном случае так же лучше обойтись без принудительного развертывания?
            guard let urlImage = URL(string: dataForDog["message"] as? String ?? "") else { return }
            guard let imageData = try? Data(contentsOf: urlImage) else { return }
            
            let dog = Dog(message: dataForDog["message"] as? String ?? "", imageData: imageData)
            
            DispatchQueue.main.async {
                completion(dog)
            }
        }.resume()
        
    }
    
    private init() {}
}

