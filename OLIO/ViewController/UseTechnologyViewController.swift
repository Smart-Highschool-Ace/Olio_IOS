//
//  UseTechnologyViewController.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/19.
//

import UIKit

class UseTechnologyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var technologyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        technologyTableView.delegate = self
        technologyTableView.dataSource = self
        
        technologyTableView.separatorStyle = .none
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UseTechnologyTableViewCell
        
        cell.technologyLogo.image = UIImage(named: "Olio_blue_Logo")
        cell.technologyName.text = "React"
        
        return cell
    }
}




