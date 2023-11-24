//
//  ImportanceView.swift
//  project todolist
//
//  Created by @_@ on 24.11.2023.
//

import UIKit

final class ImportanceView: UIStackView {
    
    // MARK: Subviews
    var importance: Importance = .usual {
        didSet {
            var index: Int
            switch importance {
            case .unimportant: index = 0
            case .usual: index = 1
            case .important: index = 2
            }
            segmentedControl.selectedSegmentIndex = index
        }
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Importance"
        
        return label
    }()
    
    private let segmentedControl: UISegmentedControl = {                    // TODO: colors
        let control = UISegmentedControl(items: ["", "usual", ""])
        control.setImage(
            UIImage(systemName: "arrow.down")?.withTintColor(.systemGray2),
            forSegmentAt: 0)
        control.setImage(
            UIImage(systemName: "exclamationmark.2")?.withTintColor(.systemRed),
            forSegmentAt: 2)
        control.selectedSegmentIndex = 1
        
        control.translatesAutoresizingMaskIntoConstraints = false
        control.widthAnchor.constraint(equalToConstant: 150).isActive = true
        control.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        return control
    }()
    
    // MARK: - Init
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        axis = .horizontal
        distribution = .equalSpacing
        alignment = .center
        
        addArrangedSubview(label)
        addArrangedSubview(segmentedControl)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
