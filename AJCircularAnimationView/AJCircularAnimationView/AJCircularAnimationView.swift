//
//  AJCircularAnimationView.swift
//  CircularAnimation
//
//  Created by Akila J Wasala on 6/19/18.
//  Copyright © 2018 AkilaWasala. All rights reserved.
//

import UIKit

class AJCircularAnimationView: UIView {

    let shapeLayerNew = CAShapeLayer()

    var trackColor = UIColor.lightGray.cgColor
    var fillColor = UIColor.black.cgColor
    
    let startAngle : CGFloat = -CGFloat.pi/2
    let endAngle : CGFloat = 2 * CGFloat.pi
    let lineWidth : CGFloat = 20

    override func draw(_ rect: CGRect) {
        
        let trackLayer = CAShapeLayer()
        let center = CGPoint(x: self.layer.bounds.height/2, y: self.layer.bounds.width/2)
        
        let radius = self.layer.bounds.height/2 - lineWidth
        
        //Track view
        let circularTrackPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: -CGFloat.pi/2, endAngle: 3 * CGFloat.pi/2, clockwise: true)
        trackLayer.path = circularTrackPath.cgPath
        trackLayer.strokeColor = trackColor
        trackLayer.lineWidth = lineWidth
        trackLayer.lineCap = kCALineCapRound
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.frame = self.layer.bounds
        trackLayer.position = center
        
        //Fill view
        shapeLayerNew.path = circularTrackPath.cgPath
        shapeLayerNew.strokeColor = fillColor
        shapeLayerNew.lineWidth = lineWidth - 8
        shapeLayerNew.lineCap = kCALineCapRound
        shapeLayerNew.fillColor = UIColor.clear.cgColor
        shapeLayerNew.strokeEnd = 0
        shapeLayerNew.frame = self.layer.bounds
        shapeLayerNew.position = center
        
        self.layer.addSublayer(trackLayer)
        self.layer.addSublayer(shapeLayerNew)
    }
    
    func startAnimate(timeDuration: Int) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = CFTimeInterval(timeDuration)
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayerNew.add(basicAnimation, forKey: "UrBasicAnim")
    }
    
    func stopAnimation() {
        
    }
}
