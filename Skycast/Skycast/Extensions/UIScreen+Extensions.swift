//
//  UIScreen+Extensions.swift
//  Skycast
//
//  Created by Baher Tamer on 13/09/2023.
//

import SwiftUI

extension UIScreen {
    static var screenWidth: Double {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            return windowScene.screen.bounds.size.width
        }
        
        return 200
    }
}
