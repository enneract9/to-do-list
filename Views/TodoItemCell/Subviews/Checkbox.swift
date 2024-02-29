//
//  Checkbox.swift
//  project todolist
//
//  Created by @_@ on 13.02.2024.
//

import UIKit

class Checkbox: UIButton {

    // MARK: Properties
    private let selectedImage = UIImage(systemName: "checkmark.circle")?
        .withConfiguration(UIImage.SymbolConfiguration(pointSize: 24))
    
    private let normalImage = UIImage(systemName: "circle")?
        .withConfiguration(UIImage.SymbolConfiguration(pointSize: 24))
    
    var seletedColor: UIColor = .systemGray3
    
    var normalColor: UIColor = .systemBlue
    
    override var isSelected: Bool {
        didSet {
            tintColor = isSelected ? seletedColor : normalColor
        }
    }
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        tintColor = normalColor
        
        setImage(selectedImage, for: .selected)
        setImage(normalImage, for: .normal)
        
        addAction(UIAction(handler: { _ in
            self.isSelected.toggle()
        }), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
