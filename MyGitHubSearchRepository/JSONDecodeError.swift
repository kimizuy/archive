//
//  JSONDecodeError.swift
//  GitHubSearchRepository
//
//  Created by Kimizu Yamasaki on 2017/02/10.
//  Copyright © 2017年 Kimizu Yamasaki. All rights reserved.
//

import Foundation

enum JSONDecodeError: Error {
    case inValidFomat(json: Any)
    case missingValue(key: String, actualValue: Any?)
}