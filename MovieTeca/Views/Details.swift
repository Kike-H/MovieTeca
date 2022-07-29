//
//  Details.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 28/07/22.
//

import SwiftUI


struct Details: View {
    let starts: [Int] = [1,2,3,4,5]
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    HStack {
                        Card(width: 140, height: 200, padding: 12, color: .indigo)
                        VStack {
                            Text("Movie Title")
                                .font(.title)
                            Text("Movie title 2")
                                .font(.title3)
                                .padding(.vertical, 1)
                            HStack {
                                ForEach(starts, id: \.self) { start in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.indigo)
                                }
                            }
                        }
                        Spacer()
                    }
                    SeccionTitle(title: "Synopsis")
                    Text("lorem ipsum")
                    SeccionTitle(title: "Actors")
                    Carousel(width: 130, height: 170, padding: 12)
                } //Vstack
            } // Scroll view
            .navigationTitle(Text("Information"))
        }// Navigation View
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details()
    }
}
