
import UIKit
import Combine

class ListOfElementCollectionViewSection: CollectionViewDataSource {
    
    // MARK: - Properties
    let ListOfElements: [ListItem]
    let selectedItem: PassthroughSubject<(ListItem, Int), Never> = .init()
    // MARK: - Init
    init(ListOfElements: [ListItem]) {
        self.ListOfElements = ListOfElements
    }
    
    /// Register cell
    func registerCells(in collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: ListOfElementsCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ListOfElementsCollectionViewCell.identifier)
        
        collectionView.register(UINib(nibName: DescriptionMovieDetails.identifier, bundle: nil), forSupplementaryViewOfKind: DescriptionMovieDetails.identifier, withReuseIdentifier: DescriptionMovieDetails.identifier)
    }
    
    var numberOfItems: Int {
        return ListOfElements.count
    }
    
    func cellForItems(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListOfElementsCollectionViewCell.identifier, for: indexPath) as? ListOfElementsCollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = ListOfElements[indexPath.item]
        cell.nameOfCell.text = item.name
        cell.valueCell.text = item.value
        
        return cell
    }
    
}
// MARK: - Header And Footer
//
extension ListOfElementCollectionViewSection: HeaderAndFooterProvider {
    
    func cellForItems(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == DescriptionMovieDetails.identifier {
            let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: DescriptionMovieDetails.identifier,
                for: indexPath) as! DescriptionMovieDetails
            
            footer.configure(descriptionLabel: "With Spider man mahmoud alaa eledefewfewdfjdsfndjsfhjdsfjhdsjfhjdshfjdsjfdjsfjdsjfjdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfds gsdfg gsgwe gergregre grwgrw ")
            return footer
        }
        
        return UICollectionReusableView()
    }
}
// MARK: - Delegate
//
extension ListOfElementCollectionViewSection: CollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = ListOfElements[indexPath.item]
        selectedItem.send((item, indexPath.row))
    }
}
// MARK: - Layout
//
struct ListOfElementSectionLayoutProvider: LayoutSectionProvider {
    
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(88),
                                               heightDimension: .absolute(60))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                      heightDimension: .absolute(100)),
                                                    elementKind: DescriptionMovieDetails.identifier,
                                                    alignment: .bottom) ]
        return section
    }
}
