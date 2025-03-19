//
//  user.swift
//  Day60_Challenge
//
//  Created by Hadi Al zayer on 19/09/1446 AH.
//

import Foundation

struct User: Codable, Identifiable{
    struct Friend: Codable, Identifiable{
        let id:String
        let name: String
    }
    let id:String
    let name:String
    let age:Int
    let company:String
    let friends:[Friend]
   
}


