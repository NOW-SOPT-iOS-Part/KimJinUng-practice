//
//  Then.swift
//  34th-Sopt-Seminar
//
//  Created by 김진웅 on 4/5/24.
//

import Foundation

protocol Then {}

extension Then where Self: Any {
    @inlinable
    func with(_ action: (inout Self) -> Void) -> Self {
        var temp = self
        action(&temp)
        return temp
    }
}

extension Then where Self: AnyObject {
    @inlinable
    func then(_ action: (Self) -> Void) -> Self {
        action(self)
        return self
    }
}

extension NSObject: Then {}
