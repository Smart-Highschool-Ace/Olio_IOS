//
//  CertificateViewController.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/19.
//

import UIKit

class CertificateViewController: UIViewController{
    @IBOutlet weak var certificateTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        certificateTableView.delegate = self
        certificateTableView.dataSource = self
    }
}

extension CertificateViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CertificateTableViewCell", for: indexPath) as! CertificateTableViewCell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
}
