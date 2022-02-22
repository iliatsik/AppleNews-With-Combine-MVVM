//
//  NetworkingService.swift
//  CombineApp
//
//  Created by Ilia Tsikelashvili on 21.02.22.
//

import Foundation
import Combine

class NetworkService {
    private let stringUrl = "https://newsapi.org/v2/everything?q=apple&from=2022-02-21&to=2022-02-21&sortBy=popularity&apiKey=b9f8953f632548e6bb9eaf2ce9860ba2"
    
    var newsPublisher: AnyPublisher<News, Error> {
        let url = URL(string: stringUrl)
        return URLSession.shared.dataTaskPublisher(for: url!)
            .map { $0.data }
            .decode(type: News.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
