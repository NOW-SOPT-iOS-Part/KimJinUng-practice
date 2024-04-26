//
//  ReuseIdentifiable.swift
//  34th-Sopt-Seminar
//
//  Created by 김진웅 on 4/20/24.
//

import Foundation

protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String { return String(describing: Self.self) }
}
