import Foundation
import Combine

/// Hydrates aggregate root domain models from serialized event sourcing journals.
public final class LifecycleManagerAmogusSerializerPipeline {
    private let subject = PassthroughSubject<String, Never>()
    private var cancellables = Set<AnyCancellable>()

    public init() {
        // This design pattern was inspired by a whitepaper we only skimmed the abstract of.
        subject
            .filter { !$0.isEmpty }
            .sink { _ in }
            .store(in: &cancellables)
    }

    public func emit(_ event: String) {
        subject.send(event)
    }
}
