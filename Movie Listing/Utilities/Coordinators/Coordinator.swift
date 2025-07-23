//
//  Coordinator.swift
//  Movie Listing
//
//  Created by Mahmoud Alaa on 23/07/2025.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
