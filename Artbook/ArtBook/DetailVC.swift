//
//  DetailVC.swift
//  ArtBook
//
//  Created by Betül Ekren on 13.04.2025.
//

import UIKit
import PhotosUI
import CoreData

class DetailVC: UIViewController, PHPickerViewControllerDelegate {
    var chosenPainting = ""
    var chosenPaintingID : UUID?
    var config = PHPickerConfiguration()
    var photoLib = PHPhotoLibrary.shared()
    var isImageSelected = false

   
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        //This function is triggered after the user selects an image from the gallery.
        picker.dismiss(animated: true)
        guard let itemProvider = results.first?.itemProvider else { return }
        //Results are a list of media files that the user has chosen.
        if itemProvider.canLoadObject(ofClass: UIImage.self) {
            //We check if the item provider can load the object as a UIImage.
            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                if let image = image as? UIImage {
                    self.isImageSelected = true
                    DispatchQueue.main.async {
                        self.imageView.image = image
                        
                    }
                }
            }
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var artName: UITextField!
    @IBOutlet weak var artist: UITextField!

    @IBOutlet weak var saveButtonOutlet: UIButton!
    @IBOutlet weak var year: UITextField!
    @IBAction func saveButton(_ sender: Any) {
        if isImageSelected == false {
            let alert = UIAlertController(title: "Warning", message: "The image is not added. Please add an image", preferredStyle: .actionSheet)
            let okAction = UIAlertAction(title: "OK", style: .destructive)
            alert.addAction(okAction)
            self.present(alert, animated: true)
            return
        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        newPainting.setValue(artName.text, forKey: "name")
        newPainting.setValue(artist.text, forKey: "artist")
        if let year = Int(year.text!) {
            newPainting.setValue(year, forKey: "year")
        }
        newPainting.setValue(UUID(), forKey: "id")
        let data = imageView.image!.jpegData(compressionQuality: 0.5)
        newPainting.setValue(data, forKey: "image")
        do {
            try context.save()
            print("Data is saved successfully")
        } catch {
            print("Error: \(error)")
        }
        
        
        self.navigationController?.popViewController(animated: true)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "NewDataIsAdded"), object: nil)
      
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: self.view.bounds)
        backgroundImage.image = UIImage(named: "detailBackgroundImage")
        backgroundImage.contentMode = .scaleAspectFill
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        self.view.insertSubview(blurView, at: 0)
        self.view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(backgroundImage)
        if chosenPainting != "" {
            saveButtonOutlet.isHidden = true
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            fetchRequest.returnsObjectsAsFaults = false //not faulting - To load objects immediately
            //Filtering to fetch data in the core data
            let idString = chosenPaintingID?.uuidString ?? ""
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            do {
                let results = try context.fetch(fetchRequest)
                    if results.count > 0 {
                        for result in results as! [NSManagedObject] {
                            
                            if let name = result.value(forKey: "name") as? String {
                                artName.text = name
                            }
                            
                            if let artistName =  result.value(forKey: "artist") as? String {
                                artist.text = artistName
                            }
                            
                            if let year = result.value(forKey:"year") as? Int {
                                self.year.text = String(year)
                                
                            }
                            
                            if let image = result.value(forKey: "image") as? Data {
                                let image = UIImage(data: image)!
                                imageView.image = image
                            }
                    }
                }
            }catch {
                    print("Error")
                }
            
            
        
            }
        
            imageView.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
            imageView.addGestureRecognizer(tapGesture)
            let gestureRecognizerForKey = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
            view.addGestureRecognizer(gestureRecognizerForKey)
        
            config.selectionLimit = 1
            config.filter = .images
        }
        
        @objc func selectImage () {
            config.selectionLimit = 1 //only 1 image is selected by a user
            config.filter = .images //Show only photos
            let picker = PHPickerViewController(configuration: config)
            picker.delegate = self
            present(picker, animated: true) //You present the photo gallery to the user
            
        }
    
        @objc func hideKeyboard() {
        view.endEditing(true)
        }
        
        /*
         Notes : The picker is a screen that displays the image gallery interface.With this object, the user can select photos or videos from their library.
         
         
         */
    }

