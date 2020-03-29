//
// Created by Utsman on 30/3/20.
// Copyright (c) 2020 utsman. All rights reserved.
//

import Foundation

class MovieDetailViewModel : ObservableObject {

    @Published var movieDetail = MovieDetail()
    @Published var isLoading = true

    init(movieId: Int) {
        getDetailMovies(movieId: movieId)
    }

    private func getDetailMovies(movieId: Int) {
        let urlDetailMovie = URL(string: "\(Statics.BASE_URL)\(Statics.DETAIL(id: movieId))\(Statics.API_KEY)")
        guard let url = urlDetailMovie else { return }

        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            print("connection successful")
            self.onMainThread {
                self.isLoading = true
            }

            guard let dataMovie = data, error == nil, response != nil else {
                print("connection failed")
                self.onMainThread {
                    self.isLoading = false
                }
                return
            }

            do {
                let responses = try JSONDecoder().decode(MovieDetail.self, from: dataMovie)
                self.onMainThread {
                    self.movieDetail = responses
                    self.isLoading = false
                }

            } catch {
                print("get data error -> \(error.localizedDescription)")
            }
        }.resume()
    }

}