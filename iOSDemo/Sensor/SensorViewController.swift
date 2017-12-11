
//
//  SensorViewController.swift
//  iOSDemo
//
//  Created by Stan Hu on 11/12/2017.
//  Copyright © 2017 Stan Hu. All rights reserved.
//

import UIKit
import TangramKit
class SensorViewController: UIViewController {

    var arrData = ["ImageRotation","Ball"]
    var tbMenu = UITableView()
    override func loadView() {
        super.loadView()
        self.view = TGFrameLayout(frame: self.view.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        tbMenu.dataSource = self
        tbMenu.delegate = self
        tbMenu.tg_width.equal(.fill)
        tbMenu.tg_height.equal(.fill)
        tbMenu.tg_left.equal(0)
        tbMenu.tg_top.equal(0)
        tbMenu.tableFooterView = UIView()
        view.addSubview(tbMenu)
    }

}

extension SensorViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = arrData[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(ImageRotationViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(BallViewController(), animated: true)
        default:
            break
        }
    }
    
}
