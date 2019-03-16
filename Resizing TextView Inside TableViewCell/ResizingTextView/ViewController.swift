//
//  ViewController.swift
//  Test
//
//  Created by Rakesha Shastri on 08/08/18.
//  Copyright © 2018 RakeshaShastri. All rights reserved.
//

import UIKit

class ViewController : UIViewController {
    
    //MARK: UI Element(s)
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TextViewCell.self, forCellReuseIdentifier: TextViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: View Controller Method(s)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.leadingAnchor .constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor     .constraint(equalTo: view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor  .constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TextViewCell.identifier, for: indexPath) as! TextViewCell
        cell.selectionStyle = .none
        cell.tableView = tableView
        return cell
    }
    
}
