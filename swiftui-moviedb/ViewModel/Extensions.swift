//
// Created by Utsman on 30/3/20.
// Copyright (c) 2020 utsman. All rights reserved.
//

import Foundation
import SwiftUI
import struct Kingfisher.KFImage

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