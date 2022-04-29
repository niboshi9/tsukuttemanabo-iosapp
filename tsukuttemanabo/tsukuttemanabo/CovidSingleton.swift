//
//  CovidSingleton.swift
//  tsukuttemanabo
//
//  Created by shusaku on 2022/04/29.
//

import Foundation

class CovidSignleton {
    private init() {}
    static let shared = CovidSignleton()
    var prefecture: [CovidInfo.Prefecture] = []
}
