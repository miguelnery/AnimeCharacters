import XCTest
@testable import AnimeCharacters

class DisplayDescriptionViewControllerTests: XCTestCase {
    let fetcherMock = DecodableFetcherMock()
    let viewMock = DisplayDescriptionViewTypeMock()
    var sut: DisplayDescriptionViewController!
    
    let validCharacter = Character(traits: ["trait1",
                                            "trait2",
                                            "trait3"],
                                   origin: "origin")
    
    override func setUp() {
        sut = DisplayDescriptionViewController(decodableFetcher: fetcherMock, view: viewMock)
        let _ = sut.view
    }
    
    func test_viewDidLoadShouldLookLikeThis() {
        fetcherMock.publish(decodable: validCharacter)
        guard let receivedText = viewMock.receivedText else {
            XCTFail()
            return
        }
        XCTAssert(receivedText == validCharacter.description)
    }
}
