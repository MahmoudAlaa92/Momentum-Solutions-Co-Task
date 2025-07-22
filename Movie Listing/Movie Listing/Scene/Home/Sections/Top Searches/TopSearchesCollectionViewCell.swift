
import UIKit

class TopSearchesCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier: String = "TopSearchesCollectionViewCell"
    // MARK: - Outlets
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var nameOfCell: UILabel!
    @IBOutlet weak var offerCell: UILabel!
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
}
// MARK: - Configure
extension TopSearchesCollectionViewCell {
    
    private func configure() {
        
        imageCell.layer.cornerRadius = 18
        imageCell.clipsToBounds = true
        imageCell.contentMode = .scaleToFill

        nameOfCell.font = .title2
        nameOfCell.textColor = .black
        
        offerCell.font = .body
        offerCell.textColor = Colors.labelGray
    }
}
