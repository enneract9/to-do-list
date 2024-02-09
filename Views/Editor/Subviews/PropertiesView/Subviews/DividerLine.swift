//
//  DividerLine.swift
//  project todolist
//
//  Created by @_@ on 25.11.2023.
//

import UIKit

class DividerLine: UIView {
    
    init() {
        let frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 5))
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
