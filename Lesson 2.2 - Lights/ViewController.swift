//
//  ViewController.swift
//  Lesson 2.2 - Lights
//
//  Created by Alexey Zinoviev on 22.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    @IBOutlet weak var mainButton: UIButton!
   
    let lightAlpha = 0.3
    var buttonPressCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewWidth = self.view.frame.width
        let lightWidth = viewWidth / 3
        let lightCornerRadius = lightWidth / 2

        mainButton.layer.position.x = 24 + viewWidth / 2 - viewWidth / 6
        mainButton.layer.position.y = self.view.frame.height * 0.9
        mainButton.layer.frame.size = CGSize(width: viewWidth / 3, height: 32)
        mainButton.layer.cornerRadius = viewWidth / 50
        
        setLightProperties(view: redLight, position: 0)
        setLightProperties(view: yellowLight, position: 1)
        setLightProperties(view: greenLight, position: 2)

        func setLightProperties(view: UIView, position: Int) {
            view.alpha = lightAlpha
            view.frame.size = CGSize(width: lightWidth, height: lightWidth)
            view.layer.cornerRadius = lightCornerRadius
            view.layer.position.x = viewWidth / 2
            
            // "16" — отступ сверху,
            // "self.view.frame.height / 10" — расстояние от кнопки до нижней лампочки,
            // "3" — количество лампочек
            view.layer.position.y = 16 + lightWidth + (CGFloat(position) * (self.view.frame.height - mainButton.frame.width - self.view.frame.height / 10) / 3)
        }
        
    }

    @IBAction func buttonPressed() {
        if buttonPressCount == 0 {
            mainButton.setTitle("Next", for: .normal)
            redLight.alpha = 1.0
        }
        
        let lightsView: [UIView] = [redLight, yellowLight, greenLight]
       
        buttonPressCount = buttonPressCount < lightsView.count ? buttonPressCount : 0
        lightsView.map { $0.alpha = lightAlpha }
        lightsView[buttonPressCount].alpha = 1.0
        buttonPressCount += 1

//        if redLight.alpha == 1.0 {
//            yellowLight.alpha = 1.0
//            redLight.alpha = lightAlpha
//        } else if yellowLight.alpha == 1.0 {
//            greenLight.alpha = 1.0
//            yellowLight.alpha = lightAlpha
//        } else if greenLight.alpha == 1.0 {
//            redLight.alpha = 1.0
//            greenLight.alpha = lightAlpha
//        } else {
//            redLight.alpha = 1.0
//        }
        

        
    }
}

