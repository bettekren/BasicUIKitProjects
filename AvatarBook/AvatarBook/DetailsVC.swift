//
//  DetailsVC.swift
//  AvatarBook
//
//  Created by Betül Ekren on 13.03.2025.
//

import UIKit

class DetailsVC: UIViewController {
    var selectedCharacters: AvatarCharacters?
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var feature: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = selectedCharacters?.image
        nameLabel.text = selectedCharacters?.name
        feature.text = selectedCharacters?.feature
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
