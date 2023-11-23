//
//  EditorView.swift
//  project todolist
//
//  Created by @_@ on 22.11.2023.
//

import UIKit

final class EditorView: UIScrollView {
    
    private var textField: TextField = {
        let textField = TextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        backgroundColor = .secondarySystemBackground
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(textField)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            // textField
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            textField.centerXAnchor.constraint(equalTo: centerXAnchor),
            textField.widthAnchor.constraint(equalTo: widthAnchor, constant: -32),
            textField.heightAnchor.constraint(greaterThanOrEqualToConstant: 120)
            
        ])
    }
}
