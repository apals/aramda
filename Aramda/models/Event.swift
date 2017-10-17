//
//  Event.swift
//  Aramda
//
//  Created by Jesper Sandstrom on 10/17/17.
//  Copyright © 2017 jeppes. All rights reserved.
//

import Foundation

struct Event: Codable {
    let id: Int
    let name: String
    let image: String
    let location: String
    let description: String
    let descriptionShort: String
    let signup: String
    let startTime: Int64
    let endTime: Int64
    let registrationStart: Int64
    let registrationEnd: Int64
    let registrationLastDayCancel: Int64
    let registrationRequired: Bool
    let diversity: Bool
    let sustainability: Bool
    let startup: Bool
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image = "image_url"
        case location
        case description
        case descriptionShort = "description_short"
        case signup = "signup_link"
        case startTime = "event_start"
        case endTime = "event_end"
        case registrationStart = "registration_start"
        case registrationEnd = "registration_end"
        case registrationLastDayCancel = "registration_last_day_cancel"
        case registrationRequired = "registration_required"
        case diversity
        case sustainability
        case startup
    }
}
