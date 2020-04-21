import Foundation
import XCTest
@testable import ProjectDescription

final class CloudTests: XCTestCase {
    func test_config_toJSON() throws {
        let cloud = Cloud(url: "https://tuist.io", projectId: "123")
        XCTAssertCodable(cloud)
    }
}
