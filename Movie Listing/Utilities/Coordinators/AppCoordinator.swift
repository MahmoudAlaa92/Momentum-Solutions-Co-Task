//
//  AppCoordinator.swift
//  Herfety
//
//  Created by Mahmoud Alaa on 01/07/2025.
//

import UIKit

protocol AppTransitionDelegate: AnyObject {
    func didRequestLogout()
}

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    private var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    /// For Debugging
    deinit {
        print("deinit \(Self.self)")
    }
    
    func start() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
        
        window?.setRootViewController(navigationController,with: .fade)
    }
}
