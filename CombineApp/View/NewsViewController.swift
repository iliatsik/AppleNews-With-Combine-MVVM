//
//  ViewController.swift
//  CombineApp
//
//  Created by Ilia Tsikelashvili on 21.02.22.
//

import UIKit
import Combine

class NewsViewController: UIViewController {
    
    private let viewModel = NewsViewModel()
    private var dataSource: NewsDataSource?
    private var subscriber = Set<AnyCancellable>()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: String(describing: NewsTableViewCell.self))
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchNews()
        addBindings()
        configureTableView()
        configureDataSource()
    }
    
    private func addBindings() {
           viewModel.$news
            .sink(receiveValue: { [weak self] _ in
                DispatchQueue.main.async {
                    guard let dataSource = self?.dataSource else { return }
                    dataSource.refresh()
                }
            }).store(in: &subscriber)
    }
}

extension NewsViewController { //Private functions
    
    private func configureTableView() {
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
    
    private func configureDataSource() {
        dataSource = NewsDataSource(with: tableView, viewModel: viewModel)
    }
}
