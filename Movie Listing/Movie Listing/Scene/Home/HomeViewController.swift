
import UIKit
import Combine

class HomeViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    // MARK: - Properties
    private var navigationBarBehavior: HomeNavBar?
    private var viewModel: HomeViewModel
    private var sections: [CollectionViewDataSource] = []
    private var layoutSections:[LayoutSectionProvider] = []
    
    private var sliderItem: SliderCollectionViewSection?
    private var recommendedItems: RecommendedItemsCollectionViewSection?
    private var TopSearchesItem: TopSearchesCollectionViewSection?
    ///
    weak var coordinator: HomeTranisitionDelegate?
    private var subscriptions = Set<AnyCancellable>()
    // MARK: - Init
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        configureSections()
        setUpCollectionView()
        cofigureCompositianalLayout()
        configureNavBar()
        bindViewModel()
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
extension HomeViewController {
    
    /// Configure Sections
    private func configureSections() {
        let sliderProvider = SliderCollectionViewSection(sliderItems: viewModel.movies)
        self.sliderItem = sliderProvider
        
        let recommendedItems = RecommendedItemsCollectionViewSection(RecommendedItems: viewModel.movies)
        self.recommendedItems = recommendedItems
        
        let TopSearchesItems = TopSearchesCollectionViewSection(topSearchItems: viewModel.movies)
        self.TopSearchesItem = TopSearchesItems
        
        sections = [sliderProvider ,recommendedItems ,TopSearchesItems]
        
        layoutSections = [
            SliderSectionLayoutProvider(),
            RecommendedItemsSectionLayoutProvider(),
            TopSearchesSectionLayoutProvider()
        ]
    }
    /// NavBar
    func configureNavBar() {
        navigationItem.backButtonTitle = ""
        navigationBarBehavior = HomeNavBar(navigationItem: navigationItem)
        
        let userName = "Hi, Mohit"
        let subTitle = "Let's watch a movie"
        let finalImage = Images.profilePhoto
        navigationBarBehavior?.configure(
            onNotification: {
            },
            onSearch: {
            },
            userName: userName,
            subtitleLabel: subTitle,
            userImage: finalImage
        )
    }
    
    /// CompositianalLayout
    private func cofigureCompositianalLayout() {
        
        let layoutFactory = SectionsLayout(providers: layoutSections)
        self.collectionView.setCollectionViewLayout(layoutFactory.createLayout(), animated: true)
    }
}
// MARK: - UICollectionViewDelegate
//
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectable = sections[indexPath.section] as? CollectionViewDelegate {
            selectable.collectionView(collectionView, didSelectItemAt: indexPath)
        }
    }
}
// MARK: - UICollectionViewDataSource
//
extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].numberOfItems
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return sections[indexPath.section].cellForItems(collectionView, cellForItemAt: indexPath)
    }
}
// MARK: - Header And Footer
//
extension HomeViewController {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let provider = sections[indexPath.section] as? HeaderAndFooterProvider {
            return provider.cellForItems(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
        }
        /// provider does not support headers/footers.
        return UICollectionReusableView()
    }
}
// MARK: - Binding ViewModel
//
extension HomeViewController {
    private func bindViewModel() {
        bindTopMovies()
        bindSliderItems()
        bindRecommendItems()
        bindTopSearchItems()
    }
    func bindTopMovies() {
        viewModel.fetchMovies()
        viewModel.$movies
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newItems in
                self?.recommendedItems?.RecommendedItems = newItems
                self?.TopSearchesItem?.topSearchItems = newItems
                self?.sliderItem?.sliderItems = newItems
                self?.collectionView.reloadData()
            }
            .store(in: &subscriptions)
    }
    // MARK: - Slider Items
    private func bindSliderItems() {
        sliderItem?.selectedItem.sink { [weak self] movieItem in
            self?.coordinator?.goToMovieDetailsVC(movie: movieItem.0)
        }.store(in: &subscriptions)
    }
    // MARK: - Recommended Items
    private func bindRecommendItems() {
        recommendedItems?.selectedItem.sink { [weak self] movieItem in
            self?.coordinator?.goToMovieDetailsVC(movie: movieItem.0)
        }.store(in: &subscriptions)
    }
    // MARK: - Top Search Items
    private func bindTopSearchItems() {
        TopSearchesItem?.selectedItem.sink { [weak self] movieItem in
            self?.coordinator?.goToMovieDetailsVC(movie: movieItem.0)
        }.store(in: &subscriptions)
    }
}
