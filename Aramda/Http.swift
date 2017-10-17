//
//  Http.swift
//  Aramda
//
//  Created by Jesper Sandstrom on 10/17/17.
//  Copyright © 2017 jeppes. All rights reserved.
//

import Foundation

class Http {

    static func get<T: Codable>(endpoint: String, type: T.Type) {
        let baseUrl = "https://ais.armada.nu/api/"
        let url = URL(string: "\(baseUrl)\(endpoint)/")!
        let request = URLRequest(url: url)
        let session = URLSession.shared

        session.dataTask(with: request) { data, response, err in
            if let data = data {
                print("Entered the completionHandler")
                decode(data: data, type: type)
            }
            }.resume()
    }

    private static func decode<T: Codable>(data: Data, type: T.Type) {
        do {
            let decoder = JSONDecoder()
            let exhibitors = try decoder.decode(type, from: data)
            print(exhibitors)
        } catch let e {
            print("Something went wrong lol")
            print(e)
        }
    }

}
