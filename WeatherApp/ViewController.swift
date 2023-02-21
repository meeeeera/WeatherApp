//
//  ViewController.swift
//  WeatherApp
//
//  Created by Мира Зейнурова on 26.01.2023.
//

import UIKit
import Alamofire
import SnapKit


class ViewController: UIViewController {
    let request = API_Requests()
    let searchController = UISearchController(searchResultsController: nil)
    
    let windRectangle = UIGenerate1().createRectangleWind()
    var weatherCode = UIGenerateCode().weatherImage(code: 0)

   
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 50)
      return label
    }()

    let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Astana"
        label.font = .boldSystemFont(ofSize: 50)
        return label
    }()

    let cityvectorImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "vector")
        return image
        }()
    
    let secondScreenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next page", for: .normal)
        button.layer.cornerRadius = 11
        button.backgroundColor = .barblue
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    @objc func buttonDidTouch () {
        let vc = NewScreen()
        vc.modalPresentationStyle = .fullScreen
        NewScreen().modalPresentationStyle = .fullScreen
        navigationController?.present(vc, animated: true)
        navigationController?.pushViewController(NewScreen(), animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .mylightblue
        
        //creating SearchBar
        navigationController?.isNavigationBarHidden = false
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.hidesBarsOnTap = true
        searchController.searchBar.placeholder = "Search Location"
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.obscuresBackgroundDuringPresentation = false
        
        func setMainView() {
        view.addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(122)
            make.top.equalToSuperview().offset(370)
            make.height.equalTo(50)
            make.width.equalTo(180)
        }
        
        view.addSubview(cityvectorImage)
        cityvectorImage.snp.makeConstraints { make in
            make.leading.equalTo(cityLabel).offset(163)
            make.top.equalToSuperview().offset(380)
            make.height.equalTo(26)
            make.width.equalTo(26)
        }
        
        view.addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(135)
            make.top.equalToSuperview().offset(420)
            make.height.equalTo(70)
            make.width.equalTo(150)
        }
        
        view.addSubview(windRectangle)
        windRectangle.snp.makeConstraints { make in
            make.height.equalTo(220)
            make.width.equalTo(350)
            make.top.equalTo(550)
            make.left.equalTo(27)
        }
        
        view.addSubview(weatherCode)
        weatherCode.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.width.equalTo(200)
            make.top.equalTo(170)
            make.left.equalTo(105)
        }
            
        view.addSubview(secondScreenButton)
        secondScreenButton.isUserInteractionEnabled = true
        secondScreenButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(buttonDidTouch)))
        secondScreenButton.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(120)
            make.top.equalToSuperview().offset(750)
            make.leading.equalToSuperview().offset(140)
        }
    }
        
        
        setMainView()
        request.getData("https://api.open-meteo.com/v1/forecast?latitude=51.12&longitude=71.43&hourly=temperature_2m&daily=weathercode,temperature_2m_max,sunset&current_weather=true&timezone=auto&start_date=2023-01-24&end_date=2023-01-26") { apiData in
                   self.temperatureLabel.text = String(apiData.current_weather.temperature) + "°"
                   self.weatherCode = UIGenerateCode().weatherImage(code: apiData.current_weather.weathercode!)
                   print(apiData)
               }
    }
}

extension ViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
            print(text)
        
        if(!text.isEmpty){
            print("Search for location:")
            }
        }
    }

