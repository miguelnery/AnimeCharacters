import UIKit
@testable import AnimeCharacters

class DisplayDescriptionViewTypeMock: UIView, DescriptionViewType {
    var receivedText: String?
    
    func setDescription(text: String) {
        receivedText = text
    }
}
