//
//  DailyEssentailCollectionViewCell.swift
//  Herfety
//
//  Created by Mahmoud Alaa on 04/02/2025.
//

import UIKit

class DailyEssentailCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier: String = "DailyEssentailCollectionViewCell"
    // MARK: - Outlets
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var nameOfCell: UILabel!
    // MARK: - Lifecycle
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
}
// MARK: - Configure
//
extension DailyEssentailCollectionViewCell {
    
    private func configure() {
        topView.backgroundColor = Colors.heavyGray
        topView.layer.cornerRadius = 18
        topView.clipsToBounds = true
        
        nameOfCell.font = .body
        nameOfCell.textColor = Colors.labelGray
    }
}
