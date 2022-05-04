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
    
    
    let url = "https://dog.ceo/api/breeds/image/random"
    
    
    func fetchDataDog(url: String, with completion: @escaping(Dog) -> Void ) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Ошибка без описание")
                return
            }
            
            guard let dog = try? JSONDecoder().decode(Dog.self, from: data) else { return }
            print(" Данные из NetworkManage - \(dog)")
            
            DispatchQueue.main.async {
                completion(dog)
            }
        }.resume()
        
    }
    private init() {}
}

