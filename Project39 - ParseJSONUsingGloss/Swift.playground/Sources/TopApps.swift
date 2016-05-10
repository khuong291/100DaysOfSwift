import Foundation
import XCPlayground

public struct TopApps: Decodable {
    public let feed: Feed?

    public init?(json: JSON) {
        feed = "feed" <~~ json
    }
}

