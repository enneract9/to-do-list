//
//  EditorView.swift
//  project todolist
//
//  Created by @_@ on 22.11.2023.
//

import UIKit

final class EditorView: UIScrollView {
    
    // MARK: - Subviews
    private let textField: TextField = {
        let textField = TextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let propertiesView: PropertiesView = {
        let propertiesView = PropertiesView()
        propertiesView.translatesAutoresizingMaskIntoConstraints = false
        
        return propertiesView
    }()
    
    // MARK: - Init
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        backgroundColor = .secondarySystemBackground
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func addSubviews() {
        addSubview(textField)
        addSubview(propertiesView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            // textField
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            textField.centerXAnchor.constraint(equalTo: centerXAnchor),
            textField.widthAnchor.constraint(equalTo: widthAnchor, constant: -32),
            textField.heightAnchor.constraint(greaterThanOrEqualToConstant: 120),
            
            // propertiesView
            propertiesView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            propertiesView.centerXAnchor.constraint(equalTo: centerXAnchor),
            propertiesView.widthAnchor.constraint(equalTo: widthAnchor, constant: -32),
            
        ])
    }
}
