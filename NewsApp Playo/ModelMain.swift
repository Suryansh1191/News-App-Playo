//
//  ModelMain.swift
//  NewsApp Playo
//
//  Created by suryansh Bisen on 22/06/22.
//

import Foundation

protocol ModelDelegate {
    func articlesFetched(_ articles: [ArticalsMCodeable])
}

class ModelMain {
    
    var delegate: ModelDelegate?
    
    func getNews() {
        
        //url object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        //urlSession Object
        let session = URLSession.shared
        
        //Data task for URLSession
        let dataTask = session.dataTask(with: url!) { data, responce, error in
            
            //check for error
            if error != nil || data == nil {
                // TODO: Add some kind of Alert for the error
                print("API ERROR: \(String(describing: error))")
                return
            }
            
            do{
                //parsing
                let decoder = JSONDecoder()
                let responce = try decoder.decode(NewsMCodeable.self, from: data!)
                
                //Calling Delegate
                if responce.articles != nil{
                    DispatchQueue.main.async {
                        self.delegate?.articlesFetched(responce.articles!)
                    }
                }
                print(responce)
            }catch{
                //Parsing Error
                print(error)
                print("Parsing Error")
            }
            
            
            
        }
        
        //Start the task
        dataTask.resume()
        
    }
    
    

    
}
