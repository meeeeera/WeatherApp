//
//  TableViewCell.swift
//  WeatherApp
//
//  Created by Мира Зейнурова on 01.02.2023.
//

import UIKit

class WeatherCell: UITableViewCell {
    
//    let text: UILabel = {
//        let label = UILabel()
//        label.text = "molodec"
//        label.font = .systemFont(ofSize: 20, weight: .semibold)
//        label.textColor = .black
//        return label
//    }()
    
    let timeLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    let weathercodeLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    let temperatureLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    let sunsetLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
 
    
    func configure(daily: Daily) {
        timeLabel.text = "\(daily.time)"
        weathercodeLabel.text = "\(daily.weathercode)"
        temperatureLabel.text = "\(daily.temperature_2m_max)"
        sunsetLabel.text = "\(daily.sunset)"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.leading.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(80)
        }
        
        self.addSubview(weathercodeLabel)
        weathercodeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(timeLabel.snp_trailingMargin).offset(15)
            make.height.equalTo(40)
            make.width.equalTo(80)
        }
        
        self.addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(weathercodeLabel.snp_trailingMargin).offset(15)
            make.height.equalTo(40)
            make.width.equalTo(80)
        }
        
        self.addSubview(sunsetLabel)
        sunsetLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(temperatureLabel.snp_trailingMargin).offset(15)
            make.height.equalTo(40)
            make.width.equalTo(80)
        }
        
       
        // Configure the view for the selected state
    }

}
