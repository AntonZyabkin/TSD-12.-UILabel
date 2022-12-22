//
//  ViewController.swift
//  TSD 12. UILabel
//
//  Created by Anton Zyabkin on 25.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Create 10 Labels
    let firstLabel = UILabel ()
    let secondLabel = UILabel ()
    let thirsLabel = UILabel ()
    let fourthLabel = UILabel ()

    override func viewDidLoad() {
        super.viewDidLoad()
        createLabel(label: firstLabel, coord: CGRect(x: 100, y: 100, width: 100, height: 30), text: "First", textColor: .red, backgroundColor: .black)
        createLabel(label: secondLabel, coord: CGRect(x: 50, y: 500, width: 400, height: 30), text: "Second and another one text", textColor: .green, backgroundColor: .clear)
        createLabel(label: thirsLabel, coord: CGRect(x: 100, y: 300, width: 100, height: 40), text: "third", textColor: .systemPink, backgroundColor: .yellow)
        createLabel(label: fourthLabel, coord: CGRect(x: 250, y: 300, width: 100, height: 40), text: "LastOne", textColor: .magenta, backgroundColor: .systemFill)
        
        
    //MARK: - change Labels
        firstLabel.font = UIFont (name: "Didot-Italic", size: 30)
        secondLabel.shadowOffset = CGSize (width: 3, height: 3)
        secondLabel.shadowColor = .red
        thirsLabel.textAlignment = .center
        secondLabel.adjustsFontSizeToFitWidth = true
        thirsLabel.isHighlighted = true
        thirsLabel.highlightedTextColor = UIColor.black
        thirsLabel.isUserInteractionEnabled = true
        
    //MARK: - addSubview
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.addSubview(thirsLabel)
        view.addSubview(fourthLabel)
        

    }

    private func createLabel (label : UILabel, coord : CGRect, text: String, textColor : UIColor, backgroundColor: UIColor) -> Void {
        label.frame = coord
        label.text = text
        label.textColor = textColor
        label.backgroundColor = backgroundColor
    }

}

