//
//  ThemeChooser.swift
//  Concentrarion
//
//  Created by Dmitrii Kupchenko on 08/10/2018.
//  Copyright © 2018 Dmitrii Kupchenko. All rights reserved.
//

import UIKit

class ThemePicker: UIPickerView {

    var themeChoices = [ThemesProvider.defaultThemeName, "halloween", "sport"]
    var themeChoice: String?
    
    let toolBar = UIToolbar()
    
    var themeTextField: UITextField?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        self.showsSelectionIndicator = true
        self.dataSource = self
        self.delegate = self
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(ThemePicker.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(ThemePicker.cancelButton))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textField: UITextField) {
        self.init(frame: .zero)
        textField.inputView = self
        textField.inputAccessoryView = toolBar
        self.themeTextField = textField
        
    }
    
    @objc func donePicker() {
        print("ThemePicker DONE сlick")
        themeTextField?.text = themeChoice
        themeTextField!.resignFirstResponder()
    }
    
    @objc func cancelButton() {
        print("ThemePicker CANCEL click")
        themeTextField!.resignFirstResponder()
    }
}

// MARK: - UIPickerViewDelegate
extension ThemePicker: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.themeChoice = themeChoices[row]
    }
}

extension ThemePicker: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.themeChoices[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.themeChoices.count
    }
}
