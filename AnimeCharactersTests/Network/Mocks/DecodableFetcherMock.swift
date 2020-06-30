import Foundation
import Combine
@testable import AnimeCharacters

class DecodableFetcherMock: DecodableFetcher {
    private let publisher = PassthroughSubject<Decodable, FetchError>()

    func publish<T: Decodable>(decodable: T) {
        publisher.send(decodable)
    }

    func publish(error: FetchError) {
        publisher.send(completion: .failure(error))
    }
    
    func fetchDecodable<T: Decodable>(from url: URL) -> AnyPublisher<T, FetchError> {
        publisher
            .map { $0 as! T }
            .eraseToAnyPublisher()
    }
}
