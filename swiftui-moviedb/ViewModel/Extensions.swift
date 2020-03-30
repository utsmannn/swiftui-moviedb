//
// Created by Utsman on 30/3/20.
// Copyright (c) 2020 utsman. All rights reserved.
//

import Foundation
import SwiftUI
import struct Kingfisher.KFImage

extension NetworkMovie {
    func onMainThread(execute work: @escaping @convention(block) () -> Void) {
        DispatchQueue.main.async(execute: work)
    }

    func getData<T: Decodable>(request: URLRequest, task: @escaping(Result<T, Error>) -> ()) {
        let jsonDecoder: JSONDecoder = {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return decoder
        }()

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                task(.failure(error))
                return
            }

            guard let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Data not found"])
                self.onMainThread {
                    task(.failure(error))
                }
                return
            }

            do {
                let d = try jsonDecoder.decode(T.self, from: data)
                self.onMainThread {
                    task(.success(d))
                }
            } catch {
                self.onMainThread {
                    task(.failure(error))
                }
            }
        }.resume()
    }
}

extension ObservableObject {
    func onMainThread(execute work: @escaping @convention(block) () -> Void) {
        DispatchQueue.main.async(execute: work)
    }
}

extension View {
    func loadDetail(movieDetail: MovieDetail) -> URL? {
        URL(string: "\(Statics.BASE_URL_IMAGE)\(movieDetail.backdropPath ?? "")")
    }

    func loadFromMovie(movie: Movie) -> URL? {
        URL(string: "\(Statics.BASE_URL_IMAGE)\(movie.poster_path ?? "")")
    }
}