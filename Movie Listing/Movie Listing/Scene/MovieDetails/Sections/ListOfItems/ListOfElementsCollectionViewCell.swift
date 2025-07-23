
import UIKit

class ListOfElementsCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier: String = "ListOfElementsCollectionViewCell"
    // MARK: - Outlets
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var nameOfCell: UILabel!
    @IBOutlet weak var valueCell: UILabel!
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
}
// MARK: - Configure
//
extension ListOfElementsCollectionViewCell {
    
    private func configure() {
        nameOfCell.font = .body
        nameOfCell.textColor = Colors.labelGray
        nameOfCell.numberOfLines = 0
        nameOfCell.lineBreakMode = .byWordWrapping
        
        valueCell.font = .footnote
        valueCell.textColor = .black
        valueCell.numberOfLines = 0
        valueCell.lineBreakMode = .byWordWrapping
    }
}
