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
    
    var title: String {
        get { titleLabel.title ?? "" }
        set { titleLabel.title = newValue }
    }
    
    var importance: Importance {
        get { titleLabel.importance }
        set { titleLabel.importance = newValue }
    }
    
    var deadline: Date?
    var isDone: Bool = false
    
    // MARK: - UI
    
    private var checkbox: Checkbox = {
        let checkbox = Checkbox()
    
        checkbox.translatesAutoresizingMaskIntoConstraints = false
            
        return checkbox
    }()
    
    private var titleLabel: TitleLabel = {
        let titleLabel = TitleLabel()
        
//        titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    private lazy var deadlineLabel: UILabel = {                         // TODO: set font size and color
        let label = UILabel()
        label.sizeToFit()
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        label.translatesAutoresizingMaskIntoConstraints = false
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
//        addSubview(importanceImageView)
        addSubview(titleLabel)
//        addSubview(calendarImageView)
//        addSubview(deadlineLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")     // TODO: Fix it
    }
    
    // MARK: - Methods
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {

        setNeedsLayout()
        layoutIfNeeded()

        var newFrame = layoutAttributes.frame
        newFrame.size.width = (superview?.frame.size.width ?? 32) - 32   // TODO: fix optional
        newFrame.size.height = 32 + (titleLabel.frame.height > checkbox.frame.height ? titleLabel.frame.height : checkbox.frame.height)

        layoutAttributes.frame = newFrame

        return layoutAttributes
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            // checkbox
            checkbox.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkbox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            // importanceImageView
//            importanceImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
//            importanceImageView.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 12),
            
            // title label
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
            
            
            // calendarImageView
//            calendarImageView.centerYAnchor.constraint(equalTo: deadlineLabel.centerYAnchor),
//            calendarImageView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
//
//            // deadline label
//            deadlineLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
//            deadlineLabel.leadingAnchor.constraint(equalTo: calendarImageView.trailingAnchor, constant: 4),
//            deadlineLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
