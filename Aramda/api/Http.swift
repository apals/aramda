//
//  Http.swift
//  Aramda
//
//  Created by Jesper Sandstrom on 10/17/17.
//  Copyright © 2017 jeppes. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class Http {

    public enum Endpoint: String {
        case exhibitors = "exhibitors"
        case events = "events"
        case news = "news"
    }

    private enum Either<A,B> {
        case Left(A)
        case Right(B)
    }

    static func get<T: Codable>(endpoint: Endpoint, type: T.Type) -> Observable<T> {
        let baseUrl = "https://ais.armada.nu/api/"
        let url = URL(string: "\(baseUrl)\(endpoint)/")!
        let request = URLRequest(url: url)
        let session = URLSession.shared

        return Observable.create { observer in
            session.dataTask(with: request) { data, response, err in
                guard let data = data else {
                    observer.onError(err!)
                    return
                }
                let result = decode(data: data, type: type)
                switch result {
                case .Right(let a):
                    observer.onNext(a)
                    observer.onCompleted()
                case .Left(let a): observer.onError(a)
                }
            }.resume()
            return Disposables.create()
        }
    }

    private static func decode<T: Codable>(data: Data, type: T.Type) -> Either<Error, T> {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(type, from: data)
            return Either.Right(result)
        } catch let e {
            return Either.Left(e)
        }
    }

}
