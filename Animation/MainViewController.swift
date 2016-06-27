//
//  MainViewController.swift
//  Animation
//
//  Created by HenryFan on 26/6/2016.
//  Copyright © 2016 HenryFanDi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupAnimateView()
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
    let animateView = UIView.init(frame: CGRectMake(offsetX, offsetY, viewWidth, viewHeight))
    animateView.backgroundColor = UIColor.whiteColor()
    view.addSubview(animateView)
  }
  
}
