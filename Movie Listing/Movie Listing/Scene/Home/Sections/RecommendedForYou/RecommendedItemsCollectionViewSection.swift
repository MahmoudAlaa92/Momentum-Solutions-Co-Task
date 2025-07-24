
import UIKit
import Combine

class RecommendedItemsCollectionViewSection: CollectionViewDataSource {
    
    // MARK: - Properties
    var RecommendedItems: [Movie]
    let selectedItem: PassthroughSubject<(Movie, Int), Never> = .init()
    // MARK: - Init
    init(RecommendedItems: [Movie]) {
        self.RecommendedItems = RecommendedItems
    }
    
    /// Register cell
    func registerCells(in collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: RecommendedItemsCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: RecommendedItemsCollectionViewCell.identifier)
        
        collectionView.register(UINib(nibName: HeaderView.headerIdentifier, bundle: nil), forSupplementaryViewOfKind: HeaderView.headerIdentifier, withReuseIdentifier: HeaderView.headerIdentifier)
    }
    
    var numberOfItems: Int {
        return RecommendedItems.count
    }
    
    func cellForItems(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedItemsCollectionViewCell.identifier, for: indexPath) as? RecommendedItemsCollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = RecommendedItems[indexPath.item]

        cell.imageCell.setImage(with: Settings.imageBaseURL + (item.posterPath ?? ""), placeholderImage: Images.loading)
        cell.nameOfCell.text = item.title
        cell.descriptionOfCell.text = item.overview
        
        return cell
    }
    
}
// MARK: - Header And Foter for category
//
extension RecommendedItemsCollectionViewSection: HeaderAndFooterProvider {
    
    func cellForItems(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == HeaderView.headerIdentifier {
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderView.headerIdentifier,
                for: indexPath) as! HeaderView
            
            header.configure(title: "Recommended for You", description: "", shouldShowButton: true)
            return header
        }
        
        return UICollectionReusableView()
    }
}
// MARK: - Delegate
//
extension RecommendedItemsCollectionViewSection: CollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = RecommendedItems[indexPath.item]
        selectedItem.send((item, indexPath.row))
    }
}
// MARK: - Layout
//
struct RecommendedItemsSectionLayoutProvider: LayoutSectionProvider {
    
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(150),
                                               heightDimension: .absolute(300))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                      heightDimension: .absolute(30)),
                                                                      elementKind: HeaderView.headerIdentifier,
                                                                      alignment: .top) ]
        return section
    }
}
