//
//  MovieDetailsViewController.swift
//  Movie Listing
//
//  Created by Mahmoud Alaa on 22/07/2025.
//

import UIKit
import Combine

class MovieDetailsViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    // MARK: - Properties
    private var viewModel: MovieDetailsViewModel
    private var sections: [CollectionViewDataSource] = []
    private var layoutSections:[LayoutSectionProvider] = []
    ///
    private var MovieHeader: MovieHeaderCollectionViewSection?
    private var MultiButtons: MultiButtonsCollectionViewSection?
    private var ListOfElements: ListOfElementCollectionViewSection?
    private var CastList: CastListCollectionViewSection?
    ///
    weak var coordinator: MovieDetailsChildDelegate?
    private var subscriptions = Set<AnyCancellable>()
    // MARK: Init
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSections()
        setUpCollectionView()
        cofigureCompositianalLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    private func setUpCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        /// Registere cells
        sections.forEach { $0.registerCells(in: collectionView) }
    }
}
// MARK: - Configuration
//
extension MovieDetailsViewController {
    
    /// Configure Sections
    private func configureSections() {
        
        let movieHeader = MovieHeaderCollectionViewSection(movieHeaderItems: viewModel.movieHeaderItems)
        movieHeader.backButton.sink { [weak self] in
            self?.coordinator?.backToHomeVC()
        }.store(in: &subscriptions)
        self.MovieHeader = movieHeader
        
        let MultiButtons = MultiButtonsCollectionViewSection(MultiButtons: viewModel.multiButtonsItems, movieItems: viewModel.movieHeaderItems)
        self.MultiButtons = MultiButtons
        
        let ListOfElements = ListOfElementCollectionViewSection(ListOfElements: viewModel.ListOfElements ,movieItems: viewModel.movieHeaderItems )
        self.ListOfElements = ListOfElements
        
        let CastList = CastListCollectionViewSection(CastListItems: viewModel.CastList)
        self.CastList = CastList
        
        sections = [movieHeader ,MultiButtons ,ListOfElements ,CastList]
        layoutSections = [
            MovieHeaderSectionLayoutProvider(),
            MultiButtonsSectionLayoutProvider(),
            ListOfElementSectionLayoutProvider(),
            CastListSectionLayoutProvider()
        ]
    }
    /// CompositianalLayout
    private func cofigureCompositianalLayout() {
        
        let layoutFactory = SectionsLayout(providers: layoutSections)
        self.collectionView.setCollectionViewLayout(layoutFactory.createLayout(), animated: true)
    }
}
// MARK: - UICollectionViewDelegate
//
extension MovieDetailsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectable = sections[indexPath.section] as? CollectionViewDelegate {
            selectable.collectionView(collectionView, didSelectItemAt: indexPath)
        }
    }
}
// MARK: - UICollectionViewDataSource
//
extension MovieDetailsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].numberOfItems
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return sections[indexPath.section].cellForItems(collectionView, cellForItemAt: indexPath)
    }
    // MARK: - Header And Footer
    //
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let provider = sections[indexPath.section] as? HeaderAndFooterProvider {
            return provider.cellForItems(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
        }
        /// provider does not support headers/footers.
        return UICollectionReusableView()
    }
}
