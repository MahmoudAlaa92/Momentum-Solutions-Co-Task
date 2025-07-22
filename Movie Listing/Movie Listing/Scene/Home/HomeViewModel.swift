//
//  HomeViewModel.swift
//  Movie Listing
//
//  Created by Mahmoud Alaa on 22/07/2025.
//

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

}
