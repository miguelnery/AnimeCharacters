import Combine
import UIKit

protocol TriggerView: UIView {
    func publisher(forEvent event: UIControl.Event) -> AnyPublisher<Void, Never>
}
