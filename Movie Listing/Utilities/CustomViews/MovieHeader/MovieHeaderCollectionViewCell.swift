//
//  DailyEssentailCollectionViewCell.swift
//  Herfety
//
//  Created by Mahmoud Alaa on 04/02/2025.
//

import UIKit

class MovieHeaderCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier: String = "MovieHeaderCollectionViewCell"
    var onPressedBtn: (() -> Void)?
    // MARK: - Outlets
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var buttonImage: UIButton!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var nameOfCell: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var rightIcon: UIButton!
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
}
// MARK: - Configure
//
extension MovieHeaderCollectionViewCell {
    private func configure() {
        topView.backgroundColor = Colors.heavyGray
        
        nameOfCell.font = .title2
        nameOfCell.textColor = Colors.buttonGray
        
        imageCell.contentMode = .scaleToFill
        imageCell.layer.cornerRadius = 18
        imageCell.layer.masksToBounds = true
        
        buttonImage.setImage(Images.cartSelected, for: .normal)
        
        backButton.setImage(Images.iconProfileArrow, for: .normal)
    }
}
// MARK: - Actions
//
extension MovieHeaderCollectionViewCell {
    @IBAction func backButtonPressed(_ sender: Any) {
        onPressedBtn?()
    }
}
