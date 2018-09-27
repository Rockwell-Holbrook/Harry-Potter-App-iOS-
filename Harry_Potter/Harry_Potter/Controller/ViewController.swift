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
    
    
   
    var myCharacters = Characters()
    
    var names: [String] = []
    
    func refreshSlider() {
        
        let group = DispatchGroup()
        group.enter()
        
        DispatchQueue.main.async {
            self.characterSlider.dataSource = self
            self.characterSlider.delegate = self
            group.leave()
        }
        
        group.notify(queue: .main) {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(15), execute: {
                self.characterSlider.reloadAllComponents()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://www.potterapi.com/v1/characters?key=$2a$10$qHP0eb3Zdr1ZaeDMOvJwH.LgkWvNh4x53UrQz0Wy/RTlALo5grtNO"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        let group = DispatchGroup()
        group.enter()
        
        DispatchQueue.main.async {
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                guard let data = data else { return }
                
                do {
                    let characters = try
                        JSONDecoder().decode(Characters.self, from: data)
                    self.myCharacters = characters
                    
                    for character in self.myCharacters {
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
            
            self.characterSlider.reloadAllComponents()
        }
    }
}
 
 extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in characterSlider: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.myCharacters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.names[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
 }
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
