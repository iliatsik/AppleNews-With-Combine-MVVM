//
//  NewsViewModel.swift
//  CombineApp
//
//  Created by Ilia Tsikelashvili on 21.02.22.
//

import Foundation
import Combine

class NewsViewModel {
    @Published var news = [Article]()

    var subscriber: AnyCancellable?
    
    func fetchNews() {
            subscriber = NetworkService().newsPublisher
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print(error)
                }
            },
                  receiveValue: { news in
                self.news = news.articles
            })
    }
    
}
