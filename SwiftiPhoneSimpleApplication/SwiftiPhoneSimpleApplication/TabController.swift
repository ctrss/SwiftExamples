//
//  TabController.swift
//  SwiftiPhoneSimpleApplication
//
//  Created by Stuart on 2016. 4. 18..
//  Copyright © 2016년 staryun. All rights reserved.
//

import UIKit

class TabController: UITabBarController {
    
    let tableView = UIView()
    let tabBtn1 = UIButton()
    let tabBtn2 = UIButton()
    let tabBtn3 = UIButton()
    let tabBtn4 = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
/*        tableView.frame = CGRectMake(0, 20, self.view.frame.size.width, 60)
        tableView.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        
        
        tabBtn1.setTitle("First", forState:UIControlState.Normal)
        tabBtn2.setTitle("Second", forState:UIControlState.Normal)
        tabBtn3.setTitle("Third", forState:UIControlState.Normal)
        tabBtn4.setTitle("Forth", forState:UIControlState.Normal)*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
