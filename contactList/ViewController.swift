//
//  ViewController.swift
//  contactList
//
//  Created by Michael Hornung on 14.11.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var gebField: UITextField!
    @IBOutlet weak var groesseField: UITextField!
    @IBOutlet weak var haarField: UITextField!
    @IBOutlet weak var augenField: UITextField!
    @IBOutlet weak var geschlechtField: UITextField!
    @IBOutlet weak var zeigMirField: UITextField!
    
   
    let geschlechtList = ["Männlich", "Weiblich", "Divers"]
    let geschlechtPicker = UIPickerView()
    
    let haarfarbeList = ["Blond", "Braun", "Schwarz"]
    let haarfarbePicker = UIPickerView()
    
    let augenfarbeList = ["Blau", "Braun", "Grün"]
    let augenfarbePicker = UIPickerView()
    
    let zeigmirList = ["Alle","Männlich", "Weiblich", "Divers"]
    let zeigmirPicker = UIPickerView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        emailField.keyboardType = .emailAddress
        groesseField.keyboardType = .decimalPad
        gebField.keyboardType = .decimalPad
        
        geschlechtPicker.dataSource = self
        geschlechtPicker.delegate = self
        geschlechtField.inputView = geschlechtPicker
        
        haarfarbePicker.dataSource = self
        haarfarbePicker.delegate = self
        haarField.inputView = haarfarbePicker
        
        augenfarbePicker.dataSource = self
        augenfarbePicker.delegate = self
        augenField.inputView = augenfarbePicker
        
        zeigmirPicker.dataSource = self
        zeigmirPicker.delegate = self
        zeigMirField.inputView = zeigmirPicker
    }


}
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView) ->  Int {
        return geschlechtList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView{
        case geschlechtPicker: return geschlechtList.count
        case haarfarbePicker: return haarfarbeList.count
        case augenfarbePicker: return augenfarbeList.count
        case zeigmirPicker: return zeigmirList.count
        default:
            return 0
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView{
        case geschlechtPicker: return geschlechtList[row]
        case haarfarbePicker: return haarfarbeList [row]
        case augenfarbePicker: return augenfarbeList[row]
        case zeigmirPicker: return zeigmirList[row]
        default:
            return ""
        }
    }
   
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView{
        case geschlechtPicker: return geschlechtField.text = geschlechtList[row]
        case haarfarbePicker: return haarField.text = haarfarbeList[row]
        case augenfarbePicker: return augenField.text = augenfarbeList[row]
        case zeigmirPicker: return zeigMirField.text = zeigmirList[row]
        default:
            print("Hallo")
        }
    self.view.endEditing(true)
    }
}

