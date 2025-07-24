
import UIKit

class SliderImagesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let cellIdentifier = "SliderImagesCollectionViewCell"

    // MARK: - Outlets
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var middleLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var backgroundOfButton: UIView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUP()
    }
    
    // MARK: - Configure
    private func setUP() {
        backGroundView.layer.cornerRadius = 10
        backGroundView.clipsToBounds = true
        backGroundView.layer.masksToBounds = true
        
        topLabel.font = .title2
        middleLabel.font = .body2
        bottomLabel.font = .body2
        
        topLabel.textColor = Colors.secondaryGray
        middleLabel.textColor = Colors.secondaryGray
        bottomLabel.textColor = Colors.primaryMove
        
        topLabel.numberOfLines = 2
        middleLabel.numberOfLines = 2
        bottomLabel.numberOfLines = 2
        
        topLabel.lineBreakMode = .byWordWrapping
        middleLabel.lineBreakMode = .byWordWrapping
        bottomLabel.lineBreakMode = .byWordWrapping
        
        rightImage.contentMode = .scaleAspectFill
        
        let cornerRadius = leftView.bounds.height / 2.0
        leftView.roundCorners(corners: [.topRight, .bottomRight], radius: cornerRadius)
        leftView.backgroundColor = Colors.primaryMove

        backgroundOfButton.layer.cornerRadius = 12
        backgroundOfButton.layer.masksToBounds = true
    }
}
