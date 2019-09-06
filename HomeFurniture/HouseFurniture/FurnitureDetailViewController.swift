
import UIKit

class FurnitureDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var furniture: Furniture?
    
    @IBOutlet var choosePhotoButton: UIButton!
    @IBOutlet var furnitureTitleLabel: UILabel!
    @IBOutlet var furnitureDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        guard let furniture = furniture else {return}
        if let imageData = furniture.imageData,
            let image = UIImage(data: imageData) {
            choosePhotoButton.setTitle("", for: .normal)
            choosePhotoButton.setImage(image, for: .normal)
        } else {
            choosePhotoButton.setTitle("Choose Image", for: .normal)
            choosePhotoButton.setImage(nil, for: .normal)
        }
        
        furnitureTitleLabel.text = furniture.name
        furnitureDescriptionLabel.text = furniture.description
    }
    
    @IBAction func choosePhotoButtonTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        let alertController = UIAlertController(title: "Choose Alert time", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }
            alertController.addAction(cameraAction)
        }
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photolibAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }
            alertController.addAction(photolibAction)
        }

        alertController.addAction(cancelAction)
        alertController.popoverPresentationController?.sourceView = sender
        
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {return}
        furniture?.imageData = selectedImage.pngData()
        dismiss(animated: true) {
            self.updateView()
        }
    }
    
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        guard let imageData = furniture?.imageData, let image = UIImage(data: imageData) else {return}
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = sender
        present(activityController, animated: true, completion: nil)
    }
    
}
