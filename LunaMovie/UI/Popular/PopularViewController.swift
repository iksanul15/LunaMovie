//
//  PopularViewController.swift
//  LunaMovie
//
//  Created by Muhammad Iksanul on 05/10/20.
//

import UIKit

private let reuseIdentifier = "MovieCell"

class PopularViewController: UITableViewController {
    
    let numbers = [1,2,3,4,5,6,7,8]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MovieViewCell
        
        cell.movieTitle.text = "Movie \(numbers[indexPath.row])"

        return cell
    }

}
