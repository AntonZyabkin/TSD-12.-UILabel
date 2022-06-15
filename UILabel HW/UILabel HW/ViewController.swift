//
//  ViewController.swift
//  UILabel HW
//
//  Created by Anton Zyabkin on 15.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alignmentSegmentedControll: UISegmentedControl!
    @IBOutlet weak var mainLabelOutlet: UILabel!
    @IBOutlet weak var FontTypePicker: UIPickerView!
    @IBOutlet weak var numberOflinesPicjer: UIPickerView!

    @IBOutlet weak var fontColorPicker: UIPickerView!
    @IBOutlet weak var fontSizeSLider: UISlider!
    
    @IBOutlet weak var shadowSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func addTextButtonAction(_ sender: UIBarButtonItem) {
        
        let addTextAlert = UIAlertController (title: "Let's play with text", message: "Add some text in preview label", preferredStyle: .alert)
        addTextAlert.addTextField() { (text) in
            text.placeholder = "Input text"
        }
        let okAlertAction = UIAlertAction(title: "Add text", style: .default) { [self] _ in
            if let text = addTextAlert.textFields?.first?.text {
                self.mainLabelOutlet.text = text
            }
        }
        let canselAlertAction = UIAlertAction (title: "Cancel", style: .cancel)
        addTextAlert.addAction(okAlertAction)
        addTextAlert.addAction(canselAlertAction)
        
        self.present(addTextAlert, animated: true)
    }
    
    @IBAction func alignmentSegmentedControllAction(_ sender: Any) {
    }
    
    @IBAction func fontSizeSliderAction(_ sender: UISlider) {
    }
    @IBAction func shadowSwitchAction(_ sender: UISwitch) {
    }
}

