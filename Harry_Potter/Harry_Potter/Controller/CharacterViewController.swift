//
//  CharacterViewController.swift
//  Harry_Potter
//
//  Created by Rockwell Holbrook on 9/27/18.
//  Copyright © 2018 Rockwell Holbrook. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var house: UILabel!
    
    @IBOutlet weak var school: UILabel!
    
    @IBOutlet weak var ministryOfMagic: UILabel!
    
    @IBOutlet weak var orderOfPheonix: UILabel!
    
    @IBOutlet weak var DumbledoresA: UILabel!
    
    @IBOutlet weak var deathEater: UILabel!
    
    @IBOutlet weak var bloodStatus: UILabel!
    
    @IBOutlet weak var species: UILabel!
    
    @IBOutlet weak var boggart: UILabel!
    
    @IBOutlet weak var alias: UILabel!
    
    @IBOutlet weak var animagus: UILabel!
    
    @IBOutlet weak var patronus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Styles */
        name.font = UIFont (name: "Bradley Hand", size: 31)
        
        /* Values */
        name.text = staticVariables.myCharacters[staticVariables.sliderIndex].name
        bloodStatus.text = staticVariables.myCharacters[staticVariables.sliderIndex].bloodStatus.rawValue
        species.text = staticVariables.myCharacters[staticVariables.sliderIndex].species
        
        if(staticVariables.myCharacters[staticVariables.sliderIndex].ministryOfMagic) {
            ministryOfMagic.text = "True"
        }
        else {
            ministryOfMagic.text = "False"
        }
        
        if(staticVariables.myCharacters[staticVariables.sliderIndex].orderOfThePhoenix) {
            orderOfPheonix.text = "True"
        }
        else {
            orderOfPheonix.text = "False"
        }
        
        if(staticVariables.myCharacters[staticVariables.sliderIndex].dumbledoresArmy) {
            DumbledoresA.text = "True"
        }
        else {
            DumbledoresA.text = "False"
        }
        
        if(staticVariables.myCharacters[staticVariables.sliderIndex].deathEater) {
            deathEater.text = "True"
        }
        else {
            deathEater.text = "False"
        }
        
        /* Might Not Be Set, depending on the Character */
        if(staticVariables.myCharacters[staticVariables.sliderIndex].house?.rawValue == nil) {
            house.text = "NOT APPLICABLE"
        }
        else {
            house.text = staticVariables.myCharacters[staticVariables.sliderIndex].house?.rawValue
        }
        
        if(staticVariables.myCharacters[staticVariables.sliderIndex].school?.rawValue == nil) {
            school.text = "NOT APPLICABLE"
        }
        else {
            school.text = staticVariables.myCharacters[staticVariables.sliderIndex].school?.rawValue
        }
        
        if(staticVariables.myCharacters[staticVariables.sliderIndex].boggart == nil) {
            boggart.text = "NOT APPLICABLE"
        }
        else {
            boggart.text = staticVariables.myCharacters[staticVariables.sliderIndex].boggart
        }
        
        if(staticVariables.myCharacters[staticVariables.sliderIndex].alias == nil) {
            alias.text = "NOT APPLICABLE"
        }
        else {
            alias.text = staticVariables.myCharacters[staticVariables.sliderIndex].alias
        }
        
        if(staticVariables.myCharacters[staticVariables.sliderIndex].animagus == nil) {
            animagus.text = "NOT APPLICABLE"
        }
        else {
            animagus.text = staticVariables.myCharacters[staticVariables.sliderIndex].animagus
        }
        
        if(staticVariables.myCharacters[staticVariables.sliderIndex].patronus == nil) {
            patronus.text = "NOT APPLICABLE"
        }
        else {
            patronus.text = staticVariables.myCharacters[staticVariables.sliderIndex].patronus
        }
    }
}
