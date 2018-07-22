//
//  NSRegularExpressionExtension.swift
//  Matcha
//
//  Created by Kyohei Ito on 2018/07/21.
//  Copyright © 2018年 CyberAgent, Inc. All rights reserved.
//

import Foundation

extension NSRegularExpression {
    func firstMatch(in string: String, options: NSRegularExpression.MatchingOptions = [], range: NSRange? = nil) -> NSTextCheckingResult? {
        return firstMatch(in: string, options: options, range: range ?? NSRange(location: 0, length: string.count))
    }
}
