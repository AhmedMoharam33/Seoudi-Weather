//
// BenchHR
//
// Created by ahmed moharam.

import Foundation

@resultBuilder
public struct Builder<Component> {
    public static func buildBlock(_ components: Component...) -> [Component] {
        components
    }

    public static func buildBlock(_ components: [Component]...) -> [Component] {
        components.flatMap { $0 }
    }

    public static func buildEither(first component: [Component])
        -> [Component]
    {
        component
    }

    public static func buildEither(second component: [Component])
        -> [Component]
    {
        component
    }

    public static func buildOptional(_ component: [Component]?) -> [Component] {
        component ?? []
    }

    public static func buildExpression(_ expression: Component) -> [Component] {
        [expression]
    }

    public static func buildExpression(_ expression: [Component])
        -> [Component]
    {
        expression
    }

    public static func buildArray(_ components: [[Component]]) -> [Component] {
        components.flatMap { $0 }
    }
}

public extension Builder {
    static func buildExpression<Expression>(_ expression: Expression)
        -> [Component] where Expression: Collection,
        Expression.Element == Component
    {
        expression.map { $0 }
    }
}
