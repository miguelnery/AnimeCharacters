import Foundation

extension URL {
    private static let apiPath = "https://randomcharacteristics-backend.herokuapp.com/"
    static func getCharacter(traitCount: Int) -> URL {
        let traitPath = "traits/\(traitCount)"
        guard let url = URL(string: apiPath + traitPath) else {
            fatalError("Could not build URL")
        }
        return url
    }
}
