//
//  CustomCell.swift
//  project todolist
//
//  Created by @_@ on 16.11.2023.
//

import UIKit

final class CustomCell: UICollectionViewCell {
    static let reuseID = "CustomCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title didn't set"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderColor = UIColor.systemGray5.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        
        backgroundColor = .white
        addSubview(titleLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            // title label
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
