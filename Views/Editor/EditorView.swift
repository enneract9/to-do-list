//
//  EditorView.swift
//  project todolist
//
//  Created by @_@ on 22.11.2023.
//

import UIKit

final class EditorView: UIScrollView {
    
    var todoItem: TodoItem?
    
    // MARK: - Subviews
    private(set) lazy var textView: TextView = {
        let textView = TextView()
        
        if let title = todoItem?.title {
            textView.text = title
        } else {
            textView.resetPlaceHolder()
        }
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    private let propertiesView: PropertiesView = {
        let propertiesView = PropertiesView()
        
        propertiesView.translatesAutoresizingMaskIntoConstraints = false
        
        return propertiesView
    }()
    
    // MARK: - Init
    init(frame: CGRect = .zero, todoItem: TodoItem? = nil) {
        super.init(frame: frame)
        
        self.todoItem = todoItem
        
        isScrollEnabled = true
        backgroundColor = .secondarySystemBackground
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {                            // TODO: Fix it
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func addSubviews() {
        addSubview(textView)
        addSubview(propertiesView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            // textField
            textView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            textView.centerXAnchor.constraint(equalTo: centerXAnchor),
            textView.widthAnchor.constraint(equalTo: widthAnchor, constant: -32),
            textView.heightAnchor.constraint(greaterThanOrEqualToConstant: 120),
            
            // propertiesView
            propertiesView.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 16),
            propertiesView.centerXAnchor.constraint(equalTo: centerXAnchor),
            propertiesView.widthAnchor.constraint(equalTo: widthAnchor, constant: -32),
            propertiesView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
