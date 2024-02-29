//
//  DeadlineStack.swift
//  project todolist
//
//  Created by @_@ on 29.02.2024.
//

import UIKit

class DeadlineStack: UIStackView {
    
    static let calendarFontSize: CGFloat = 12
    static let labelFontSize: CGFloat = 15
    
    var deadline: Date? {
        didSet { deadlineLabel.text = deadline?.toStringCropped }
    }
    
    private let deadlineLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: labelFontSize)
        
        return label
    }()
    
    private let calendarImageView: UIImageView =  {
        let image = UIImage(systemName: "calendar",
                            withConfiguration: UIImage.SymbolConfiguration(pointSize: calendarFontSize))
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.tintColor = .systemGray2
        
        imageView.setContentHuggingPriority(.defaultHigh, for: .vertical)
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
        addArrangedSubview(calendarImageView)
        addArrangedSubview(deadlineLabel)
    }
}
