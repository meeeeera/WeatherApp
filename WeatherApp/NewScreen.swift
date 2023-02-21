//
//  NewScreen.swift
//  WeatherApp
//
//  Created by Мира Зейнурова on 01.02.2023.
//

import UIKit

class NewScreen: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let urlStr = "https://api.open-meteo.com/v1/forecast?latitude=51.12&longitude=71.43&hourly=temperature_2m&daily=weathercode,temperature_2m_max,sunset&current_weather=true&timezone=auto&start_date=2023-01-24&end_date=2023-01-26"
    let requests = API_Requests()
    var daily = [Daily]()
//    Daily(time: ["fsv"], weathercode: [5], temperature_2m_max: [5,5], sunset: ["5"])
    
    
    var table: UITableView = {
        var table = UITableView()
        table.separatorColor = .black
        return table
    }()
    
    let returnButton: UIButton = {
        let button = UIButton()
        button.setTitle("Return to Main", for: .normal)
        button.layer.cornerRadius = 11
        button.backgroundColor = .mylightblue
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    //back to main ViewController
    @objc func cancel() {
        dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .barblue
        
        requests.getData(urlStr) { apiData in
            self.daily = apiData.daily
            print(self.daily)
            self.table.reloadData()
        }
        
        table.dataSource = self
        table.delegate = self
        table.register(WeatherCell.self, forCellReuseIdentifier: "myCell")
        
      
        view.addSubview(table)
        table.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(350)
            make.height.equalTo(600)
                
        view.addSubview(returnButton)
            returnButton.isUserInteractionEnabled = true
            returnButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cancel)))
            returnButton.snp.makeConstraints { make in
                make.height.equalTo(30)
                make.width.equalTo(130)
                make.top.equalToSuperview().offset(760)
                make.leading.equalToSuperview().offset(140)
            }
            
        }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(daily[indexPath.row])
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          daily.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          guard let cell = table.dequeueReusableCell(withIdentifier: "myCell") as? WeatherCell else
          { return UITableViewCell() }
          cell.configure(daily: daily[indexPath.row])
          return cell
      }
    
}
