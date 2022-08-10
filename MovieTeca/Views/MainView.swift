//
//  Main.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 25/07/22.
//

import SwiftUI
import Alamofire

struct MainView: View {
    @State private var showingAlert = false
    @StateObject var moviesDelegate = MoviesDelegate()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // MARK: - New Movies
                    SeccionTitle(title: "New Movies", width: 150)
                    Carousel(width: 240, height: 350, padding: 12, navigation: true, movies: moviesDelegate.now_playing, cast: nil)
                    Spacer()
                    // MARK: - Popular Movies
                    SeccionTitle(title: "Popular Movies", width: 180)
                    Carousel(width: 160, height: 250, padding: 8, navigation: true, movies: moviesDelegate.popular, cast: nil)
                } //VStack
            } //Scroll View
            
            // MARK: - Navigation Tittle
            .navigationTitle(Text("MovieTeca"))
            
            // MARK: - ToolBar
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    // MARK: - Searching Button
                    NavigationLink(destination: SearchView()) {
                        Label("", systemImage: "magnifyingglass")
                    }
                    // MARK: - Reload Button
                    Button {
                        moviesDelegate.reload()
                    } label: {
                        Label("", systemImage: "arrow.clockwise")
                    }
                    // MARK: - Configuration Button
                    NavigationLink(destination: ConfigurationView().environmentObject(ColorSchemeManager())) {
                        Label("", systemImage: "gearshape")
                    }
                    // MARK: - Configuration Button
                } // Group
            } //ToolBar
        }// Navigation View
        .accentColor(.indigo)
    }
}


struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
