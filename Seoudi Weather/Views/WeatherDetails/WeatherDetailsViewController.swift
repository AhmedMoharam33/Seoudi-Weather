//
//  WeatherDetailsViewController.swift
//  Seoudi Weather
//
//  Created by ahmed moharam on 09/09/2024.
//

import UIKit

class WeatherDetailsViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var headerView: UIView!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var weatherIcon: UIImageView!
    @IBOutlet private weak var hourlyForecastLabel: UILabel!
    @IBOutlet private weak var hourlyCollectionView: UICollectionView!
    @IBOutlet private weak var backgroundView: UIImageView!
    @IBOutlet private weak var locationImage: UIImageView!
    @IBOutlet private weak var temperatureImage: UIImageView!
    
    // MARK: - Properties
    
    private lazy var collectionCoordinatorProvider = CollectionViewCoordinator()
    private var viewModel: WeatherDetailsViewModelProtocol
    private var loader: LoadingSpinnerProtocol
    private var temperatureCelsius: Bool = true
    
    // MARK: - Init
    
    init(viewModel: WeatherDetailsViewModelProtocol,
         loader: LoadingSpinnerProtocol = LoadingSpinnerManager.shared) {
        self.viewModel = viewModel
        self.loader = loader
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupObservers()
        viewModel.loadAPI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        setupHeaderView()
        setupBackgroundView()
        setupCityLabel()
        setupTemperatureLabel()
        setupWeatherIcon()
        setupHourlyForecastLabel()
        setupHourlyCollectionView()
        setupLocationImage()
        setupTemperatureImage()
    }
    
    private func setupHeaderView() {
        headerView
            .backgroundColor(.clear)
            .border(.white, width: 1.5)
            .corner(20)
    }
    
    private func setupBackgroundView() {
        backgroundView
            .contentMode(.scaleAspectFill)
    }
    
    private func setupCityLabel() {
        cityLabel
            .textAlignment(.center)
            .textColor(.white)
            .font(UIFont(name: AppFonts.regularHelvetica, size: 20))
    }
    
    private func setupTemperatureLabel() {
        temperatureLabel
            .textAlignment(.left)
            .textColor(.white)
            .font(UIFont(name: AppFonts.boldHelvetica, size: 65))
    }
    
    private func setupWeatherIcon() {
        weatherIcon.contentMode = .scaleAspectFit
    }
    
    private func setupHourlyForecastLabel() {
        hourlyForecastLabel
            .textAlignment(.center)
            .textColor(.white)
            .text("Daily Temperature")
            .font(UIFont(name: AppFonts.boldHelvetica, size: 15))
    }
    
    private func setupLocationImage() {
        locationImage
            .image(ImagesDesignSystem.images.location.image.withRenderingMode(.alwaysTemplate))
            .tintColor(.white)
    }
    
    private func setupTemperatureImage() {
        temperatureImage
            .image(ImagesDesignSystem.images.temperature.image.withRenderingMode(.alwaysTemplate))
            .tintColor(.white)
    }
    
    private func setupHourlyCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        
        hourlyCollectionView
            .backgroundColor(.clear)
            .showScrollIndicator(false)
            .register(nib: HourlyCollectionCell.self)
            .delegate(collectionCoordinatorProvider)
            .dataSource(collectionCoordinatorProvider)
            .collectionViewLayout = layout
        
        collectionCoordinatorProvider
            .numberOfItemsInSection { [weak self] _, _ in
                guard let self = self else { return 0 }
                return viewModel.data.value?.hourly?.filterUniqueTimes().time?.count ?? 0
            }
            .cellForItemAt { [weak self] _, indexPath in
                guard let self = self,
                      let cell = self.hourlyCollectionView.dequeueReusableCell(withReuseIdentifier: HourlyCollectionCell.identifier, for: indexPath) as? HourlyCollectionCell else {
                    return UICollectionViewCell()
                }
                
                let data = viewModel.data.value?.hourly?.filterUniqueTimes()
                cell.config(time: data?.time?[indexPath.row] ?? "",
                            icon: data?.weatherCode?[indexPath.row] ?? 0,
                            temp: self.convert(temperature: data?.temperature2M?[indexPath.row] ?? 0, to: self.temperatureCelsius ? .celsius : .fahrenheit))
                return cell
            }
            .minimumLineSpacingForSectionAt { _, _, _ in 10 }
            .minimumInteritemSpacingForSectionAt { _, _, _ in 10 }
    }
    
    private func convert(temperature: Double, to unit: TemperatureUnit) -> String {
        switch unit {
            case .celsius:
                return "\(temperature) °C"
            case .fahrenheit:
                return "\(Double(String(format: "%.2f", (temperature * 9 / 5) + 32)) ?? 0.0) °F"
        }
    }
    
    private func setCardDate(data: BaseModel?) {
        hourlyCollectionView.reloadData()
        cityLabel.text = viewModel.injectedData.name
        temperatureLabel.text = convert(temperature: data?.hourly?.getCurrentHourData().temperature2M ?? 0, to: temperatureCelsius ? .celsius : .fahrenheit)
        weatherIcon.image = WeatherCode(rawValue: data?.hourly?.getCurrentHourData().weatherCode ?? 0)?.iconImage()
        backgroundView.image = (data?.hourly?.getCurrentHourData().isAM ?? false) ? ImagesDesignSystem.images.loadingPagePlaceHolder.image : ImagesDesignSystem.images.night.image
    }
    
    private func setupObservers() {
        locationImage.tapGesture()
            .sink { _ in
                AppStateManager.shared.switchState(to: .location)
            }
            .store(in: &viewModel.cancellableBag)
        
        temperatureImage.tapGesture()
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.temperatureCelsius.toggle()
                self.setCardDate(data: self.viewModel.data.value)
            }
            .store(in: &viewModel.cancellableBag)
        
        viewModel.data
            .dropFirst()
            .sink { [weak self] data in
                self?.setCardDate(data: data)
            }
            .store(in: &viewModel.cancellableBag)
        
        viewModel.state
            .sink { [weak self] state in
                guard let self = self else { return }
                switch state {
                    case .loading(let show):
                        self.hourlyForecastLabel.isHidden = show
                        self.headerView.isHidden = show
                        self.hourlyCollectionView.isHidden = show
                        show ? self.loader.show() : self.loader.hide()
                    case .showError(let message):
                        print("Error message: \(message)")
                }
            }
            .store(in: &viewModel.cancellableBag)
    }
    
    // MARK: - Enums
    
    enum TemperatureUnit {
        case celsius
        case fahrenheit
    }
}

