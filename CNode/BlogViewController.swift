//
//  BlogViewController.swift
//  CNode
//
//  Created by fanhehe on 2017/4/13.
//  Copyright © 2017年 fanhehe. All rights reserved.
//

import UIKit

class BlogViewController: UIViewController {
    var data: Topic? {
        set {
            print(newValue ?? "juju")
        }
        get { return self.data }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
