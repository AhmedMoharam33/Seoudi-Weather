//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension UIView {
    struct SafeAreaEdges: OptionSet {
        public typealias RawValue = UInt

        public let rawValue: UInt

        public init(rawValue: RawValue) {
            self.rawValue = rawValue
        }

        public static let top = SafeAreaEdges(rawValue: 1 << 0)
        public static let leading = SafeAreaEdges(rawValue: 1 << 1)
        public static let bottom = SafeAreaEdges(rawValue: 1 << 2)
        public static let trailing = SafeAreaEdges(rawValue: 1 << 3)

        public static let none: SafeAreaEdges = []
        public static let all: SafeAreaEdges = [
            .top,
            .leading,
            .bottom,
            .trailing,
        ]
        public static let vertical: SafeAreaEdges = [.top, .bottom]
        public static let horizontal: SafeAreaEdges = [.leading, .trailing]
    }
}
