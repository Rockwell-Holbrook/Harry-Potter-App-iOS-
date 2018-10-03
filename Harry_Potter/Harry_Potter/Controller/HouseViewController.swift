//
//  HouseViewController.swift
//  Harry_Potter
//
//  Created by Rockwell Holbrook on 10/2/18.
//  Copyright © 2018 Rockwell Holbrook. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    @IBOutlet weak var houseName: UILabel!
    
    @IBOutlet weak var headOfHouse: UILabel!
    
    @IBOutlet weak var founder: UILabel!
    
    @IBOutlet weak var mascot: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /* On Button Click Fill out the Info */
    @IBAction func pushed(_ sender: Any) {
        let number = Int.random(in: 0 ..< 4)
        
        houseName.text = staticVariables.myHouses[number].name + "!!!"
        headOfHouse.text = staticVariables.myHouses[number].headOfHouse
        founder.text = staticVariables.myHouses[number].founder
        mascot.text = staticVariables.myHouses[number].mascot
    }
}
