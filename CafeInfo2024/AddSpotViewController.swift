//
//  AddSpotViewController.swift
//  CafeInfo2024
//
//  Created by Gomi Kouki on 2024/01/29.
//

import UIKit

class AddSpotViewController: UIViewController {

    @IBOutlet var coffeeButton: [UIButton]!
    @IBOutlet var serviceButton: [UIButton]!
    @IBOutlet var atmosphereButton1: [UIButton]!
    
    var coffeeStar = 0
    var serviceStar = 0
    var atmosphereStar = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func changeCoffeeStar(_ sender: UIButton) {
        var count:Int = Int(sender.tag)
        
        for i in 0...count{
            coffeeButton[i].setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
        if count < 4 {
            for j in count + 1...4 {
                coffeeButton[j].setImage(UIImage(systemName: "star"), for: .normal)
            }
        }
        
        self.coffeeStar = count
    }
    
    
    @IBAction func changeServiceStar(_ sender: UIButton) {
        var count:Int = Int(sender.tag)
        
        for i in 0...count{
            serviceButton[i].setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
        if count < 4 {
            for j in count + 1...4 {
                serviceButton[j].setImage(UIImage(systemName: "star"), for: .normal)
            }
        }
        
        self.serviceStar = count
    }
    
    
    @IBAction func changeAtmosphereStar1(_ sender: UIButton) {
        var count:Int = Int(sender.tag)
        
        for i in 0...count{
            atmosphereButton1[i].setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
        if count < 4 {
            for j in count + 1...4 {
                atmosphereButton1[j].setImage(UIImage(systemName: "star"), for: .normal)
            }
        }
        
        self.atmosphereStar = count
    }
    
    
}
