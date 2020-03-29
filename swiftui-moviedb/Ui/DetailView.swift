//
// Created by Utsman on 30/3/20.
// Copyright (c) 2020 utsman. All rights reserved.
//

import Foundation
import SwiftUI
import struct Kingfisher.KFImage

struct DetailView: View {

    @ObservedObject var detailViewModel: MovieDetailViewModel

    init(movieId: Int) {
        self.detailViewModel = MovieDetailViewModel(movieId: movieId)
    }

    var body: some View {
        VStack(alignment: .trailing, spacing: 10) {
            KFImage(loadDetail(movieDetail: detailViewModel.movieDetail))
                    .resizable()
            Text(self.detailViewModel.movieDetail.overview ?? "")
            Spacer(minLength: 200)
        }
                .padding()
                .navigationBarTitle(self.detailViewModel.movieDetail.title ?? "")
                .frame(alignment: .top)
    }
}