//
//  HomeModel.swift
//  GoodsMartTask
//
//  Created by mohamed eltabey on 5/31/22.
//

import Foundation

// MARK: - Welcome
struct HomeResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author: String?
    let title, articleDescription: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id: ID
    let name: Name
}

enum ID: String, Codable {
    case cnn = "cnn"
}

enum Name: String, Codable {
    case cnn = "CNN"
}
