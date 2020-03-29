//
//  ContentView.swift
//  swiftui-moviedb
//
//  Created by Utsman on 30/3/20.
//  Copyright © 2020 utsman. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var listViewModel = MovieListViewModel()

    init() {
        listViewModel.getMoviesTrending()
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(listViewModel.movies.indices, id: \.self) { index in
                    NavigationLink(destination: DetailView(movieId: self.listViewModel.movies[index].id ?? 0)) {
                        ItemView(movie: self.listViewModel.movies[index])
                    }
                }
            }.navigationBarTitle("Movie List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
