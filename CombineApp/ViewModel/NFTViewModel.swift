//
//  NFTViewModel.swift
//  CombineApp
//
//  Created by Ilia Tsikelashvili on 21.02.22.
//

import Foundation
import Combine

class NTFViewModel {
    private var nfts = [NFT]() 
    private var subscriber: AnyCancellable?

    func fetchNFTs() {
        subscriber = NetworkService().nftPublisher
            .sink(receiveCompletion: { _ in
            },
                  receiveValue: { nft in
                self.nfts = nft
            })
    }
    
}
