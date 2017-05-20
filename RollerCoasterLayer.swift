//
//  RollerCoasterLayer.swift
//  AnimationSwiftDemo
//
//  Created by Ngmm_Jadon on 2017/5/19.
//  Copyright © 2017年 Ngmm_Jadon. All rights reserved.
//

import UIKit

class RollerCoasterLayer: CALayer {
    
    var groundLayer: CALayer?
    var yellowPathWay: CAShapeLayer?
    var greenPathWay: CAShapeLayer?
    
    init(frame: CGRect) {
        super.init()
        self.frame = frame
        initLayers(size: frame.size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initLayers(size: CGSize) {
        initGradientLayer(size)
        initMountainLayer(size)
        initGrasslandLayer(size)
        groundLayer = initGroundLayer(size)
        yellowPathWay = initYellowPathWayLayer(size)
        greenPathWay = initGreenPathWayLayer(size)
        for index in 0...4 {
            addYellowPathWayCarAnimaton(CACurrentMediaTime() + 0.07 * Double(index))
        }
        for index in 0...4 {
            addGreenPathWayCarAnimation(CACurrentMediaTime() + 0.085 * Double(index))
        }
        addCloudAnimation(size)
        addTreeLayer(size)
    }
    
    func getPoint(_ fromPoint: CGPoint, toPoint: CGPoint, referenceX: CGFloat) -> CGFloat {
        let x1 = fromPoint.x
        let y1 = fromPoint.y
        let x2 = toPoint.x
        let y2 = toPoint.y
        let a: CGFloat = (y2 - y1) / (x2 - x1)
        let b: CGFloat = y1 - a * x1
        let y = a * referenceX + b
        return y
    }
    
    //初始化背景
    @discardableResult
    func initGradientLayer(_ size: CGSize) -> CAGradientLayer {
        let layer: CAGradientLayer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        //设置渐变颜色
        layer.colors = [UIColor(colorLiteralRed: 178.0/255.0, green: 226.0/255.0, blue: 248.0/255.0, alpha: 1.0).cgColor, UIColor(colorLiteralRed: 232.0/255.0, green: 244.0/255.0, blue: 193.0/255.0, alpha: 1.0).cgColor];
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        addSublayer(layer)
        return layer
    }
    
    //初始化大山
    func initMountainLayer(_ size: CGSize) {
        //第一座山
        let firstMountainSnow: CAShapeLayer = CAShapeLayer()
        let snowPathOne: UIBezierPath = UIBezierPath()
        snowPathOne.move(to: CGPoint(x: 0, y: size.height - 120))
        snowPathOne.addLine(to: CGPoint(x: 100, y: 100))
        snowPathOne.addLine(to: CGPoint(x: size.width / 3, y: size.height - 100))
        snowPathOne.addLine(to: CGPoint(x: size.width / 1.5, y: size.height - 50))
        snowPathOne.addLine(to: CGPoint(x: 0, y: size.height))
        firstMountainSnow.path = snowPathOne.cgPath
        firstMountainSnow.fillColor = UIColor.white.cgColor
        addSublayer(firstMountainSnow)
        
        let firstMountainGround: CAShapeLayer = CAShapeLayer()
        let groundPathOne: UIBezierPath = UIBezierPath()
        groundPathOne.move(to: CGPoint(x: 0, y: size.height - 120))
        var groundPathUpHeightOne: CGFloat = getPoint(CGPoint(x: 0, y: size.height - 120), toPoint: CGPoint(x: 100, y: 100), referenceX: 55)
        var groundPathDownHeightOne: CGFloat = getPoint(CGPoint(x: 100, y: 100), toPoint: CGPoint(x: size.width / 3, y: size.height - 100), referenceX: 160)
        groundPathOne.addLine(to: CGPoint(x: 55, y: groundPathUpHeightOne))
        groundPathOne.addLine(to: CGPoint(x: 70, y: groundPathUpHeightOne + 15))
        groundPathOne.addLine(to: CGPoint(x: 90, y: groundPathUpHeightOne))
        groundPathOne.addLine(to: CGPoint(x: 110, y: groundPathUpHeightOne + 25))
        groundPathOne.addLine(to: CGPoint(x: 130, y: groundPathUpHeightOne - 5))
        groundPathOne.addLine(to: CGPoint(x: 160, y: groundPathDownHeightOne))
        groundPathOne.addLine(to: CGPoint(x: size.width / 3, y: size.height - 100))
        groundPathOne.addLine(to: CGPoint(x: size.width / 1.5, y: size.height - 50))
        groundPathOne.addLine(to: CGPoint(x: 0, y: size.height))
        firstMountainGround.path = groundPathOne.cgPath
        firstMountainGround.fillColor = UIColor(red: 104.0/255.0, green: 92.0/255.0, blue: 157.0/255.0, alpha: 1.0).cgColor
        addSublayer(firstMountainGround)
        
        //第二座山
        let secondMountainSnow: CAShapeLayer = CAShapeLayer()
        let snowPathTwo:UIBezierPath = UIBezierPath()
        snowPathTwo.move(to: CGPoint(x: size.width/4, y: size.height - 90))
        snowPathTwo.addLine(to: CGPoint(x: size.width/2.7, y: 200))
        snowPathTwo.addLine(to: CGPoint(x: size.width/1.8, y: size.height - 85))
        snowPathTwo.addLine(to: CGPoint(x: size.width/1.6, y: size.height - 125))
        snowPathTwo.addLine(to: CGPoint(x: size.width/1.35, y: size.height - 70))
        snowPathTwo.addLine(to: CGPoint(x: 0, y: size.height))
        secondMountainSnow.path = snowPathTwo.cgPath
        secondMountainSnow.fillColor = UIColor.white.cgColor
        insertSublayer(secondMountainSnow, below: firstMountainSnow)
        
        let secondMountainGround: CAShapeLayer = CAShapeLayer()
        let groundPathTwo:UIBezierPath = UIBezierPath()
        groundPathTwo.move(to: CGPoint(x: 0, y: size.height))
        groundPathTwo.addLine(to: CGPoint(x: size.width/4, y: size.height - 90))
        groundPathUpHeightOne = getPoint(CGPoint(x: size.width/4, y: size.height - 90), toPoint: CGPoint(x: size.width/2.7, y: 200), referenceX: size.width/4+50)
        groundPathDownHeightOne = getPoint(CGPoint(x: size.width/1.8, y: size.height - 85), toPoint: CGPoint(x: size.width/2.7, y: 200), referenceX: size.width/2.2)
        let groundPathUpHeightTwo = getPoint(CGPoint(x: size.width/1.8, y: size.height - 85), toPoint: CGPoint(x: size.width/1.6, y: size.height - 125), referenceX: size.width/1.67)
        let groundPathDownHeightTwo = getPoint(CGPoint(x: size.width/1.35, y: size.height - 70), toPoint: CGPoint(x: size.width/1.6, y: size.height - 125), referenceX: size.width/1.50)
        groundPathTwo.addLine(to: CGPoint(x: size.width/4+50, y: groundPathUpHeightOne))
        groundPathTwo.addLine(to: CGPoint(x: size.width/4+70, y: groundPathUpHeightOne + 15))
        groundPathTwo.addLine(to: CGPoint(x: size.width/4+90, y: groundPathUpHeightOne))
        groundPathTwo.addLine(to: CGPoint(x: size.width/4+110, y: groundPathUpHeightOne + 15))
        groundPathTwo.addLine(to: CGPoint(x: size.width/2.2, y: groundPathDownHeightOne))
        groundPathTwo.addLine(to: CGPoint(x: size.width/1.8, y: size.height - 85))
        groundPathTwo.addLine(to: CGPoint(x: size.width/1.67, y: groundPathUpHeightTwo))
        groundPathTwo.addLine(to: CGPoint(x: size.width/1.65, y: groundPathUpHeightTwo+5))
        groundPathTwo.addLine(to: CGPoint(x: size.width/1.60, y: groundPathUpHeightTwo-2))
        groundPathTwo.addLine(to: CGPoint(x: size.width/1.58, y: groundPathDownHeightTwo+2))
        groundPathTwo.addLine(to: CGPoint(x: size.width/1.55, y: groundPathDownHeightTwo-5))
        groundPathTwo.addLine(to: CGPoint(x: size.width/1.50, y: groundPathDownHeightTwo))
        groundPathTwo.addLine(to: CGPoint(x: size.width/1.35, y: size.height - 70))
        groundPathTwo.addLine(to: CGPoint(x: 0, y: size.height))
        secondMountainGround.path = groundPathTwo.cgPath
        secondMountainGround.fillColor = UIColor(colorLiteralRed: 75.0/255.0, green: 65.0/255.0, blue: 111.0/255.0, alpha: 1.0).cgColor
        insertSublayer(secondMountainGround, below: firstMountainSnow)
    }
    
    //初始化草坪
    @discardableResult
    func initGrasslandLayer(_ size: CGSize) -> (CAShapeLayer, CAShapeLayer) {
        //第一块草坪
        let firstGrassland: CAShapeLayer = CAShapeLayer()
        let pathOne: UIBezierPath = UIBezierPath()
        pathOne.move(to: CGPoint(x: 0, y: size.height - 20))
        pathOne.addLine(to: CGPoint(x: 0, y: size.height - 100))
        pathOne.addQuadCurve(to: CGPoint(x: size.width/3.0, y: size.height - 20), controlPoint: CGPoint(x: size.width/6.0, y: size.height - 100))
        firstGrassland.path = pathOne.cgPath
        firstGrassland.fillColor = UIColor(colorLiteralRed: 82.0/255.0, green: 177.0/255.0, blue: 44.0/255.0, alpha: 1.0).cgColor
        addSublayer(firstGrassland)
        
        //第二块草坪
        let secondGrassland: CAShapeLayer = CAShapeLayer()
        let pathTwo:UIBezierPath = UIBezierPath()
        pathTwo.move(to: CGPoint(x: 0, y: size.height - 20))
        pathTwo.addQuadCurve(to: CGPoint(x: size.width, y: size.height - 60), controlPoint: CGPoint(x: size.width/2.0, y: size.height - 100))
        pathTwo.addLine(to: CGPoint(x: size.width, y: size.height - 20))
        secondGrassland.path = pathTwo.cgPath
        secondGrassland.fillColor = UIColor(colorLiteralRed: 92.0/255.0, green: 195.0/255.0, blue: 52.0/255.0, alpha: 1.0).cgColor
        addSublayer(secondGrassland)
        
        return (firstGrassland, secondGrassland)
    }
    
    //初始化土地
    func initGroundLayer(_ size: CGSize) -> CALayer {
        let ground: CALayer = CALayer()
        ground.frame = CGRect(x: 0, y: size.height - 20, width: size.width, height: 20)
        ground.backgroundColor = UIColor(patternImage: UIImage(named: "ground")!).cgColor
//        ground.contents = UIImage(named: "ground")?.cgImage
        addSublayer(ground)
        return ground
    }
    
    //初始化黄色轨道
    func initYellowPathWayLayer(_ size: CGSize) -> CAShapeLayer {
        let yellowPathWay: CAShapeLayer = CAShapeLayer()
        yellowPathWay.lineWidth = 4
        yellowPathWay.strokeColor = UIColor(colorLiteralRed: 210.0/255.0, green: 179.0/255.0, blue: 54.0/255.0, alpha: 1.0).cgColor
        
        let path:UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: size.height - 70))
        path.addCurve(to: CGPoint(x: size.width/1.5, y: 200), controlPoint1: CGPoint(x: size.width/6, y: size.height - 200), controlPoint2: CGPoint(x: size.width/2.5, y: size.height+50))
        path.addQuadCurve(to: CGPoint(x: size.width+10, y: size.height/3), controlPoint: CGPoint(x: size.width-100, y: 50))
        path.addLine(to: CGPoint(x: size.width + 10, y: size.height+10))
        path.addLine(to: CGPoint(x: 0, y: size.height+10))
        yellowPathWay.fillColor = UIColor(patternImage: UIImage(named: "yellowPathWay")!).cgColor
        yellowPathWay.path = path.cgPath
        insertSublayer(yellowPathWay, below: groundLayer)

        let lineLayer:CAShapeLayer = CAShapeLayer()
        lineLayer.lineCap = kCALineCapRound
        lineLayer.strokeColor = UIColor.white.cgColor
        lineLayer.lineDashPattern = [NSNumber(value: 1 as Int32),NSNumber(value: 5 as Int32)]
        lineLayer.lineWidth = 2
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.path = path.cgPath
        yellowPathWay.addSublayer(lineLayer)
        
        return yellowPathWay
    }
    
    //初始化绿色轨道
    func initGreenPathWayLayer(_ size: CGSize) -> CAShapeLayer {
        let greenPathWay: CAShapeLayer = CAShapeLayer()
        greenPathWay.lineWidth = 4
//        greenPathWayNobg.fillRule = kCAFillRuleEvenOdd
        greenPathWay.strokeColor = UIColor(colorLiteralRed: 0.0/255.0, green: 147.0/255.0, blue: 163.0/255.0, alpha: 1.0).cgColor
        
        let path:UIBezierPath = UIBezierPath()
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        path.move(to: CGPoint(x: size.width + 10, y: size.height))
        path.addLine(to: CGPoint(x: size.width + 10, y: size.height - 70))
        path.addQuadCurve(to: CGPoint(x: size.width/1.8, y: size.height - 70), controlPoint: CGPoint(x: size.width - 120, y: 200))
        path.addArc(withCenter: CGPoint(x: size.width/1.9, y: size.height - 140), radius: 70, startAngle: CGFloat(0.5*M_PI), endAngle: CGFloat(2.5*M_PI), clockwise: true)
        path.addCurve(to: CGPoint(x: 0, y: size.height - 100), controlPoint1: CGPoint(x: size.width/1.8 - 60, y: size.height - 60), controlPoint2: CGPoint(x: 150, y: size.height/2.3))
        path.addLine(to: CGPoint(x: -100, y: size.height + 10))
        greenPathWay.fillColor = UIColor.clear.cgColor
        greenPathWay.path = path.cgPath
        insertSublayer(greenPathWay, below: groundLayer)
        
        let greenPathWayBg:CAShapeLayer = CAShapeLayer()
//        greenLayer.fillRule = kCAFillRuleEvenOdd
//        greenPathWayBg.strokeColor = UIColor(colorLiteralRed: 0.0/255.0, green: 147.0/255.0, blue: 163.0/255.0, alpha: 1.0).cgColor
        let grennPath:UIBezierPath = UIBezierPath()
        grennPath.move(to: CGPoint(x: size.width + 10, y: size.height))
        grennPath.addLine(to: CGPoint(x: size.width + 10, y: size.height - 70))
        grennPath.addQuadCurve(to: CGPoint(x: size.width/1.8, y: size.height - 70), controlPoint: CGPoint(x: size.width - 120, y: 200))
        grennPath.addCurve(to: CGPoint(x: 0, y: size.height - 100), controlPoint1: CGPoint(x: size.width/1.8 - 60, y: size.height - 60), controlPoint2: CGPoint(x: 150, y: size.height/2.3))
        grennPath.addLine(to: CGPoint(x: -100, y: size.height + 10))
        greenPathWayBg.fillColor = UIColor(patternImage: UIImage(named: "greenPathWay")!).cgColor
        greenPathWayBg.path = grennPath.cgPath
        insertSublayer(greenPathWayBg, below: greenPathWay)
        
        let lineLayer:CAShapeLayer = CAShapeLayer()
        lineLayer.lineCap = kCALineCapRound
        lineLayer.strokeColor = UIColor.white.cgColor
        lineLayer.lineDashPattern = [NSNumber.init(value: 1 as Int32),NSNumber.init(value: 5 as Int32)]
        lineLayer.lineWidth = 2
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.path = path.cgPath
        greenPathWay.addSublayer(lineLayer)
        
        return greenPathWay
    }
    
    //添加黄色轨道的小车动画
    func addYellowPathWayCarAnimaton(_ beginTime: CFTimeInterval) {
        let carLayer: CALayer = CALayer()
        carLayer.frame = CGRect(x: -17, y: 0, width: 17, height: 11)
//        carLayer.setAffineTransform(CGAffineTransform(translationX: 0, y: -7))
        carLayer.contents = UIImage(named: "yellowPathCar")?.cgImage
        
        let animation:CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position")
        animation.path = yellowPathWay?.path
        animation.duration = 6
        animation.beginTime = beginTime
        animation.repeatCount = MAXFLOAT
        animation.calculationMode = kCAAnimationCubicPaced
        animation.rotationMode = kCAAnimationRotateAuto
        
        carLayer.add(animation, forKey: "position")
        yellowPathWay?.addSublayer(carLayer)
    }
    
    //添加绿色轨道的小车动画
    func addGreenPathWayCarAnimation(_ beginTime: CFTimeInterval) {
        let carLayer: CALayer = CALayer()
        carLayer.frame = CGRect(x: -17, y: 0, width: 17, height: 11)
//        carLayer.setAffineTransform(CGAffineTransform(translationX: 0, y: -2))
        carLayer.contents = UIImage(named: "greenPathCar")?.cgImage
        
        let animation:CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position")
        animation.path = greenPathWay?.path
        animation.duration = 6
        animation.beginTime = beginTime
        animation.repeatCount = MAXFLOAT
        animation.calculationMode = kCAAnimationCubicPaced
        animation.rotationMode = kCAAnimationRotateAuto
        
        carLayer.add(animation, forKey: "position")
        greenPathWay?.addSublayer(carLayer)
    }
    
    //初始化云朵动画
    @discardableResult
    func addCloudAnimation(_ size: CGSize) -> CALayer {
        let cloudLayer:CALayer = CALayer()
        cloudLayer.contents = UIImage(named: "cloud")?.cgImage
        cloudLayer.frame = CGRect(x: size.width + 63, y: 0, width: 63, height: 20)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: size.width + 63, y: 40))
        path.addLine(to: CGPoint(x: -63, y: 40))
        
        let animation = CAKeyframeAnimation.init(keyPath: "position")
        animation.path = path.cgPath
        animation.duration = 40
        animation.autoreverses = false
        animation.repeatCount = MAXFLOAT
        animation.calculationMode = kCAAnimationPaced
        cloudLayer.add(animation, forKey: "position")
        
        addSublayer(cloudLayer)
        return cloudLayer
    }
    
    //添加树
    func addTreeLayer(_ size:CGSize) {
        for index in 0...6 {
            let treeOne = CALayer()
            treeOne.contents = UIImage.init(named: "tree")?.cgImage
            treeOne.frame = CGRect(x: [5,55,70,size.width/3+15,size.width/3+25,size.width-130,size.width-160][index], y: size.height - 43, width: 13, height: 23)
            addSublayer(treeOne)
        }
        for index in 0...3 {
            let treeOne = CALayer()
            treeOne.contents = UIImage.init(named: "tree")?.cgImage
            treeOne.frame = CGRect(x: [10,60,size.width/3,size.width-150][index], y: size.height - 52, width: 18, height: 32)
            addSublayer(treeOne)
        }
        for index in 0...1 {
            let treeOne = CALayer()
            treeOne.contents = UIImage.init(named: "tree")?.cgImage
            treeOne.frame = CGRect(x: [size.width-210,size.width-50][index], y: [size.height - 75,size.height - 80][index], width: 18, height: 32)
            insertSublayer(treeOne, below: yellowPathWay)
        }
        for index in 0...2 {
            let treeOne = CALayer()
            treeOne.contents = UIImage.init(named: "tree")?.cgImage
            treeOne.frame = CGRect(x: [size.width-235, size.width-220, size.width-40][index], y: [size.height - 67 ,size.height - 67 , size.height - 72][index], width: 13, height: 23)
            insertSublayer(treeOne, below: yellowPathWay)
        }
    }

}
