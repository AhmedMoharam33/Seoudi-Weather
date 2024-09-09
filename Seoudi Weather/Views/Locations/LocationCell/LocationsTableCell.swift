//
//  LocationsTableCell.swift
//  Seoudi Weather
//
//  Created by ahmed moharam on 09/09/2024.
//

import UIKit

class LocationsTableCell: UITableViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet private weak var bannerImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    //MARK: - Propreties
    
    //MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func config(data: LocationModel?) {
        guard let data else { return }
        
        bannerImage.image(data.image)
        titleLabel.text(data.name)
    }
    
    //MARK: - Methods
    
    private func setup() {
        setupUI()
    }
    
    private func setupUI() {
        setupBannerImage()
        setupTitleLabel()
        setupSelf()
    }
    
    private func setupSelf() {
        selectionStyle = .none
        self.backgroundColor(.clear)
    }
    
    private func setupBannerImage() {
        bannerImage
            .contentMode(.scaleAspectFill)
            .border(.white, width: 2.5)
            .corner(12)
            .alpha = 0.6
    }
    
    private func setupTitleLabel() {
        titleLabel
            .textColor(.white)
            .font(UIFont(name: AppFonts.boldHelvetica, size: 24))
    }
    
}
