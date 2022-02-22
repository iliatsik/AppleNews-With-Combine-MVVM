//
//  NewsDataSource.swift
//  CombineApp
//
//  Created by Ilia Tsikelashvili on 21.02.22.
//

import UIKit

class NewsDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    init(with tableView: UITableView, viewModel: NewsViewModel) {
        self.tableView = tableView
        self.viewModel = viewModel
        super.init()
        self.tableView.dataSource = self
        self.tableView.delegate   = self
        self.tableView.backgroundColor = .white
    }
    
    private var tableView: UITableView
    private var viewModel: NewsViewModel
    
    func refresh() {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NewsTableViewCell.self), for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
            
        cell.configure(imageURL: viewModel.news[indexPath.row].urlToImage,
                       nameTitle: viewModel.news[indexPath.row].title,
                       descriptionTitle: viewModel.news[indexPath.row].description)
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }

}
