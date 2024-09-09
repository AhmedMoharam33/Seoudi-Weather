//
//  AppStateManager.swift
//  Seoudi Weather
//
//  Created by ahmed moharam on 30/08/2024.
//

import Foundation
import UIKit

protocol AppStateManagerProtocol {
    func start(appDelegate: AppDelegateProtocol)
    func switchState(to state: AppStateManager.AppState)
}

final class AppStateManager {
    // MARK: - Enum

    enum AppState {
        case none
        case location
        case loading
        case weather(LocationModel?)
    }

    // MARK: - Private Properties

    private var appDelegate: AppDelegateProtocol!
    private var transitionAnimationDuration: Float = 0.3

    // MARK: - Computed Propreties

    var mainWindow: UIWindow? {
        return appDelegate?.window
    }
    
    private var state: AppState = .none {
        didSet {
            switch self.state {
                case .none:
                    break
                case .location:
                    handleLocation()
                case .loading:
                    handleLoading()
                case let .weather(data):
                    handleWeather(data: data)
            }
        }
    }


    // MARK: - Singleton

    static let shared: AppStateManagerProtocol = AppStateManager()

    // MARK: - Methods

    private func handleLocation() {
        let vc = LocationsViewController(viewModel: LocationsViewModel())
        switchRootWithAnimation(toVC: vc)
    }

    private func handleLoading() {
        mainWindow?.rootViewController = LoadingViewController()
        mainWindow?.makeKeyAndVisible()
    }
    
    private func handleWeather(data: LocationModel?) {
        let vc = WeatherDetailsViewController(viewModel: WeatherDetailsViewModel(injectedData: data))
        switchRootWithAnimation(toVC: vc)
    }

    private func switchRootWithAnimation(toVC: UIViewController) {
        var options = UIWindow.TransitionOptions(direction: .toRight, style: .easeIn)
        options.background = UIWindow.TransitionOptions.Background.solidColor(.white)
        options.duration = TimeInterval(exactly: transitionAnimationDuration)!
        mainWindow?.setRootViewController(toVC, options: options)
    }
}

// MARK: - Protocol Conformance

extension AppStateManager: AppStateManagerProtocol {
    func start(appDelegate: AppDelegateProtocol) {
        self.appDelegate = appDelegate
        switchState(to: .loading)
    }

    func switchState(to state: AppState) {
        guard let _ = appDelegate?.window else {
            return
        }
        self.state = state
    }
}
