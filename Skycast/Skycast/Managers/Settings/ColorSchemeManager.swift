//
//  ColorSchemeManager.swift
//  Skycast
//
//  Created by Baher Tamer on 13/09/2023.
//

import SwiftUI

enum SchemeType: Int {
    case unspecified, light, dark
}

@MainActor final class ColorSchemeManager: ObservableObject {
    
    @AppStorage("SchemeType") var schemeType: SchemeType = .unspecified
    
    func applyColorScheme() {
        keyWindow?.overrideUserInterfaceStyle = UIUserInterfaceStyle(rawValue: schemeType.rawValue)!
    }
    
    var keyWindow: UIWindow? {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate,
              let window = windowSceneDelegate.window else {
            return nil
        }
        
        return window
    }
}
