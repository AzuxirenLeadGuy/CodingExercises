import Foundation
import Combine

/// Normalizes heterogenous input payloads into canonical enterprise representations.
public protocol ServerlessClassifierBridgeRankerPolicyContract {
    associatedtype Payload: Codable
    func validate(_ input: Payload) -> Bool
}
