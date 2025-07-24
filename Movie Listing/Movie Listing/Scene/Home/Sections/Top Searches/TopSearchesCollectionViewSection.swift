
import UIKit
import Combine

class TopSearchesCollectionViewSection: CollectionViewDataSource {
    
    // MARK: - Properties
    var topSearchItems: [Movie]
    let selectedItem: PassthroughSubject<(Movie, Int), Never> = .init()
    // MARK: - Init
    init(topSearchItems: [Movie]) {
        self.topSearchItems = topSearchItems
    }
    
    /// Register cell
    func registerCells(in collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: TopSearchesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: TopSearchesCollectionViewCell.identifier)
        
        collectionView.register(UINib(nibName: HeaderView.headerIdentifier, bundle: nil), forSupplementaryViewOfKind: HeaderView.headerIdentifier, withReuseIdentifier: HeaderView.headerIdentifier)
    }
    
    var numberOfItems: Int {
        return topSearchItems.count
    }
    
    func cellForItems(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopSearchesCollectionViewCell.identifier, for: indexPath) as? TopSearchesCollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = topSearchItems[indexPath.item]
        
        cell.imageCell.setImage(with: Settings.imageBaseURL + (item.posterPath ?? ""), placeholderImage: Images.loading)
        cell.nameOfCell.text =  item.title
        cell.offerCell.text = item.originalLanguage
        
        return cell
    }
    
}
// MARK: - Header And Foter for category
//
extension TopSearchesCollectionViewSection: HeaderAndFooterProvider {
    
    func cellForItems(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == HeaderView.headerIdentifier {
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderView.headerIdentifier,
                for: indexPath) as! HeaderView
            
            header.configure(title: "Top Searches", description: "", shouldShowButton: true)
            return header
        }
        
        return UICollectionReusableView()
    }
}
// MARK: - Delegate
//
extension TopSearchesCollectionViewSection: CollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = topSearchItems[indexPath.item]
        selectedItem.send((item, indexPath.row))
    }
}
// MARK: - Layout
//
struct TopSearchesSectionLayoutProvider: LayoutSectionProvider {
    
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(110))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 5, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 5
        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                      heightDimension: .absolute(30)),
                                                                      elementKind: HeaderView.headerIdentifier,
                                                                      alignment: .top) ]
        return section
    }
    
}
