//
//  SetCardView.swift
//  Set_Lab_3
//
//  Created by Anique Davla on 10/6/19.
//  Copyright © 2019 Anique. All rights reserved.
//

import UIKit
@IBDesignable

class SetCardView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
       // Drawing code
        drawCardOutline()
        //drawDiamond()
        drawSetOval()
    }
    
    
    
    //draws a rounded card
    func drawCardOutline(){
           //card outline
           let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 26.0)
           UIColor.white.setFill()
           roundedRect.addClip()
           roundedRect.fill()
    }
    //draws a Squiggle
    func drawSquiggle(){
        let ovalSize = CGSize.init(width: 80.0, height: 40.0)
        let ovalPath = UIBezierPath(ovalIn: bounds.leftHalf.sized(to: ovalSize))
        UIColor.white.setFill()
        ovalPath.addClip()
        ovalPath.fill()
        
    }
    //draws a Set Oval
    func drawSetOval(){
        let arcCenter = CGPoint(x: bounds.width / 1.5, y: bounds.height / 2)
        let radius = bounds.height / 10
        
        //right side arc
        let rightArcStartAngle = CGFloat.pi/4
        let rightArcEndAngle = (7*CGFloat.pi)/4
        let rightArcPath = UIBezierPath(
                            arcCenter: arcCenter,
                            radius: radius,
                            startAngle: rightArcStartAngle,
                            endAngle: rightArcEndAngle,
                            clockwise: false)
        let topLinePoint = CGPoint(x: radius * 2, y: (arcCenter.y - (radius / 1.4)))
        rightArcPath.addLine(to: topLinePoint)
//        UIColor.red.setStroke()
//        rightArcPath.addClip()
//        rightArcPath.stroke()
        
        //left side arc
        let leftArcCenter = CGPoint(x: bounds.width / 3, y: bounds.height / 2)
       //let leftArcRadius = bounds.height / 4
        let leftArcStartAngle = 5 * CGFloat.pi/4
        let leftArcEndAngle = 3 * CGFloat.pi/4
//        let leftArcPath = UIBezierPath(
//                            arcCenter: leftArcCenter,
//                            radius: leftArcRadius,
//                            startAngle: leftArcStartAngle,
//                            endAngle: leftArcEndAngle,
//                            clockwise: true)
//        UIColor.red.setStroke()
//        leftArcPath.addClip()
//        leftArcPath.stroke()
        rightArcPath.addArc(withCenter: leftArcCenter, radius: radius, startAngle: leftArcStartAngle, endAngle: leftArcEndAngle, clockwise: false)
        let bottomLine = CGPoint(x: radius * 5.7, y: (leftArcCenter.y + (radius / 1.4)))
        rightArcPath.addLine(to: bottomLine)
        UIColor.red.setStroke()
        //rightArcPath.addClip()
        rightArcPath.stroke()
    }
    //draws a triangle
    func drawDiamond(){
        //triangle
        let triangle = UIBezierPath()
        triangle.move(to: CGPoint(x: 40,y: 25))
        triangle.addLine(to: CGPoint(x: 23, y: 50))
        triangle.addLine(to: CGPoint(x: 40, y: 70))
        triangle.addLine(to: CGPoint(x: 55, y: 50))
        triangle.addLine(to: CGPoint(x: 40, y: 25))
        triangle.addClip()
        UIColor.green.setFill()
        triangle.fill()
        UIColor.black.setStroke()
        triangle.stroke()
    }

    
}

extension CGPoint {
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: x+dx, y: y+dy)
    }
}

extension CGRect {
    var leftHalf: CGRect {
        return CGRect(x: minX, y: minY, width: width/2, height: height)
    }
    
    var rightHalf: CGRect {
        return CGRect(x: midX, y: minY, width: width/2, height: height)
    }
    
    func inset(by size: CGSize) -> CGRect {
        return insetBy(dx: size.width, dy: size.height)
    }
    
    func sized(to size: CGSize) -> CGRect {
        return CGRect(origin: origin, size: size)
    }
    
    func zoom(by scale: CGFloat) -> CGRect {
        let newWidth = width * scale
        let newHeight = height * scale
        return insetBy(dx: (width - newWidth) / 2, dy: (height - newHeight) / 2)
    }
}
