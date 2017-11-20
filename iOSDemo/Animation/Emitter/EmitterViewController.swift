//
//  EmitterViewController.swift
//  iOSDemo
//
//  Created by Stan Hu on 20/11/2017.
//  Copyright © 2017 Stan Hu. All rights reserved.
//

import UIKit

class EmitterViewController: UIViewController {

    let btnStar = UIButton(frame: CGRect(x: 10, y: 100, width: 50, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
      
        view.addSubview(btnStar)
        
        btnStar.setImage(#imageLiteral(resourceName: "star_hollow"), for: .normal)
        btnStar.setImage(#imageLiteral(resourceName: "star_full"), for: .highlighted)
        btnStar.addTarget(self, action: #selector(click(sender:)), for: .touchUpInside)
    }


    @objc func click(sender:UIButton)  {
        sender.isSelected = !sender.isSelected
    }
    
    
    
}

class EmitterButton: UIButton {
    override var isSelected: Bool{
        didSet{
           setupExplotion()
        }
    }
    
    var explotionLayer:CAEmitterLayer
    
    override init(frame: CGRect) {
        explotionLayer = CAEmitterLayer()
        super.init(frame: frame)
        setupExplotion()
    }
    
    func setupExplotion() {
        let explotionCell = CAEmitterCell()
        explotionCell.name = "explosion"
        explotionCell.alphaRange = 0.10
        explotionCell.alphaSpeed = -1.0
        explotionCell.lifetime = 0.7
        explotionCell.lifetimeRange = 0.3
        explotionCell.birthRate = 2500
        explotionCell.velocity = 40
        explotionCell.velocityRange = 10
        explotionCell.scale = 0.03
        explotionCell.scaleRange = 0.02
//        explotionCell.contents =  没这个图片
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
