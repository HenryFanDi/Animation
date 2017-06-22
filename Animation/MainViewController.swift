//
//  MainViewController.swift
//  Animation
//
//  Created by HenryFan on 26/6/2016.
//  Copyright © 2016 HenryFanDi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  fileprivate let fromValue = 150.0 as CGFloat
  fileprivate let toValue = 300.0 as CGFloat
  
  fileprivate var animateView = UIView()
  
  // MARK: Lifecycle
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    setupAnimation()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupAnimateView()
    setupShapeLayer()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: Private
  
  fileprivate func setupAnimateView() {
    let screenWidth = UIScreen.main.bounds.width as CGFloat
    let viewWidth = 40.0 as CGFloat
    let viewHeight = viewWidth as CGFloat
    let offsetX = (screenWidth - viewWidth) / 2.0 as CGFloat
    let offsetY = fromValue as CGFloat
    animateView = UIView.init(frame: CGRect(x: offsetX, y: offsetY, width: viewWidth, height: viewHeight))
    animateView.backgroundColor = UIColor.white
    view.addSubview(animateView)
  }
  
  fileprivate func setupShapeLayer() {
    let shapeLayer = CAShapeLayer.init()
    shapeLayer.path = UIBezierPath.init(rect: animateView.bounds).cgPath
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.strokeColor = UIColor.blue.cgColor
    animateView.layer.addSublayer(shapeLayer)
  }
  
  fileprivate func setupAnimation() {
    let animationDown = CABasicAnimation()
    animationDown.keyPath = "position.y"
    animationDown.fromValue = fromValue
    animationDown.toValue = toValue
    animationDown.duration = 1.5
    animationDown.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
    
    let animationRotation = CABasicAnimation()
    animationRotation.keyPath = "transform.rotation.z"
    animationRotation.fromValue = 0.0
    animationRotation.toValue = 2.0 * Float.pi
    animationRotation.duration = 1.5
    animationRotation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
    
    let animationUp = CABasicAnimation()
    animationUp.keyPath = "position.y"
    animationUp.fromValue = toValue
    animationUp.toValue = fromValue
    animationUp.duration = 1.0
    animationUp.beginTime = 1.5
    animationUp.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
    
    let animationGroup = CAAnimationGroup()
    animationGroup.animations = [animationDown, animationRotation, animationUp]
    animationGroup.duration = 2.5
    animationGroup.repeatCount = 99.0
    animateView.layer.add(animationGroup, forKey: "loading")
  }
  
}
