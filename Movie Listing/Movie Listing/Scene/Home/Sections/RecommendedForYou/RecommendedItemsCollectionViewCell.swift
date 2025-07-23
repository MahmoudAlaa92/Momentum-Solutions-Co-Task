
import UIKit

class RecommendedItemsCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties
    static let identifier: String = "RecommendedItemsCollectionViewCell"
    // MARK: - Outlets
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var nameOfCell: UILabel!
    @IBOutlet weak var descriptionOfCell: UILabel!
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
}
// MARK: - Configure
//
extension RecommendedItemsCollectionViewCell {
    
    private func configure() {
        topView.layer.cornerRadius = 12
        topView.clipsToBounds = true
        
        nameOfCell.font = .title3
        nameOfCell.textColor = .black
        nameOfCell.lineBreakMode = .byWordWrapping
        
        descriptionOfCell.font = .body
        descriptionOfCell.textColor = Colors.labelGray
        descriptionOfCell.lineBreakMode = .byWordWrapping
        
        imageCell.contentMode = .scaleAspectFill
    }
}
