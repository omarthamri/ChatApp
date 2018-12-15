//
//  ViewController.swift
//  ChatApp
//
//  Created by MACBOOK PRO RETINA on 01/12/2018.
//  Copyright © 2018 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit


struct ChatMessage {
    let text: String
    let isIncoming: Bool
    let date: Date
}


class ViewController: UITableViewController {
    
    let CellId = "id"
    
    let allMessages = [ChatMessage(text: "test test test test test test test test test test test test test test test test test test" ,isIncoming: true, date: Date.dateFromCustomString(customString: "01/01/2018")),ChatMessage(text: "test test test" ,isIncoming: false, date: Date.dateFromCustomString(customString: "01/01/2018")),ChatMessage(text: "test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test" ,isIncoming: true, date: Date.dateFromCustomString(customString: "02/01/2018")),ChatMessage(text: "test test test test test test test test test test test test test test test test test test" ,isIncoming: false, date: Date.dateFromCustomString(customString: "02/01/2018")),ChatMessage(text: "test test test test" ,isIncoming: true, date: Date.dateFromCustomString(customString: "02/01/2018"))]
    
    var ChatMessages = [[ChatMessage]]()

    func AssembleGroupedMessages() {
       let groupedMessages = Dictionary(grouping: allMessages) { (element) -> Date in
            return element.date
        }
        let sortedKeys = groupedMessages.keys.sorted()
        sortedKeys.forEach{ (key) in
            ChatMessages.append(groupedMessages[key] ?? [])
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AssembleGroupedMessages()
        navigationItem.title = "CHAT APP"
        tableView.register(ChatMessageTableViewCell.self, forCellReuseIdentifier: CellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return ChatMessages.count
    }
    
    class DateHeaderLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = UIColor.green
            textAlignment = .center
            textColor = UIColor.white
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize{
            layer.cornerRadius = (super.intrinsicContentSize.height + 10) / 2
            layer.masksToBounds = true
            return CGSize(width: super.intrinsicContentSize.width + 15, height: super.intrinsicContentSize.height + 10)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstMessageInSection = ChatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/mm/yyyy"
            let label = DateHeaderLabel()
            label.text = dateFormatter.string(from: firstMessageInSection.date)
            label.font = UIFont.boldSystemFont(ofSize: 14)
            let ContainerView = UIView()
            ContainerView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: ContainerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: ContainerView.centerYAnchor).isActive = true
            label.textColor = UIColor.white
            return ContainerView
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ChatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId, for: indexPath) as! ChatMessageTableViewCell
        cell.chatMessage = ChatMessages[indexPath.section][indexPath.row]
        return cell
    }


}

