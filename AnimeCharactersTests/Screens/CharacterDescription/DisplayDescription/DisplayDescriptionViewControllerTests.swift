import XCTest
import Combine
@testable import AnimeCharacters

class DisplayDescriptionViewControllerTests: XCTestCase {
    let viewMock = DisplayDescriptionViewTypeMock()
    let subject = PassthroughSubject<String, FetchError>()
    var sut: DescriptionViewController!
    
    let validDescription = "validDescription"
    
    override func setUp() {
        sut = DescriptionViewController(view: viewMock, publisher: subject.eraseToAnyPublisher())
        let _ = sut.view
    }
    
    func test_onSuccessShoudDisplayDescription() {
        subject.send(validDescription)
        guard let receivedText = viewMock.receivedText else {
            XCTFail("Did not receive description")
            return
        }
        XCTAssert(receivedText == validDescription)
    }
}
