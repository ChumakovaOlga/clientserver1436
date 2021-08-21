//
//  Session.swift
//  cs
//
//  Created by Olga Chumakova on 15.08.2021.
//

import Foundation
final class Session {
    static let shared = Session()
    private init() {}
    var token = ""
    var userId = ""
}
