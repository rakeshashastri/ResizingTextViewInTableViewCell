//
//  TextViewCell.swift
//  ResizingTextView
//
//  Created by Rakesha Shastri on 16/03/19.
//  Copyright © 2019 RakeshaShastri.Campaigns.vTouch. All rights reserved.
//

import UIKit

class TextViewCell: UITableViewCell {
    
    //MARK: Reuse ID
    static let identifier = debugDescription()
    
    //MARK: UI Element(s)
    /// Reference of the parent table view so that it can be updated
    var tableView: UITableView!
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.delegate = self
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    //MARK: Padding Variable(s)
    let padding: CGFloat = 50
    
    //MARK: Initializer(s)
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        addConstraints()
        
        textView.becomeFirstResponder()
    }
    
    //MARK: Helper Method(s)
    func addSubviews() {
        contentView.addSubview(textView)
    }
    
    func addConstraints() {
        textView.leadingAnchor  .constraint(equalTo: contentView.leadingAnchor, constant: padding).isActive = true
        textView.trailingAnchor .constraint(equalTo: contentView.trailingAnchor, constant: -padding).isActive = true
        textView.topAnchor      .constraint(equalTo: contentView.topAnchor, constant: padding).isActive = true
        textView.bottomAnchor   .constraint(equalTo: contentView.bottomAnchor, constant: -padding).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TextViewCell: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
    
}
