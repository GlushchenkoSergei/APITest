//
//  NetworkManage.swift
//  APITest
//
//  Created by mac on 04.05.2022.
//

import Foundation
import UIKit
    
// Заготовка NetworkManage но не рабочая

    func fetchDataDog() -> Dog {
        let url = "https://dog.ceo/api/breeds/image/random"
        var plug = Dog(message: "", status: "")
        
        guard let url2 = URL(string: url) else {
            
            return plug }
        
        URLSession.shared.dataTask(with: url2) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Ошибка без описание")
                return
            }
           
            guard let dog = try? JSONDecoder().decode(Dog.self, from: data) else { return }
            print(" Данные из NetworkManage - \(dog)")
            plug = dog
            
        }.resume()
        return plug
    }
    
    
    func fetchImage(from dog: Dog) -> UIImage {
        let plug = UIImage()
        
        guard let urlImage = URL(string: dog.message) else { return plug }
        guard let imageData = try? Data(contentsOf: urlImage) else { return plug }
        guard let image = UIImage(data: imageData) else { return plug }
        
        return image
    }
    


