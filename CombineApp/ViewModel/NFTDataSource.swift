//
//  NFTDataSource.swift
//  CombineApp
//
//  Created by Ilia Tsikelashvili on 21.02.22.
//

import UIKit

class NFTDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    init(with tableView: UITableView, viewModel: NFTViewModel) {
        self.tableView = tableView
        self.viewModel = viewModel
        super.init()
        self.tableView.dataSource = self
        self.tableView.delegate   = self
        self.tableView.backgroundColor = .white
    }
    
    private var tableView: UITableView
    private var viewModel: NFTViewModel
    
    func refresh() {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NFTTableViewCell.self), for: indexPath) as? NFTTableViewCell else { return UITableViewCell() }
        cell.configure(imageURL: "",
                       nameTitle: "Swift is new programming language for iOS, macOS, watchOS, and tvOS app development. Nonetheless, many parts of Swift will be familiar from your experience of developing in C and Objective-C.",
                       descriptionTitle: "Swift is a new programming language for iOS, macOS, watchOS, and tvOS app development. Nonetheless, many parts of Swift will be familiar from your experience of developing in C and Objective-C. Swift provides its own versions of all fundamental C and Objective-C types")
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }

}
