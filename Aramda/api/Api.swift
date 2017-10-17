//
//  Api.swift
//  Aramda
//
//  Created by Jesper Sandstrom on 10/17/17.
//  Copyright © 2017 jeppes. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class Api {

    static func fetchExhibitors() -> Observable<[Exhibitor]> {
        return Http.get(endpoint: .exhibitors, type: [Exhibitor].self)
    }

    static func fetchEvents() -> Observable<[Event]> {
        return Http.get(endpoint: .events, type: [Event].self)
    }

    static func fetchNews() -> Observable<[News]> {
        return Http.get(endpoint: .news, type: [News].self)
    }

}
