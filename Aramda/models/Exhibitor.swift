//
//  Exhibitor.swift
//  Aramda
//
//  Created by Jesper Sandstrom on 10/17/17.
//  Copyright © 2017 jeppes. All rights reserved.
//

import Foundation

struct Exhibitor: Decodable {
    let name: String
    let description: String
    let type: String?
    let website: String
    let facts: String
    let logo: String
    let location: String
    let addressStreet: String
    let addressCity: String
    let addressCountry: String
    let contact: Contact?
    let hosts: [Host]
    enum CodingKeys: String, CodingKey {
        case name = "company"
        case description = "about"
        case type = "organisation_type"
        case website = "company_website"
        case facts
        case logo = "logo_url"
        case location = "exhibitor_location"
        case addressStreet = "address_street"
        case addressCity = "address_city"
        case addressCountry = "address_country"
        case contact = "company_contact"
        case hosts
    }
}

struct Contact: Codable {
    let name: String
    let email: String
    let title: String
}

struct Host: Codable {
    let firstName: String
    let lastName: String
    let email: String
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case email
    }
}
