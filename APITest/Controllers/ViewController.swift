//
//  ViewController.swift
//  APITest
//
//  Created by mac on 03.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageDog: UIImageView!
    @IBOutlet var nameBreed: UILabel!
    
    let url = "https://dog.ceo/api/breeds/image/random"
 
    @IBAction func TapButtonNextImage(_ sender: Any) {
        fetchImage()
        
//        Тест парсинга JSON из NetworkManage (неудачный)
        DispatchQueue.global().async {
            let data = fetchDataDog()
            
            DispatchQueue.main.async {
                print("\(data)")
            }
        }
    }
    
    
   private func fetchImage() {
        
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Ошибка без описания")
                return
            }
            
            guard let dog = try? JSONDecoder().decode(Dog.self, from: data) else { return }
            guard let image = UIImage(data: dog.dataForImage) else { return }
            
            DispatchQueue.main.async {
                self.imageDog.image = image
               
                self.nameBreed.text = (self.getNameBreed(from: dog.message)).firstCharOnly()
            }
        }.resume()
        
    }
    
    private func getNameBreed(from string: String) -> String {
        let plug = "https://images.dog.ceo/breeds/"
        
        let strArrays = string.components(separatedBy: plug)
        guard let rightSideString = strArrays.last else { return "" }
        let stringsBetweenCharacter = rightSideString.components(separatedBy: "/")
        
        guard let name = stringsBetweenCharacter.first else { return "Не преобразовал ссылку в нужную строку" }
       
        return name
    }
}

