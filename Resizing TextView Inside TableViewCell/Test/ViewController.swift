//
//  ViewController.swift
//  Test
//
//  Created by Rakesha Shastri on 08/08/18.
//  Copyright © 2018 RakeshaShastri.Campaigns.vTouch. All rights reserved.
//

import UIKit

class MyViewController : UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    //MARK: UI Elements
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TextViewCell.self, forCellReuseIdentifier: "text")
        return tableView
    }()
    
    //MARK: Initializers
    override func viewDidLoad() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    //MARK: TableView delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "text", for: indexPath) as? TextViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.tableView = tableView
        return cell
    }
    
}

class TextViewCell: UITableViewCell, UITextViewDelegate, UITextFieldDelegate {
    
    //MARK: UI Elements
    /// Reference of the parent tableView so that cell can be updated
    var tableView: UITableView!
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.delegate = self
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1
        return textView
    }()
    
    //MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50).isActive = true
        textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50).isActive = true
        textView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 100).isActive = true
        textView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50).isActive = true
        textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: TextView Delegates
    func textViewDidChange(_ textView: UITextView) {
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
}
