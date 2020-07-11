@testable import AnimeCharacters

class DescriptionHomeDelegateMock: DescriptionHomeDelegate {
    var didCallDisplayDescription =  false
    
    func displayDescription() {
        didCallDisplayDescription = true
    }
}
