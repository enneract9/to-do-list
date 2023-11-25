//
//  DeadlineView.swift
//  project todolist
//
//  Created by @_@ on 24.11.2023.
//

import UIKit

class DeadlineView: UIStackView {
    
    var deadline: Date? {
        didSet {
            if let deadline = deadline {
                button.setTitle(deadline.toStringCropped, for: .normal)
                button.isHidden = false
                deadlineSwitch.isOn = true
            } else {
                button.isHidden = true
                deadlineSwitch.isOn = false
            }
        }
    }
    
    // MARK: - Subviews
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Deadline"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setTitle("-no conf-", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)             // color when highlighed?
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalCentering
        stackView.spacing = 0
        
        return stackView
    }()
    
    private let deadlineSwitch: UISwitch = {
        let dSwitch = UISwitch()
        
        return dSwitch
    }()
    
    // MARK: - Init
    init(frame: CGRect = .zero, deadline: Date? = nil) {
        super.init(frame: frame)
        self.deadline = deadline
        
        axis = .horizontal
        distribution = .equalSpacing
        alignment = .center
        
        button.addAction(buttonTapped, for: .touchUpInside)
        deadlineSwitch.addAction(deadlineSwitchChanged, for: .valueChanged)
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(button)
        self.addArrangedSubview(stackView)
        self.addArrangedSubview(deadlineSwitch)
        
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // label
            label.heightAnchor.constraint(equalToConstant: 22),
            
            // button
            button.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    private let buttonTapped = UIAction { _ in
        print("aaa")
    }
    
    private lazy var deadlineSwitchChanged = UIAction { _ in
        // set date to button ?
        
        UIView.transition(with: self.button, duration: 0.2, options: .transitionCrossDissolve) {
            self.button.isHidden = !self.deadlineSwitch.isOn
            self.button.alpha = self.deadlineSwitch.isOn ? 1 : 0
        }
    }
}
