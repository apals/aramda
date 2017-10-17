//
//  News.swift
//  Aramda
//
//  Created by Jesper Sandstrom on 10/17/17.
//  Copyright © 2017 jeppes. All rights reserved.
//

import Foundation

struct News: Codable {
    let id: Int64
    let title: String
    let date: Date
    let htmlText: String
    let image: String
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case date = "date_published"
        case htmlText = "html_article_text"
        case image
    }
}
