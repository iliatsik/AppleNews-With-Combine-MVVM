//
//  ViewController.swift
//  CombineApp
//
//  Created by Ilia Tsikelashvili on 21.02.22.
//

import UIKit

class NFTViewController: UIViewController {
    
    private let viewModel = NFTViewModel()
    private var dataSource: NFTDataSource?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NFTTableViewCell.self, forCellReuseIdentifier: String(describing: NFTTableViewCell.self))
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchNFTs()

        configureTableView()
        configureDataSource()
    }
}

extension NFTViewController { //Private functions
    
    private func configureTableView() {
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
    
    private func configureDataSource() {
        dataSource = NFTDataSource(with: tableView, viewModel: viewModel)
    }
}
