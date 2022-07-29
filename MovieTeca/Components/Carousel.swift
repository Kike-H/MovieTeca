//
//  Carousel.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 26/07/22.
//

import SwiftUI

struct Carousel: View {
    let width: Int; let height: Int; let padding: Int; let navigation: Bool;
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(movies) { movie in
                    VStack {
                        Card(width: width, height: height, padding: padding, url: movie.posterPath, navigation: navigation)
                        Text(movie.title)
                    }
                }
            } //Hstack
        } //Scroll View
    }
}

struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        Carousel(width: 240, height: 350, padding: 12, navigation: false)
    }
}
