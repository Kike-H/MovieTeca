//
//  Card.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 26/07/22.
//

import SwiftUI

// MARK: - CardView
struct Card: View {
    
    //Atributes
    let width, height, padding: Int
    let navigation: Bool
    let movie: Movie?
    let cast: Cast?
    
// MARK: - Crad With Navigation
    var body: some View {
        let imgPath = movie?.posterPath ?? cast?.profilePath ?? ""
        if navigation {
            NavigationLink(destination: DetailsView(movie: movie!)) {
                CardTemplate(width: width, height: height, padding: padding, url: "https://image.tmdb.org/t/p/w500\(imgPath)")
            } // Navigation Link
        }
// MARK: - Crad With Navigation
        
// MARK: - Crad WithOuth Navigation
        else {
            CardTemplate(width: width, height: height, padding: padding, url: "https://image.tmdb.org/t/p/w500\(imgPath)")
        }
// MARK: - Crad WithOuth Navigation
    }
}

// MARK: - CardTemplate
struct CardTemplate: View {

    //Atributes
    let width, height, padding: Int
    let url: String
    
    //Const
    let cornerRadius = CGFloat(20)
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: url)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                }
                else if phase.error != nil {
                    Image("no-img")
                        .resizable()
                        .frame(width: CGFloat(width), height: CGFloat(height))
                        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                        .padding(.horizontal, CGFloat(padding))
                }
                else {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .frame(width: CGFloat(width-12), height: CGFloat(height-12))
                        .foregroundColor(.indigo)
                        .opacity(0.2)
                        .padding(.horizontal, CGFloat(padding))
                        .overlay(
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .indigo))
                                .scaleEffect(2)
                        )
                } // Last else
            } // Image
            .frame(width: CGFloat(width), height: CGFloat(height))
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .padding(.horizontal, CGFloat(padding))
        } // VStack
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(width: 240, height: 350, padding: 15, navigation: false, movie: nil, cast: nil).previewLayout(.fixed(width: 260, height: 390))
    }
}
