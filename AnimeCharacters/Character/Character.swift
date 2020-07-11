struct Character: Codable {
    let traits: [String]
    let origin: String
}

extension Character {
    var description: String {
        traits.joined(separator: " ") + " " + origin
    }
}
