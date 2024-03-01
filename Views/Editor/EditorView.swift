//
//  EditorView.swift
//  project todolist
//
//  Created by @_@ on 22.11.2023.
//

import UIKit

final class EditorView: UIScrollView {
    
    // MARK: - Properties
    var title: String? {
        didSet {
            if let title = title {
                textView.text = title
            } else {
                textView.resetPlaceHolder()
            }
        }
    }
    
    var importance: Importance? {
        didSet {
            if let importance = importance {
                propertiesView.importance = importance
            }
        }
    }
    
    var deadline: Date? {
        didSet {
            propertiesView.deadline = deadline
        }
    }
    
    // MARK: - Subviews
    private(set) var textView: TextView = {
        let textView = TextView()
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    private let propertiesView: PropertiesView = {
        let propertiesView = PropertiesView()
        
        propertiesView.translatesAutoresizingMaskIntoConstraints = false
        
        return propertiesView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isScrollEnabled = true
        backgroundColor = .secondarySystemBackground
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
