//
//  TodoItemCell.swift
//  project todolist
//
//  Created by @_@ on 16.11.2023.
//

import UIKit

final class TodoItemCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let reuseID = "TodoItemCell"
    static let titleFontSize: CGFloat = 16
    static let calendarFontSIze: CGFloat = 12
    
    var title: String = "Title didn't configured" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var importance: Importance = .usual {
        didSet {
            switch importance {
            case .important: importanceImageView.tintColor = .systemRed
            case .usual: {}()                                           // TODO: Make importanceImageView dissappear
            case .unimportant: importanceImageView.tintColor = .systemGray2
            }
        }
    }
    
    // TODO: Make deadline property optional - if nill - Make deadlineLabel and calendarImageView dissappear
    var deadline: String = "Deadline didn't configured" {
        didSet {
            deadlineLabel.text = deadline
        }
    }
    
    var isDone: Bool = false {
        didSet {
            checkbox.isSelected = isDone
        }
    }
    
    // MARK: - UI
    
    private lazy var checkbox: UIButton = {
        let onImage = UIImage(systemName: "checkmark.circle")?
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 24))
        let offImage = UIImage(systemName: "circle")?
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 24))
        
        let checkbox = UIButton()
        checkbox.setImage(onImage, for: .selected)
        checkbox.setImage(offImage, for: .normal)
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        
        checkbox.addAction(
            UIAction(handler: { _ in
                self.isDone.toggle()
                checkbox.isSelected = self.isDone
            }),
            for: .touchUpInside)
        
        return checkbox
    }()
    
    private lazy var titleLabel: UILabel = {                            // TODO: set font size and color
        let label = UILabel()                                           // TODO: do smt with early line breaks
        label.numberOfLines = 3
        label.text = title
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    private var importanceImageView: UIImageView = {
        let image = UIImage(systemName: "exclamationmark.2")?
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: titleFontSize + 2))
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var deadlineLabel: UILabel = {                         // TODO: set font size and color
        let label = UILabel()
        label.text = deadline
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    private var calendarImageView: UIImageView =  {
        let image = UIImage(systemName: "calendar",
                            withConfiguration: UIImage.SymbolConfiguration(pointSize: calendarFontSIze))
        let imageView = UIImageView()
        imageView.image = image
        imageView.tintColor = .systemGray2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 16
        backgroundColor = .systemBackground
        
        addSubview(checkbox)
        addSubview(importanceImageView)
        addSubview(titleLabel)
        addSubview(calendarImageView)
        addSubview(deadlineLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")     // TODO: Fix it
    }
    
    // MARK: - Methods
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        titleLabel.sizeToFit()
        deadlineLabel.sizeToFit()
        
        var newFrame = layoutAttributes.frame
        newFrame.size.width = (superview?.frame.size.width ?? 32) - 32   // TODO: fix optional
        newFrame.size.height = 16 + titleLabel.frame.height + 4 + deadlineLabel.frame.height + 16
        layoutAttributes.frame = newFrame
        
        return layoutAttributes
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            // checkbox
            checkbox.centerYAnchor.constraint(equalTo: centerYAnchor),
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
