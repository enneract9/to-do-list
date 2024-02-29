//
//  DeadlineStack.swift
//  project todolist
//
//  Created by @_@ on 29.02.2024.
//

import UIKit

class DeadlineStack: UIStackView {
    
    static let calendarFontSize: CGFloat = 12
    
    var deadline: Date? {
        didSet { deadlineLabel.text = deadline?.toStringCropped }
    }
    
    private let deadlineLabel: UILabel = {                         // TODO: set font size and color
        let label = UILabel()
//        label.sizeToFit()
//        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
//        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let calendarImageView: UIImageView =  {
        let image = UIImage(systemName: "calendar",
                            withConfiguration: UIImage.SymbolConfiguration(pointSize: calendarFontSize))
        let imageView = UIImageView()
        imageView.image = image
        imageView.tintColor = .systemGray2
        
//        imageView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
//        imageView.translatesAutoresizingMaskIntoConstraints = false
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
