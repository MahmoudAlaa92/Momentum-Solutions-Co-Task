//
//  DailyEssentailProvider.swift
//  Herfety
//
//  Created by Mahmoud Alaa on 09/02/2025.
//

import UIKit
import Combine

class MovieHeaderCollectionViewSection: CollectionViewDataSource {
    
    // MARK: - Properties
    let dailyEssentail: [MovieDetailsModel]
    let selectedItem: PassthroughSubject<(MovieDetailsModel, Int), Never> = .init()
    // MARK: - Init
    init(dailyEssentail: [MovieDetailsModel]) {
        self.dailyEssentail = dailyEssentail
    }
    
    /// Register cell
    func registerCells(in collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: MovieHeaderCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: MovieHeaderCollectionViewCell.identifier)
    }
    
    var numberOfItems: Int {
        return dailyEssentail.count
    }
    
    func cellForItems(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieHeaderCollectionViewCell.identifier, for: indexPath) as? MovieHeaderCollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = dailyEssentail[indexPath.item]
        cell.imageCell.image = item.image
        cell.nameOfCell.text = item.name
        
        return cell
    }
}

// MARK: - Delegate
//
extension MovieHeaderCollectionViewSection: CollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = dailyEssentail[indexPath.item]
        selectedItem.send((item, indexPath.row))
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
