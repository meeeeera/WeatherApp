//
//  API_Request.swift
//  WeatherApp
//
//  Created by Мира Зейнурова on 26.01.2023.
//

import Foundation
import Alamofire

class API_Requests {
    
    func getData(_ urlStr: String,  handler: @escaping (_ apiData: WeatherModel) -> ()) {
        let url = URL(string: urlStr)!
        AF.request(url).response { resoponse in
            switch resoponse.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(WeatherModel.self, from: data!)
                    //                    print(jsonData)
                    handler(jsonData)
                    
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
