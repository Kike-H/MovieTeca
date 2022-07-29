//
//  Carousel.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 26/07/22.
//

import SwiftUI

struct Carousel: View {
    let width: Int; let height: Int; let padding: Int
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(colors, id: \.self) { color in
                    VStack {
                        Card(width: width, height: height, padding: padding, url: "https://cdn.mos.cms.futurecdn.net/p7LYq5FN4SAHk7sYp6zZog.jpg")
                        Text("Title movie")
                    }
                }
            } //Hstack
        } //Scroll View
    }
}

struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        Carousel(width: 240, height: 350, padding: 12)
    }
}
