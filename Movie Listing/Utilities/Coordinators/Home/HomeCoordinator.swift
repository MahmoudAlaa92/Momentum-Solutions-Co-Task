//
//  HomeCoordinator.swift
//  Movie Listing
//
//  Created by Mahmoud Alaa on 01/07/2025.
//

import UIKit

protocol HomeTranisitionDelegate: AnyObject {
    func goToMovieDetailsVC(movie: Movie)
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
        let viewModel = HomeViewModel()
        let homeVC = HomeViewController(viewModel: viewModel)
        homeVC.coordinator = self
        navigationController.transition(to: homeVC, with: .push)
    }
}
// MARK: - Home Transition Delegate
//
extension HomeCoordinator: HomeTranisitionDelegate {
    func goToMovieDetailsVC(movie: Movie) {
        let coordinator = MovieDetailsCoordinator(navigationController: navigationController, movieItems: movie)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
        
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
