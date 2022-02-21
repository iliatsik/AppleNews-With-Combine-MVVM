//
//  NetworkingService.swift
//  CombineApp
//
//  Created by Ilia Tsikelashvili on 21.02.22.
//

import Foundation
import Combine

class NetworkService {
    private let stringUrl = "https://api.opensea.io/api/v1/assets?format=json"
    
    var nftPublisher: AnyPublisher<[NFT], Error> {
        let url = URL(string: stringUrl)
        return URLSession.shared.dataTaskPublisher(for: url!)
            .map { $0.data }
            .decode(type: [NFT].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
