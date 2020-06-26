import Foundation
import Combine
import XCTest
@testable import AnimeCharacters

class DefaultDecodableFetcherTests: XCTestCase {
    let dataFetcherMock = DataFetcherMock()
    var sut: DefaultDecodableFetcher!
    let validURL = URL(fileURLWithPath: "i'm valid")
    let validModel = "validModel"
    let invalidModel = 666

    override func setUp() {
        sut = DefaultDecodableFetcher(dataFetcher: dataFetcherMock)
    }

    func test_onSuccessPublishDecodedModel() {
        let sub = sut.fetchDecodable(from: validURL)
            .sink(receiveCompletion: { completion in
                if case .failure = completion { XCTFail() }
            }, receiveValue: { (value: String) in
                XCTAssert(value == self.validModel)
                XCTAssert(type(of: value) == type(of: self.validModel))
            })
        dataFetcherMock.publish(model: validModel)
    }

    func test_onFailurePublishBadRequestError() {
        let sub = sut.fetchDecodable(from: validURL)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    XCTAssert(error == .badRequest)
                } else { XCTFail() }
            }, receiveValue: { (value: String) in XCTFail() })

        // publish any URLError that is not `.notConnectedToInternet`
        dataFetcherMock.publish(error: URLError(.cancelled))
    }

    func test_onFailurePublishNotConnectedError() {
        let sub = sut.fetchDecodable(from: validURL)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    XCTAssert(error == .notConnected)
                } else { XCTFail() }
            }, receiveValue: { (value: String) in XCTFail() })
        dataFetcherMock.publish(error: URLError(.notConnectedToInternet))
    }

    func test_onFailurePublishFailedToDecodeError() {
        let sub = sut.fetchDecodable(from: validURL)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    XCTAssert(error == .failedToDecode)
                } else {  XCTFail() }
            }, receiveValue: { (value: String) in XCTFail() })
        dataFetcherMock.publish(model: invalidModel)
    }
}
