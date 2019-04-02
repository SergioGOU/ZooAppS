//
//  ViewController.swift
//  ZooAppS
//
//  Created by LABMAC2016 on 08/03/19.
//  Copyright © 2019 LABMAC2016. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var listOfKillerAnimals = [Animal]()
    var listOfNotKillerAnimals = [Animal]()
    
        var AnimalType = ["Not Killer", "Kiler"]
    
    @IBOutlet weak var tvListAnimals: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        listOfNotKillerAnimals.append(Animal(name: "baboon", des: "live in big place with tree....", image: "baboon" ))
        listOfNotKillerAnimals.append(Animal(name: "bulldog", des: "live in big place with tree....", image: "bulldog" ))
        listOfKillerAnimals.append(Animal(name: "panda", des: "live in big place with tree....", image: "panda" ))
        listOfKillerAnimals.append(Animal(name: "swallow_bird", des: "live in big place with tree....", image: "swallow_bird" ))
        listOfKillerAnimals.append(Animal(name: "white_tiger", des: "live in big place with tree....", image: "white_tiger" ))
        listOfNotKillerAnimals.append(Animal(name: "zebra", des: "live in big place with tree....", image: "zebra" ))
        
        tvListAnimals.delegate = self
        tvListAnimals.dataSource = self
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return AnimalType[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return listOfNotKillerAnimals.count
        }else{
            return listOfKillerAnimals.count
        }
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellAnimal:TVCAnimal = tableView.dequeueReusableCell(withIdentifier: "cellAnimal", for: indexPath) as! TVCAnimal
        
        if indexPath.section == 0{
            cellAnimal.SetAnimal(animal: listOfNotKillerAnimals[indexPath.row])
        }else{
            cellAnimal.SetAnimal(animal: listOfKillerAnimals[indexPath.row])
        }
        
        
        return cellAnimal
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section==0 {
            print(listOfNotKillerAnimals[indexPath.row].image!)
            listOfNotKillerAnimals.remove(at: indexPath.row)
            
            //listOfNotKillerAnimals.append(listOfNotKillerAnimals[indexPath.row])
            
        }else{
            print(listOfKillerAnimals[indexPath.row].name!)
            listOfKillerAnimals.remove(at: indexPath.row)
            
            //listOfKillerAnimals.append(listOfKillerAnimals[indexPath.row])
            
        }
        
        
        tvListAnimals.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

