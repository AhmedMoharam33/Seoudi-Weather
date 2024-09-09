//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public typealias UIViewBuilder = Builder<UIView>

#if canImport(SwiftUI)

    import SwiftUI

    @available(iOS 13.0.0, *)
    public extension UIViewBuilder {
        static func buildExpression(_ expression: some View) -> [Component] {
            [UIView(content: expression)]
        }
    }

#endif
