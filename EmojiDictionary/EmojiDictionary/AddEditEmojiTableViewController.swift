
import UIKit

class AddEditEmojiTableViewController: UITableViewController {
    
    @IBOutlet var symbolTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var usageTextField: UITextField!
    
    @IBOutlet var saveButton: UIBarButtonItem!
    
    var emoji: Emoji?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let emoji = emoji {
            symbolTextField.text = String(emoji.symbol)
            nameTextField.text = emoji.name
            descriptionTextField.text = emoji.detailDescription
            usageTextField.text = emoji.usage
        }
        
        updateSaveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let symbol = symbolTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let detailDescription = descriptionTextField.text ?? ""
        let usage = usageTextField.text ?? ""
        emoji = Emoji(symbol: symbol, name: name, detailDescription: detailDescription, usage: usage)
    }
    
    func updateSaveButtonState() {
        let symbolText = symbolTextField.text ?? ""
        let nameText = nameTextField.text ?? ""
        let descriptionText = descriptionTextField.text ?? ""
        let usageText = usageTextField.text ?? ""
        saveButton.isEnabled = !symbolText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty && !usageText.isEmpty
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
}
