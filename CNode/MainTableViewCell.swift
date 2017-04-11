//
//  TableViewCell.swift
//  CNode
//
//  Created by fanhehe on 2017/4/7.
//  Copyright © 2017年 fanhehe. All rights reserved.
//

import UIKit

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
//            guard data!.tab != nil else { data!.tab = "" }
//            guard data!.title != nil else { data!.title = "" }
//            guard data!.replyCount != nil else { data!.replyCount = "" }
//            guard data!.visitCount != nil else { data!.visitCount = "" }
//            guard data!.createAt != nil else { data!.createAt = "" }
            tabLabel.text = data!.tab!
            titleLabel.text = data!.title!
            username.text = data!.author?.loginName
            
            replyCount.text = data!.replyCount!
            visitCount.text = " / \(data!.visitCount!)"
            
            createAt.text = data!.createAt!
            timeOffset.text = data!.offsetTime!
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
