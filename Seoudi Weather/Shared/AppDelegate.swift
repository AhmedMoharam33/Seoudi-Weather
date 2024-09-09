//
//  AppDelegate.swift
//  Seoudi Weather
//
//  Created by ahmed moharam on 30/08/2024.
//

import UIKit
import CoreData

protocol AppDelegateProtocol: AnyObject {
    var window: UIWindow? { get set }
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate, AppDelegateProtocol {

    // MARK: - Propreties
    
    var window: UIWindow?

    // MARK: - Life Cycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        setupAppAppearanceStyle()
        startNetworkMonitoring()
        setupAppStateManager()
        
        return true
    }
    
    //MARK: - Methods
    
    private func setupAppAppearanceStyle() {
        window?.overrideUserInterfaceStyle = .light
    }
    
    private func startNetworkMonitoring() {
        BaseReachability.shared.startNetworkMonitoring()
    }
    
    private func setupAppStateManager() {
        AppStateManager.shared.start(appDelegate: self)
    }
}

