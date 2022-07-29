//
//  Card.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 26/07/22.
// https://cdn.mos.cms.futurecdn.net/p7LYq5FN4SAHk7sYp6zZog.jpg

import SwiftUI


struct Card: View {
    let width: Int; let height: Int; let padding: Int; let url: String; let navigation: Bool;
    var body: some View {
        if navigation {
            NavigationLink(destination: DetailsView()) {
                CardTemplate(width: width, height: height, padding: padding, url: url)
            } // Navigation Link
        } // if
        else {
            CardTemplate(width: width, height: height, padding: padding, url: url)
        } // else
    }
}

struct CardTemplate: View {
    let width: Int; let height: Int; let padding: Int; let url: String;
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
        Card(width: 240, height: 350, padding: 15, url: "https://cdn.mos.cms.futurecdn.net/p7LYq5FN4SAHk7sYp6zZog.jpg", navigation: false).previewLayout(.fixed(width: 260, height: 390))
    }
}
