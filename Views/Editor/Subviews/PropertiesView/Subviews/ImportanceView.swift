//
//  ImportanceView.swift
//  project todolist
//
//  Created by @_@ on 24.11.2023.
//

import UIKit

final class ImportanceView: UIStackView {
    
    // MARK: - Properties
    var importance: Importance = .usual {
        didSet {
            segmentedControl.selectedSegmentIndex = importance.rawValue
        }
    }
    
    // MARK: Subviews
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Importance"
        
        return label
    }()
    
    private var segmentedControl: UISegmentedControl = {                    // TODO: colors
        let arrow = UIAction(image: UIImage(systemName: "arrow.down")?.withTintColor(.cyan)) { _ in print("aaaa")}
        let control = UISegmentedControl(items: [
            arrow,
            "usual",
            UIImage(systemName: "exclamationmark.2")!.withTintColor(.systemRed)  // TODO: !!!
        ])
        
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
