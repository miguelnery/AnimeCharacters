import XCTest
@testable import AnimeCharacters

class DisplayDescriptionViewControllerTests: XCTestCase {
    let viewMock = DisplayDescriptionViewTypeMock()
    var sut: DescriptionViewController!
    
    let validDescription = "validDescription"
    
    override func setUp() {
        sut = DescriptionViewController(description: validDescription, view: viewMock)
        let _ = sut.view
    }
    
    func test_viewDidLoadShouldLookLikeThis() {
        guard let receivedText = viewMock.receivedText else {
            XCTFail()
            return
        }
        XCTAssert(receivedText == validDescription)
    }
}
