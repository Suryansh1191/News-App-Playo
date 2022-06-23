//
//  ConstentsData.swift
//  NewsApp Playo
//
//  Created by suryansh Bisen on 23/06/22.
//

import Foundation

struct Constants {
    
    static var API_KEY = "968a7e92938841fdae87e361edd9129a"
    static var API_URL = "https://newsapi.org/v2/top-headlines?apikey=\(Constants.API_KEY)&sources=\(Constants.NEWS_SOURCE)"
    static var NEWS_SOURCE = "techcrunch"
    static var ARTICLES_CELL_ID = "ArticlesCell"
    
}
