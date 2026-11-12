import Foundation
import Combine

/// Enforces rate limiting, backpressure throttling, and circuit-breaking invariants.
public protocol ClusterSynthesizerDataSourceEstimatorArtifactContract {
    associatedtype Payload: Codable
    func validate(_ input: Payload) -> Bool
}
