//
// BenchHR
//
// Created by ahmed moharam.

#if canImport(Combine)

    import Combine
    import Foundation

    // MARK: - CancellableBag

    public typealias CancellableBag = Set<AnyCancellable>
    public typealias CancellableKeyBag<Key> = [Key: AnyCancellable] where Key: Hashable

    // MARK: - Subject

    public typealias NeverSubject<Value> = Subject<Value, Never>
    public typealias VoidSubject = NeverSubject<Void>
    public typealias ListSubject<Value> = NeverSubject<[Value]>

    // MARK: - PassthroughSubject

    public typealias PassSubject<Value> = PassthroughSubject<Value, Never>
    public typealias ListPassSubject<Value> = PassSubject<[Value]>
    public typealias VoidPassSubject = PassSubject<Void>
    public typealias StringPassSubject = PassSubject<String>
    public typealias BoolPassSubject = PassSubject<Bool>
    public typealias IntPassSubject = PassSubject<Int>
    public typealias DoublePassSubject = PassSubject<Double>

    // MARK: - CurrentValueSubject

    public typealias ValueSubject<Value> = CurrentValueSubject<Value, Never>
    public typealias ListValueSubject<Value> = ValueSubject<[Value]>
    public typealias StringValueSubject = ValueSubject<String>
    public typealias BoolValueSubject = ValueSubject<Bool>
    public typealias IntValueSubject = ValueSubject<Int>
    public typealias DoubleValueSubject = ValueSubject<Double>

    public typealias requestHandler = (Subscribers.Completion<NSError>) -> Void
    public typealias PublisherAnyResponse = AnyPublisher<Any?, NSError>
#endif
