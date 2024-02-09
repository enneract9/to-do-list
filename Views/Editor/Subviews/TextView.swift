//
//  TextView.swift
//  project todolist
//
//  Created by @_@ on 23.11.2023.
//

import UIKit

final class TextView: UITextView {
    
    var textPadding: UIEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    
    static var placeholder = "What do you need to do?"
    
    override init(frame: CGRect = .zero, textContainer: NSTextContainer? = nil) {
        super.init(frame: frame, textContainer: textContainer)
        
        isScrollEnabled = false
        textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layer.cornerRadius = 16
        font = .systemFont(ofSize: 17)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func resetPlaceHolder() {
        text = TextView.placeholder
        textColor = UIColor.systemGray3
    }
}
