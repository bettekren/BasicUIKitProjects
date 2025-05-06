//
//  ViewController.swift
//  AvatarBook
//
//  Created by Betül Ekren on 13.03.2025.
//

import UIKit
//for Commit


class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    var choosenCharacter :  AvatarCharacters?

    var characters : [AvatarCharacters] = []
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTypeIdentifier", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = characters[indexPath.row].name
        content.image = characters[indexPath.row].image
        content.imageProperties.maximumSize = CGSize(width: 50, height: 50)
        content.textProperties.color = UIColor.blue
        content.imageProperties.cornerRadius = 20
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenCharacter = characters[indexPath.row]
      
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destination = segue.destination as! DetailsVC
            destination.selectedCharacters = choosenCharacter
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let aang = AvatarCharacters(name: "Aang", feature: "He is Avatar", image: UIImage(named: "Aang")!)
        let katara = AvatarCharacters(name: "Katara", feature: "She is waterbender", image: UIImage(named: "Katara")!)
        let sokka = AvatarCharacters(name: "Sokka", feature: "He is warrior", image: UIImage(named: "Sokka")!)
        let zuko = AvatarCharacters(name: "Zuko", feature: "He is firebender", image: UIImage(named: "Zuko")!)
        let appa = AvatarCharacters(name: "Appa", feature: "He is a flying bison", image: UIImage(named: "Appa")!)
        characters = [aang, katara, sokka, zuko, appa]
        tableView.dataSource = self
        tableView.delegate = self
        //Save the cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellTypeIdentifier")
        
    }
    
    


}

