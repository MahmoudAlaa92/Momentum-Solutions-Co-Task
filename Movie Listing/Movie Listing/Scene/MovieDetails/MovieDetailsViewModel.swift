import UIKit

class MovieDetailsViewModel {
    var movieHeaderItems: Movie
    
    init(movieHeaderItems: Movie) {
        self.movieHeaderItems = movieHeaderItems
    }
    
    @Published var multiButtonsItems: [MultiButtonsItem] = [
        .init(
            name: "Action"
        ),
        .init(
            name: "Adventure"
        ),
        .init(
            name: "Fantasy"
        )
    ]
    
    @Published var ListOfElements: [ListItem] = [
        .init(
            name: "Length",
            value: "2h 28min"
        ),
        .init(
            name: "Language",
            value: "English"),
        .init(
            name: "Rating",
            value: "PG - 13"),
        .init(
            name: "Bridegerton",
            value: "Romance Drama"
        ),
    ]
    
    @Published var CastList: [CastListModel] = [
        .init(
            image: Images.art,
            name: "Toma Holland",
        ),
        .init(
            image: Images.fashion,
            name: "Zendaya"
        ),
        .init(
            image: Images.craft,
            name: "JaconBatlon"
        ),
        .init(
            image: Images.craft,
            name: "JaconBatlon"
        ),
        .init(
            image: Images.craft,
            name: "JaconBatlon"
        )
    ]

}
