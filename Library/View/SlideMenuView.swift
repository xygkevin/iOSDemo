//
//  SlideMenuView.swift
//  iOSDemo
//
//  Created by Stan Hu on 2019/3/13.
//  Copyright © 2019 Stan Hu. All rights reserved.
//

import UIKit
//一个可以左右抽屉式滑出的菜单，等待完成
//目前这个从右边出来
class SlideMenuView: UIView {

    let vMenu = UIView()
    
    var menu = [String:UIImage](){
        didSet{
            
        }
    }
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        
        backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.3)
        
        vMenu.backgroundColor = UIColor.white
        
        addSubview(vMenu)
        vMenu.snp.makeConstraints { (m) in
            m.left.equalTo(self.snp.right)
            m.top.bottom.equalTo(0)
            m.width.equalTo(0.6 * UIScreen.main.bounds.size.width)
        }
    }
    
    func setMenu()  {
        var previousBtn:UIButton?
        for item in menu {
            let btn = UIButton()
            btn.setTitle(item.key, for: .normal)
            btn.setImage(item.value, for: .normal)
            vMenu.addSubview(btn)
            btn.snp.makeConstraints { (m) in
                m.left.equalTo(10)
                m.top.equalTo(previousBtn == nil ? 10 : previousBtn!.snp.bottom)
                m.height.equalTo(20)
            }
            previousBtn = btn
        }
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func expand() {
        UIView.animate(withDuration: 1, animations: {
            self.vMenu.snp.updateConstraints { (m) in
                m.left.equalTo(UIScreen.main.bounds.size.width * 0.4)
            }
            self.layoutIfNeeded()
        })
    }
    
    func collapse(){
        UIView.animate(withDuration: 1, animations: {
            self.vMenu.snp.updateConstraints { (m) in
                m.left.equalTo(self.snp.right)
            }
            self.layoutIfNeeded()
        })
    }
    
}