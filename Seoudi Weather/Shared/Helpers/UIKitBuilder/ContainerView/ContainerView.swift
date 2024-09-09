//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

open class ContainerView: UIView {
    public init(
        content: UIView,
        safeArea: SafeAreaEdges = .none,
        padding: UIEdgeInsets = .zero
    ) {
        super.init(frame: .zero)
        content.add(to: self)
            .fillSuperview(safeArea: safeArea, insets: padding)
    }

    public convenience init(
        safeArea: SafeAreaEdges = .none,
        padding: UIEdgeInsets = .zero,
        content: () -> UIView
    ) {
        self.init(content: content(), safeArea: safeArea, padding: padding)
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
