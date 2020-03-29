//
// Created by Utsman on 30/3/20.
// Copyright (c) 2020 utsman. All rights reserved.
//

import Foundation

class MovieListViewModel: ObservableObject {

    @Published var movies = [Movie]()
    @Published var isLoading = true

    public func clearList() {
        self.movies.removeAll()
        self.isLoading = false
    }

    public func getMoviesTrending() {
        let urlTrending = URL(string: "\(Statics.BASE_URL)\(Statics.TRENDING)\(Statics.API_KEY)")
        guard let url = urlTrending else { return }

        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            print("connection successful")
            self.onMainThread {
                self.isLoading = true
            }

            guard let dataMovies = data, error == nil, response != nil else {
                print("connection failed")
                self.onMainThread {
                    self.isLoading = false
                }
                return
            }

            do {
                let responses = try JSONDecoder().decode(MovieList.self, from: dataMovies)
                print(responses)
                self.onMainThread {
                    print(responses.page)
                    let nonNullTitle = responses.results.filter { movie in
                        movie.title != nil
                    }
                    self.movies.append(contentsOf: nonNullTitle)
                    self.isLoading = false
                }
            } catch {
                print("error get data -> \(error.localizedDescription)")
                print("url is -> \(url.absoluteString)")
                print("data movie is -> \(dataMovies)")
            }
        }.resume()
    }
}