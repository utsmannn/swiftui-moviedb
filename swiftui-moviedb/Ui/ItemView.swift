//
// Created by Utsman on 30/3/20.
// Copyright (c) 2020 utsman. All rights reserved.
//

import Foundation
import SwiftUI
import struct Kingfisher.KFImage

struct ItemView: View {
    var movie: Movie

    init(movie: Movie) {
        self.movie = movie
    }

    var body: some View {
        HStack {
            KFImage(self.loadFromMovie(movie: self.movie))
                    .resizable()
                    .frame(width: 120, height: 160)

            VStack(alignment: .leading) {
                Text(movie.title ?? "").bold().lineLimit(2)
                Text(dateFormatter(dateString: movie.release_date))
                Spacer()
                Text(movie.overview ?? "").lineLimit(4)
            }
        }
    }

    private func dateFormatter(dateString: String?) -> String {
        let dateFormatApi = DateFormatter()
        dateFormatApi.dateFormat = "yyyy-MM-DD"

        let dateFormatOutput = DateFormatter()
        dateFormatOutput.dateFormat = "EEEE DD/MMM/yyyy"

        guard let dateApi = dateFormatApi.date(from: dateString ?? "2020-02-12") else { return "2020-02-12" }
        return dateFormatOutput.string(from: dateApi)
    }
}