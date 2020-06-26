import Foundation
import Combine

protocol DataFetcher {
    func fetchData(from url: URL) -> AnyPublisher<Data, URLError>
}

class DefaultDataFetcher {
    private let urlSession: URLSession

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
}

extension DefaultDataFetcher: DataFetcher {
    func fetchData(from url: URL) -> AnyPublisher<Data, URLError> {
        urlSession.dataTaskPublisher(for: url)
            .map { $0.data }
            .eraseToAnyPublisher()
    }
}
