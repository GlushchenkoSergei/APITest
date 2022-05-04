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
        setDataFormNetwork()
    }
    private func setDataFormNetwork() {
        NetworkManage.shared.fetchDataDog(url: url) { dog in
            guard let image = UIImage(data: dog.imageData) else { return }
            self.imageDog.image = image
            self.nameBreed.text = (self.getNameBreed(from: dog.message)).firstCharOnly()
        }
    }
}
    
   extension ViewController {
       private func getNameBreed(from string: String) -> String {
           let plug = "https://images.dog.ceo/breeds/"
           
           let strArrays = string.components(separatedBy: plug)
           guard let rightSideString = strArrays.last else { return "" }
           let stringsBetweenCharacter = rightSideString.components(separatedBy: "/")
           
           guard let name = stringsBetweenCharacter.first else { return ""}
           
           return name
       }
    }


