
import UIKit
import Combine

class TopSearchesCollectionViewSection: CollectionViewDataSource {
    
    // MARK: - Properties
    let dailyEssentail: [TopSearchesItem]
    let selectedItem: PassthroughSubject<(TopSearchesItem, Int), Never> = .init()
    // MARK: - Init
    init(dailyEssentail: [TopSearchesItem]) {
        self.dailyEssentail = dailyEssentail
    }
    
    /// Register cell
    func registerCells(in collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: TopSearchesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: TopSearchesCollectionViewCell.identifier)
        
        collectionView.register(UINib(nibName: HeaderView.headerIdentifier, bundle: nil), forSupplementaryViewOfKind: "Header", withReuseIdentifier: HeaderView.headerIdentifier)
    }
    
    var numberOfItems: Int {
        return dailyEssentail.count
    }
    
    func cellForItems(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopSearchesCollectionViewCell.identifier, for: indexPath) as? TopSearchesCollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = dailyEssentail[indexPath.item]
        cell.imageCell.image = item.image
        cell.nameOfCell.text = item.name
        cell.offerCell.text = item.offer
        
        return cell
    }
    
}
// MARK: - Header And Foter for category
//
extension TopSearchesCollectionViewSection: HeaderAndFooterProvider {
    
    func cellForItems(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == "Header" {
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
        let item = dailyEssentail[indexPath.item]
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
                                                                      elementKind: "Header",
                                                                      alignment: .top) ]
        return section
    }
    
}
