//
//  TextField.swift
//  project todolist
//
//  Created by @_@ on 23.11.2023.
//

import UIKit

class TextField: UITextField {
    
    var textPadding: UIEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        placeholder = "What do you need to do?"
        textAlignment = .natural
        contentVerticalAlignment = .top
        
        layer.cornerRadius = 16
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
