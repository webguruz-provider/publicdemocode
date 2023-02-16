//
//  CrushRequestBuyPopup.swift
//  Genie
//
//  Created by Krify on 12/05/20.
//  Copyright © 2020 Appzilla.tech. All rights reserved.
//

import UIKit
import SwiftyGif
import SDWebImage

class CrushRequestBuyPopup: UIView {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var checkBoxBtn: UIButton!
    @IBOutlet weak var parentSuperVw: UIView!
    @IBOutlet weak var parentSuperVwImageVw: UIImageView!
    @IBOutlet weak var buynowBtn: UIButton!
    @IBOutlet weak var crushrequestGuidelinesBtn: UIButton!
    
    @IBOutlet weak var spaceforsendmessage: NSLayoutConstraint!
    @IBOutlet weak var free_credit: UIImageView!
    
    @IBOutlet weak var guidlinebtn: UIButton!
    @IBOutlet weak var inputTextField: UITextView!
    @IBOutlet weak var right_swipe_animation: UIImageView!
    
    @IBOutlet weak var character_counter: UILabel!
    
    deinit {
        print("dinit: called \(String(describing: [self .classForCoder]))")
    }
    
    func loadingDefaultUI()
    {
        
        parentSuperVw.cornerRadius = 20
        parentSuperVwImageVw.cornerRadius = 20
        parentSuperVw.clipsToBounds = true
        buynowBtn.cornerRadius = 20
        buynowBtn.clipsToBounds = true
        inputTextField.delegate = self
        
        
        
        let savedText = DEFAULTS.string(forKey: "default_crush_message")
        self.inputTextField.placeholder = "Let them know what sparked your interest..."
        self.inputTextField.text = savedText
        
        
        let limit = 500
        let rangeVal = inputTextField.text.count
        character_counter.text = "\(limit - rangeVal)"
        
        if (limit - rangeVal) >= limit {
            character_counter.text = "\(limit)"
        }
        
        
        self.checkBoxBtn.setImage(UIImage.init(named: "wg_match_check"), for: .normal)
        let isChecked = DEFAULTS.bool(forKey: "default_crush_flag")
        if isChecked {
            self.checkBoxBtn.setImage(UIImage.init(named: "checkwith"), for: .normal)
        }
        
        
        do {
            let gif = try UIImage(gifName: "right_swipe_indicator.gif")
            right_swipe_animation.setGifImage(gif)
        } catch {
            print(error)
        }

        
        let showcase_credits = DEFAULTS.bool(forKey: "showcase_credits")
        if showcase_credits {
           // spaceforsendmessage.constant = 60
            free_credit.isHidden = false
        }
        else
        {
            free_credit.isHidden = false
        }
    }
    
    @objc func enabledDisabledCheckBox(){
        
        let isChecked = DEFAULTS.bool(forKey: "default_crush_flag")
        if isChecked {
            self.checkBoxBtn.setImage(UIImage.init(named: "wg_match_check"), for: .normal)
            UserDefaults.standard.set(false, forKey: "default_crush_flag")
            UserDefaults.standard.synchronize()
        }
        else{
            self.checkBoxBtn.setImage(UIImage.init(named: "checkwith"), for: .normal)
            UserDefaults.standard.set(true, forKey: "default_crush_flag")
            UserDefaults.standard.synchronize()
        }
        
    }
    
    
    @IBAction func checkBoxTapped(_ sender: UIButton) {
        enabledDisabledCheckBox()
    }
    
    func moveup(moveBy:CGFloat){
        //topmove.constant = moveBy
    }
    
    func hide(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func changeTextColor(text:String){
//        let orange_color = UIColor.init(red: 252/255, green: 91/255, blue: 42/255, alpha: 1.0)
//        let str1 = NSString(string: messageLabel.text!)
//        let theRange1 = str1.range(of: "\(text)")
//        let myMutableString1 = NSMutableAttributedString(string: str1 as String, attributes: [NSAttributedString.Key.font :messageLabel.font!])
//        myMutableString1.addAttribute(NSAttributedString.Key.foregroundColor, value: orange_color, range: theRange1 )
//        messageLabel.attributedText = myMutableString1
    }
    
    func showAlertForEmpty(message : String, topDistance : CGFloat , isFromTop: Bool) {
        let toastLabel = UILabel()
        toastLabel.frame =  CGRect(x: 10, y: 5  , width: self.frame.size.width - 150 , height: toastLabel.frame.size.height)
        toastLabel.text = message
        toastLabel.numberOfLines = 0
        toastLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        toastLabel.font = UIFont(name: "Barlow-Regular", size: 13)
        toastLabel.sizeToFit()
        toastLabel.frame =  CGRect(x: 10, y: 10  , width: toastLabel.frame.size.width , height: toastLabel.frame.size.height)
        toastLabel.textAlignment = .center
        
        let base_view_for_ = UIView(frame: CGRect(x: 0, y: 0, width: toastLabel.frame.size.width + 20, height: toastLabel.frame.size.height + 20 ))
        base_view_for_.backgroundColor = new_toast_background_color
        base_view_for_.alpha = 1.0
        base_view_for_.layer.cornerRadius = base_view_for_.frame.height * 0.5
        if base_view_for_.layer.cornerRadius > 20 {
            base_view_for_.layer.cornerRadius = 10
        }
        base_view_for_.addSubview(toastLabel)

        let toastIcon = UIImage(named: "toast_info_icon")
        let toastIconImage:UIImageView = UIImageView()
        toastIconImage.contentMode = UIView.ContentMode.scaleAspectFit
        toastIconImage.frame =  CGRect(x: base_view_for_.frame.origin.x+base_view_for_.frame.size.width+10, y: base_view_for_.frame.origin.y+(base_view_for_.frame.size.height/2-24/2) , width: 24, height: 24)
        toastIconImage.alpha = 1.0
        toastIconImage.image = toastIcon

        let width = toastIconImage.frame.origin.x + toastIconImage.frame.size.width;
        let height = base_view_for_.frame.size.height;
        

        let base_view = UIView(frame: CGRect(x: self.frame.size.width / 2 - width / 2 , y: topDistance , width: width , height: height ))
        if isFromTop {
            base_view.frame = CGRect(x: self.frame.size.width / 2 - width / 2 , y: topDistance , width: width , height: height )
        }
        else{
            
            base_view.frame = CGRect(x: self.frame.size.width / 2 - width / 2 , y: self.frame.size.height - height - topDistance , width: width , height: height )
        }
        
        base_view.backgroundColor = .clear
        base_view.alpha = 1.0
        
        base_view.addSubview(base_view_for_)
        base_view.addSubview(toastIconImage)
        
        self.addSubview(base_view)
        
        let showTime = 1.0
        let delayTime = 3.0
        UIView.animate(withDuration: showTime, delay: delayTime, options: .curveEaseOut, animations: {
            base_view.alpha = 0.0
        }, completion: {(isCompleted) in
            base_view.removeFromSuperview()
        })
        
    }
    
}

//for keyboard
extension CrushRequestBuyPopup {
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.moveup(moveBy: -80)
        }
    }
    
    
    //MARK: Keyboardwhen appears
    @objc func keyboardWillHide(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.moveup(moveBy: 0)
        }
    }
}


extension CrushRequestBuyPopup:UITextViewDelegate
{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
    {
        let limit = 500
        let rangeVal = textView.text.count + (text.count - range.length)
        character_counter.text = "\(limit - rangeVal)"
        if (limit - rangeVal) >= limit {
            character_counter.text = "\(limit)"
        }
        
        if (limit - rangeVal) <= 0 {
            character_counter.text = "0"
        }
        
        
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        if newText.count > limit {
           textView.text = String(newText.prefix(limit))
        }
        return newText.count <= limit
        
    }
}
