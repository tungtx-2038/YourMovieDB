//
//  MovieDetail.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/7/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import ObjectMapper

struct MovieDetail: BaseModel {
    var adult = false
    var backdropPath = ""
    var budget = 0
    var genres = [Genre]()
    var id = 0
    var imdbId = ""
    var originalLanguage = ""
    var originalTitle = ""
    var overview = ""
    var popularity = 0.0
    var posterPath = ""
    var productionCompanies = [Company]()
    var productionCountries = [Country]()
    var releaseDate: Date?
    var runTime = 0
    var status = ""
    var tagLine = ""
    var title = ""
    var video = false
    var voteAverage = 0.0
    var voteCount = 0

    init?(map: Map) {
        mapping(map: map)
    }

    mutating func mapping(map: Map) {
        adult <- map["adult"]
        backdropPath <- map["backdrop_path"]
        budget <- map["budget"]
        genres <- map["genres"]
        id <- map["id"]
        imdbId <- map["homepage"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        posterPath <- map["poster_path"]
        productionCompanies <- map["production_companies"]
        productionCountries <- map["production_countries"]
        releaseDate <- (map["release_date"], DateTransform())
        runTime <- map["runtime"]
        status <- map["status"]
        tagLine <- map["tagline"]
        title <- map["title"]
        video <- map["video"]
        voteAverage <- map["vote_average"]
        voteCount <- map["vote_count"]

    }
}
