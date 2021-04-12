//
//  ProfileProjectViewController.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/19.
//

import UIKit

class ProfileProjectViewController: UIViewController{
    
    @IBOutlet weak var ProfileProjectTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProfileProjectTableView.delegate = self
        ProfileProjectTableView.dataSource = self
        
        
    }
}

extension ProfileProjectViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileProjectTableViewCell", for: indexPath) as! ProfileProjectTableViewCell
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
}
