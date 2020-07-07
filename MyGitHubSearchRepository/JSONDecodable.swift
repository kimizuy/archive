//
//  JSONDecodable.swift
//  GitHubSearchRepository
//
//  Created by Kimizu Yamasaki on 2017/02/10.
//  Copyright © 2017年 Kimizu Yamasaki. All rights reserved.
//

protocol JSONDecodable {
    init(json: Any) throws
}