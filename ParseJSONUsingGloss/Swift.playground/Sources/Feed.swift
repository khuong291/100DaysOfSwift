import Foundation

public struct Feed: Decodable {

    public let entries: [App]?

    public init?(json: JSON) {
        entries = "entry" <~~ json
    }
}