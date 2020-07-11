import XCTest
import Combine
@testable import AnimeCharacters

class DescriptionHomeViewControllerTests: XCTestCase {
    let triggerViewMock = TriggerViewMock()
    let delegateMock = DescriptionHomeDelegateMock()
    var sut: DescriptionHomeViewController!
    
    override func setUp() {
        sut = DescriptionHomeViewController(view: triggerViewMock,
                                            delegate: delegateMock)
        _ = sut.view
    }
    
    func test_didTriggerCallDelegateDisplayDescription() {
        triggerViewMock.publish()
        XCTAssert(delegateMock.didCallDisplayDescription)
    }
} 
