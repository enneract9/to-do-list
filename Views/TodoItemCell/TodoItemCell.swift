//
//  TodoItemCell.swift
//  project todolist
//
//  Created by @_@ on 16.11.2023.
//

import UIKit

final class TodoItemCell: UICollectionViewCell {
    
    // MARK: Properties
    
    static let reuseID = "TodoItemCell"
    static let titleFontSize: CGFloat = 16
    static let calendarFontSIze: CGFloat = 12
    
    var title: String? {
        get { titleStack.title }
        set { titleStack.title = newValue }
    }
    
    var importance: Importance {
        get { titleStack.importance }
        set { titleStack.importance = newValue }
    }
    
    var deadline: Date? {
        get { deadlineStack.deadline }
        set {
            deadlineStack.deadline = newValue
            deadlineStack.isHidden = newValue == nil
        }
    }
    
    var isDone: Bool {
        get { checkbox.isSelected }
        set { checkbox.isSelected = newValue }
    }
    
    // MARK: UI
    
    private let checkbox: Checkbox = {
        let checkbox = Checkbox()
        
        checkbox.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    
        checkbox.translatesAutoresizingMaskIntoConstraints = false
            
        return checkbox
    }()
    
    private let titleStack: TitleStack = {
        let titleStack = TitleStack()
        
//        titleStack.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        titleStack.translatesAutoresizingMaskIntoConstraints = false
        
        return titleStack
    }()
    
    private let deadlineStack: DeadlineStack = {
        let deadlineStack = DeadlineStack()
        
        deadlineStack.translatesAutoresizingMaskIntoConstraints = false
        
        return deadlineStack
    }()
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 16
        backgroundColor = .systemBackground
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: Methods
    
    private func addSubviews() {
        addSubview(checkbox)
        addSubview(titleStack)
        addSubview(deadlineStack)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            // checkbox
            checkbox.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkbox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            checkbox.widthAnchor.constraint(equalToConstant: 28),
            checkbox.heightAnchor.constraint(equalToConstant: 28),
            
//             titleStack
            titleStack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleStack.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 4),
            titleStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
//             deadlineStack
            deadlineStack.topAnchor.constraint(equalTo: titleStack.bottomAnchor),
            deadlineStack.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 4),
            deadlineStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
