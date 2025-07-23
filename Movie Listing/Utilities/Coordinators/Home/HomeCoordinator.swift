//
//  HomeCoordinator.swift
//  Movie Listing
//
//  Created by Mahmoud Alaa on 01/07/2025.
//

import UIKit

protocol HomeTranisitionDelegate: AnyObject {
    func goToMovieDetailsVC()
}

protocol HomeChildDelegate: AnyObject {
    func backToHome(_ coordinator: Coordinator)
}

class HomeCoordinator: NSObject, Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    /// For Debugging
    deinit {
        print("deinit \(Self.self)")
    }
    
    func start() {
        let homeVC = HomeViewController()
        homeVC.coordinator = self
        navigationController.pushViewController(homeVC, animated: true)
    }
}
// MARK: - Home Transition Delegate
//
extension HomeCoordinator: HomeTranisitionDelegate {
    func goToMovieDetailsVC() {
        
    }
}
// MARK: - ChildDelegate
//
extension HomeCoordinator: HomeChildDelegate {
    
    func backToHome(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator } ){
            childCoordinators.remove(at: index)
        }
    }
}
