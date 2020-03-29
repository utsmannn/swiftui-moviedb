//
// Created by Utsman on 30/3/20.
// Copyright (c) 2020 utsman. All rights reserved.
//

import Foundation

class Statics {

    static let API_KEY: String = "?api_key=da2334aed44334eb29a85cfc3711ee6d"
    static let BASE_URL: String = "https://api.themoviedb.org/3"
    static let BASE_URL_IMAGE: String = "https://image.tmdb.org/t/p/w500"
    static let TRENDING: String = "/trending/all/day"

    static func DETAIL(id: Int) -> String {
        "/movie/\(id)"
    }
}