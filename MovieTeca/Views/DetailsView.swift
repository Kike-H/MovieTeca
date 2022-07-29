//
//  Details.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 28/07/22.
//

import SwiftUI


struct DetailsView: View {
    let starts: [Int] = [1,2,3,4,5]
    var body: some View {
        ScrollView{
            VStack {
                HStack {
                    Card(width: 140, height: 200, padding: 12, url: "", navigation: false)
                    VStack {
                        Text("Movie Tittle")
                            .font(.title)
                        Text("Secondary title")
                            .font(.title2)
                        HStack {
                            ForEach(starts, id: \.self) { star in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.indigo)
                            }
                        } // HStack
                    } //Vstack
                    Spacer()
                } //HStack
                SeccionTitle(title: "Synopsis", width: 123)
                VStack {
                    Text("lorem ipsum bla bla bla bla bla bla bla bla bla bla bla bla bla bla")
                }
                .multilineTextAlignment(.leading)
                SeccionTitle(title: "Actors", width: 100)
                Carousel(width: 130, height: 170, padding: 12, navigation: false)
            } //Vstack
        } // ScrollView
        .navigationTitle(Text("Movie Title"))
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
