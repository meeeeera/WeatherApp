//
//  WeatherCode.swift
//  WeatherApp
//
//  Created by Мира Зейнурова on 27.01.2023.
//

import Foundation
import UIKit

class UIGenerateCode {
    func weatherImage(code: Int) -> UIView {
        let image: UIImageView = {
            let image = UIImageView()
            return image
        }()
        
        if code == 0 {
            image.image = UIImage(named: "sunny")
        } else if code == 1 || code == 2 || code == 3 {
            image.image = UIImage(named: "cloudy")
        } else if code == 51 || code == 53 || code == 55 || code == 56 || code == 57 {
            image.image = UIImage(named: "drizzle")
        } else if code == 61 || code == 63 || code == 65 || code == 66 || code == 67 {
            image.image = UIImage(named: "rain")
        } else if code == 71 || code == 73 || code == 75 || code == 77 || code == 85 || code == 86 {
            image.image = UIImage(named: "snow")
        } else if code == 95 || code == 96 || code == 99  {
            image.image = UIImage(named: "thunderstorm")
        }
        
        return image
    }
}
