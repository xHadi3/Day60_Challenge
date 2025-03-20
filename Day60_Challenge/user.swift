//
//  user.swift
//  Day60_Challenge
//
//  Created by Hadi Al zayer on 19/09/1446 AH.
//

import Foundation
import SwiftData

@Model
class User: Codable, Identifiable{
    
    let id:String
    let name:String
    let age:Int
    let company:String
    let friends:[Friend]
    
    init(id: String, name: String, age: Int, company: String, friends: [Friend]) {
        self.id = id
        self.name = name
        self.age = age
        self.company = company
        self.friends = friends
    }
    
    enum CodingKeys: String, CodingKey {
            case id, name, age, company, friends
        }
    
        
    required init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
           self.id = try container.decode(String.self, forKey: .id)
           self.name = try container.decode(String.self, forKey: .name)
           self.age = try container.decode(Int.self, forKey: .age)
           self.company = try container.decode(String.self, forKey: .company)
           self.friends = try container.decode([Friend].self, forKey: .friends)
       }

       func encode(to encoder: Encoder) throws {
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(id, forKey: .id)
           try container.encode(name, forKey: .name)
           try container.encode(age, forKey: .age)
           try container.encode(company, forKey: .company)
           try container.encode(friends, forKey: .friends)
       }
  
}
@Model
class Friend:Codable, Identifiable{
    let id:String
    let name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    // MARK: - Codable Conformance
      enum CodingKeys: String, CodingKey {
          case id, name
      }

      required init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: CodingKeys.self)
          self.id = try container.decode(String.self, forKey: .id)
          self.name = try container.decode(String.self, forKey: .name)
      }

      func encode(to encoder: Encoder) throws {
          var container = encoder.container(keyedBy: CodingKeys.self)
          try container.encode(id, forKey: .id)
          try container.encode(name, forKey: .name)
      }
}


