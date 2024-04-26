//
//  UIColor+Extension.swift
//  34th-Sopt-Seminar
//
//  Created by 김진웅 on 4/20/24.
//

import UIKit

extension UIColor {
    enum GrayScale {
        case hex_626262, hex_9C9C9C, hex_ACB0B9, hex_DDDEE3
        
        var color: UIColor {
            switch self {
            case .hex_626262:
                return .gray500
            case .hex_9C9C9C:
                return .gray400
            case .hex_ACB0B9:
                return .gray300
            case .hex_DDDEE3:
                return .gray200
            }
        }
    }
    
    static func grayScale(_ scale: GrayScale) -> UIColor {
        return scale.color
    }
}
