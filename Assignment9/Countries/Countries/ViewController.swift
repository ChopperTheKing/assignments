//
//  ViewController.swift
//  Countries
//
//  Created by MAC on 05/09/23.
//

// ViewController.swift
import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var countries: [Country] = [] //holds list of countries that'll be displayed in table view.
    private let networkManager = NetworkManager() //instance of NetworkManager to make API call.
    
    override func viewDidLoad() { //Sets up initial state.
        super.viewDidLoad()
        
        tableView.dataSource = self //Sets data source of table view to self.
        networkManager.getCountries { countries, error in //Calls getCountries method to fetch countries.
            if let countries = countries { //Checks if countries were fetched successfully and reloads table view.
                self.countries = countries
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else if let error = error { //Checks if error occurred and calls showError.
                DispatchQueue.main.async {
                    self.showError(error: error)
                }
            }
        }
    }
    
    func showError(error: Error) { //Shows alert if error occurs.
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //Sets up table view.
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //Sets up table view
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let country = countries[indexPath.row]
        cell.textLabel?.text = "\(country.name)"
    
        return cell
    }
}
