//
//  ViewController.swift
//  CombineApp
//
//  Created by Ilia Tsikelashvili on 21.02.22.
//

import UIKit

class NewsViewController: UIViewController {
    
    private let viewModel = NewsViewModel()
    private var dataSource: NewsDataSource?
    
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

        viewModel.didFinishLoading = { [weak self] in
            guard let dataSource = self?.dataSource else { return }
            dataSource.refresh()
        }
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
