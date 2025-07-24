

import UIKit
import Combine

class MovieHeaderCollectionViewSection: CollectionViewDataSource {
    
    // MARK: - Properties
    let movieHeaderItems: Movie
    let backButton = PassthroughSubject<Void, Never>()
    // MARK: - Init
    init(movieHeaderItems: Movie) {
        self.movieHeaderItems = movieHeaderItems
    }
    
    /// Register cell
    func registerCells(in collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: MovieHeaderCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: MovieHeaderCollectionViewCell.identifier)
    }
    
    var numberOfItems: Int {
        return 1
    }
    
    func cellForItems(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieHeaderCollectionViewCell.identifier, for: indexPath) as? MovieHeaderCollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = movieHeaderItems
        
        cell.imageCell.setImage(with: Settings.imageBaseURL + (item.posterPath ?? ""), placeholderImage: Images.loading)
        cell.nameOfCell.text =  "Player Trailer"
        cell.onPressedBtn = { [weak self] in
            self?.backButton.send()
        }
        return cell
    }
}
// MARK: - Delegate
//
extension MovieHeaderCollectionViewSection: CollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /// Selected items here
    }
}
// MARK: - Layout
//
struct MovieHeaderSectionLayoutProvider: LayoutSectionProvider {
    
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(350))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
}
