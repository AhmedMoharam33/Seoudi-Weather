//
//  WeatherDetailsViewModel.swift
//  Seoudi Weather
//
//  Created by ahmed moharam on 09/09/2024.
//

import Foundation
import Combine

protocol WeatherDetailsViewModelProtocol {
    var state: PassSubject<WeatherDetailsViewModel.PageState> { get }
    var cancellableBag: CancellableBag { get set }
    var data: ValueSubject<BaseModel?> { get }
    var injectedData: LocationModel { get }
    
    func loadAPI()
}

class WeatherDetailsViewModel: WeatherDetailsViewModelProtocol {
    
    // MARK: - Enums
    
    enum PageState {
        case loading(_ show: Bool)
        case showError(message: String)
    }
    
    // MARK: - Private Properties
    
    private(set) var data = ValueSubject<BaseModel?>(nil)
    private(set) var state = PassSubject<PageState>()
    private(set) var injectedData: LocationModel
    private let provider: HomeProviderProtocol
    
    // MARK: - Public Properties
    
    var cancellableBag = CancellableBag()
    
    // MARK: - Lazy Properties
    
    private lazy var requestCompletionHandler: (Subscribers.Completion<NSError>) -> Void = { [weak self] completion in
        guard let self else { return }
        
        state.send(.loading(false))
        switch completion {
            case .failure(let error):
                print(error)
                state.send(.showError(message: error.localizedDescription))
            case .finished:
                print("Finished")
        }
    }
    
    //MARK: - Init & dealloc methods
    
    init(provider: HomeProviderProtocol = HomeProvider(), injectedData: LocationModel?) {
        self.provider = provider
        self.injectedData = injectedData!
    }
    
    deinit {
        print("DeInit called: \(Self.self)")
    }
    
    //MARK: - Methods
    
    func loadAPI() {
        state.send(.loading(true))
        
        provider.getForecast(latitude: injectedData.lat, longitude: injectedData.long)
            .sink(receiveCompletion: requestCompletionHandler) { [weak self] response in
                guard let self else { return }
                
                data.send(response)
            }.store(in: &cancellableBag)
    }
}
