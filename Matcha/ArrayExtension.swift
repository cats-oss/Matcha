//
//  ArrayExtension.swift
//  Matcha
//
//  Created by Kyohei Ito on 2018/07/21.
//  Copyright © 2018年 CyberAgent, Inc. All rights reserved.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
