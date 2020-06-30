import UIKit
@testable import AnimeCharacters

class DisplayDescriptionViewTypeMock: UIView, DisplayDescriptionViewType {
    var receivedText: String?
    
    func setDescription(text: String) {
        receivedText = text
    }
}
