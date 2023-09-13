//
//  SkycastLocal.swift
//  Skycast
//
//  Created by Baher Tamer on 13/09/2023.
//

import Foundation

struct SkycastLocal {
    static var language: String {
        (Locale.current.language.languageCode!.identifier) == "ar" ? "ar" : "en"
    }
}
