//
//  ArrayExtension.swift
//  Matcha
//
//  Created by Kyohei Ito on 2018/07/21.
//  Copyright © 2018年 CyberAgent, Inc. All rights reserved.
//

extension Array {
    subscript(safe index: Int) -> Element? {
        indices ~= index ? self[index] : nil
    }
}
