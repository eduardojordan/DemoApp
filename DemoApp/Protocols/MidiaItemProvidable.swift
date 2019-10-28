//
//  MidiaItemProvidable.swift
//  DemoApp
//
//  Created by MAC on 28/10/2019.
//  Copyright © 2019 EdJordan. All rights reserved.
//

import Foundation

protocol MediaItemProvidable {
    var title: String { get }
    var imageURL: URL? { get }
}

