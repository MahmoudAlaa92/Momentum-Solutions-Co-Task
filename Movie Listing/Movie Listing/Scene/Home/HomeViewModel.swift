import Combine
import UIKit

class HomeViewModel {
    // MARK: - Properties
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    private let movieRemote: MovieRemoteProtocol
    private var cancellables = Set<AnyCancellable>()
    // MARK: - Init
    init(repository: MovieRemoteProtocol = MovieRemote(network: AlamofireNetwork())) {
         self.movieRemote = repository
     }
}
// MARK: - Private Handlers
//
extension HomeViewModel {
    func fetchMovies() {
        isLoading = true
        movieRemote.fetchTopMovies(year: 2025)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                    self?.error = error
                }
            } receiveValue: { [weak self] movies in
                self?.movies = movies.results
            }
            .store(in: &cancellables)
    }
}
