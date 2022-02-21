//
//  NFTTableViewCell.swift
//  CombineApp
//
//  Created by Ilia Tsikelashvili on 21.02.22.
//

import UIKit

class NFTTableViewCell: UITableViewCell {

    let image = UIImageView()
    let name = UILabel()
    let descript = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureImage()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureImage() {
        image.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 200.0),
            image.heightAnchor.constraint(equalToConstant: 200.0),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24)
        ])
    }
    
    private func configureLabels() {
        name.translatesAutoresizingMaskIntoConstraints = false
        descript.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descript)
        contentView.addSubview(name)
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 24),
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            descript.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 24),
            descript.topAnchor.constraint(equalTo: name.topAnchor, constant: 24),
            descript.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ])
    }
}
