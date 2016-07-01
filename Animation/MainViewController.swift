//
//  MainViewController.swift
//  Animation
//
//  Created by HenryFan on 26/6/2016.
//  Copyright © 2016 HenryFanDi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  private let fromValue = 150.0 as CGFloat
  private let toValue = 300.0 as CGFloat
  
  private var animateView = UIView()
  
  // MARK: Lifecycle
  
  override func viewDidAppear(animated: Bool) {
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
  
  private func setupAnimateView() {
    let screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds) as CGFloat
    let viewWidth = 40.0 as CGFloat
    let viewHeight = viewWidth as CGFloat
    let offsetX = (screenWidth - viewWidth) / 2.0 as CGFloat
    let offsetY = fromValue as CGFloat
    animateView = UIView.init(frame: CGRectMake(offsetX, offsetY, viewWidth, viewHeight))
    animateView.backgroundColor = UIColor.whiteColor()
    view.addSubview(animateView)
  }
  
  private func setupShapeLayer() {
    let shapeLayer = CAShapeLayer.init()
    shapeLayer.path = UIBezierPath.init(rect: animateView.bounds).CGPath
    shapeLayer.fillColor = UIColor.clearColor().CGColor
    shapeLayer.strokeColor = UIColor.blueColor().CGColor
    animateView.layer.addSublayer(shapeLayer)
  }
  
  private func setupAnimation() {
    let animationDown = CABasicAnimation()
    animationDown.keyPath = "position.y"
    animationDown.fromValue = fromValue
    animationDown.toValue = toValue
    animationDown.duration = 1.5
    animationDown.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
    
    let animationRotation = CABasicAnimation()
    animationRotation.keyPath = "transform.rotation.z"
    animationRotation.fromValue = 0.0
    animationRotation.toValue = 2.0 * M_PI
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
    animateView.layer.addAnimation(animationGroup, forKey: "loading")
  }
  
}
