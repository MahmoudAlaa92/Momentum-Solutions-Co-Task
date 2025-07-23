
import UIKit

class CastListCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier: String = "CastListCollectionViewCell"
    // MARK: - Outlets
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var nameOfCell: UILabel!
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }

}

// MARK: - Configure
extension CastListCollectionViewCell {
    
    private func configure() {
        
        imageCell.contentMode = .scaleToFill
        imageCell.layer.cornerRadius = 10
        imageCell.layer.masksToBounds = true
        
        nameOfCell.font = .body
        nameOfCell.numberOfLines = 2
        nameOfCell.textColor = Colors.labelGray
    }
}
