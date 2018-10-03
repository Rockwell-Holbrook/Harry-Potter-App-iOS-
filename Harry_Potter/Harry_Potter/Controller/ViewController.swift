 //
//  ViewController.swift
//  Harry_Potter
//
//  Created by Rockwell Holbrook on 9/12/18.
//  Copyright © 2018 Rockwell Holbrook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var characterSlider: UIPickerView!
    
    @IBOutlet weak var mytitle: UILabel!
    
    var names: [String] = []
    
    func refreshSlider() {
        
        let group = DispatchGroup() //Need to manage Async Tasks.
        group.enter()
        
        DispatchQueue.main.async {
            self.characterSlider.dataSource = self
            self.characterSlider.delegate = self
            group.leave()
        }
        
        group.notify(queue: .main) {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(35), execute: { // Give it just a slight rest because my callback is off once in a while.
                self.characterSlider.reloadAllComponents()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mytitle.font = UIFont (name: "Bradley Hand", size: 31)
        
        /* Get Character Information */
        
        let jsonUrlString = "https://www.potterapi.com/v1/characters?key=$2a$10$qHP0eb3Zdr1ZaeDMOvJwH.LgkWvNh4x53UrQz0Wy/RTlALo5grtNO" // API Endpoint For All Characters.
        
        guard let url = URL(string: jsonUrlString) else { return } // Turn it into a url.
        
        let group = DispatchGroup()
        group.enter()
        
        DispatchQueue.main.async {
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in //Do the API call
                
                guard let data = data else { return }
                
                do {
                    let characters = try
                        JSONDecoder().decode(Characters.self, from: data) // Turn the json object into a Character object.
                    staticVariables.myCharacters = characters
                    
                    for character in staticVariables.myCharacters { // Populate an array of names to display later.
                        self.names.append(character.name)
                    }
                    group.leave()
                    
                    group.notify(queue: .main) {
                        self.refreshSlider()
                    }
                }
                    
                catch let jsonErr {
                    print ("Error with JSON: ", jsonErr)
                    group.leave()
                }
            }.resume()
            
            self.characterSlider.reloadAllComponents() // Push info to the slider.
        }
        
        /* Get House Information */
        
        let jsonUrlString2 = "https://www.potterapi.com/v1/houses?key=$2a$10$qHP0eb3Zdr1ZaeDMOvJwH.LgkWvNh4x53UrQz0Wy/RTlALo5grtNO" // API Endpoint For All Characters.
        
        guard let url2 = URL(string: jsonUrlString2) else { return } // Turn it into a url.
        
        DispatchQueue.main.async {
            
            URLSession.shared.dataTask(with: url2) { (data, response, error) in //Do the API call
                
                guard let data = data else { return }
                
                do {
                    let houses = try
                        JSONDecoder().decode(Houses.self, from: data) // Turn the json object into a Character object.
                    staticVariables.myHouses = houses
                }
                    
                catch let jsonErr {
                    print ("Error with JSON: ", jsonErr)
                }
                }.resume()
       }
    }
 }

 
 // Slider Functions to display, style, and keep track of what is selected.
 extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in characterSlider: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return staticVariables.myCharacters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.names[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        staticVariables.sliderIndex = row
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view {
            label = v as! UILabel
        }
        label.font = UIFont (name: "Times New Roman", size: 28)
        label.text =  names[row]
        label.textAlignment = .center
        return label
    }
 }
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
