
import UIKit

class MultiButtonsCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier: String = "MultiButtonsCollectionViewCell"
    // MARK: - Outlets
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var nameOfCell: UILabel!
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
}
// MARK: - Configure
//
extension MultiButtonsCollectionViewCell {
    
    private func configure() {
        topView.backgroundColor = Colors.heavyGray
        topView.layer.cornerRadius = 18
        topView.clipsToBounds = true
        
        nameOfCell.font = .body
        nameOfCell.textColor = Colors.labelGray
    }
}
