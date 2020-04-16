//
//  MediaObject.swift
//  TestActivityApp
//
//  Created by Liubov Kaper  on 4/15/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import Foundation

struct MediaObject: Codable {
    let imageData: Data?
    let videoURL: URL?
    let caption: String? // UI so user can enter text
    let id = UUID().uuidString
    let createdDate = Date()
}
