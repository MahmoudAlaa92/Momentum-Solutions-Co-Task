//
//  HomeNavBar.swift
//  Movie Listing
//
//  Created by Mahmoud Alaa on 22/07/2025.
//

import UIKit

class HomeNavBar {
    
    private unowned var navigationItem: UINavigationItem
    private var noticationBtn: () -> Void = {}
    private var searchBtn: () -> Void = {}
    private var navigationBarButtonItems: [UIBarButtonItem] = []
    
    init(navigationItem: UINavigationItem) {
        self.navigationItem = navigationItem
    }
}
// MARK: - Configure
//
extension HomeNavBar {
    
    func configure(onNotification: @escaping () -> Void, onSearch: @escaping () -> Void, userName: String ,subtitleLabel: String, userImage: UIImage) {
        self.noticationBtn = onNotification
        self.searchBtn = onSearch
        
        /// Container view
        let profileView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        
        /// Image
        let imageView = UIImageView(frame: CGRect(x: 0, y: 5, width: 40, height: 40))
        imageView.image = userImage
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        /// Name of person
        let nameLabel = UILabel(frame: CGRect(x: 50, y: 5, width: 100, height: 40))
        nameLabel.text = userName
        nameLabel.textColor = .black
        nameLabel.font = .calloutBold
        nameLabel.textColor = Colors.secondaryBLue
        
        let subTitleLabel = UILabel()
        subTitleLabel.text = subtitleLabel
        subTitleLabel.textColor = Colors.primaryGray
        subTitleLabel.font = .body2
        
        let labelStack = UIStackView(arrangedSubviews: [nameLabel, subTitleLabel])
        labelStack.axis = .vertical
        labelStack.spacing = 2
        labelStack.alignment = .leading
        labelStack.frame = CGRect(x: 50, y: 5, width: 130, height: 40)

        profileView.addSubview(imageView)
        profileView.addSubview(labelStack)
        
        let leftBarButtonItem = UIBarButtonItem(customView: profileView)
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        let searchButton = UIBarButtonItem(image: Images.search.withRenderingMode(.alwaysOriginal),
                                           style: .done,
                                           target: self,
                                           action: #selector(searchWasTapped))
        
        let notificationButton = UIBarButtonItem(image: Images.notification.withRenderingMode(.alwaysOriginal),
                                                 style: .done,
                                                 target: self,
                                                 action: #selector(notificationWasTapped))
        
        navigationBarButtonItems = [notificationButton, searchButton]
        navigationItem.rightBarButtonItems = navigationBarButtonItems
    }
}
// MARK: - Actions
//
extension HomeNavBar {
    
    @objc private func searchWasTapped() {
        searchBtn()
    }
    
    @objc private func notificationWasTapped() {
        noticationBtn()
    }
}
