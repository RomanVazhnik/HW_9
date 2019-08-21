//
//  ViewController.swift
//  HW_9
//
//  Created by Роман Важник on 20/08/2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import Spring

class ViewController: UIViewController {
    
    @IBOutlet var nextAnimationButton: UIButton!
    @IBOutlet var animatedView: SpringView!
    @IBOutlet var animationName: SpringLabel!
    
    var nextAnimation = animations.randomElement()
    var nextCurve = curves.randomElement()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextAnimationButton.setTitle("\(nextAnimation!) + \(nextCurve!)", for: .normal)
        
        animatedViewSetup()
        
    }
    
    func animatedViewSetup() {
        animatedView.duration = 1
        animatedView.force = 1
        animatedView.delay = 0
    }

    @IBAction func nextAnimationButtonPressed() {
        
        animationName.text = "This animation was (\(nextAnimation!) + \(nextCurve!))"
        animatedView.animation = nextAnimation!
        animatedView.curve = nextCurve!
        animatedView.animate()
        
        nextAnimation = animations.randomElement()
        nextCurve = curves.randomElement()
        
        nextAnimationButton.setTitle("\(nextAnimation!) + \(nextCurve!)", for: .normal)
        
    }
    
}

