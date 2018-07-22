//
//  Matcha.swift
//  Matcha
//
//  Created by Kyohei Ito on 2018/05/07.
//  Copyright © 2018年 CyberAgent, Inc. All rights reserved.
//

import Foundation

public struct Matcha: Equatable {
    /// value of key
    /// - Parameter key: key of the value you want to retrieve.
    /// - Returns: value of key
    public subscript(_ key: String) -> String? {
        return value(of: key)
    }

    /// value of index
    /// - Parameter key: index of the value you want to retrieve.
    /// - Returns: value of index
    public subscript(_ index: Int) -> String? {
        return value(at: index)
    }

    private let values: [String: String]
    private let list: [String]
    /// url that is set
    public let url: URL

    /// value of key
    /// - Parameter key: key of the value you want to retrieve.
    /// - Returns: value of key
    public func value(of key: String) -> String? {
        return values[key]
    }

    /// value of index
    /// - Parameter key: index of the value you want to retrieve.
    /// - Returns: value of index
    public func value(at index: Int) -> String? {
        return list[safe: index]
    }

    public func matched(_ pattern: String) -> Matcha? {
        return Matcha(url: url, pattern: pattern)
    }

    /// initialize the matcher
    /// - Parameter url: target url
    public init(url: URL) {
        self.url = url
        self.values = [:]
        self.list = []
    }

    /// initialize the matcher
    /// - Parameter url: target url
    /// - Parameter pattern: url path pattern using `{` and `}`
    ///
    /// e.g.
    /// let url = URL(string: "https://example.com/path/to/glory")!
    /// Matcha(url: url, pattern: "https://example.com/")               // is `nil`
    /// Matcha(url: url, pattern: "https://example.com/path/to/glory")  // is not `nil`
    /// Matcha(url: url, pattern: "/path/to/glory")                     // is not `nil`
    /// Matcha(url: url, pattern: "/{A}/{B}/{C}/")                      // is not `nil`, can access to value
    /// Matcha(url: url, pattern: "/{A}/{B}/{C}/")?.value(at: 1)        // is `to`
    /// Matcha(url: url, pattern: "/{A}/{B}/{C}/")?.value(of: "C")      // is `glory`
    public init?(url: URL, pattern: String) {
        let isPath = pattern.first == "/"
        let patternUrl = isPath ? "dummy\(pattern)" : pattern

        guard let schemeRegex = try? NSRegularExpression(pattern: "[^https?:\\/\\/].+") else { return nil }
        guard let matched = schemeRegex.firstMatch(in: patternUrl) else { return nil }

        let paths = (patternUrl as NSString).substring(with: matched.range(at: 0)).split(separator: "/").map(String.init)

        guard (url.host == paths.first || isPath) && (url.pathComponents.count == paths.count || (url.pathComponents.isEmpty && paths.count == 1)) else { return nil }

        var values: [String: String] = [:]
        var list: [String] = []

        guard let pathRegex = try? NSRegularExpression(pattern: "^\\{(.+?)\\}$") else { return nil }
        for (pattern, path) in zip(paths, url.pathComponents) {
            if pattern == path || path == "/" {
                continue
            }

            if let matched = pathRegex.firstMatch(in: pattern) {
                values[(pattern as NSString).substring(with: matched.range(at: 1))] = path
                list.append(path)
            } else {
                return nil
            }
        }

        self.url = url
        self.values = values
        self.list = list
    }
}
