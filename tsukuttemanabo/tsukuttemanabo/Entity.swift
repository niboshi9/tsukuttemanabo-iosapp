//
//  Entity.swift
//  tsukuttemanabo
//
//  Created by serori on 2022/04/24.
//

struct CovidInfo: Codable {
    
    struct Total: Codable {
        var pcr: Int
        var positive: Int
        var hospitalize: Int
        var severe: Int
        var death: Int
        var discharge: Int
    }
}
