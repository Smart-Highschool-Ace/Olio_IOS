//
//  AwardWinningCareerViewController.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/19.
//

import UIKit

class AwardWinningCareerViewController: UIViewController{
    @IBOutlet weak var AwardWinningCareerTableView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AwardWinningCareerTableView.delegate = self
        AwardWinningCareerTableView.dataSource = self

    }
}

extension AwardWinningCareerViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AwardWinningCareerTableViewCell", for: indexPath) as! AwardWinningCareerTableViewCell
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
}

