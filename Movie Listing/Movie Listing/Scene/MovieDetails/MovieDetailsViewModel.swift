import UIKit

class MovieDetailsView {
    @Published var movieHeaderItems: [MovieDetailsModel] = [
        .init(image: Images.homeDecore, name: "Bridegerton")
    ]
    
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
            name: "Bridegerton",
            value: "Romance Drama"
        ),
        .init(
            name: "Bridegerton",
            value: "Romance Drama"),
        .init(
            name: "Bridegerton",
            value: "Romance Drama"),
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
