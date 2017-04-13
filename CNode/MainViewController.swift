//
//  ViewController.swift
//  CNode
//
//  Created by fanhehe on 2017/4/5.
//  Copyright © 2017年 fanhehe. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tView: UITableView!
    fileprivate var newsList = [Topic]();
    
    enum SegueType:String {
        case SideBar
        case Blog
    }
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let segueIdentifier = SegueType.Blog.rawValue
        let data = newsList[indexPath.row]
        self.performSegue(withIdentifier: segueIdentifier, sender: data)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let id = segue.identifier, let segueId = SegueType(rawValue: id) else { fatalError("identifier error \(String(describing: segue.identifier)).") }
        
        switch segueId {
            case .Blog :
                let dest = segue.destination as! BlogViewController
                dest.data = sender as? Topic
            case .SideBar: return
        }
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

