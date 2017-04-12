//
//  TableViewCell.swift
//  CNode
//
//  Created by fanhehe on 2017/4/7.
//  Copyright © 2017年 fanhehe. All rights reserved.
//

import UIKit
import Kingfisher

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var tabLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var createAt: UILabel!
    
    @IBOutlet weak var timeOffset: UILabel!
    @IBOutlet weak var visitCount: UILabel!
    @IBOutlet weak var replyCount: UILabel!
    
    var data: Topic? {
        didSet {
            if let tab = data!.tab {
                tabLabel.text = tab
            }
            
            if let title = data!.title {
                titleLabel.text = title
            }
            
            if let un = data!.author?.loginName {
                username.text = un
            }
            
            if let rc = data!.replyCount {
                replyCount.text = rc
            }
            
            if let vc = data!.visitCount {
                visitCount.text = " / \(vc)"
            }
            
            if let ca = data!.createAt {
                createAt.text = ca
            }
            
            if let to = data!.offsetTime {
                timeOffset.text = to
            }
            
            if let avatarUrl = data!.author?.avatarUrl {
                let url = URL(string: avatarUrl)
                avatar.kf.setImage(with: url)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
