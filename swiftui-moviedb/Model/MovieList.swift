//
// Created by Utsman on 30/3/20.
// Copyright (c) 2020 utsman. All rights reserved.
//

import Foundation

struct MovieList: Decodable {
    var page: Int
    var results: [Movie]
}
