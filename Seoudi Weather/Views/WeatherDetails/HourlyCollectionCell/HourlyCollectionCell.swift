//
//  HourlyCollectionCell.swift
//  Seoudi Weather
//
//  Created by ahmed moharam on 09/09/2024.
//

import UIKit

class HourlyCollectionCell: UICollectionViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak private var hourLabel: UILabel!
    @IBOutlet weak private var stackView: UIStackView!
    @IBOutlet weak private var temperatureLabel: UILabel!
    @IBOutlet weak private var iconImageView: UIImageView!
    
    //MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    //MARK: - config
    
    func config(time: String?, icon: Int, temp: String?) {
        hourLabel.text = time
        iconImageView.image = WeatherCode(rawValue: icon)?.iconImage()
        temperatureLabel.text = temp
    }
    
    //MARK: - Methods
    
    private func setup() {
        setupUI()
    }
    
    private func setupUI() {
        setupTemperatureLabel()
        setupIconImageView()
        setupSelf()
        setupHourLabel()
    }
    
    private func setupHourLabel() {
        temperatureLabel
            .textColor(.white)
            .textAlignment(.center)
            .font(UIFont(name: AppFonts.boldHelvetica, size: 15))
    }
    
    private func setupTemperatureLabel() {
        iconImageView
            .contentMode(.scaleAspectFit)
    }
    
    private func setupIconImageView() {
        hourLabel
            .textColor(.white)
            .textAlignment(.center)
            .font(UIFont(name: AppFonts.regularHelvetica, size: 12))
    }
    
    private func setupSelf() {
        self.border(.white, width: 1)
        self.corner(20)
    }
}
