//
//  MainViewController.swift
//  Animation
//
//  Created by HenryFan on 26/6/2016.
//  Copyright © 2016 HenryFanDi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
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
    let offsetY = 150.0 as CGFloat
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
    animationDown.fromValue = 150.0
    animationDown.toValue = 300.0
    animationDown.duration = 2.5
    animationDown.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
    
    let animationGroup = CAAnimationGroup()
    animationGroup.animations = [animationDown]
    animationGroup.duration = 2.5
    animateView.layer.addAnimation(animationGroup, forKey: "loading")
  }
  
}
