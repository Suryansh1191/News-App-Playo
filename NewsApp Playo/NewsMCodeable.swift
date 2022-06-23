//
//  NewsMCodeable.swift
//  NewsApp Playo
//
//  Created by suryansh Bisen on 23/06/22.
//

import Foundation

struct NewsMCodeable: Decodable {
    var articles: [ArticalsMCodeable]?
    
    enum CodingKeys: String, CodingKey {
        case articles
    }
    
    init(from decoder: Decoder) throws {
        
        //main json decoder
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //parsing it to articals
        self.articles = try container.decode([ArticalsMCodeable].self, forKey: .articles)
    }
}
