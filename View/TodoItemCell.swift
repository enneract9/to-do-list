//
//  TodoItemCell.swift
//  project todolist
//
//  Created by @_@ on 16.11.2023.
//

import UIKit

final class TodoItemCell: UICollectionViewCell {
    static let reuseID = "TodoItemCell"
    static let titleFontSize: CGFloat = 16
    static let calendarFontSIze: CGFloat = 12
    
    //forces the system to do only one layout pass
    private var isHeightCalculated: Bool = false
    
    var checkbox: UIButton = {
        let onImage = UIImage(systemName: "checkmark.circle")?
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 22))
        let offImage = UIImage(systemName: "circle")?
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 22))
        
        let checkbox = UIButton()
        checkbox.setImage(onImage, for: .selected)
        checkbox.setImage(offImage, for: .normal)
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        return checkbox
    }()
    
    var titleLabel: UILabel = {                                     // TODO: set font size and color
        let label = UILabel()
        label.text = "Title didn't configured Title didn't configured" // Title didn't configured Title didn't configured Title didn't configured Title didn't configured"
        label.numberOfLines = 3
//        label.textAlignment = .justified                            // TODO: do smt with line breaks
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var importanceImageView: UIImageView = {
        let image = UIImage(systemName: "exclamationmark.2")?
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: titleFontSize + 2))
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.tintColor = .systemBlue   // did not configured cell importance state
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var deadlineLabel: UILabel = {  // TODO: set font size and color
        let label = UILabel()
        label.text = "Date didn't configured"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var calendarImageView: UIImageView =  {
        let image = UIImage(systemName: "calendar",
                            withConfiguration: UIImage.SymbolConfiguration(pointSize: calendarFontSIze))
        let imageView = UIImageView()
        imageView.image = image
        imageView.tintColor = .systemGray2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 16
        backgroundColor = .tertiarySystemFill
        
        addSubview(checkbox)
        addSubview(importanceImageView)
        addSubview(titleLabel)
        addSubview(calendarImageView)
        addSubview(deadlineLabel)
//        importanceImageView.isHidden = true // TODO: How to make allocated space for hidden view dissappaer?
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        titleLabel.sizeToFit()
        deadlineLabel.sizeToFit()
        var newFrame = layoutAttributes.frame
        newFrame.size.width = (superview?.frame.size.width ?? 30) - 32   // TODO: fix optional
        newFrame.size.height = 16 + titleLabel.frame.height + 4 + deadlineLabel.frame.height + 16
        layoutAttributes.frame = newFrame
        isHeightCalculated = true

        return layoutAttributes
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            // checkbox
            checkbox.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            checkbox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            // importanceImageView
            importanceImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            importanceImageView.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 12),
            
            // title label
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: importanceImageView.trailingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            // calendarImageView
            calendarImageView.centerYAnchor.constraint(equalTo: deadlineLabel.centerYAnchor),
            calendarImageView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            // deadline label
            deadlineLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            deadlineLabel.leadingAnchor.constraint(equalTo: calendarImageView.trailingAnchor, constant: 4),
            deadlineLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
