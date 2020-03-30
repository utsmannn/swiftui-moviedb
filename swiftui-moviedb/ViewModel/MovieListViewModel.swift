//
// Created by Utsman on 30/3/20.
// Copyright (c) 2020 utsman. All rights reserved.
//

import Foundation

class MovieListViewModel: ObservableObject, NetworkMovie {

    @Published var movies = [Movie]()
    @Published var isLoading = true

    public func clearList() {
        self.movies.removeAll()
        self.isLoading = false
    }

    public func getMoviesTrending() {
        let urlTrending = URL(string: "\(Statics.BASE_URL)\(Statics.TRENDING)\(Statics.API_KEY)")
        guard let url = urlTrending else { return }
        let urlRequest = URLRequest(url: url)

        getData(request: urlRequest) { (result: Result<MovieList, Error>) in
            switch result {
            case .success(let response):
                let nonNullTitle = response.results.filter { movie in
                    movie.title != nil
                }
                self.movies.append(contentsOf: nonNullTitle)
                self.isLoading = false

            case .failure(let error as Error):
                print("error -> \(error.localizedDescription)")
            }
        }
    }
}