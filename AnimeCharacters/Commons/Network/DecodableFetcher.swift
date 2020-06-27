import Foundation
import Combine

protocol DecodableFetcher {
    func fetchDecodable<T: Decodable>(from url: URL) -> AnyPublisher<T, FetchError>
}

class DefaultDecodableFetcher {
    private let dataFetcher: DataFetcher
    private let decoder: JSONDecoder

    init(dataFetcher: DataFetcher = DefaultDataFetcher(),
         decoder: JSONDecoder = JSONDecoder()) {
        self.dataFetcher = dataFetcher
        self.decoder = decoder
    }

}

extension DefaultDecodableFetcher: DecodableFetcher {
    func fetchDecodable<T: Decodable>(from url: URL) -> AnyPublisher<T, FetchError> {
        dataFetcher.fetchData(from: url)
            .decode(type: T.self, decoder: decoder)
            .mapError { error -> FetchError in
                if case let urlError as URLError = error {
                    return .derived(from: urlError)
                } else {
                    return .failedToDecode
                }
            }
        .eraseToAnyPublisher()
    }
}

enum FetchError: Error {
    case failedToDecode
    case notConnected
    case badRequest

    static func derived(from urlError: URLError) -> FetchError {
        if case .notConnectedToInternet = urlError.code {
            return .notConnected
        } else {
            return .badRequest
        }
    }
}
