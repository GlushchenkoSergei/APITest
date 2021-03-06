//
//  ViewController.swift
//  APITest
//
//  Created by mac on 03.05.2022.
//
import Spring
import UIKit


class MainController: UIViewController {


    @IBOutlet var imageDog: SpringImageView!
    
    @IBOutlet var nameBreed: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var pickerOfBreed: UIPickerView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
   private let url = "https://dog.ceo/api/breeds/image/random"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = DataDog.shared.dog[0]
        activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
    }
    
    
    @IBAction func tapButtonNextRandom(_ sender: Any) {
        activityIndicator.startAnimating()
        imageDog.animation = "fadeOut"
        imageDog.duration = 0.5
        imageDog.animate()
        
        setDataFormNetwork(from: url)
    }
    
    
    @IBAction func tapButtonNextOfBreed(_ sender: Any) {
        activityIndicator.startAnimating()
        imageDog.animation = "fadeOut"
        imageDog.duration = 0.5
        imageDog.animate()
        
        let urlForBreed = getURLFor(breed: textField.text ?? "")
        setDataFormNetwork(from: urlForBreed)
    }
    

    
    private func getURLFor(breed string: String) -> String {
        let leftPart = "https://dog.ceo/api/breed/"
        let rightPart = "/images/random"
        let stringURL = leftPart + string + rightPart
        return stringURL
    }
    
    
    
    private func setDataFormNetwork(from url: String) {
        NetworkManage.shared.fetchDataDog(url: url) { dog in
            guard let image = UIImage(data: dog.imageData) else { return }
            self.activityIndicator.stopAnimating()
            self.imageDog.image = image
            
            self.imageDog.animation = "fadeIn"
            self.imageDog.duration = 1
            self.imageDog.animate()
            
            self.nameBreed.text = (self.getNameBreed(from: dog.message)).firstCharOnly()
        }
    }
}
    
   extension MainController {
       private func getNameBreed(from string: String) -> String {
           let plug = "https://images.dog.ceo/breeds/"
           
           let strArrays = string.components(separatedBy: plug)
           guard let rightSideString = strArrays.last else { return "" }
           let stringsBetweenCharacter = rightSideString.components(separatedBy: "/")
           
           guard let name = stringsBetweenCharacter.first else { return ""}
           
           return name
       }
    }

extension MainController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        DataDog.shared.dog.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        DataDog.shared.dog[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = DataDog.shared.dog[row]
    }
}

