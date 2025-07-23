//
//  DailyEssentailProvider.swift
//  Herfety
//
//  Created by Mahmoud Alaa on 09/02/2025.
//

import UIKit
import Combine

class MultiButtonsCollectionViewSection: CollectionViewDataSource {
    
    // MARK: - Properties
    let MultiButtons: [MultiButtonsItem]
    let selectedItem: PassthroughSubject<(MultiButtonsItem, Int), Never> = .init()
    // MARK: - Init
    init(MultiButtons: [MultiButtonsItem]) {
        self.MultiButtons = MultiButtons
    }
    
    /// Register cell
    func registerCells(in collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: DailyEssentailCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DailyEssentailCollectionViewCell.identifier)
        
        collectionView.register(UINib(nibName: HeaderMultiButtonsView.headerIdentifier, bundle: nil), forSupplementaryViewOfKind: HeaderMultiButtonsView.headerIdentifier, withReuseIdentifier: HeaderMultiButtonsView.headerIdentifier)
    }
    
    var numberOfItems: Int {
        return MultiButtons.count
    }
    
    func cellForItems(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyEssentailCollectionViewCell.identifier, for: indexPath) as? DailyEssentailCollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = MultiButtons[indexPath.item]
        cell.nameOfCell.text = item.name
        
        return cell
    }
}
// MARK: - Header And Foter for category
//
extension MultiButtonsCollectionViewSection: HeaderAndFooterProvider {
    
    func cellForItems(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == HeaderMultiButtonsView.headerIdentifier {
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderMultiButtonsView.headerIdentifier,
                for: indexPath) as! HeaderMultiButtonsView
            
            header.configure(title: "SpiderMan: No Way ", description: "Home", rate: "9.1/10 IMDB", shouldShowButton: true)
            return header
        }
        return UICollectionReusableView()
    }
}
// MARK: - Delegate
//
extension MultiButtonsCollectionViewSection: CollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = MultiButtons[indexPath.item]
        selectedItem.send((item, indexPath.row))
    }
}
// MARK: - Layout
//
struct MultiButtonsSectionLayoutProvider: LayoutSectionProvider {
    
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(100),
                                               heightDimension: .absolute(60))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                      heightDimension: .absolute(60)),
                                                                      elementKind: HeaderMultiButtonsView.headerIdentifier,
                                                                      alignment: .top) ]
        return section
    }
    
}
