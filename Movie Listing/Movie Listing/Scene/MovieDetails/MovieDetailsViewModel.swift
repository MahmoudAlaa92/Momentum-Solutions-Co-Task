

import UIKit

class MovieDetailsView {
    @Published var movieHeaderItems: [MovieDetailsModel] = [
        .init(image: Images.homeDecore, name: "Bridegerton")
    ]
    
    @Published var dailyEssentailItems: [MultiButtonsItem] = [
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

}
