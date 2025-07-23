import UIKit

class HeaderMultiButtonsView: UICollectionReusableView {
    // MARK: - Properties
    static let headerIdentifier = "HeaderMultiButtonsView"
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var starIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
}
// MARK: - Configure
//
extension HeaderMultiButtonsView {

    func configure(
        title: String,
        description: String,
        rate: String,
        titleFont: UIFont? = nil,
        titleColor: UIColor? = nil,
        shouldShowButton: Bool
    ) {
        titleLabel.text = title
        titleLabel.font = titleFont
        titleLabel.textColor = titleColor
        descriptionLabel.text = description
        rateLabel.text = rate
        saveButton.isHidden = !shouldShowButton
    }

    private func setUp() {
        
        titleLabel.font = .title3
        titleLabel.textColor = Colors.hPrimary

        descriptionLabel.font = .callout
        descriptionLabel.textColor = .black

        rateLabel.font = .body
        rateLabel.textColor = Colors.labelGray
        
        starIcon.image = Images.iconRating
        
        saveButton.setImage(Images.iconCommunity, for: .normal)
    }
}
// MARK: - Actions
//
extension HeaderMultiButtonsView {
    @IBAction func saveButtonPressed(_ sender: UIButton) {

    }
}
