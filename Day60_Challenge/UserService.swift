//
//  UserService.swift
//  Day60_Challenge
//
//  Created by Hadi Al zayer on 19/09/1446 AH.
//

import Foundation

class UserService{
    
    static func fetchUsers() async throws -> [User]{
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else{ return [] }
        let (data,_) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([User].self, from: data)
    }
    
}
