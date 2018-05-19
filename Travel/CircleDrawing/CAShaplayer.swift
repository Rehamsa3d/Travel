//
//  CAShaplayer.swift
//  Travel
//
//  Created by ahmedxiio on 4/22/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit
class CAShaplayer:UIView{

    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: CGRect(x: -100, y: -200, width: 100 + self.frame.width + 100, height: self.frame.height))
        let shape = CAShapeLayer()
        
        shape.path = path.cgPath
        
        self.layer.insertSublayer(shape, at: 0)
        
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//         setup()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//         setup()
//    }
//
//    override func layoutSubviews() {
//        setup()
//    }
//
//    let shapeLayer = CAShapeLayer()
//
//    func setup() {
//
//        let shapeLayer = CAShapeLayer()
//
//        shapeLayer.frame = CGRect(x: -bounds.width, y: -bounds.height, width: bounds.width*2, height: bounds.height*2)
//        shapeLayer.lineWidth = 20.0
//        shapeLayer.fillColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
//
//
//        let arcCenter = CGPoint(x: 260.0, y: 260.0)
//        let radius = CGFloat(200.0)
//        let startAngle = CGFloat(90.0)
//        let endAngle = -CGFloat.pi
//        let clockwise = false
//
//        let openCirclePath = UIBezierPath(arcCenter: arcCenter,
//                                          radius: radius,
//                                          startAngle: startAngle,
//                                          endAngle: endAngle,
//                                          clockwise: clockwise)
//
//        shapeLayer.path = openCirclePath.cgPath
//
//    }
}
