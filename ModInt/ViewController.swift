//
//  ViewController.swift
//  ModInt
//
//  Created by Dengfeng Zhang on 16/2/17.
//  Copyright © 2016年 Dengfeng Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calc: UIButton!
    @IBOutlet weak var x: UITextField!
    @IBOutlet weak var y: UITextField!
    @IBOutlet weak var res: UILabel!
    @IBOutlet weak var p: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func click(sender: UIButton) {
        let a = Double((x.text! as NSString).doubleValue)
        let b = Double((y.text! as NSString).doubleValue)
        let c = Double((p.text! as NSString).doubleValue)
        let first=ModInt(Int(a),Int(c))
        let second=ModInt(Int(b),Int(c))
        let result=first+second
        res.text="= "+String(result.getv())
    }

}
