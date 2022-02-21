//
//  ViewController.swift
//  CombineApp
//
//  Created by Ilia Tsikelashvili on 21.02.22.
//

import UIKit
import Combine

class NFTViewController: UIViewController {

    private var subscriber: AnyCancellable?
    
    private var nfts = [NFT]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NFTTableViewCell.self, forCellReuseIdentifier: String(describing: NFTTableViewCell.self))
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNFTs()
        configureTableView()
    }
    
    private func fetchNFTs() {
        subscriber = NetworkService().nftPublisher
            .sink(receiveCompletion: { _ in
            },
                  receiveValue: { nft in
                self.nfts = nft
            })
    }
    
}

extension NFTViewController { //Private functions
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
    
}

extension NFTViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NFTTableViewCell.self), for: indexPath)
//        cell.textLabel?.text = nfts[indexPath.row].assets[indexPath.row].name
        cell.textLabel?.text = "\(indexPath.row)"
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

