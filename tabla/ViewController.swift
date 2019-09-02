//
//  ViewController.swift
//  tabla
//
//  Created by rodrigo on 8/29/19.
//  Copyright © 2019 rodrigo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var movies: [Movie] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getMovies()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        let index: Int = indexPath.row
        
        
        let movie = movies [index]
        
        cell.nombre.text = movie.name
        cell.telefono.text = movie.summary
        
        
            return cell
        
        
    
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    private func getMovies(){
        let url: String = "http://api.themoviedb.org/4/list/1?api_key=6de141add9b48d75416a80e7d8e74967"
       
        let task = URLSession.shared.dataTask(
            with: URL(string: url)!,
            completionHandler: { (data, response, error) in
       
                if let data = data {
                    let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
                    
                    if let results = json ["results"] as? [[String:Any]]{
                    
                    
                    for p in results {
                        let title = p["title"] as? String ?? ""
                        let overview = p["overview"] as? String ?? ""
                        
                        let pelicula = Movie(name: title, summary: overview)
                        self.movies.append(pelicula)
                    }
                   
            self.tableView.reloadData()
                        
                    }
                    
                }
                    
                })
        

    
        task.resume()
       
    
}

}

