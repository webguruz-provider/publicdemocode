//
//  CrushRequestPopupV2.swift
//  Genie
//
//  Created by webguruz technologies on 10/05/22.
//  Copyright © 2022 Appzilla.tech. All rights reserved.
//

import Foundation
import UIKit
import Popover
import SwiftyJSON
import SDWebImage
import ImageSlideshow

class CrushRequestPopupV2: UIView
{
    @IBOutlet weak var top_header: UILabel!
    @IBOutlet weak var compatibility_score: UILabel!
    @IBOutlet weak var profile_view_image: UIImageView!
    @IBOutlet weak var match_percentage: UILabel!
    @IBOutlet weak var percentage_bar_outer: UIView!
    @IBOutlet weak var percentage_bar_inner: UIView!
    @IBOutlet weak var new_user_bg: UIImageView!
    @IBOutlet weak var new_user_text: UILabel!
    
    @IBOutlet weak var middle_header_1: UILabel!
    
    
    @IBOutlet weak var text_filed_outerview: UIView!
    @IBOutlet weak var text_input_field: UITextView!
    @IBOutlet weak var remaining_chars: UILabel!
    
    @IBOutlet weak var check_box_view: UIView!
    @IBOutlet weak var check_box_tick: UIButton!
    @IBOutlet weak var check_box_message: UILabel!
    
    @IBOutlet weak var or_lable: UILabel!
    
    @IBOutlet weak var cancel_btn: UIButton!
    @IBOutlet weak var send_crush_btn: UIButton!
    @IBOutlet weak var dropdown_view: UIView!
    
    @IBOutlet weak var dropdown_view_title: UILabel!
    @IBOutlet weak var dropdown_view_arrow: UIImageView!
    @IBOutlet weak var dropdown_view_btn: UIButton!
    
    
    @IBOutlet weak var crushrequestGuidelinesBtn: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var free_credit: UIImageView!
    
    @IBOutlet weak var popup_view: UIView!
    @IBOutlet weak var weekword_cancel: UIButton!
    
    
    @IBOutlet weak var weektable: UITableView!
    
    @IBOutlet weak var learn_more_popup: UIView!
    @IBOutlet weak var learn_more_popup_match_percentage: UILabel!
    @IBOutlet weak var learn_more_popup_percentage_bar_outer: UIView!
    @IBOutlet weak var learn_more_popup_percentage_bar_inner: UIView!
    @IBOutlet weak var learn_more_popup_new_user_bg: UIImageView!
    
    @IBOutlet weak var learn_more_popup_match_percentage_value: UILabel!
    @IBOutlet weak var profileImgTopConst: NSLayoutConstraint!
    
    @IBOutlet weak var top_distance: NSLayoutConstraint!
    @IBOutlet weak var right_swipe_dont_lie: UILabel!
    
    
    @IBOutlet weak var learn_more_profile_1: UIView!
    @IBOutlet weak var learn_more_profile_1_image: UIImageView!
    
    @IBOutlet weak var learn_more_profile_2: UIView!
    @IBOutlet weak var learn_more_profile_3_image: UIImageView!
    
    var weekSelectedStr = ""
    var credits                    = "0.0"
    var guidelinesVw :KismetGuidelinesView? = nil
    
    var temp_percentage = ""
    var temp_percentage_value = 0.0
    var temp_percentage_value_2 = 0.0
    var timer:Timer? = nil
    
    
    var crush_temp_percentage = ""
    var crush_temp_percentage_value = 0.0
    var crush_temp_percentage_value_2 = 0.0
    var crush_timer:Timer? = nil
    
    @IBOutlet weak var crush_same_league_text: UILabel!
    deinit
    {
        print("dinit: called \(String(describing: [self .classForCoder]))")
    }
    
    @IBAction func OKlearnMorepopup(_ sender: Any) {
        popup_view.isHidden = true
    }
    
    @IBAction func OKWeekpopup(_ sender: Any) {
        popup_view.isHidden = true
    }
    
    @IBAction func openWeekpopup(_ sender: Any) {
        
        selectedHeader = -1
        selectedRow = -1
        weektable.reloadData()
        popup_view.isHidden = false
        
    }
    
    @IBAction func leranmore(_ sender: Any) {
        learn_more_popup.isHidden = false
        showLearnMorePopup()
    }
    
    @objc func update() {
        if(temp_percentage_value_2 < temp_percentage_value ) {
            temp_percentage_value_2 = temp_percentage_value_2 + 1.0
            learn_more_popup_match_percentage_value.text = "\(temp_percentage_value_2)%"
        }
        else
        {
            if timer != nil {
                timer?.invalidate()
            }
        }
    }
    
    @objc func crush_update() {
        if(crush_temp_percentage_value_2 < crush_temp_percentage_value ) {
            crush_temp_percentage_value_2 = crush_temp_percentage_value_2 + 1.0
            match_percentage.text = "\(crush_temp_percentage_value_2)%"
        }
        else
        {
            if crush_timer != nil {
                crush_timer?.invalidate()
            }
        }
    }
    
    func showLearnMorePopup(){

        if timer != nil {
            timer?.invalidate()
        }
        temp_percentage_value_2 = 0.0
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        
        learn_more_popup_match_percentage.text = "Same\nLeague"
        learn_more_popup_match_percentage_value.text = "\(temp_percentage)%"
        
        learn_more_popup_percentage_bar_inner.frame.size.height = learn_more_popup_percentage_bar_outer.frame.size.height
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 ){
            let showTime = 1.0
            let delayTime = 0.0
            UIView.animate(withDuration: showTime, delay: delayTime, options: .curveLinear, animations: { [self] in
                learn_more_popup_percentage_bar_inner.frame.size.height = learn_more_popup_percentage_bar_outer.frame.size.height * ((100 - temp_percentage_value)/100)
                
                learn_more_popup_match_percentage_value.text = "\(learn_more_popup_percentage_bar_inner.frame.size.height)%"
                
            }, completion: {(isCompleted) in
                self.learn_more_popup_match_percentage_value.text = "\(self.temp_percentage)%"
                self.temp_percentage_value_2 = self.temp_percentage_value
            })
        }
    }
    
    @IBAction func closelearnmore(_ sender: Any) {
        learn_more_popup.isHidden = true
        if timer != nil {
            timer?.invalidate()
        }
    }
    
    func topSlideView_show(){
        
        print("Device Height: \(self.frame.height)")
        print("Device Width: \(self.frame.width)")
       
        
        let bTag = 1010211
        
        var baseHeight: CGFloat = 130.0
        var moreGap: CGFloat = 16.0
        var fontSize: CGFloat = 15.0
        var yLabel: CGFloat = 23.0
        var labelHeight: CGFloat = 20
        var cornerRadious: CGFloat = 20.0
        
        
        //less than or equal to iPhone 8 Plus
        if(self.frame.height <= 736 )
        {
            baseHeight = 130
            moreGap = 0
            fontSize = 15
            yLabel = 0
            labelHeight = 15
            cornerRadious = 20
        }
        
        if let foundView = self.viewWithTag(bTag) {
            foundView.removeFromSuperview()
        }
        
        let baseView  = UIView(frame: CGRect.init(x: 0, y: 0 , width: self.frame.width, height: self.frame.height))
        baseView.tag = bTag
        baseView.isUserInteractionEnabled = true
        baseView.backgroundColor = .clear
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.hideToast(_:)))
        baseView.addGestureRecognizer(tap)
        
        let redView  = UIView(frame: CGRect.init(x: 0, y: 0 , width: baseView.frame.width, height: baseHeight  ))
        redView.clipsToBounds = true
        redView.backgroundColor = orange_color
        redView.layer.cornerRadius = cornerRadious
        redView.isUserInteractionEnabled = true
        redView.layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMaxXMaxYCorner] // Top right corner, Top left corner respectively
        baseView.addSubview(redView)
        
        yLabel = redView.frame.size.height / 2 - labelHeight / 2
        
        let label1 = UILabel(frame: CGRect(x: 20, y: yLabel + moreGap , width: redView.frame.size.width - 40 , height: labelHeight))
        label1.textAlignment = .center
        label1.text = DEFAULTS.string(forKey: "compatibility_score_alert_body")
        label1.font = UIFont(name: "Barlow-Medium", size: fontSize)
        label1.adjustsFontSizeToFitWidth = true
        label1.minimumScaleFactor = 0.5
        label1.textColor = .white
        label1.isUserInteractionEnabled = true
        label1.backgroundColor = .clear
        label1.numberOfLines = 2
        label1.lineBreakMode = .byWordWrapping
        label1.sizeToFit()
        redView.addSubview(label1)
        
        self.addSubview(baseView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3) ) {
            self.hideWithAnimation(tah: bTag)
        }
        
        
    }
    
    @objc func hideToast(_ sender: UITapGestureRecognizer? = nil){
        hideNewRequestMessage()
    }
    
    func hideNewRequestMessage(){
        let bTag = 1010211
        if let foundView = self.viewWithTag(bTag) {
            foundView.removeFromSuperview()
        }
    }
    
    func hideWithAnimation(tah:Int){
        let viewTag = tah
        if let foundView = self.viewWithTag(viewTag) {
            let showTime = 3.0
            let delayTime = 1.0
            UIView.animate(withDuration: showTime, delay: delayTime, options: [.allowUserInteraction, .overrideInheritedOptions, .curveEaseOut ], animations: {
                foundView.alpha = 0.3
            }, completion: {(isCompleted) in
                foundView.removeFromSuperview()
            })
        }
    }
    
    func getJSONFrom(Data data: Data) -> JSON? {
        do {
            return try JSON(data: data, options: .mutableContainers)
        } catch _ {
            return nil
        }
    }
    
    
   func loadingDefaultUI(useriddata : JSON)
   {
       var new_right_swipe_text = ""
       var new_middle_text = ""
       var new_learn_more_text = ""
       if DEFAULTS.object(forKey: "CompatibilityLocal") != nil {
           let val = DEFAULTS.object(forKey: "CompatibilityLocal") as! [String:Any]
           let jsonData = try! JSONSerialization.data(withJSONObject: val, options: [])
           let json = getJSONFrom(Data: jsonData)
           compatibility_conversation_starters = json!["conversation_starters"].arrayValue
           compatibility_conversations_starter_header = json!["conversations_starter_header"].stringValue
           compatibility_conversations_header = json!["header"].stringValue
           compatibility_conversations_placeholder = json!["placeholder"].stringValue
           
           new_right_swipe_text = json!["header_new"].stringValue
           new_middle_text = json!["header_new_body"].stringValue
           new_learn_more_text = json!["header_new_subbody"].stringValue
       }
       
       
       let orange_color = UIColor.init(red: 252/255, green: 91/255, blue: 42/255, alpha: 1.0)
       
       weekSelectedStr = ""
       print("---", useriddata.description)
       dropdown_view_title.text = "Message tips of the week"
       text_input_field.text = ""
       popup_view.isHidden = true
       learn_more_popup.isHidden = true
       
       right_swipe_dont_lie.text = new_right_swipe_text
       let right_swipe_dont_lie_str2 = NSString(string: right_swipe_dont_lie.text!)
       let right_swipe_dont_lie_theRange2 = right_swipe_dont_lie_str2.range(of: "\(right_swipe_dont_lie_str2)")
       let right_swipe_dont_lie_myMutableString2 = NSMutableAttributedString(string: right_swipe_dont_lie_str2 as String, attributes: [NSAttributedString.Key.font :right_swipe_dont_lie.font!])
       right_swipe_dont_lie_myMutableString2.addAttribute(NSAttributedString.Key.foregroundColor, value: orange_color, range: right_swipe_dont_lie_theRange2 )
       right_swipe_dont_lie.text = ""
       
       var divider = 1
       if(appDel.window!.rootViewController!.view.frame.height <= 568 )
       {
           divider = 1
       }
       let imageAttachment = NSTextAttachment()
       imageAttachment.image = UIImage(named:"crush_hand")
       let imageOffsetY: CGFloat = -20.0
       imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: imageAttachment.image!.size.width/CGFloat(divider), height: imageAttachment.image!.size.height/CGFloat(divider))
       let attachmentString = NSMutableAttributedString(attachment: imageAttachment)
       attachmentString.append(right_swipe_dont_lie_myMutableString2)
       
       right_swipe_dont_lie.attributedText = attachmentString
       
       middle_header_1.text = new_middle_text
       
       top_header.text = new_learn_more_text
       
       let str1 = NSString(string: top_header.text!)
       let theRange1 = str1.range(of: "\(new_learn_more_text)")
       let myMutableString1 = NSMutableAttributedString(string: str1 as String, attributes: [NSAttributedString.Key.font :top_header.font!])
       myMutableString1.addAttribute(NSAttributedString.Key.foregroundColor, value: orange_color, range: theRange1 )
       myMutableString1.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: theRange1 )
       
       var divider1 = 1
       if(appDel.window!.rootViewController!.view.frame.height <= 568 )
       {
           divider1 = 1
       }
       let imageAttachment1 = NSTextAttachment()
       imageAttachment1.image = UIImage(named:"crush_help")
       let imageOffsetY1: CGFloat = -2.0
       imageAttachment1.bounds = CGRect(x: 0, y: imageOffsetY1, width: imageAttachment1.image!.size.width/CGFloat(divider1), height: imageAttachment1.image!.size.height/CGFloat(divider1))
       let attachmentString1 = NSMutableAttributedString(attachment: imageAttachment1)
       attachmentString1.append(NSMutableAttributedString(string: "   "))
       attachmentString1.append(myMutableString1)
       top_header.attributedText = attachmentString1
       
       top_header.isUserInteractionEnabled = true
       let tap = UITapGestureRecognizer(target: self, action: #selector(self.leranmore(_:)))
       top_header.addGestureRecognizer(tap)
       
       match_percentage.text = "\(useriddata["matchPercentage"].stringValue)%"
       let matchPercentage = useriddata["matchPercentage"].doubleValue
       temp_percentage_value = useriddata["matchPercentage"].doubleValue
       crush_temp_percentage_value = useriddata["matchPercentage"].doubleValue
       temp_percentage = useriddata["matchPercentage"].stringValue
       
       print("screen--- ", appDel.window!.rootViewController!.view.frame.width, appDel.window!.rootViewController!.view.frame.height)
       
       if useriddata["matchPercentage"].stringValue == "-1" || useriddata["matchPercentage"].stringValue == "NaN" {
           
           match_percentage.isHidden = true
           percentage_bar_inner.isHidden = true
           percentage_bar_outer.isHidden = true
           
           new_user_bg.isHidden = false
           new_user_text.isHidden = false
           
           learn_more_popup_new_user_bg.isHidden = false
           learn_more_popup_match_percentage.isHidden = true
           learn_more_popup_match_percentage_value.isHidden = true
           learn_more_popup_percentage_bar_outer.isHidden = true
           learn_more_popup_percentage_bar_inner.isHidden = true
       }
       else
       {
           match_percentage.isHidden = false
           percentage_bar_inner.isHidden = false
           percentage_bar_outer.isHidden = false
           //self.profileImgTopConst.constant = 46
           new_user_bg.isHidden = true
           new_user_text.isHidden = true
           learn_more_popup_new_user_bg.isHidden = true
           learn_more_popup_match_percentage.isHidden = false
           learn_more_popup_match_percentage_value.isHidden = false
           learn_more_popup_percentage_bar_outer.isHidden = false
           learn_more_popup_percentage_bar_inner.isHidden = false
       }
       crush_same_league_text.isHidden = match_percentage.isHidden
       
       self.top_distance.constant = 40
       print("height: \(appDel.window!.rootViewController!.view.frame.height)")
       if(appDel.window!.rootViewController!.view.frame.height == 667.0 )
       {
           self.top_distance.constant = 30
       }
       
       if  useriddata["images"].arrayValue.count > 0
       {
           print("Oppented: url: \(useriddata["images"].arrayValue[0]["thumbnail"].stringValue)")
           print("Oppented: url Signed: \(String(describing: getPresignedURL(publicPath: useriddata["images"].arrayValue[0]["thumbnail"].stringValue ).url))")
           
           self.profile_view_image.cornerRadius = self.profile_view_image.frame.size.height / 2
           self.profile_view_image.clipsToBounds = true
           self.profile_view_image.contentMode = .scaleAspectFill
           
           self.learn_more_profile_1_image.clipsToBounds = true
           self.learn_more_profile_1_image.contentMode = .scaleAspectFill
           self.learn_more_profile_3_image.clipsToBounds = true
           self.learn_more_profile_3_image.contentMode = .scaleAspectFill
           
           self.learn_more_profile_1.cornerRadius = 5
           self.learn_more_profile_1.clipsToBounds = true
           self.learn_more_profile_2.cornerRadius = 5
           self.learn_more_profile_2.clipsToBounds = true
           
           self.learn_more_profile_1.transform = self.learn_more_profile_1.transform.rotated(by: -.pi / 8)
           self.learn_more_profile_2.transform = self.learn_more_profile_2.transform.rotated(by: .pi / 8)
           
           if isfileExistsAtpath(publicPathurl: useriddata["images"].arrayValue[0]["thumbnail"].stringValue)
           {
               self.profile_view_image.image = getLocalFilePathDataImg(publicPathurl: useriddata["images"].arrayValue[0]["thumbnail"].stringValue)
               
               self.learn_more_profile_3_image.image  = getLocalFilePathDataImg(publicPathurl: useriddata["images"].arrayValue[0]["thumbnail"].stringValue)
           }
           else
           {
               self.profile_view_image!.sd_setImage(with: getPresignedURL(publicPath: useriddata["images"].arrayValue[0]["thumbnail"].stringValue ).url, completed: nil)
               
               self.learn_more_profile_3_image.sd_setImage(with: getPresignedURL(publicPath: useriddata["images"].arrayValue[0]["thumbnail"].stringValue ).url, completed: nil)
           }
           
           if  getJSON(Constant.USER_LOGIN_DATA)["user"]["images"].arrayValue.count > 0
           {
               self.learn_more_profile_1_image.sd_setImage(with:  getPresignedURL(publicPath: getJSON(Constant.USER_LOGIN_DATA)["user"]["images"].arrayValue[0]["thumbnail"].stringValue).url , completed: nil)
           }
           
           
       }
       
       
       if crush_timer != nil {
           crush_timer?.invalidate()
       }
       crush_temp_percentage_value_2 = 0.0
       crush_timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.crush_update), userInfo: nil, repeats: true)
       
       percentage_bar_inner.frame.size.height = percentage_bar_outer.frame.size.height
       DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ){
           let showTime = 2.5
           let delayTime = 0.0
           UIView.animate(withDuration: showTime, delay: delayTime, options: .curveLinear, animations: { [self] in
               percentage_bar_inner.frame.size.height = percentage_bar_outer.frame.size.height * ((100 - matchPercentage)/100)
           }, completion: { [self](isCompleted) in
               crush_temp_percentage_value_2 = crush_temp_percentage_value
               match_percentage.text = "\(crush_temp_percentage_value_2)%"
           })
       }

       let term_text = NSMutableAttributedString(string: "Cancel", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
       cancel_btn.setAttributedTitle(term_text, for: .normal)

       text_input_field.delegate = self
       
       let savedText = DEFAULTS.string(forKey: "default_crush_message")
       self.text_input_field.placeholdercrush = compatibility_conversations_placeholder
       self.text_input_field.text = savedText
       
       let limit = 500
       let rangeVal = text_input_field.text.count
       remaining_chars.text = "\(limit - rangeVal)"
       
       if (limit - rangeVal) >= limit {
           remaining_chars.text = "\(limit)"
       }
       if (limit - rangeVal) <= 0 {
           remaining_chars.text = "0"
       }
       
       
       let isChecked = DEFAULTS.bool(forKey: "default_crush_flag")
       if isChecked && savedText != "" {
           self.check_box_tick.setImage(UIImage.init(named: "crush_check"), for: .normal)
       }
       else{
           self.check_box_tick.setImage(UIImage.init(named: "crush_uncheck"), for: .normal)
       }
       
       do {
           let gif = try UIImage(gifName: "animation_500_l2zpdyvi_2.gif")
           free_credit.setGifImage(gif)
       } catch {
           print(error)
       }

       free_credit.transform = free_credit.transform.rotated(by: -.pi / 4)
       let showcase_credits = DEFAULTS.bool(forKey: "showcase_credits")
       if showcase_credits {
           free_credit.isHidden = false
       }
       else
       {
           free_credit.isHidden = true
           free_credit.transform = free_credit.transform.rotated(by: .pi / 4)
       }
       
       DispatchQueue.main.asyncAfter(deadline: .now() + 2 ){
           let showTime = 3.0
           let delayTime = 1.0
           UIView.animate(withDuration: showTime, delay: delayTime, options: .curveLinear, animations: { [self] in
               self.free_credit.isHidden = true
               free_credit.transform = free_credit.transform.rotated(by: .pi / 4)
           }, completion: {(isCompleted) in
               
           })
       }
       
       weektable.register(CollapsibleTableViewCell.self, forCellReuseIdentifier: "CollapsibleTableViewCell")
       weektable.register(MyCustomHeader.self,forHeaderFooterViewReuseIdentifier: "sectionHeader")
       weektable.dataSource = self
       weektable.delegate = self
       weektable.rowHeight = UITableView.automaticDimension
       weektable.estimatedRowHeight = 80
       weektable.reloadData()
       if  DEFAULTS.bool(forKey: "compatibility_score_alert_show") {
           topSlideView_show()
           Utility.sendCounterToServer(name: "compatibility_score_alert")
       }
       self.crushrequestGuidelinesBtn.addTarget(self, action: #selector( self.gotoguidelinesBtnTapped(_:)), for: .touchUpInside)
       
   }
   
    func showCaseChemistry() {
                
        let toastIcon = UIImage(named: "kismet_highlighter")
        let toastIconImage:UIImageView = UIImageView()
        toastIconImage.contentMode = UIView.ContentMode.scaleAspectFit
        toastIconImage.frame =  CGRect(x: -10, y: 0 , width: self.frame.size.width+10, height: 400)
        toastIconImage.alpha = 1.0
        toastIconImage.image = toastIcon
        self.addSubview(toastIconImage)
        
        let toastLabel:UILabel = UILabel()
        toastLabel.frame =  CGRect(x: 10, y: 150 , width: 150, height: 250)
        toastLabel.alpha = 1.0
        toastLabel.text = "The more you swipe, the more accurate the ratings get."
        toastLabel.numberOfLines = 0
        toastLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        toastLabel.font = UIFont(name: "Barlow-Regular", size: 13)
        toastLabel.sizeToFit()
        toastLabel.textColor = .white
        toastLabel.textAlignment = .center
        self.addSubview(toastLabel)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            toastIconImage.removeFromSuperview()
            toastLabel.removeFromSuperview()
            toastLabel.alpha = 0
            toastIconImage.alpha = 0

        }
        
//        let showTime = 1.0
//        let delayTime = 3.0
//        UIView.animate(withDuration: showTime, delay: delayTime, options: .curveEaseOut, animations: {
//            toastLabel.alpha = 0.0
//            toastIconImage.alpha = 0.0
//        }, completion: {(isCompleted) in
//            toastIconImage.removeFromSuperview()
//            toastLabel.removeFromSuperview()
//        })
        
    }
    
    @objc func gotoguidelinesBtnTapped(_ sender: UIButton) {
        sender.preventMultipleTouchs()
        if guidelinesVw != nil
        {
            guidelinesVw!.alpha = 0
            guidelinesVw?.removeFromSuperview()
            guidelinesVw = nil
        }
        else
        {
            if guidelinesVw == nil {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
                    guidelinesVw = Bundle.main.loadNibNamed("CustomViews2", owner: CrushRequestPopupV2.self, options: nil)![2] as? KismetGuidelinesView
                    guidelinesVw?.credits = credits
                    guidelinesVw?.loadingDefaultUI(type: .crushrequest)
                    guidelinesVw?.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    guidelinesVw?.center = self.center
                    guidelinesVw?.closeBtn.addTarget(self, action: #selector(self.gotoguidelinesBtnTapped), for: .touchUpInside)
                    guidelinesVw?.backBtn.addTarget(self, action: #selector(self.gotoguidelinesBtnTapped), for: .touchUpInside)
                    self.addSubview(guidelinesVw!)
                    self.guidelinesVw?.alpha = 1
                }
            }
        }
    }
    
    func changeTextColor(text:String){
        let orange_color = UIColor.init(red: 252/255, green: 91/255, blue: 42/255, alpha: 1.0)
        let str1 = NSString(string: messageLabel.text!)
        let theRange1 = str1.range(of: "\(text)")
        let myMutableString1 = NSMutableAttributedString(string: str1 as String, attributes: [NSAttributedString.Key.font :messageLabel.font!])
        myMutableString1.addAttribute(NSAttributedString.Key.foregroundColor, value: orange_color, range: theRange1 )
        myMutableString1.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: theRange1 )
        messageLabel.attributedText = myMutableString1
    }
    
    @IBAction func openWeekWords(_ sender: Any) {
        
    }
    
    @IBAction func cancelPopup(_ sender: Any) {
        
    }
    
    @IBAction func checkBoxClick(_ sender: Any) {
        enabledDisabledCheckBox()
    }
    
    @IBAction func sendCrush(_ sender: Any) {
        
    }
    
    @objc func enabledDisabledCheckBox(){
        
        let isChecked = DEFAULTS.bool(forKey: "default_crush_flag")
        if isChecked {
            self.check_box_tick.setImage(UIImage.init(named: "crush_uncheck"), for: .normal)
            UserDefaults.standard.set(false, forKey: "default_crush_flag")
            UserDefaults.standard.synchronize()
        }
        else{
            self.check_box_tick.setImage(UIImage.init(named: "crush_check"), for: .normal)
            UserDefaults.standard.set(true, forKey: "default_crush_flag")
            UserDefaults.standard.synchronize()
        }
        
    }
    
    func moveup(moveBy:CGFloat){
        //topmove.constant = moveBy
    }
    
    func hide(){
        
        if crush_timer != nil {
            crush_timer?.invalidate()
        }
        if timer != nil {
            timer?.invalidate()
        }
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
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
extension CrushRequestPopupV2 {
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


extension CrushRequestPopupV2:UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
    {
        let limit = 500
        let rangeVal = textView.text.count + (text.count - range.length)
        remaining_chars.text = "\(limit - rangeVal)"
        if (limit - rangeVal) >= limit {
            remaining_chars.text = "\(limit)"
        }
        
        if (limit - rangeVal) <= 0 {
            remaining_chars.text = "0"
        }
        
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        if newText.count > limit {
                textView.text = String(newText.prefix(limit))
        }
        return newText.count <= limit
    }
}

var selectedHeader:Int = -1
var selectedRow:Int = -1


extension CrushRequestPopupV2 : UITableViewDataSource, UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollapsibleTableViewCell", for: indexPath) as! CollapsibleTableViewCell
        
        let data0 = compatibility_conversation_starters[indexPath.section]["messages"].arrayValue
        let data = data0[indexPath.row]["body"].stringValue
        let isNew = data0[indexPath.row]["isNew"].boolValue
        
        if isNew {
            cell.newImg.isHidden = false
            cell.nameLabel.font = UIFont(name: "Barlow-SemiBold", size: 14)
        }else {
            cell.newImg.isHidden = true
            cell.nameLabel.font = UIFont(name: "Barlow-SemiBold", size: 14)
        }
        
        cell.nameLabel.text = "\(data)"//"\(data[indexPath.row])"
        cell.contentView.backgroundColor = .white
        if data == weekSelectedStr {
//            cell.background.frame = cell.contentView.frame
//            cell.background.isHidden = false
            cell.nameLabel.textColor = .white
            cell.newImg.tintColor = .white
            cell.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "week_work_background")!)
        }
        else
        {
            //cell.background.isHidden = true
            cell.nameLabel.textColor = orange_color
            cell.newImg.tintColor = orange_color
            cell.contentView.backgroundColor = .clear
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        selectedHeader = indexPath.section

        let data0 = compatibility_conversation_starters[indexPath.section]["messages"].arrayValue
        let data = data0[indexPath.row]["body"].stringValue
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollapsibleTableViewCell", for: indexPath) as! CollapsibleTableViewCell

        if data == weekSelectedStr
        {
           // cell.background.isHidden = true
            
            cell.nameLabel.textColor = orange_color
            //cell.background.alpha = 0.0
            self.weekSelectedStr = ""
            dropdown_view_title.text = "Message tips of the week"
            self.text_input_field.text = ""
            cell.contentView.backgroundColor = .clear
        }
        else
        {
            self.weekSelectedStr = data
           // cell.background.isHidden = false
            cell.nameLabel.textColor = .white
           // cell.background.alpha = 1.0

            self.text_input_field.text = data
            dropdown_view_title.text = data
            cell.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "week_work_background")!)
        }
        
        let limit = 500
        let rangeVal = text_input_field.text.count
        remaining_chars.text = "\(limit - rangeVal)"
        if (limit - rangeVal) >= limit {
            remaining_chars.text = "\(limit)"
        }
        if (limit - rangeVal) <= 0 {
            remaining_chars.text = "0"
        }
        
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return compatibility_conversation_starters.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = compatibility_conversation_starters[section]["messages"].arrayValue
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                       "sectionHeader") as! MyCustomHeader
        print("Category Header: \(compatibility_conversation_starters[section]["category"].stringValue)")
           view.title.text = compatibility_conversation_starters[section]["category"].stringValue
            view.title.textColor = blue_color
        view.title.font = UIFont(name: "Barlow-SemiBold", size: 14)
           return view
    }
    
}


class MyCustomHeader: UITableViewHeaderFooterView {
    let title = UILabel()
    let image = UIImageView()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        image.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.backgroundColor = .clear
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            image.widthAnchor.constraint(equalToConstant: 0),
            image.heightAnchor.constraint(equalToConstant: 0),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            title.heightAnchor.constraint(equalToConstant: 36),
            title.leadingAnchor.constraint(equalTo: image.trailingAnchor,
                   constant: 0),
            title.trailingAnchor.constraint(equalTo:
                   contentView.layoutMarginsGuide.trailingAnchor),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}



class CollapsibleTableViewCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let detailLabel = UILabel()
    //let background = UIImageView()
    let newImg = UIImageView()
    
    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        contentView.clipsToBounds = true
        
//        contentView.addSubview(background)
//        background.image = UIImage(named: "crushtable_cell")
//        background.contentMode = .scaleAspectFill
        
        // configure nameLabel
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 45).isActive = true
        nameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont(name: "Barlow-SemiBold", size: 10)
        nameLabel.textColor = orange_color
        
        // configure newImg
        contentView.addSubview(newImg)
        newImg.translatesAutoresizingMaskIntoConstraints = false
        newImg.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 0).isActive = true
        newImg.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: -10).isActive = true
        newImg.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: 10).isActive = true
        newImg.trailingAnchor.constraint(equalTo: nameLabel.layoutMarginsGuide.leadingAnchor, constant: -10).isActive = true
        newImg.image = UIImage.init(named: "new_anyColor")
        newImg.tintColor = orange_color
        newImg.contentMode = .scaleAspectFit
        
        // configure detailLabel
        contentView.addSubview(detailLabel)
        detailLabel.lineBreakMode = .byWordWrapping
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        detailLabel.numberOfLines = 0
        detailLabel.font = UIFont.systemFont(ofSize: 0)
        detailLabel.textColor = UIColor.lightGray
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

