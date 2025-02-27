import Foundation
import TSCBasic
import TuistCore
import TuistCoreTesting
import TuistSupport
import XcodeProj
@testable import TuistGenerator

final class MockProjectGenerator: ProjectGenerating {
    enum MockError: Error {
        case stubNotImplemented
    }

    var generatedProjects: [Project] = []
    var generateStub: ((Project, Graph, AbsolutePath?, AbsolutePath?) throws -> ProjectDescriptor)?

    func generate(project: Project, graph: Graph, sourceRootPath: AbsolutePath?, xcodeprojPath: AbsolutePath?) throws -> ProjectDescriptor {
        guard let generateStub = generateStub else {
            throw MockError.stubNotImplemented
        }
        generatedProjects.append(project)
        return try generateStub(project, graph, sourceRootPath, xcodeprojPath)
    }
}
