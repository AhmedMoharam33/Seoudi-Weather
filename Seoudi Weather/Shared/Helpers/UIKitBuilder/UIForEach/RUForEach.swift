//
// BenchHR
//
// Created by ahmed moharam.

import Foundation

public struct RUForEach<Element>: Collection {
    public typealias Element = Element
    public typealias Index = Int

    public private(set) var elements: [Element] = []
    public var startIndex: Index { elements.startIndex }
    public var endIndex: Index { elements.endIndex }

    public func index(after i: Int) -> Index {
        elements.index(after: i)
    }

    public subscript(position: Int) -> Element {
        elements[position]
    }

    public init(elements: [Element]) {
        self.elements = elements
    }

    public init(forEach: RUForEach<Element>) {
        elements = forEach.elements
    }

    public init(@Builder<Element> elementsBuilder: () -> [Element]) {
        elements = elementsBuilder()
    }

    public init<Items>(
        _ items: Items,
        @Builder<Element> elementsBuilder: (Items.Element, Items.Index)
            -> [Element]
    ) where Items: Collection {
        var _elements: [Element] = []
        for (index, item) in zip(items.indices, items) {
            _elements.append(contentsOf: elementsBuilder(item, index))
        }
        elements = _elements
    }

    public init<Items>(
        _ items: Items,
        @Builder<Element> elementsBuilder: (Items.Element) -> [Element]
    ) where Items: Collection {
        self.init(items) { (element, _: Items.Index) in
            elementsBuilder(element)
        }
    }
}
