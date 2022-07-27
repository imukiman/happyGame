//
//  Game.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 10/07/2022.
//

import Foundation
import SwiftyJSON

enum PageGame: String{
    case newRelease
    case dicCover
    case genRes
    case none
}
enum Play: String{
    case wanted
    case playing
    case played
    case none
}

struct API{
    static var BASE_URL = "http://topxmedia.club/img-happ/"
    static var BASE_URL_CATEGORIES = "http://topxmedia.club/happ/genre/all"
    static var BASE_SEARCH = "http://topxmedia.club/happ/game/search"
}

struct CategoriesData{
    let id: String?
    let createdAt: Int?
    let createdBy: Any?
    let lastUpdatedBy: Any?
    let updatedAt: Int?
    let genreId: Int?
    let name: String?
    let slug: String?
    let gamesCount: Int?
    let imageBackground: String?
    
    init(_ json: JSON) {
        id = json["id"].stringValue
        createdAt = json["createdAt"].intValue
        createdBy = json["createdBy"]
        lastUpdatedBy = json["lastUpdatedBy"]
        updatedAt = json["updatedAt"].intValue
        genreId = json["genreId"].intValue
        name = json["name"].stringValue
        slug = json["slug"].stringValue
        gamesCount = json["gamesCount"].intValue
        imageBackground = json["imageBackground"].stringValue
    }
}

struct DataItemCategories{
    let id: String?
    let createdAt: Int?
    let createdBy: Any?
    let lastUpdatedBy: Any?
    let updatedAt: Int?
    let added: String?
    let backgroundImage: String?
    let clip: Any?
    let dominantColor: String?
    let genres: String?
    let gameId: Int?
    let metacritic: String?
    let name: String?
    let platforms: String?
    let playtime: String?
    let rating: String?
    let ratingsCount: Int?
    let ratingTop: Int?
    let released: String?
    let reviewsCount: String?
    let reviewsTextCount: String?
    let shortScreenshots: String?
    let slug: String?
    let stores: String?
    let suggestionsCount: Int?
    let description: Any?
    let averagePlaytime: Any?
    let metaScore: Any?
    let publisher: Any?
    let discoverOrder: Int?
    let upComingOrder: Int?
    let newReleaseOrder: Int?
    let topPreviousYear: Int?
    let topCurrentYear: Int?
    let linkStoreIOS: Any?
    let linkStoreAndroid: Any?
    let url: String?
    
    init(_ json: JSON) {
        id = json["id"].stringValue
        createdAt = json["createdAt"].intValue
        createdBy = json["createdBy"]
        lastUpdatedBy = json["lastUpdatedBy"]
        updatedAt = json["updatedAt"].intValue
        added = json["added"].stringValue
        backgroundImage = json["backgroundImage"].stringValue
        clip = json["clip"]
        dominantColor = json["dominantColor"].stringValue
        genres = json["genres"].stringValue
        gameId = json["gameId"].intValue
        metacritic = json["metacritic"].stringValue
        name = json["name"].stringValue
        platforms = json["platforms"].stringValue
        playtime = json["playtime"].stringValue
        rating = json["rating"].stringValue
        ratingsCount = json["ratingsCount"].intValue
        ratingTop = json["ratingTop"].intValue
        released = json["released"].stringValue
        reviewsCount = json["reviewsCount"].stringValue
        reviewsTextCount = json["reviewsTextCount"].stringValue
        shortScreenshots = json["shortScreenshots"].stringValue
        slug = json["slug"].stringValue
        stores = json["stores"].stringValue
        suggestionsCount = json["suggestionsCount"].intValue
        description = json["description"]
        averagePlaytime = json["averagePlaytime"]
        metaScore = json["metaScore"]
        publisher = json["publisher"]
        discoverOrder = json["discoverOrder"].intValue
        upComingOrder = json["upComingOrder"].intValue
        newReleaseOrder = json["newReleaseOrder"].intValue
        topPreviousYear = json["topPreviousYear"].intValue
        topCurrentYear = json["topCurrentYear"].intValue
        linkStoreIOS = json["linkStoreIOS"]
        linkStoreAndroid = json["linkStoreAndroid"]
        url = json["url"].stringValue
    }
}


