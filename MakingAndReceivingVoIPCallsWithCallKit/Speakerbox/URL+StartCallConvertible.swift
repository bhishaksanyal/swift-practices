/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
Extension to allow creating a CallKit CXStartCallAction from a URL which the app was launched with.
*/

import Foundation

extension URL: StartCallConvertible {

    private struct Constants {
        static let URLScheme = "speakerbox"
    }

    var startCallHandle: String? {
        guard scheme == Constants.URLScheme else { return nil }

        return host
    }

}
