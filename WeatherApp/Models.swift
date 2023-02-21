//
//  Models.swift
//  WeatherApp
//
//  Created by Мира Зейнурова on 26.01.2023.
//

import Foundation

struct WeatherModel: Decodable{
    var hourly: Hours
    var current_weather: CurrentWeather
    var daily: [Daily]
}
struct Hours : Decodable {
    var time: [String]
    var temperature_2m : [Double]
}
struct CurrentWeather : Decodable {
    var time: String
    var temperature: Double
    var windspeed: Double?
    var winddirecton: Double?
    var weathercode: Int?
}
struct Daily : Decodable {
    var time: [String]
    var weathercode: [Int]
    var temperature_2m_max: [Double]
    var sunset: [String]
}
