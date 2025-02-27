import Foundation
import ProjectDescription
import TSCBasic
import TuistCore
import TuistSupport

enum CloudManifestMapperError: FatalError {
    /// Thrown when the cloud URL is invalid.
    case invalidCloudURL(String)

    /// Error type.
    var type: ErrorType {
        switch self {
        case .invalidCloudURL: return .abort
        }
    }

    /// Error description.
    var description: String {
        switch self {
        case let .invalidCloudURL(url):
            return "The cloud URL '\(url)' is not a valid URL"
        }
    }
}

extension TuistCore.Cloud {
    static func from(manifest: ProjectDescription.Cloud) throws -> TuistCore.Cloud {
        var cloudURL: URL!
        if let manifestCloudURL = URL(string: manifest.url) {
            cloudURL = manifestCloudURL
        } else {
            throw CloudManifestMapperError.invalidCloudURL(manifest.url)
        }
        return TuistCore.Cloud(url: cloudURL, projectId: manifest.projectId)
    }
}
