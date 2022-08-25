//
//  PhoneManager.swift
//  PhoneMall
//
//  Created by Семен Гайдамакин on 22.08.2022.
//

import Foundation
import UIKit

protocol PhoneManagerDelegate {
    func didUpdatePhone(_ phoneManager: PhoneManager, phone : PhoneModel)
    func didFailWithError(error: Error)
}

struct PhoneManager {
    
    var delegate: PhoneManagerDelegate? //свойство для делегирования по протоколу
    
//    let phoneURL = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
//    
//    //
//    func performRequest(with urlString : String) { // функция выполяющая запрос  через URLSession
//        // 1. Create a URL
//        
//        if let url = URL(string: urlString) {
//            
//            //2. Create a URLSession
//            let session = URLSession(configuration: .default)
//            
//            //3. Give the session a task
//            let task = session.dataTask(with: url) { data, response, error in
//                if error != nil {
//                    self.delegate?.didFailWithError(error: error!)
//                    print("error1")
//                    return
//                }
//                if let safeData = data {
//                    if let phone = parseJSON(phoneData: safeData) {
//                        self.delegate?.didUpdatePhone(self, phone: phone)
//                    }
//                }
//            }
//            //4. Start the task
//            task.resume()
//        }
//    }
    
//    func parseJSON(phoneData : Data) -> PhoneModel? {
//        let decoder = JSONDecoder() //It creates an instance of JSONDecoder, which is dedicated to converting between JSON and Codable objects.
//        do {
//            let decodedData = try decoder.decode(PhoneData.self, from: phoneData)
//                
//            
//            let picture = decodedData.bestSeller[0].picture
//
//            let title = decodedData.bestSeller[0].title
//            let noDiscountPrice = decodedData.bestSeller[0].priceWihoutDiscount
//            let withDiscountPrice = decodedData.bestSeller[0].priceWithDiscount
//            let isFav = decodedData.bestSeller[0].isFavorites
//            
//            let phone = PhoneModel(picture: picture, phoneName: title, priceNoDiscount: noDiscountPrice, priceWithDiscount: withDiscountPrice, isFavorites: isFav)
//            print(phone.phoneName)
//            return phone
//            
//        } catch {
//            delegate?.didFailWithError(error: error)
//            print("error")
//            return nil
//        }
//    }
}


