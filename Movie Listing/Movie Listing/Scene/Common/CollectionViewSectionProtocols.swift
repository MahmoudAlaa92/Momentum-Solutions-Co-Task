//
//  Common.swift
//  Movie Listing
//
//  Created by Mahmoud Alaa on 22/07/2025.
//

import UIKit

protocol CollectionViewDataSource {
    func registerCells(in collectionView: UICollectionView)
    var numberOfItems: Int { get }
    func cellForItems(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}
protocol HeaderAndFooterProvider {
    func cellForItems(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
}
protocol LayoutSectionProvider {
    func layoutSection() -> NSCollectionLayoutSection
}
// MARK: - Delegate
//
protocol CollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
}
protocol ContextMenuProvider {
    func contextMenuConfiguration(for collectionView: UICollectionView, at indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration?
}

