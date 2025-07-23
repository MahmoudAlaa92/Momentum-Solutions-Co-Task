//
//  MovieDetailsCoordinator.swift
//  Movie Listing
//
//  Created by Mahmoud Alaa on 23/07/2025.
//

import UIKit

protocol MovieDetailsChildDelegate: AnyObject {
    func backToHomeVC()
}

class MovieDetailsCoordinator: NSObject, Coordinator {

    weak var parentCoordinator: HomeChildDelegate?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    let movieItems: Movie
    
    init(navigationController: UINavigationController, movieItems: Movie) {
        self.navigationController = navigationController
        self.movieItems = movieItems
    }
    
    func start() {
        let viewModel = MovieDetailsViewModel(movieHeaderItems: movieItems)
        let MovieDetailsVC = MovieDetailsViewController(viewModel: viewModel)
        MovieDetailsVC.coordinator = self
        navigationController.transition(to: MovieDetailsVC, with: .push)
    }
    
    deinit {
        print("deinit \(Self.self)")
    }
}
// MARK: - Child Delegate
//
extension MovieDetailsCoordinator: MovieDetailsChildDelegate {
    func backToHomeVC() {
        parentCoordinator?.backToHome(self)
        navigationController.pop(with: .push)
    }
}
