//
//  NewsTableViewCell.swift
//  CombineApp
//
//  Created by Ilia Tsikelashvili on 21.02.22.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {
    
    let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        return label
    }()
    
    let descript: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureImage()
        configureLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureImage() {
        contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: contentView.frame.size.width / 2.5),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ])
    }
    
    private func configureLabels() {
        contentView.addSubview(descript)
        contentView.addSubview(name)
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 24),
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            descript.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 24),
            descript.topAnchor.constraint(equalTo: name.topAnchor, constant: 24),
            descript.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            descript.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ])
    }
    
    func configure(imageURL: String, nameTitle: String, descriptionTitle: String) {
        image.kf.setImage(with: URL(string: imageURL))
        name.text = nameTitle
        descript.text = descriptionTitle
    }
}
