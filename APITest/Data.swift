//
//  Data.swift
//  APITest
//
//  Created by mac on 04.05.2022.
//

import Foundation
// не понял как создать модель под данный json решил хардкодить
//https://dog.ceo/api/breeds/list/all

class DataGog {
    static let shared = DataGog()
    private init() {}
    let dog = ["affenpinscher", "african", "airedale", "akita" ,"appenzeller","australian","basenji","beagle","bluetick","borzoi","bouvier","boxer","brabancon","briard","buhund","bulldog","bullterrier","cattledog","chihuahua","chow","clumber","cockapoo","collie","coonhound","corgi","cotondetulear","dachshund","dalmatian","dane","deerhound","dhole","dingo","doberman","elkhound","entlebucher","eskimo","finnish","frise","germanshepherd","greyhound","groenendael","havanese","hound","husky","keeshond","kelpie","komondor","kuvasz","labradoodle","labrador","leonberg","lhasa","malamute","malinois","maltese","mastiff","mexicanhairless","mix","mountain","newfoundland","otterhound","ovcharka","papillon","pekinese","pembroke","pinscher","pitbull","pointer","pomeranian","poodle","pug","puggle","pyrenees","redbone","retriever","ridgeback","rottweiler","saluki","samoyed","schipperke","schnauzer","setter","sheepdog","shiba","shihtzu","spaniel","springer","stbernard","terrier","tervuren","vizsla","waterdog","weimaraner","whippet","wolfhound"]
}
