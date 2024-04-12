//
//  UITextField+Extension.swift
//  34th-Sopt-Seminar
//
//  Created by 김진웅 on 4/5/24.
//

import UIKit

extension UITextField {
    func addPadding(left: CGFloat? = nil, right: CGFloat? = nil) {
        if let left {
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: 0))
            leftViewMode = .always
        }
        if let right {
            rightView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: 0))
            rightViewMode = .always
        }
    }
}
