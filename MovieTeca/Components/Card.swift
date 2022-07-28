//
//  Card.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 26/07/22.
// https://cdn.mos.cms.futurecdn.net/p7LYq5FN4SAHk7sYp6zZog.jpg

import SwiftUI


struct Card: View {
    let width: Int; let height: Int; let padding: Int; let color: Color
    let cornerRadius = CGFloat(20)
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://cdn.mos.cms.futurecdn.net/p7LYq5FN4SAHk7sYp6zZog.jpg")) { phase in
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
                }
            }
            .frame(width: CGFloat(width), height: CGFloat(height))
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .padding(.horizontal, CGFloat(padding))
        } // VStack
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(width: 240, height: 350, padding: 15, color: .indigo).previewLayout(.fixed(width: 260, height: 390))
    }
}
