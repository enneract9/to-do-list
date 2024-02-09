//
//  PropertiesView.swift
//  project todolist
//
//  Created by @_@ on 24.11.2023.
//

import UIKit

final class PropertiesView: UIStackView {
    
    private let subviewsPadding: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
    
    // MARK: - Arranged subviews
    private let importanceView: ImportanceView = {
        let importanceView = ImportanceView()
        importanceView.translatesAutoresizingMaskIntoConstraints = false
        importanceView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        return importanceView
    }()
    
//    private let divider: DividerLine = {
//        let divider = DividerLine()
//
//
//        return divider
//    }()
    
    private let deadlineView: DeadlineView = {
        let deadlineView = DeadlineView()
        deadlineView.translatesAutoresizingMaskIntoConstraints = false
        deadlineView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        return deadlineView
    }()
    
    // MARK: - Init
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        isLayoutMarginsRelativeArrangement = true
        directionalLayoutMargins = subviewsPadding
        
        axis = .vertical
        distribution = .equalSpacing
        spacing = 0
        
        setupArrangedSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupArrangedSubviews() {
        addArrangedSubview(importanceView)
//        addArrangedSubview(divider)
        addArrangedSubview(deadlineView)
    }
}
