//
//  ViewController.swift
//  HW_9
//
//  Created by Роман Важник on 20/08/2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import Spring

class ViewController: UIViewController {
    
    @IBOutlet var nextAnimationButton: SpringButton!
    @IBOutlet var animatedView: SpringView!
    @IBOutlet var animationName: SpringLabel!
    
    var gradient: CAGradientLayer! {
        didSet {
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 0, y: 1)
            let startColor = #colorLiteral(red: 0.262745098, green: 0.7960784314, blue: 1, alpha: 1).cgColor
            let endColor = #colorLiteral(red: 0.5921568627, green: 0.03137254902, blue: 0.8, alpha: 1).cgColor
            gradient.colors = [startColor, endColor]
        }
    }
    
    var nextAnimation = animations.randomElement()
    var nextCurve = curves.randomElement()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradient = CAGradientLayer()
        view.layer.insertSublayer(gradient, at: 0)
        
        nextAnimationButton.setTitle("\(nextAnimation!) + \(nextCurve!)", for: .normal)
        
        animatedViewSetup()
        nextAnimationButtonSetup()
    }
    
    override func viewDidLayoutSubviews() {
        gradient.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }

    @IBAction func nextAnimationButtonPressed() {
        
        nextAnimationButton.animation = "shake"
        nextAnimationButton.animate()
        
        animationName.text = "This animation was (\(nextAnimation!) + \(nextCurve!))"
        animatedView.animation = nextAnimation!
        animatedView.curve = nextCurve!
        animatedView.animate()
        
        nextAnimation = animations.randomElement()
        nextCurve = curves.randomElement()
        
        nextAnimationButton.setTitle("\(nextAnimation!) + \(nextCurve!)", for: .normal)
    }
    
    private func nextAnimationButtonSetup() {
        nextAnimationButton.duration = 1
        nextAnimationButton.force = 1
        nextAnimationButton.delay = 0
    }
    
    private func animatedViewSetup() {
        animatedView.duration = 1
        animatedView.force = 1
        animatedView.delay = 0
    }
    
}

