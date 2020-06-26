import Foundation
import Combine
@testable import AnimeCharacters

class DataFetcherMock: DataFetcher {
    private let publisher = PassthroughSubject<Data, URLError>()

    func publish(data: Data) {
        publisher.send(data)
    }

    func publish<T: Encodable>(model: T,
                               encodedWith encoder: JSONEncoder = JSONEncoder()) {
        guard let encoded = try? encoder.encode(model) else {
            fatalError("could not encode model")
        }
        publish(data: encoded)
    }

    func publish(error: URLError) {
        publisher.send(completion: .failure(error))
    }

    func fetchData(from url: URL) -> AnyPublisher<Data, URLError> {
        publisher.eraseToAnyPublisher()
    }
}
