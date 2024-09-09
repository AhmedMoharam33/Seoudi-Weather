//
// Seoudi Weather
//
// Created by ahmed moharam.

import Alamofire
import Foundation

// MARK: - NetworkConnection Protocol


public protocol NetworkConnectionListenerProtocol: AnyObject {
    func goOnLine()
    func goOffLine()
}

public protocol NetworkConnectionProtocol: AnyObject {
    var delegate: NetworkConnectionListenerProtocol? { get set }
    
    func startNetworkMonitoring()
    func stopListening()
}

public class BaseReachability: NetworkConnectionProtocol {
    // MARK: - Singleton Pattern

    public static let shared: NetworkConnectionProtocol = BaseReachability()
    public weak var delegate: NetworkConnectionListenerProtocol?

    // MARK: - Properties

    let reachabilityManager = NetworkReachabilityManager(host: "www.google.com")
    var reachabilityState: Bool = NetworkReachabilityManager()?
        .isReachable ?? false

    // MARK: - Public Methods

    public func startNetworkMonitoring() {
        reachabilityManager?.startListening { [weak self] status in
            guard let self = self else { return }

            switch status {
            case .notReachable:
                self.showOffline()

            case .reachable(.cellular), .reachable(.ethernetOrWiFi):
                self.showOnline()

            case .unknown:
                print("Unknown network state")
            }
        }
    }

    public func stopListening() {
        reachabilityManager?.stopListening()
    }

    // MARK: - Private Methods

    private func showOffline() {
        reachabilityState = false
        delegate?.goOffLine()
    }

    private func showOnline() {
        guard !reachabilityState else {
            return
        }
        reachabilityState = true
        delegate?.goOnLine()
        
    }
}
