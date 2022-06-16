//
//  ViewController.swift
//  UILabel HW
//
//  Created by Anton Zyabkin on 15.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let fontTypeArray = ["AppleSDGothicNeo-Thin",
                         "GillSans-Italic",
                         "GillSans",
                         "AvenirNextCondensed-UltraLightItalic",
                         "Noteworthy-Light",
                         "Chalkduster",
                         "Farah",
                         "PartyLetPlain"]
    
    let numberOfLinesArray = [0, 1, 2, 3, 4]
    let textColorArray = ["red", "blue", "systemPink", "systemGray", "brown", "darkGray"]
    let textUIColorArray = [UIColor.red, .blue, .systemPink, .systemGray, .brown, .darkGray]

    @IBOutlet weak var alignmentSegmentedControll: UISegmentedControl!
    @IBOutlet weak var mainLabelOutlet: UILabel!
    
    @IBOutlet weak var FontTypePicker: UIPickerView!
    @IBOutlet weak var numberOflinesPicjer: UIPickerView!
    @IBOutlet weak var fontColorPicker: UIPickerView!
    
    @IBOutlet weak var fontSizeSLider: UISlider!
    
    @IBOutlet weak var shadowSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alignmentSegmentedControll.addTarget(self, action: #selector(setAlignment), for: .valueChanged)
        
        
        fontColorPicker.dataSource = self
        fontColorPicker.delegate = self
        FontTypePicker.dataSource = self
        FontTypePicker.delegate = self
        numberOflinesPicjer.dataSource = self
        numberOflinesPicjer.delegate = self
        
        
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
    
    @IBAction func fontSizeSliderAction(_ sender: UISlider) {
        
        let fontSize = Int(fontSizeSLider.value)
        mainLabelOutlet.font = UIFont(name: mainLabelOutlet.font.fontName, size: CGFloat(fontSize))
        
    }
    
    @IBAction func shadowSwitchAction(_ sender: UISwitch) {
        
        if sender.isOn {
            
            mainLabelOutlet.shadowColor = .red
        mainLabelOutlet.shadowOffset = CGSize(width: 3, height: 3)
            
        } else {
            
            mainLabelOutlet.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    
    
    
    @objc func setAlignment (target: UISegmentedControl) {
        
        switch target.selectedSegmentIndex {
        case 0 : mainLabelOutlet.textAlignment = .left
        case 1 : mainLabelOutlet.textAlignment = .center
        case 2 : mainLabelOutlet.textAlignment = .right
        default: return
        }
    }
}



extension ViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1 : return 8
        case 2 : return 6
        case 3 : return 5
        default: return 0
        }
    }
}

extension ViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1 :
            mainLabelOutlet.font = UIFont(name: fontTypeArray [row], size: CGFloat(fontSizeSLider.value))
            return fontTypeArray [row]
        case 2 :
            mainLabelOutlet.textColor = UIColor(named: "\(textColorArray[row])")
            print("\(textColorArray[row])")
            return textColorArray [row]
        case 3 :
            mainLabelOutlet.numberOfLines = row
            return "\(numberOfLinesArray [row])"
        default: return "error"
        }
    }
}
