//
//  UIView+Extension.swift
//  34th-Sopt-Seminar
//
//  Created by 김진웅 on 4/5/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
