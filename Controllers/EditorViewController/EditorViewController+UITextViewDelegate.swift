//
//  EditorViewController+UITextViewDelegate.swift
//  project todolist
//
//  Created by @_@ on 09.02.2024.
//

import Foundation
import UIKit

extension EditorViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .systemGray3 {
                textView.text = nil
            textView.textColor = UIColor.label
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = TextView.placeholder
            textView.textColor = UIColor.systemGray3
        }
    }
}
