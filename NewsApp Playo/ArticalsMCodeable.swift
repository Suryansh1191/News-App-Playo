//
//  NewsMCodeable.swift
//  NewsApp Playo
//
//  Created by suryansh Bisen on 22/06/22.
//

import Foundation

struct ArticalsMCodeable: Decodable {
    
    var author = ""
    var title = ""
    var description = ""
    var newImageURL = ""
    var detailedURL = ""
    
    enum CodingKeys: String, CodingKey {
        case author
        case title
        case description
        case newImageURL = "urlToImage"
        case detailedURL = "url"
        
    }
    
    init(from decoder: Decoder) throws {
        
        //container that contains author json
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Parsing Data from Decoder
        self.author = try container.decode(String.self, forKey: .author)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.newImageURL = try container.decode(String.self, forKey: .newImageURL)
        self.detailedURL = try container.decode(String.self, forKey: .detailedURL)
        
    }
    
}
