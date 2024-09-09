//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension UIStackView {
    convenience init(
        _ axis: NSLayoutConstraint.Axis = .vertical,
        spacing: CGFloat = 0,
        alignment: Alignment = .fill,
        distribution: Distribution = .fill,
        @UIViewBuilder content: () -> [UIView]
    ) {
        self.init(arrangedSubviews: content())
        self.axis(axis).spacing(spacing)
            .alignment(alignment)
            .distribution(distribution)
    }

    convenience init<Items>(
        _ items: Items,
        @UIViewBuilder viewBuilder: (Items.Element, Items.Index) -> [UIView]
    ) where Items: Collection {
        let foreach = UIForEach(items, elementsBuilder: viewBuilder)
        self.init(content: { foreach })
    }

    convenience init<Items>(
        _ items: Items,
        @UIViewBuilder viewBuilder: (Items.Element) -> [UIView]
    ) where Items: Collection {
        self.init(items) { element, _ in
            viewBuilder(element)
        }
    }
}

public extension UIStackView {
    @discardableResult
    func forEach<Items>(
        _ items: Items,
        @UIViewBuilder viewBuilder: (Items.Element, Items.Index) -> [UIView]
    ) -> Self where Items: Collection {
        let foreach = UIForEach(items, elementsBuilder: viewBuilder).elements
        return add(foreach)
    }

    @discardableResult
    func forEach<Items>(
        _ items: Items,
        @UIViewBuilder viewBuilder: (Items.Element) -> [UIView]
    ) -> Self where Items: Collection {
        let foreach = UIForEach(items, elementsBuilder: viewBuilder).elements
        return add(foreach)
    }
}
