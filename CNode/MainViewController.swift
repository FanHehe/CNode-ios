//
//  ViewController.swift
//  CNode
//
//  Created by fanhehe on 2017/4/5.
//  Copyright © 2017年 fanhehe. All rights reserved.
//

import UIKit

var test = [
    "id": "123",
    "tab": "推荐",
    "title": "bia苏是如何炼成的",
    "content": "contentcontentcontentcontentcontent",
    "top": false,
    "good": false,
    "replyCount": "44",
    "visitCount": "2312",
    "createAt": "3213213",
    "lastReplyAt": "23213123",
    "logiinName": "fanhehe",
    "avatarUrl": "picture",
    "authorId": "21321312312"
    ] as [String : Any]

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tView: UITableView!
    fileprivate var newsList = [Topic]( repeating: Topic(test), count: 1);
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tView.delegate = self
        tView.dataSource = self
        
        Fetch.get("https://cnodejs.org/api/v1/topics") { [weak self] data in
            self!.newsList += NetAdapter.Topics(data: data["data"])
            self!.tView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return newsList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ID: String = "TableCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: ID, for: indexPath) as! MainTableViewCell
        cell.data = newsList[indexPath.row]
//        let alertView = UIAlertView()
//        alertView.title = "系统提示"
//        alertView.message = "\(newsList.count)"
//        alertView.addButton(withTitle: "取消")
//        alertView.addButton(withTitle: "确定")
//        alertView.cancelButtonIndex=0
//        alertView.delegate=self;
//        alertView.show()
        return cell
    }
}

