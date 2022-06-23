//
//  ViewController.swift
//  NewsApp Playo
//
//  Created by suryansh Bisen on 22/06/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, ModelDelegate {
    
    @IBOutlet weak var tableViewArticles: UITableView!
    var model = ModelMain()
    var articles = [ArticalsMCodeable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableViewArticles.dataSource = self
        tableViewArticles.delegate = self
        model.delegate = self
        
        model.getNews()
    }
    
    // MARK:  Model Delegate Protocal
    func articlesFetched(_ articles: [ArticalsMCodeable]) {
        
        self.articles = articles
        tableViewArticles.reloadData()
    }
    

    // MARK: - Table View Protocals
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewArticles.dequeueReusableCell(withIdentifier: Constants.ARTICLES_CELL_ID, for: indexPath)
        
        let title = self.articles[indexPath.row].title
        
        cell.textLabel?.text = title
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Taped")
    }

}

