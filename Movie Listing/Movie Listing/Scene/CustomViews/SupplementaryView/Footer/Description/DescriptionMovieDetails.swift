
import UIKit

class DescriptionMovieDetails: UICollectionReusableView {
    // MARK: - Properties
    static let identifier: String = "DescriptionMovieDetails"
    ///
    // MARK: - Outlets
    @IBOutlet weak var descriptionTitle: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
}
// MARK: - Configuration
//
extension DescriptionMovieDetails {
    
    private func configureUI() {
        descriptionTitle.text = "Description"
        descriptionLabel.numberOfLines = 0
        descriptionTitle.font = .title3
        
        descriptionLabel.font = .body
        descriptionLabel.textColor = Colors.hSocialButton
        descriptionLabel.lineBreakMode = .byWordWrapping
    }
    func configure(descriptionLabel: String){
        self.descriptionLabel.text = descriptionLabel
    }
}
