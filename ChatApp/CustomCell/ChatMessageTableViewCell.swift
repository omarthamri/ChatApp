//
//  ChatMessageTableViewCell.swift
//  ChatApp
//
//  Created by MACBOOK PRO RETINA on 09/12/2018.
//  Copyright © 2018 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class ChatMessageTableViewCell: UITableViewCell {
    
    let backgroundBubbleView = UIView()
    let messageLabel = UILabel()
    let profileImg = UIImageView()
    var LeadingConstraint: NSLayoutConstraint!
    var TrailingConstraint: NSLayoutConstraint!
    var profileImgLeadingConstraint: NSLayoutConstraint!
    var profileImgTrailingConstraint: NSLayoutConstraint!
    var chatMessage: ChatMessage! {
        didSet {
            backgroundBubbleView.backgroundColor = chatMessage.isIncoming ? UIColor.white : UIColor.darkGray
            messageLabel.textColor = chatMessage.isIncoming ? UIColor.black : UIColor.white
            messageLabel.text = chatMessage.text
            if chatMessage.isIncoming {
                LeadingConstraint.isActive = true
                TrailingConstraint.isActive = false
                profileImgLeadingConstraint.isActive = true
                profileImgTrailingConstraint.isActive = false
                profileImg.image = #imageLiteral(resourceName: "profilepic")
            } else {
                LeadingConstraint.isActive = false
                TrailingConstraint.isActive = true
                profileImgLeadingConstraint.isActive = false
                profileImgTrailingConstraint.isActive = true
                profileImg.image = #imageLiteral(resourceName: "no-profil")
            }
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clear
        backgroundBubbleView.backgroundColor = UIColor.yellow
        backgroundBubbleView.layer.cornerRadius = 12
        backgroundBubbleView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundBubbleView)
        
        addSubview(messageLabel)
        addSubview(profileImg)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
                                     messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
                                         messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 160),
                                         backgroundBubbleView.topAnchor.constraint(equalTo: messageLabel.topAnchor,constant: -16),
                                         backgroundBubbleView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor,constant: 16),
                                         backgroundBubbleView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor,constant: -16),
                                         backgroundBubbleView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor,constant: 16),
                                         profileImg.topAnchor.constraint(equalTo: topAnchor, constant: 15),
                                         profileImg.heightAnchor.constraint(equalToConstant: 60),
                                         profileImg.widthAnchor.constraint(equalToConstant: 60)])
        profileImgLeadingConstraint = profileImg.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        profileImgTrailingConstraint = profileImg.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        LeadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: profileImg.leadingAnchor,constant: 90)
        TrailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: profileImg.trailingAnchor, constant: -90)
        messageLabel.text = "test test test test test test test test test test test test test test test test test test"
        messageLabel.numberOfLines = 0
        profileImg.translatesAutoresizingMaskIntoConstraints = false
        profileImg.layer.masksToBounds = false
        profileImg.layer.cornerRadius = 30
        profileImg.clipsToBounds = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
