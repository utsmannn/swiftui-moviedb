//
// Created by Utsman on 30/3/20.
// Copyright (c) 2020 utsman. All rights reserved.
//

import Foundation

class MovieDetailViewModel : ObservableObject, NetworkMovie {

    @Published var movieDetail = MovieDetail()
    @Published var isLoading = true

    init(movieId: Int) {
        getDetailMovies(movieId: movieId)
    }

    private func getDetailMovies(movieId: Int) {
        let urlDetailMovie = URL(string: "\(Statics.BASE_URL)\(Statics.DETAIL(id: movieId))\(Statics.API_KEY)")
        guard let url = urlDetailMovie else { return }
        let urlRequest = URLRequest(url: url)

        getData(request: urlRequest) { (result: Result<MovieDetail, Error>) in
            switch result {
            case .success(let response):
                self.movieDetail = response
                self.isLoading = false
            case .failure(let error as Error):
                print("error -> \(error.localizedDescription)")
            }
        }
    }

}