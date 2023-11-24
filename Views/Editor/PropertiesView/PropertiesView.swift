//
//  PropertiesView.swift
//  project todolist
//
//  Created by @_@ on 24.11.2023.
//

import UIKit

class PropertiesView: UIStackView {
    
    private let subviewsPadding: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        isLayoutMarginsRelativeArrangement = true
        directionalLayoutMargins = subviewsPadding
        
        axis = .vertical
        distribution = .equalSpacing
        spacing = 1                                             // ? на что влияет ?
        
        setupArrangedSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupArrangedSubviews() {
        addArrangedSubview(ImportanceView())
    }
}
