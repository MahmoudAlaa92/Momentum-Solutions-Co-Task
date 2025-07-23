//
//  DailyEssentailProvider.swift
//  Herfety
//
//  Created by Mahmoud Alaa on 09/02/2025.
//

import UIKit
import Combine


class CastListCollectionViewSection: CollectionViewDataSource {
    // MARK: - Properties
    let CastListItems: [CastListModel]
    let selectedItem: PassthroughSubject<(CastListModel, Int), Never> = .init()
    // MARK: - Init
    init(CastListItems: [CastListModel]) {
        self.CastListItems = CastListItems
    }
    
    /// Register cell
    func registerCells(in collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: CastListCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CastListCollectionViewCell.identifier)
        
        collectionView.register(UINib(nibName: HeaderView.headerIdentifier, bundle: nil), forSupplementaryViewOfKind: "Header", withReuseIdentifier: HeaderView.headerIdentifier)
    }
    
    var numberOfItems: Int {
        return CastListItems.count
    }
    
    func cellForItems(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CastListCollectionViewCell.identifier, for: indexPath) as? CastListCollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = CastListItems[indexPath.item]
        cell.imageCell.image = item.image
        cell.nameOfCell.text = item.name
        
        return cell
    }
}

// MARK: - Header And Foter for category
//
extension CastListCollectionViewSection: HeaderAndFooterProvider {
    
    func cellForItems(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == "Header" {
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderView.headerIdentifier,
                for: indexPath) as! HeaderView
            
            header.configure(title: "Cast ", description: "", shouldShowButton: false)
            return header
        }
        
        return UICollectionReusableView()
    }
}
// MARK: - Delegate
//
extension CastListCollectionViewSection: CollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = CastListItems[indexPath.item]
        selectedItem.send((item, indexPath.row))
    }
}
// MARK: - Layout
//
struct CastListSectionLayoutProvider: LayoutSectionProvider {
    
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(120),
                                               heightDimension: .absolute(120))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                      heightDimension: .absolute(30)),
                                                                      elementKind: "Header",
                                                                      alignment: .top) ]
        return section
    }
    
}
