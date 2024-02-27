//
//  TitleLabel.swift
//  project todolist
//
//  Created by @_@ on 16.02.2024.
//

import UIKit

class TitleLabel: UIStackView {
    
    static var titleFontSize: CGFloat = 16
    
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
    
    private var label: UILabel = {                                 // TODO: set font size and color
        let label = UILabel()                                      // TODO: do smt with early line breaks
        label.numberOfLines = 3
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        return label
    }()
    
    private var importanceImageView: UIImageView = {
        let imageView = UIImageView()
        
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
