//
//  GlobalExtension.swift
//  APITest
//
//  Created by mac on 04.05.2022.
//

import Foundation

// Преобразует первый символ в заглавную букву
extension String {
    func firstCharOnly() -> String {
        return prefix(1).uppercased() +
        self.dropFirst()
    }
}
