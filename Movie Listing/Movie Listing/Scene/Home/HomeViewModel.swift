
import Combine
import UIKit

class HomeViewModel {

    @Published var sliderItems: [SliderItem] = [
        .init(
            name: "Watch Popular\nmovies 1917",
            description: "Discover Unique Handmade Treasures for Your Journey!",
            offer: "Watch Now",
            image: Images.sliderImage1
        ),
        .init(
            name: "Own Style, Own Story",
            description: "Discover Unique Handmade Treasures for Your Journey!",
            offer: "UP to 20% OFF",
            image: Images.chain
        ),
        .init(
            name: "Dress Bold, Live True",
            description: "Discover Unique Handmade Treasures for Your Journey!",
            offer: "UP to 30% OFF",
            image: Images.imageOfArt
        ),
        .init(
            name: "Be Unique, Be You",
            description: "Discover Unique Handmade Treasures for Your Journey!",
            offer: "UP to 40% OFF",
            image: Images.jewelry
        ),
    ]

    @Published var RecommendedItems: [RecommendedItem] = [
        .init(
            image: Images.homeDecore,
            name: "The Greatest ",
            offer: "Romance Drama"
        ),
        .init(
            image: Images.art,
            name: "The Greatest ",
            offer: "Romance Drama"
        ),
        .init(
            image: Images.craft,
            name: "The Greatest ",
            offer: "Romance Drama"
        ),
        .init(
            image: Images.fashion,
            name: "The Greatest ",
            offer: "Romance Drama"
        ),
    ]
    
    @Published var dailyEssentailItems: [TopSearchesItem] = [
        .init(image: Images.homeDecore, name: "Bridegerton", offer: "Romance Drama"),
        .init(image: Images.art, name: "Bridegerton", offer: "Romance Drama"),
        .init(image: Images.craft, name: "Bridegerton", offer: "Romance Drama"),
        .init(image: Images.fashion, name: "Bridegerton", offer: "Romance Drama")
    ]
}
