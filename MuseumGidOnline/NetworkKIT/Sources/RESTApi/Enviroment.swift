//
//  Enviroment.swift
//  NetworkKIT
//
//  Created by andrew on 24.11.25.
//

import Foundation

extension URL {

    static var baseURLComponent: URLComponents {
//#if DEBUG
        let env = SettingsAppBundleHelper.shared.currentEnvironment.baseUrl
        var component = URLComponents(string: env)!

        if let comp = URLComponents(string: env){
            component = comp
        }
        return component
    }
}

enum Env: String {
    case production
    case stage
    case development

    var baseUrl: String {
        switch self {
//        case .development:
//            return "http://"
//
//        case .production:
//            return "http://"
//
        default:
            return Constants.apiEndPoint
        }
    }
}

final class SettingsAppBundleHelper {
    static let shared = SettingsAppBundleHelper()
    private init() {}

    var currentEnvironment: Env {
        return Env.stage
    }
}

import Foundation

enum Constants {
    static let apiEndPoint = "http://"
    static let app = "MuseumGidOnline"
    static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    static let bundleId = Bundle.main.bundleIdentifier
    static let linkTerms = "https://"
    static let linkConditions = "https://"
}
