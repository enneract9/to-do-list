//
//  TitleStack.swift
//  project todolist
//
//  Created by @_@ on 16.02.2024.
//

import UIKit

class TitleStack: UIStackView {
    
    static let titleFontSize: CGFloat = 16
    
    var title: String? {
        get { label.text }
        set { label.text = newValue }
    }
    
    var importance: Importance = .usual {
        didSet {
            importanceImageView.image = importance.image
            importanceImageView.tintColor = importance.tintColor
            importanceImageView.isHidden = importance == .usual
        }
    }
    
    private let label: UILabel = {                                 // TODO: set font size and color
        let label = UILabel()                                      // TODO: do smt with early line breaks
        label.numberOfLines = 3
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        return label
    }()
    
    private let importanceImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        axis = .horizontal
        
        setupArrangedSubviews()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupArrangedSubviews() {
        addArrangedSubview(importanceImageView)
        addArrangedSubview(label)
    }
}
