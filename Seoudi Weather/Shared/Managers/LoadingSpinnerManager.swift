//
//  LoadingSpinnerManager.swift
//  Seoudi Weather
//
//  Created by ahmed moharam on 09/09/2024.
//


import Foundation
import UIKit

protocol LoadingSpinnerProtocol {
    func show()
    func hide()
}

class LoadingSpinnerManager: LoadingSpinnerProtocol {
    //MARK: Properties
    
    private var loadingSpinner: UIActivityIndicatorView?
    private var containerView: UIView?
    private var isLoding: Bool = false
    private let screenBound = UIScreen.main.bounds
    
    //MARK: Singleton
    static let shared: LoadingSpinnerProtocol = LoadingSpinnerManager()
    
    private init() {}
    
    //MARK: Methods
    func show() {
        guard isLoding == false else {return}
        self.isLoding = true
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        loadingSpinner = UIActivityIndicatorView(style: .large)
        containerView = UIView(frame: window.bounds)
        guard let view = containerView else { return }
        guard let spinner = loadingSpinner else { return }
        
        let position = CGRect(x: screenBound.width / 2 - 50, y: screenBound.height / 2 - 50, width: 100, height: 100)
        
        view.frame = position
        view.backgroundColor = .lightGray
        view.alpha = 0.7
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        
        
        spinner.bounds = position
        spinner.center = view.center
        spinner.color = .blue
        view.addSubview(spinner)
        window.addSubview(view)
        spinner.startAnimating()
    }
    
    func hide() {
        loadingSpinner?.removeFromSuperview()
        containerView?.removeFromSuperview()
        loadingSpinner = nil
        containerView = nil
        isLoding = false
    }
}

