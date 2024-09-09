//
// BenchHR
//
// Created by ahmed moharam.

import Combine
import Foundation
import UIKit

public extension Set where Element == AnyCancellable {
    static func += (lhs: inout Set<AnyCancellable>, rhs: AnyCancellable) {
        lhs.insert(rhs)
    }
}

// MARK: - Just a Marker Protocol will be used in extension files for ui elements with uikit components

public protocol CombineCompatible { }

extension UIControl: CombineCompatible { }

public extension CombineCompatible where Self: UIControl {
    func publisher(for events: UIControl.Event) -> UIControlPublisher<UIControl> {
        return UIControlPublisher(control: self, events: events)
    }
}

public class UIControlSubscription<SubscriberType: Subscriber, Control: UIControl>: Subscription
    where SubscriberType.Input == Control
{
    private var subscriber: SubscriberType?
    private let control: Control

    init(subscriber: SubscriberType, control: Control, event: UIControl.Event) {
        self.subscriber = subscriber
        self.control = control
        control.addTarget(self, action: #selector(eventHandler), for: event)
    }

    public func request(_: Subscribers.Demand) {
        // We do nothing here as we only want to send events when they occur.
    }

    public func cancel() {
        subscriber = nil
    }

    @objc
    private func eventHandler() {
        _ = subscriber?.receive(control)
    }
}

public struct UIControlPublisher<Control: UIControl>: Publisher {
    public typealias Output = Control
    public typealias Failure = Never

    let control: Control
    let controlEvents: UIControl.Event

    init(control: Control, events: UIControl.Event) {
        self.control = control
        controlEvents = events
    }

    public func receive<S>(subscriber: S) where S: Subscriber,
        S.Failure == UIControlPublisher.Failure,
        S.Input == UIControlPublisher.Output
    {
        let subscription = UIControlSubscription(
            subscriber: subscriber,
            control: control,
            event: controlEvents
        )
        subscriber.receive(subscription: subscription)
    }
}

// MARK: - Gesture Publisher

public enum GestureType {
    case tap(UITapGestureRecognizer = .init())
    case swipe(UISwipeGestureRecognizer = .init())
    case longPress(UILongPressGestureRecognizer = .init())
    case pan(UIPanGestureRecognizer = .init())
    case pinch(UIPinchGestureRecognizer = .init())
    case edge(UIScreenEdgePanGestureRecognizer = .init())

    func get() -> UIGestureRecognizer {
        switch self {
        case let .tap(tapGesture):
            return tapGesture
        case let .swipe(swipeGesture):
            return swipeGesture
        case let .longPress(longPressGesture):
            return longPressGesture
        case let .pan(panGesture):
            return panGesture
        case let .pinch(pinchGesture):
            return pinchGesture
        case let .edge(edgePanGesture):
            return edgePanGesture
        }
    }
}

public struct GesturePublisher: Publisher {
    public typealias Output = GestureType
    public typealias Failure = Never

    private let view: UIView
    private let gestureType: GestureType

    init(view: UIView, gestureType: GestureType) {
        self.view = view
        self.gestureType = gestureType
        self.view.isUserInteractionEnabled = true
    }

    public func receive<S>(subscriber: S) where S: Subscriber,
        GesturePublisher.Failure == S.Failure,
        GesturePublisher.Output == S.Input
    {
        let subscription = GestureSubscription(
            subscriber: subscriber,
            view: view,
            gestureType: gestureType
        )
        subscriber.receive(subscription: subscription)
    }
}

public class GestureSubscription<S: Subscriber>: Subscription where S.Input == GestureType,
    S.Failure == Never
{
    private var subscriber: S?
    private var gestureType: GestureType
    private var view: UIView

    init(subscriber: S, view: UIView, gestureType: GestureType) {
        self.subscriber = subscriber
        self.view = view
        self.gestureType = gestureType
        configureGesture(gestureType)
    }

    private func configureGesture(_ gestureType: GestureType) {
        let gesture = gestureType.get()
        gesture.addTarget(self, action: #selector(handler))
        view.addGestureRecognizer(gesture)
    }

    public func request(_: Subscribers.Demand) { }

    public func cancel() {
        subscriber = nil
    }

    @objc
    private func handler() {
        _ = subscriber?.receive(gestureType)
    }
}

public extension Publisher {
    /// Includes the current element as well as the previous element from the upstream publisher in
    /// a tuple where the
    /// previous element is optional.
    /// The first time the upstream publisher emits an element, the previous element will be `nil`.
    ///
    ///     let range = (1...5)
    ///     cancellable = range.publisher
    ///         .withPrevious()
    ///         .sink { print ("(\($0.previous), \($0.current))", terminator: " ") }
    ///      // Prints: "(nil, 1) (Optional(1), 2) (Optional(2), 3) (Optional(3), 4) (Optional(4),
    /// 5) ".
    ///
    /// - Returns: A publisher of a tuple of the previous and current elements from the upstream
    /// publisher.
    func withPrevious() -> AnyPublisher<(previous: Output?, current: Output), Failure> {
        scan((Output?, Output)?.none) { ($0?.1, $1) }
            .compactMap { $0 }
            .eraseToAnyPublisher()
    }
}

// MARK: - UIView

public extension UIView {
    func tapGesture(_ gestureType: GestureType = .tap()) ->
        GesturePublisher
    {
        .init(view: self, gestureType: gestureType)
    }
}

// MARK: - UITextField

public extension UITextField {
    var textPublisher: AnyPublisher<String, Never> {
        publisher(for: .editingChanged)
            .map { _ in self.text ?? "" } // mapping UITextField to extract text
            .eraseToAnyPublisher()
    }
}

// MARK: - UITextView

public extension UITextView {
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextView.textDidChangeNotification, object: self)
            .map { ($0.object as? UITextView)?.text ?? "" }
            .eraseToAnyPublisher()
    }
}
