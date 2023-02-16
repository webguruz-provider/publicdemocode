//
//  AddProfileVC.swift
//  Genie
//
//  Created by Aliqan on 18/07/18.
//  Copyright © 2018 Aliqan. All rights reserved.
//

import UIKit
import CropViewController
import Popover
import SDWebImage
import AVKit

class AddProfileVC: UIViewController {
    
    @IBOutlet weak var selfiMsgLabel: UILabel!
    
    @IBOutlet weak var backgroundImgVw: UIImageView!
    @IBOutlet weak var addPhotoBtn:UIButton!
    
    @IBOutlet var backPhotoimg: UIImageView!
    
    
    @IBOutlet weak var btnVerify: UIButton!
    @IBOutlet weak var btnReady: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var uploadedImage: UIImageView!
    @IBOutlet weak var imageView_Profile:UIImageView!
    
    var acceptrealPopup  = Popover()
    var acceptedRevealView   =  SelefiImageRejectedPopView()
    
    var imagePicker = UIImagePickerController()
    var profileVM = ProfileVM()
    var loginModel: NewLoginModel!
    var imageURL = ""
    var phoneNo = ""
    var AI_Status = 0
    var turk_status = 0
    var hit_Id = ""
    var isbackBtndisplay = true
    var selfipose = ""
    var geieguidlinesrestrictedvw =   GenieguidlinesRestricedPopView()
    var genieguidelinesPopover = Popover()
    var deniedCameraView  = Bundle.main.loadNibNamed("CustomViews", owner: AddProfileVC.self, options: nil)![17] as! SelefiImageRejectedPopView
    var deniedPop  = Popover()
    
    @IBOutlet weak var uploadBackVw: UIView!
    
    var first_name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(true, forKey: "isOnProfileVC_FacebookProfileVC_AddProfileVC_EditProfileVC")
        UserDefaults.standard.synchronize()
        print("Ref count \(String(describing: [self .classForCoder])) : \(CFGetRetainCount(self))")
        
        acceptrealPopup.animationOut = 0
        acceptrealPopup.animationIn = 0
        acceptedRevealView                                      = Bundle.main.loadNibNamed("CustomViews", owner: self, options: nil)![17] as! SelefiImageRejectedPopView
        
        genieguidelinesPopover.animationOut = 0
        genieguidelinesPopover.animationIn = 0
        geieguidlinesrestrictedvw = Bundle.main.loadNibNamed("CustomViews", owner: self, options: nil)![16] as! GenieguidlinesRestricedPopView
        
        if let selficacheURL = DEFAULTS.string(forKey: Constant.SELFI_CACHE_URL)
        {
            selfipose = selficacheURL
        }
        
        listassignmentScreenType = 4
        setCornerRadiusToViews([imageView_Profile, uploadedImage, uploadBackVw], cornerRadius: 15.0)
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        initialSetUp()
        self.geieguidlinesrestrictedvw.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.geieguidlinesrestrictedvw.loadingDefaultUI(ismanualverification: false)
        self.geieguidlinesrestrictedvw.closeBtn.addTarget(self, action: #selector(closeGeniefailedguidlinesPOPup(_:)), for: .touchUpInside)
        self.geieguidlinesrestrictedvw.backdismissBtn.addTarget(self, action: #selector(closeGeniefailedguidlinesPOPup(_:)), for: .touchUpInside)
        self.geieguidlinesrestrictedvw.guidlinesbtn.addTarget(self, action: #selector(gotoGenieGuidelines(_:)), for: .touchUpInside)
        backgroundImgVw.applynewGradient()
        //selfiMsgLabel.text = "Your selfie is only used for comparsion and not shown to any users."
        selfiMsgLabel.text = "Your selfie is only used for comparsion and not shown to any users.\n\nPlease read genie image guidelines for further details."
        //Your selfie is only used to verify your profile photo and NOT SEEN BY ANYONE
        //\n\nPlease read genie image guidelines for further details.
        
        selfiMsgLabel.font = UIFont(name: "Barlow-SemiBold", size: 14)
        let str2 = NSString(string: selfiMsgLabel.text!)
        let theRange2 = str2.range(of: "genie image guidelines")
        let myMutableString2 = NSMutableAttributedString(string: str2 as String, attributes: [NSAttributedString.Key.font :selfiMsgLabel.font!])
        myMutableString2.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: theRange2 )
        selfiMsgLabel.attributedText = myMutableString2
        let read_more = UITapGestureRecognizer(target: self, action: #selector(self.openGuideline(_:)))
        selfiMsgLabel.addGestureRecognizer(read_more)
        selfiMsgLabel.isUserInteractionEnabled = true
        
        if #available(iOS 13.0, *), DEFAULTS.bool(forKey: "selfieLive"){
            //show new design
            
        }
        
        showPopup()
    }
    
    @objc func openGuideline(_ sender: UITapGestureRecognizer? = nil){
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let vController  = story.instantiateViewController(withIdentifier: "ImageGuidalinesVC") as! ImageGuidalinesVC
        vController.showRejected = 0
        vController.showpeding = 0
        vController.showRejected = 0
        vController.showpeding = 0
        vController.isfromprotoscreen = true
        vController.show_manual_verify = false
        self.navigationController?.pushViewController(vController, animated: false)
    }
    
    func showNewLivenessDesign(){
        
    }
    
    func showPopup()
    {
        if let foundView = self.view.viewWithTag(120012) {
            foundView.removeFromSuperview()
        }
        
        
        let orange_color = UIColor.init(red: 252/255, green: 91/255, blue: 42/255, alpha: 1.0)
        let blue_color = UIColor.init(red: 0/255, green: 0/255, blue: 58/255, alpha: 1.0)
        
        let baseView  = UIView(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        baseView.tag = 120012
        baseView.backgroundColor = .clear
        
        let transparentView  = UIView(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        transparentView.backgroundColor = .black
        transparentView.alpha = 0.7
        baseView.addSubview(transparentView)
        
        let height = 480
        let width = 300
        
        let whiteView  = UIView(frame: CGRect.init(x: CGFloat(Int(baseView.frame.size.width) / 2 - width / 2), y: baseView.frame.size.height / 2 - CGFloat(height / 2), width: CGFloat(width) , height: CGFloat(height)))
        
        whiteView.backgroundColor = .white
        whiteView.layer.cornerRadius = 15
        whiteView.clipsToBounds = true
        
        let catImage = UIImage(named: "WG_SELFIE")
        let myImageView:UIImageView = UIImageView()
        myImageView.contentMode = UIView.ContentMode.scaleAspectFit
        let img_height = 85
        let img_width = 78
        myImageView.frame.size.width = CGFloat(img_width)
        myImageView.frame.size.height = CGFloat(img_height)
        myImageView.image = catImage
        myImageView.frame = CGRect.init(x: CGFloat(Int(whiteView.frame.size.width) / 2 - img_width / 2), y: 40, width: CGFloat(img_width) , height: CGFloat(img_height))
        whiteView.addSubview(myImageView)
        
        let label = UILabel(frame: CGRect(x: 0, y: myImageView.frame.origin.y + myImageView.frame.size.height + 15, width: whiteView.frame.size.width, height: 21))
        label.textAlignment = .center
        label.text = "Not selfie ready?"
        label.font = UIFont(name: "Barlow-Bold", size: 18)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = orange_color //UIColor.init(red: 0/255, green: 0/255, blue: 76/255, alpha: 1.0)
        whiteView.addSubview(label)
        
        let label1 = UILabel(frame: CGRect(x: 0, y: label.frame.origin.y + label.frame.size.height + 30, width: whiteView.frame.size.width, height: 21))
        label1.textAlignment = .center
        label1.text = "Don't worry,"
        label1.font = UIFont(name: "Barlow-Bold", size: 14)
        label1.adjustsFontSizeToFitWidth = true
        label1.minimumScaleFactor = 0.5
        label1.textColor = blue_color
        whiteView.addSubview(label1)
        
        let label2 = UILabel(frame: CGRect(x: 10, y: label1.frame.origin.y + label1.frame.size.height, width: whiteView.frame.size.width-20, height: 21))
        label2.textAlignment = .center
        label2.text = "NO ONE SEES YOUR SELFIE"
        label2.font = UIFont(name: "Barlow-Bold", size: 14)
        label2.adjustsFontSizeToFitWidth = true
        label2.minimumScaleFactor = 0.5
        label2.textColor = blue_color
        whiteView.addSubview(label2)
        
        
        let label3 = UILabel(frame: CGRect(x: 10, y: label2.frame.origin.y + label2.frame.size.height, width: whiteView.frame.size.width-20, height: 21))
        label3.textAlignment = .center
        label3.text = "except the AI robot - we're just verifying"
        label3.font = UIFont(name: "Barlow-Bold", size: 14)
        label3.adjustsFontSizeToFitWidth = true
        label3.minimumScaleFactor = 0.5
        label3.textColor = blue_color
        whiteView.addSubview(label3)
        
        let label4 = UILabel(frame: CGRect(x: 10, y: label3.frame.origin.y + label3.frame.size.height, width: whiteView.frame.size.width-20, height: 21))
        label4.textAlignment = .center
        label4.text = "your profile photo is genuinely you!"
        label4.font = UIFont(name: "Barlow-Bold", size: 14)
        label4.adjustsFontSizeToFitWidth = true
        label4.minimumScaleFactor = 0.5
        label4.textColor = blue_color
        whiteView.addSubview(label4)
        
        
        let label5 = UILabel(frame: CGRect(x: 10, y: label3.frame.origin.y + label3.frame.size.height + 45, width: whiteView.frame.size.width - 20, height: 40))
        label5.textAlignment = .center
        label5.numberOfLines = 2
        label5.text = "This means that all the users you see on genie are also genuine"
        label5.font = UIFont(name: "Barlow-Bold", size: 14)
        label5.adjustsFontSizeToFitWidth = true
        label5.minimumScaleFactor = 0.5
        label5.textColor = blue_color
        whiteView.addSubview(label5)
        
        label5.text = ""
        let str4 = NSString(string: "This means that all the users you see on genie are also genuine")
        let myMutableString4 = NSMutableAttributedString(string: str4 as String, attributes: [NSAttributedString.Key.font :label5.font!])
        
        myMutableString4.addAttribute(NSAttributedString.Key.foregroundColor, value: orange_color, range: str4.range(of: "genie") )
        myMutableString4.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "Barlow-Bold", size: label5.font!.pointSize)!, range: str4.range(of: "genie") )
        
        myMutableString4.addAttribute(NSAttributedString.Key.foregroundColor, value: orange_color, range: str4.range(of: "genuine") )
        myMutableString4.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "Barlow-Bold", size: label5.font!.pointSize)!, range: str4.range(of: "genuine") )
        
        label5.attributedText = myMutableString4
        
        
        let button = UIButton(frame: CGRect(x: 20, y: label5.frame.origin.y + label5.frame.size.height + 50, width: whiteView.frame.size.width - 40, height: 40))
         button.setTitle("Okay", for: .normal)
         button.backgroundColor = orange_color
        button.layer.cornerRadius = button.frame.size.height / 2
        button.clipsToBounds = true
         button.setTitleColor(UIColor.white, for: .normal)
         button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        whiteView.addSubview(button)
        

        baseView.addSubview(whiteView)
        
        self.view.addSubview(baseView)
    }
    
    @objc func buttonTapped(sender : UIButton) {
            if let foundView = self.view.viewWithTag(120012) {
                foundView.removeFromSuperview()
            }
        
 }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backgroundImgVw.applynewGradient()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UserDefaults.standard.set(true, forKey: "isUserSelfieView")
        UserDefaults.standard.set(true, forKey: "isOnProfileVC_FacebookProfileVC_AddProfileVC_EditProfileVC")
        UserDefaults.standard.synchronize()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.set(false, forKey: "isUserSelfieView")
        UserDefaults.standard.set(false, forKey: "isOnProfileVC_FacebookProfileVC_AddProfileVC_EditProfileVC")
        UserDefaults.standard.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:-
    //MARK:- Custom Methods
    fileprivate func initialSetUp(){
        
        print("selfi imageas as \(selfipose)")
        
        if isfileExistsAtpath(publicPathurl: selfipose)
        {
            //imageView_Profile.sd_setImage(with: getPresignedURL(publicPath: selfipose  ).url, completed: nil);
            imageView_Profile.image = getLocalFilePathDataImg(publicPathurl: selfipose)  
        }
        else
        {
            imageView_Profile.sd_setImage(with: getPresignedURL(publicPath: selfipose  ).url, completed: nil);
            
            SDWebImageManager.shared.loadImage(with: getPresignedURL(publicPath: selfipose).url,  options: .highPriority, progress: { (process, process1, imgeurl) in
                print("downloading....")
            }) { (img, imgData, error, type, issucess, imgurl) in
                
                self.imageView_Profile.sd_setImage(with: getPresignedURL(publicPath: self.selfipose  ).url, completed: nil);
            }
        }
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "HitStatus"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(HitStatusSelfie), name: NSNotification.Name(rawValue: "HitStatus"), object: nil)
        
        btnReady.roundCornerWith(color: .clear)
        
        if imageURL != "" {
            backPhotoimg.alpha = 0
            uploadedImage!.sd_imageIndicator = SDWebImageActivityIndicator.gray
            
            uploadedImage!.sd_setImage(with:  getPresignedURL(publicPath: imageURL ).url, placeholderImage: nil, options: .highPriority) { (img, err, type, url) in
                self.backPhotoimg.alpha = 1
            }
            
            
            if AI_Status == 2{
                
                self.btnReady.setTitle("Next", for: .normal)
                self.btnReady.tag = 1
                DEFAULTS.set("", forKey:  Constant().UD_HIT_ID)
                self.btnVerify.isHidden = true
                self.btnVerify.isEnabled = false
                self.btnVerify.backgroundColor = #colorLiteral(red: 0.5882352941, green: 0.5882352941, blue: 0.5882352941, alpha: 0.8980392157)
                
            }
            else
            {
            
                self.btnVerify.isHidden = true
                self.btnVerify.isEnabled = true
                self.btnVerify.backgroundColor = UIColor.white
                
                if turk_status == 1{
                    self.btnVerify.tag = 0
                    self.btnVerify.setTitle("Verify Manually", for: .normal)
                    DispatchQueue
                        .main.asyncAfter(deadline: .now() + 0.5) {
                            self.geieguidlinesrestrictedvw.loadingDefaultUI(ismanualverification: true)
                            
                            self.geieguidlinesrestrictedvw.profileimg.sd_setImage(with: getPresignedURL(publicPath: self.imageURL ).url, completed: nil)
                            self.geieguidlinesrestrictedvw.messageLabel.text = "You have already uploaded a selfie which is not verified yet"
                            self.genieguidelinesPopover = Popover.init()
                            self.genieguidelinesPopover.popoverColor = .clear;
                            self.genieguidelinesPopover.blackOverlayColor  = UIColor.black.withAlphaComponent(0.8)
                            self.genieguidelinesPopover.arrowSize = CGSize.init(width: 0, height: 0);
                            self.genieguidelinesPopover.show(  self.geieguidlinesrestrictedvw, point: CGPoint.init(x: self.view.frame.origin.x, y: self.view.frame.origin.y) )
                        }
                }
                else if turk_status == 2{
                    self.btnVerify.tag = 1
                    self.btnVerify.setTitle("Check Status", for: .normal)
                    //checking the status
                    globalAPIClass.shared.checkingHitStatus()
                    print("status called again")
                }
                else if turk_status == 3{
                    self.btnReady.setTitle("Next", for: .normal)
                    self.btnReady.tag = 1
                    DEFAULTS.set("", forKey:  Constant().UD_HIT_ID)
                    self.btnVerify.isHidden = true
                    self.btnVerify.isEnabled = false
                    self.btnVerify.backgroundColor = #colorLiteral(red: 0.5882352941, green: 0.5882352941, blue: 0.5882352941, alpha: 0.8980392157)
                }
                
            }
            
        }
    }
    
    deinit {
        print("dinit: called \(String(describing: [self .classForCoder]))")
    }
    
    @objc func closeGeniefailedguidlinesPOPup(_ sender : UIButton)
    {
        genieguidelinesPopover.dismiss()
    }
    
    @objc func gotoGenieGuidelines(_ sender : UIButton)
    {
        sender.preventMultipleTouchs()
        genieguidelinesPopover.dismiss()
        let vController  = self.storyboard?.instantiateViewController(withIdentifier: "ImageGuidalinesVC") as! ImageGuidalinesVC
        vController.showRejected = 0
        vController.showpeding = 0
        self.navigationController?.pushViewController(vController, animated: false)
        
    }
    
    @IBAction func gotoGuidelines(_ sender: UIButton) {
        sender.preventMultipleTouchs()
        let vController  = self.storyboard?.instantiateViewController(withIdentifier: "ImageGuidalinesVC") as! ImageGuidalinesVC
        vController.showRejected = 0
        vController.showpeding = 0
        self.navigationController?.pushViewController(vController, animated: false)
    }
    
    func checkHitStatus(_ isloader : Bool){
        if isloader
        {
            startLoad(0, .star, .custom(color: .black))
        }
        
        if  DEFAULTS.string(forKey: Constant().UD_USER_USER_ID) == nil
        {
            stopLoad()
            return
        }
        
        let hitId = DEFAULTS.string(forKey:  Constant().UD_HIT_ID)
        let userID = DEFAULTS.string(forKey: Constant().UD_USER_USER_ID)
        let param = ["myhitid": hitId!,
                     "userID": userID!] as [String : Any]
        
        DataManager.alamofirePostRequestWithDictionary(url: BASE_URL + LIST_ASSIGNMENTS ,
                                                       viewcontroller: appDel.topController(), parameters: param as [String : AnyObject]) {
            (responseObject, error,responseDict, apistatus) in
                       
            
            URLCache.shared.removeAllCachedResponses()
            stopLoad()
            if apistatus == .success
            {
                let dict = responseObject?.dictionaryValue
                let data = dict?["data"]?.dictionaryValue
                let status = data?["status"]?.stringValue
                print(status!)
                if status! == "Pending"
                {
                    Utility.showAlertMessage(title: Constant().TITLE, message: "Your image is under verification process. We will notify you when it is done or you can check status manually", view: self)
                }
                else if status! == "Rejected"
                {
                    DispatchQueue.main.async
                    {
                        self.btnVerify.isHidden = true
                        self.btnVerify.isEnabled = false
                        self.btnVerify.backgroundColor = #colorLiteral(red: 0.5882352941, green: 0.5882352941, blue: 0.5882352941, alpha: 0.8980392157)
                        DEFAULTS.set("", forKey:  Constant().UD_HIT_ID)
                        
                        self.geieguidlinesrestrictedvw.setImage(img: self.imageView_Profile.image)
                        self.genieguidelinesPopover = Popover.init()
                        self.genieguidelinesPopover.popoverColor = .clear;
                        self.genieguidelinesPopover.blackOverlayColor  = UIColor.black.withAlphaComponent(0.8)
                        self.genieguidelinesPopover.arrowSize = CGSize.init(width: 0, height: 0);
                        self.genieguidelinesPopover.show(  self.geieguidlinesrestrictedvw, point: CGPoint.init(x: self.view.frame.origin.x, y: self.view.frame.origin.y) )
                    }
                }
                else
                {
                    self.btnReady.setTitle("Next", for: .normal)
                    self.btnReady.tag = 1
                    self.btnVerify.isEnabled = false
                    self.btnVerify.backgroundColor = #colorLiteral(red: 0.5882352941, green: 0.5882352941, blue: 0.5882352941, alpha: 0.8980392157)
                    DEFAULTS.set("", forKey:  Constant().UD_HIT_ID)
                    Utility.showAlertMessage(title: Constant().TITLE, message: "Your image is verified. Please Click Next to continue", view: self)
                }
            }
            else if apistatus == .failed
            {
                
                showAlertWithAction(headerTitle: "Genie", Msg: "An internal error occured, Please try again", OkAction: nil, showinviw: self)
                
            }
            else if apistatus == .incorrectTime
            {
                self.showToast(message: "Could not authenticate device time. Update your device’s Date & Time settings to Set Automatically", bgColor: UIColor.white.withAlphaComponent(0.5))
                
            }
            else if apistatus == .nonetwork
            {
                Utility.showNetworkAlertMessage(title:Constant().TITLE, message: Constant().MESSAGE, view: self, imagetype: Constant().violetgradientImg)
                
            }
        }
    }
    
    @objc func HitStatusSelfie (notification:NSNotification) {
        self.btnReady.setTitle("Next", for: .normal)
        self.btnReady.tag = 1
        self.btnVerify.isEnabled = false
        self.btnVerify.backgroundColor = #colorLiteral(red: 0.5882352941, green: 0.5882352941, blue: 0.5882352941, alpha: 0.8980392157)
        DEFAULTS.set("", forKey:  Constant().UD_HIT_ID)
        
    }
    //MARK:-
    //MARK:- UIButton Action Method
    @IBAction func backBtnClicked(){
        if !isbackBtndisplay
        {
            gobackToprotoScreen()
        }
        else
        {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    func gobackToprotoScreen() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: Constant.PROFILE_VC) as! ProfileVC
        vc.isfromappdelegate = true
        vc.showAcceptedPopup = false
        vc.first_name = first_name
        var Url = Utility.getImagefor(images: loginModel.user?.rejectedImageArr ?? [], tag: 0)
        if Url == ""{
            Url = Utility.getImagefor(images: loginModel.user?.imageArr ?? [], tag: 1)
            let imageObj = Utility.getImageObject(images: loginModel.user?.imageArr ?? [], tag: 1)
            vc.AI_Status = imageObj.AI_status
            vc.turk_status = imageObj.mTurk_status
        }
        else
        {
            let imageObj = Utility.getImageObject(images: loginModel.user?.rejectedImageArr ?? [], tag: 0)
            vc.AI_Status = imageObj.AI_status
            vc.turk_status = imageObj.mTurk_status
        }
        vc.imageURL = Url
        vc.rejectedmess = "The image does not contain a human face"
        self.navigationController?.pushViewController(vc, animated: false)
   }
    
    
    @IBAction func addphotoClickedOnimg(_ sender: UIButton) {
        sender.preventMultipleTouchs()
        openCamera()
        
    }
    
    
    @IBAction func addPhotoBtnClicked(_ sender: UIButton){
        sender.preventMultipleTouchs()
        if sender.tag == 0{
            openCamera()
        }
        else
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: Constant.GENERAL_INFO_VC) as! GeneralInfoVC
            vc.loginModel = loginModel
            vc.first_name = first_name
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func cmdVerify(_ sender: UIButton) {
        sender.preventMultipleTouchs()
        if sender.tag == 0{
            let userID = DEFAULTS.string(forKey: Constant().UD_USER_USER_ID)
            let param = ["userID": userID!, "type":""] as [String : Any]
            startLoad(0, .star, .custom(color: .black))
            DataManager.alamofirePostRequestWithDictionary(url: BASE_URL + IMAGE_COMPARE_URL ,
                                                           viewcontroller: appDel.topController(), parameters: param as [String : AnyObject]) {
                (responseObject, error,responseDict, apistatus) in
                
               
                
                URLCache.shared.removeAllCachedResponses()
                stopLoad()
                if apistatus == .success
                {
                    
                    if error == nil {
                        let dict = responseObject?.dictionaryValue
                        let data = dict?["data"]?.dictionaryValue
                        let hit = data?["HIT"]?.dictionaryValue
                        let hitId = hit?["HITId"]?.stringValue
                        //print(hitId!)
                        DEFAULTS.set(hitId, forKey:  Constant().UD_HIT_ID)
                        DispatchQueue.main.async {
                            self.btnVerify.tag = 1
                            self.btnVerify.setTitle("Check Status", for: .normal)
                        }
                    }
                    
                }
                else if apistatus == .failed
                {
                    showAlertWithAction(headerTitle: "Genie", Msg: "An internal error occured, please try again", OkAction: nil, showinviw: self)
                    
                }
                else if apistatus == .incorrectTime
                {
                    self.showToast(message: "Could not authenticate device time. Update your device’s Date & Time settings to Set Automatically", bgColor: UIColor.white.withAlphaComponent(0.5))
                    
                }
                else if apistatus == .nonetwork
                {
                    Utility.showNetworkAlertMessage(title:Constant().TITLE, message: Constant().MESSAGE, view: self, imagetype: Constant().violetgradientImg)
                    
                }
            }
        }
        else
        {
            checkHitStatus(true)
        }
    }
}

//MARK:- Implement UIImagePickerDelegate and UINavigationControllerDelegate methos
extension AddProfileVC:UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    
    fileprivate func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            if AVCaptureDevice.authorizationStatus(for: .video) ==  .denied {
                print("camera denied")
                
                self.deniedCameraView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width  , height: self.view.frame.height)
                self.deniedCameraView.loadingDefaultUI(false)
                self.deniedCameraView.messageLabel.text = "Unable to access your camera because you denied permission. Please go to Genie settings and give permission to access camera or choose some other mode to upload image"
                self.deniedCameraView.okcancelBtnVw.alpha = 0
                self.deniedCameraView.okBtn.alpha = 1
                self.deniedCameraView.okBtn.setTitle("  Settings  ", for: .normal)
                self.deniedPop.popoverColor = .clear;
                self.deniedPop.arrowSize = CGSize.init(width: 0, height: 0);
                self.deniedPop.blackOverlayColor  = UIColor.black.withAlphaComponent(0.5)
                self.deniedCameraView.closeBtn.alpha = 1
                self.deniedCameraView.closeBtn.addTarget(self, action: #selector(self.dismissCameraDeniedView(_:)), for: .touchUpInside)
                self.deniedCameraView.okBtn.addTarget(self, action: #selector(self.gotoappSettings(_:)), for: .touchUpInside)
                self.deniedPop.show(self.deniedCameraView, point: CGPoint.init(x: self.view.frame.origin.x, y: self.view.frame.origin.y ))
            }
            else
            {
                UserDefaults.standard.set(false, forKey: "isOnProfileVC_FacebookProfileVC_AddProfileVC_EditProfileVC")
                UserDefaults.standard.synchronize()
                openCameraMethodOld()
            }
            
        }
        else
        {
            Utility.showAlertMessage(title: Constant.CAMERA_NOT_FOUND, message: Constant.NO_CAMERA, view: self)
        }
    }
    
    fileprivate func openCameraMethodOld(){
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        imagePicker.cameraDevice = .front
        imagePicker.cameraCaptureMode = .photo
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    fileprivate func openCameraMethodNew(){
        openCameraMethodOld()
    }
    
    @objc func dismissCameraDeniedView(_ sender : UIButton)
    {
        self.deniedPop.dismiss()
    }
    
    @objc func gotoappSettings(_ sender : UIButton)
    {
        sender.preventMultipleTouchs()
        self.deniedPop.dismiss()
        UIApplication.shared.open(URL.init(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true) { [self] in
            if let pickedImage = info[.originalImage] as? UIImage {
                uploadedImage.image = pickedImage
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { [self] in
                UploadImageWithoutCropper(image: pickedImage)
                }
            }
            UserDefaults.standard.set(true, forKey: "isOnProfileVC_FacebookProfileVC_AddProfileVC_EditProfileVC")
            UserDefaults.standard.synchronize()
        }
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(true, forKey: "isOnProfileVC_FacebookProfileVC_AddProfileVC_EditProfileVC")
        UserDefaults.standard.synchronize()
    }
    
    func callUploadImageAPICall(_ pickedImage: UIImage) {
        
        startLoad(0, .star, .custom(color: .black))
        let param : [String:Any] = [:]
        //"5bbf363aa7850f476216e017"
        var refView = UIViewController()
        for vc in (self.navigationController?.viewControllers ?? []) {
            if vc is AddProfileVC {
                refView = vc as! AddProfileVC
                break
            }
        }
        
        UserDefaults.standard.set(false, forKey: "isOnProfileVC_FacebookProfileVC_AddProfileVC_EditProfileVC")
        UserDefaults.standard.set(true, forKey: "isUploadingInProgress")
        
        UserDefaults.standard.synchronize()
        profileVM.callUploadImageADDPRO(url: SELFIE_URL, viewController: refView, imageKey: "file", image: pickedImage, otherParam: param) { (response,responseCode, apistatus, registartionCode ) in
            
            stopLoad()
            
            UserDefaults.standard.set(true, forKey: "isOnProfileVC_FacebookProfileVC_AddProfileVC_EditProfileVC")
            UserDefaults.standard.set(false, forKey: "isUploadingInProgress")
            UserDefaults.standard.synchronize()
            if apistatus == .success || apistatus == .rejected
            {
                
                DEFAULTS.set(false, forKey: Constant().IS_HIT_VERIFIED)
                DEFAULTS.set(nil, forKey: Constant().UD_HIT_ID)
                DEFAULTS.set(0, forKey: Constant().IS_SHOW_REJECTED)
                DEFAULTS.set(0, forKey: Constant().IS_SHOW_PENDING)
                DEFAULTS.synchronize()
                
                if responseCode == "00"
                {
                    if registartionCode == "180"
                    {
                        let vcontroller = self.storyboard?.instantiateViewController(withIdentifier: "EnterEmailVC") as! EnterEmailVC
                        //vc.accessToken = self.accessToken
                        vcontroller.isFromWishVCScreen = false
                        vcontroller.loginModel = self.loginModel
                        vcontroller.registeredCode  = ""
                        
                        self.navigationController?.pushViewController(vcontroller, animated: false)
                        return
                    }
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: Constant.GENERAL_INFO_VC) as! GeneralInfoVC
                    vc.loginModel = self.loginModel
                    vc.first_name = self.first_name
                    self.navigationController?.pushViewController(vc, animated: true)
                    return
                }
                else
                {
                    if apistatus == .rejected
                    {
                        var genietext = ""
                        if ((response?.newuserJSON["rejectionMessage"].stringValue) != nil)
                        {
                            genietext = response!.newuserJSON["rejectionMessage"].stringValue
                        }
                        
                        if ((response?.newuserJSON["rejectionMessage2"].stringValue) != nil)
                        {
                            UserDefaults.standard.set(response!.newuserJSON["rejectionMessage2"].stringValue, forKey: "rejectionMessage2")
                            UserDefaults.standard.synchronize()
                        }
                       
                        if ((response?.newuserJSON["manualVerify"].stringValue) != nil)
                        {
                            UserDefaults.standard.set(response!.newuserJSON["manualVerify"].boolValue, forKey: "rejectionMessage2_manualVerify")
                            UserDefaults.standard.synchronize()
                        }
                        
                        self.failedtheimagewithServer(pickedImage, msg: genietext)
                    }
                    else
                    {
                        self.uploadedImage.image = pickedImage
                    }
                    
                }
            }
            else if apistatus == .failed
            {
                showAlertWithAction(headerTitle: "Genie", Msg: "An internal error occured, please try again", OkAction: nil, showinviw: self)
            }
            else if apistatus == .incorrectTime
            {
                self.showToast(message: "Could not authenticate device time. Update your device’s Date & Time settings to Set Automatically", bgColor: UIColor.white.withAlphaComponent(0.5))
            }
            else if apistatus == .nonetwork
            {
                Utility.showNetworkAlertMessage(title:Constant().TITLE, message: Constant().MESSAGE, view: self, imagetype: Constant().violetgradientImg)
            }
        }
    }
    
    
    
    
    fileprivate func callUploadImageAPI(_ pickedImage: UIImage) {
        startLoad(0, .star, .custom(color: .black))
        let param : [String:Any] = [:]
        //"5bbf363aa7850f476216e017"
        profileVM.callUploadImageADDPRO(url: SELFIE_URL, viewController: self, imageKey: "file", image: pickedImage, otherParam: param) { (response,responseCode, apistatus, registartionCode ) in
            stopLoad()
            if apistatus == .success || apistatus == .rejected
            {
                
                //Clearing hit status data
                DEFAULTS.set(false, forKey: Constant().IS_HIT_VERIFIED)
                DEFAULTS.set(nil, forKey: Constant().UD_HIT_ID)
                DEFAULTS.set(0, forKey: Constant().IS_SHOW_REJECTED)
                DEFAULTS.set(0, forKey: Constant().IS_SHOW_PENDING)
                DEFAULTS.synchronize()
                //==
                
                if responseCode == "00"{
                    
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: Constant.FACEBOOK_PROFILE_VC) as! FacebookProfileVC
                    vc.isFacebook = false
                    vc.isPhone = true
                    vc.imageUrl =  Utility.getImagefor(images: response!.imageArr , tag: 1)
                    Utility.updateImagesinUserDefaults(images: response?.imageArr ?? [])
                    vc.profileURL = response!.imageArr
                    vc.isSignUp = true
                    self.navigationController?.pushViewController(vc, animated: true)
                    appDel.AppFlyerCustomEvents(name: "selfie_check_complete", values: [:])
                    return
                    
                    
                }
                
                if apistatus == .rejected
                {
                    
                    DispatchQueue
                        .main.asyncAfter(deadline: .now() + 0.5) {
                            self.geieguidlinesrestrictedvw.loadingDefaultUI(ismanualverification: false)
                            self.geieguidlinesrestrictedvw.profileimg.sd_setImage(with: getPresignedURL(publicPath: self.imageURL ).url , completed: nil)
                            self.geieguidlinesrestrictedvw.messageLabel.text = "Selfie does not contain the required hand pose. Please upload another selfie of yours with the hand pose matching as shown on the photo in the left."
                            self.genieguidelinesPopover = Popover.init()
                            self.genieguidelinesPopover.popoverColor = .clear;
                            self.genieguidelinesPopover.blackOverlayColor  = UIColor.black.withAlphaComponent(0.8)
                            self.genieguidelinesPopover.arrowSize = CGSize.init(width: 0, height: 0);
                            self.genieguidelinesPopover.show(  self.geieguidlinesrestrictedvw, point: CGPoint.init(x: self.view.frame.origin.x, y: self.view.frame.origin.y) )
                        }
                    
                }
            }
            else if apistatus == .failed
            {
                showAlertWithAction(headerTitle: "Genie", Msg: "An internal error ocuured, Please try again", OkAction: nil, showinviw: self)
                
            }
            else if apistatus == .incorrectTime
            {
                self.showToast(message: "Could not authenticate device time. Update your device’s Date & Time settings to Set Automatically", bgColor: UIColor.white.withAlphaComponent(0.5))
                
            }
            else if apistatus == .nonetwork
            {
                showAlertWithAction(headerTitle: "Genie", Msg: "No network connection, please try again", OkAction: nil, showinviw: self)
                
            }
            
            
        }
    }
}
//MARK:- CropViewControllerDelegate Methods
extension AddProfileVC : CropViewControllerDelegate{
    func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        self.navigationController?.popViewController(animated: true)
        self.uploadedImage.image = image
        //callUploadImageAPICall(image.updateImageOrientionUpSide()!.resizeTODefault())
        if let image1 = image.updateImageOrientionUpSide()?.resizeTODefault() {
            callUploadImageAPICall(image1)
        }
        else
        {
            self.showToast(message: "Something went wrong. Please try again!!!", bgColor: UIColor.white.withAlphaComponent(0.5))
        }
    }
    
    
    func UploadImageWithoutCropper(image : UIImage)
    {
        self.uploadedImage.image = image
        //callUploadImageAPICall(image.updateImageOrientionUpSide()!.resizeTODefault()) //crash Genie/AddProfileVC.swift:843: Fatal error: Unexpectedly found nil while unwrapping an Optional value
        if let image1 = image.updateImageOrientionUpSide()?.resizeTODefault() {
            callUploadImageAPICall(image1)
        }
        else
        {
            self.showToast(message: "Something went wrong. Please try again!!!", bgColor: UIColor.white.withAlphaComponent(0.5))
        }
    }
    
}

extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.y, y: -origin.x,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return rotatedImage ?? self
        }
        
        return self
    }
}



extension AddProfileVC : selfiViewcontrollerCaptureDelegate
{
    @objc func closeSameLeague1(sender : UIButton)
    {
        removePopup()
    }
    
    func removePopup()
    {
        if let foundView = appDel.window!.rootViewController!.view.viewWithTag(120012) {
            foundView.removeFromSuperview()
        }
    }
    func failedtheimagewithServer(_ img: UIImage, msg: String) {
        
        print("faled and  got backg")
        
        removePopup()
        
        var text1 = ""
        var text2 = ""
        var text3 = ""
        if !msg.isEmpty
        {
            let dataofMSG = msg.split(separator: ".")
            if dataofMSG.count > 0
            {
                text1 = String(dataofMSG[0])
                //new_invalid_popup.messageLabel.text = String(dataofMSG[0])
            }
            if dataofMSG.count > 1
            {
                text2 = String(dataofMSG[1])
                //new_invalid_popup.uploaddifferentImgLabel.text = String(dataofMSG[1])
            }
        }

        if let rejectionMessage2 = DEFAULTS.string(forKey: "rejectionMessage2") {
            if rejectionMessage2.count > 0 {
                UserDefaults.standard.set("", forKey: "rejectionMessage2")
                UserDefaults.standard.synchronize()
                text3 = rejectionMessage2
            }
        }
        
        let manualVerify = DEFAULTS.bool(forKey: "rejectionMessage2_manualVerify")
        
        let orange_color = UIColor.init(red: 252/255, green: 91/255, blue: 42/255, alpha: 1.0)
        let orange_color_for_box_text = UIColor.init(red: 1, green: 0.649, blue: 0.542, alpha: 1)
        let blue_color = UIColor.init(red: 0/255, green: 0/255, blue: 58/255, alpha: 1.0)
        let bar_bg_color = UIColor.init(red: 0.913, green: 0.913, blue: 0.913, alpha: 1)
        
        let baseView  = UIView(frame: CGRect.init(x: 0, y: 0, width: appDel.window!.rootViewController!.view.frame.width, height: appDel.window!.rootViewController!.view.frame.height))
        baseView.tag = 120012
        baseView.backgroundColor = .clear
        
        let transparentView  = UIView(frame: CGRect.init(x: 0, y: 0, width: appDel.window!.rootViewController!.view.frame.width, height: appDel.window!.rootViewController!.view.frame.height))
        transparentView.backgroundColor = .black
        transparentView.alpha = 0.7
        baseView.addSubview(transparentView)
        
        var height = 320
        let width = 320
        
        let whiteViewOuter  = UIView(frame: CGRect.init(x: CGFloat(Int(baseView.frame.size.width) / 2 - width / 2), y: baseView.frame.size.height / 2 - CGFloat(height / 2), width: CGFloat(width) , height: CGFloat(height)))
        
        whiteViewOuter.backgroundColor = .clear
        whiteViewOuter.layer.cornerRadius = 15
        whiteViewOuter.clipsToBounds = true
        
        let whiteView  = UIView(frame: CGRect.init(x: CGFloat(Int(whiteViewOuter.frame.size.width) / 2 - width / 2), y: whiteViewOuter.frame.size.height / 2 - CGFloat(height / 2), width: CGFloat(width) , height: CGFloat(height)))
        
        whiteView.backgroundColor = .white
        whiteView.layer.cornerRadius = 15
        whiteView.clipsToBounds = true
        
        height = 0
        
        let button = UIButton(frame: CGRect(x: Int(whiteView.frame.size.width) - 40, y: height - 5 , width: 40, height: 40))
        button.setTitle("X", for: .normal)
        button.titleLabel?.font = UIFont(name: "Barlow-Bold", size: 14)
        button.backgroundColor = .clear
        button.layer.cornerRadius = button.frame.size.height / 2
        button.clipsToBounds = true
        button.setTitleColor(orange_color, for: .normal)
        button.addTarget(self, action: #selector(self.closeSameLeague1), for: .touchUpInside)
        whiteView.addSubview(button)
        
        height = Int(button.frame.origin.y + button.frame.size.height + 10)
        
        if text1.count > 0 {
            let toastLabel = UILabel()
            toastLabel.frame =  CGRect(x: 15, y: 5  , width: whiteView.frame.size.width - 30 , height: toastLabel.frame.size.height)
            toastLabel.text = text1
            toastLabel.numberOfLines = 0
            toastLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            toastLabel.font = UIFont(name: "Barlow-SemiBold", size: 14)
            toastLabel.sizeToFit()
            toastLabel.frame =  CGRect(x: whiteView.frame.size.width / 2  - toastLabel.frame.size.width / 2, y: CGFloat(height)  , width: toastLabel.frame.size.width , height: toastLabel.frame.size.height)
            toastLabel.textAlignment = .center
            toastLabel.textColor = orange_color
            whiteView.addSubview(toastLabel)
            height = Int(toastLabel.frame.origin.y + toastLabel.frame.size.height + 20)
        }
        
        if text2.count > 0 {
            let toastLabel1 = UILabel()
            toastLabel1.frame =  CGRect(x: 15, y: 5  , width: whiteView.frame.size.width - 30 , height: toastLabel1.frame.size.height)
            toastLabel1.text = text2
            toastLabel1.numberOfLines = 0
            toastLabel1.lineBreakMode = NSLineBreakMode.byWordWrapping
            toastLabel1.font = UIFont(name: "Barlow-SemiBold", size: 14)
            toastLabel1.sizeToFit()
            toastLabel1.frame =  CGRect(x: whiteView.frame.size.width / 2  - toastLabel1.frame.size.width / 2, y: CGFloat(height)  , width: toastLabel1.frame.size.width , height: toastLabel1.frame.size.height)
            toastLabel1.textAlignment = .center
            toastLabel1.textColor = blue_color
            whiteView.addSubview(toastLabel1)
            height = Int(toastLabel1.frame.origin.y + toastLabel1.frame.size.height + 20)
        }
        
        //genie guideline
        let toastLabel2 = UILabel()
        toastLabel2.frame =  CGRect(x: 15, y: 5  , width: whiteView.frame.size.width - 30 , height: toastLabel2.frame.size.height)
        toastLabel2.attributedText = geieguidlinesrestrictedvw.guidlinesbtn.titleLabel?.attributedText
        toastLabel2.numberOfLines = 0
        toastLabel2.lineBreakMode = NSLineBreakMode.byWordWrapping
        toastLabel2.font = UIFont(name: "Barlow-Regular", size: 12)
        toastLabel2.sizeToFit()
        toastLabel2.frame =  CGRect(x: whiteView.frame.size.width / 2  - toastLabel2.frame.size.width / 2, y: CGFloat(height)  , width: toastLabel2.frame.size.width , height: toastLabel2.frame.size.height)
        toastLabel2.textAlignment = .center
        //toastLabel2.textColor = blue_color
        whiteView.addSubview(toastLabel2)
        height = Int(toastLabel2.frame.origin.y + toastLabel2.frame.size.height + 20)
        for recognizer in toastLabel2.gestureRecognizers ?? [] {
            toastLabel2.removeGestureRecognizer(recognizer)  }
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.gotoGenieGuidelines1(_:)))
        toastLabel2.addGestureRecognizer(tap)
        toastLabel2.isUserInteractionEnabled = true
        
        if text3.count > 0 {
            //server message
            let toastLabel3 = UILabel()
            toastLabel3.frame =  CGRect(x: 15, y: 5  , width: whiteView.frame.size.width - 30 , height: toastLabel3.frame.size.height)
            toastLabel3.text = text3
            toastLabel3.numberOfLines = 0
            toastLabel3.lineBreakMode = NSLineBreakMode.byWordWrapping
            toastLabel3.font = UIFont(name: "Barlow-Regular", size: 12)
            toastLabel3.sizeToFit()
            toastLabel3.frame =  CGRect(x: whiteView.frame.size.width / 2  - toastLabel3.frame.size.width / 2, y: CGFloat(height)  , width: toastLabel3.frame.size.width , height: toastLabel3.frame.size.height)
            toastLabel3.textAlignment = .center
            toastLabel3.textColor = .red
            whiteView.addSubview(toastLabel3)
            height = Int(toastLabel3.frame.origin.y + toastLabel3.frame.size.height + 20)
        }
        
        if manualVerify {
            //manual verify btn
            let mbutton = UIButton(frame: CGRect(x: 60, y: CGFloat(height), width: whiteView.frame.size.width - 120, height: 40))
            mbutton.setTitle("Manual Verify", for: .normal)
            mbutton.backgroundColor = orange_color
            mbutton.layer.cornerRadius = mbutton.frame.size.height / 2
            mbutton.clipsToBounds = true
            mbutton.setTitleColor(UIColor.white, for: .normal)
            mbutton.addTarget(self, action: #selector(self.manualVerifyFunction), for: .touchUpInside)
            whiteView.addSubview(mbutton)
            height = Int(mbutton.frame.origin.y + mbutton.frame.size.height + 20)
        }
        
        whiteView.frame  = CGRect.init(x: CGFloat(Int(baseView.frame.size.width) / 2 - width / 2), y: baseView.frame.size.height / 2 - CGFloat(height / 2) , width: CGFloat(width) , height: CGFloat(height))
        whiteViewOuter.addSubview(whiteView)
        
        let same_league_1_bg:UIImageView = UIImageView()
        same_league_1_bg.contentMode = UIView.ContentMode.scaleToFill
        same_league_1_bg.image = img
        same_league_1_bg.frame = CGRect.init(x: 0, y: 0, width: 120 , height:  120)
        same_league_1_bg.cornerRadius = 15
        same_league_1_bg.clipsToBounds = true
        same_league_1_bg.frame =  CGRect(x: whiteViewOuter.frame.size.width / 2  - same_league_1_bg.frame.size.width / 2, y: 0  , width: same_league_1_bg.frame.size.width , height: same_league_1_bg.frame.size.height)
        whiteViewOuter.addSubview(same_league_1_bg)
        
        let same_league_1_bg1:UIImageView = UIImageView()
        same_league_1_bg1.contentMode = UIView.ContentMode.scaleToFill
        same_league_1_bg1.image = UIImage(named: "warningimg")
        same_league_1_bg1.frame = CGRect.init(x: 30, y: 30, width: 60 , height:  60)
        same_league_1_bg1.cornerRadius = 15
        same_league_1_bg1.clipsToBounds = true
        same_league_1_bg1.frame =  CGRect(x: whiteViewOuter.frame.size.width / 2  - same_league_1_bg1.frame.size.width / 2, y: 30  , width: same_league_1_bg1.frame.size.width , height: same_league_1_bg1.frame.size.height)
        whiteViewOuter.addSubview(same_league_1_bg1)
                
        whiteView.frame  = CGRect.init(x: 0, y: CGFloat(same_league_1_bg.frame.origin.y + same_league_1_bg.frame.size.height - 30) , width: CGFloat(width) , height: CGFloat(height))
        
        height = Int(whiteView.frame.origin.y + whiteView.frame.size.height)
        
        whiteViewOuter.frame  = CGRect.init(x: CGFloat(Int(baseView.frame.size.width) / 2 - width / 2), y: baseView.frame.size.height / 2 - CGFloat(height / 2), width: CGFloat(width) , height: CGFloat(height))
        baseView.addSubview(whiteViewOuter)
        
        appDel.window!.rootViewController!.view.addSubview(baseView)

        
    }
    
    @objc func gotoGenieGuidelines1(_ sender: UITapGestureRecognizer? = nil)
    {
        removePopup()
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let vController  = story.instantiateViewController(withIdentifier: "ImageGuidalinesVC") as! ImageGuidalinesVC
        vController.showRejected = 0
        vController.showpeding = 0
        vController.isfromprotoscreen = false
        vController.show_manual_verify = true
        self.navigationController?.pushViewController(vController, animated: true)
    }
    
    @objc func manualVerifyFunction(_ sender : UIButton){
        
        removePopup()
        
        startLoad(0, .star, .custom(color: .black))
        let userID = DEFAULTS.string(forKey: Constant().UD_USER_USER_ID)
        let param = ["userID": userID!, "type" :""] as [String : Any]
        let mnaulverifyURL =  BASE_URL + IMAGE_COMPARE_URL
        

        DataManager.alamofirePostRequestWithDictionary(url: mnaulverifyURL ,
                                                       viewcontroller: appDel.topController(), parameters: param as [String : AnyObject]) {
            (responseObject, error,responseDict, apistatus) in
            
            
            
            stopLoad()
            URLCache.shared.removeAllCachedResponses()
            if apistatus == .success
            {
                if error == nil {
                    saveDefaults(value: false, Key: Constant().UD_HIT_REJECTED)
                    let dict = responseObject?.dictionaryValue
                    let data = dict?["data"]?.dictionaryValue
                    let hit = data?["HIT"]?.dictionaryValue
                    let hitId = hit?["HITId"]?.stringValue
                    //print(hitId!)
                    DEFAULTS.set(hitId, forKey: Constant().UD_HIT_ID)
                    DEFAULTS.set(0, forKey: Constant().IS_SHOW_REJECTED)
                    DEFAULTS.set(0, forKey: Constant().IS_SHOW_PENDING)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.acceptedRevealView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width  , height: self.view.frame.height)
                        self.acceptedRevealView.loadingDefaultUI(false)
                        self.acceptedRevealView.messageLabel.text = "Your image has been sent for manual verification. It can take upto 24 hours.\n\nHowever, we suggest it is best to try with a different combination of profile and selfie image to avoid wait"
                        self.acceptedRevealView.backBtn.addTarget(self, action: #selector(self.closeacceptRrejectViewPopup(_:)), for: .touchUpInside)
                        self.acceptedRevealView.okBtn.addTarget(self, action: #selector(self.successandclose(_:)), for: .touchUpInside)
                        self.acceptedRevealView.okBtn.setTitle("Okay", for: .normal)
                        self.acceptrealPopup.popoverColor = .clear;
                        self.acceptrealPopup.arrowSize = CGSize.init(width: 0, height: 0);
                        self.acceptrealPopup.blackOverlayColor  = UIColor.black.withAlphaComponent(0.8)
                        self.acceptrealPopup.show(self.acceptedRevealView, point: CGPoint.init(x: self.view.frame.origin.x, y: self.view.frame.origin.y ))
                    }
                }
                
            }
            else if apistatus == .failed
            {
                showAlertWithAction(headerTitle: "Genie", Msg: "An internal error occured please try again", OkAction: nil, showinviw: self)
                
            }
            else if apistatus == .incorrectTime
            {
                self.showToast(message: "Could not authenticate device time. Update your device’s Date & Time settings to Set Automatically")
                
            }
            else if apistatus == .nonetwork
            {
                showAlertWithAction(headerTitle: "Genie", Msg: "No network please try again", OkAction: nil, showinviw: self)
                
            }
        }
    }
    
    @objc func closeacceptRrejectViewPopup(_ sender : UIButton)
    {
        self.acceptrealPopup.dismiss()
    }
    
    @objc func successandclose(_ sender : UIButton)
    {
        self.acceptrealPopup.dismiss()
    }
    
    func gotimagetoUpload(_ img: UIImage) {
        
        let cropViewController = CropViewController(image: img)
        cropViewController.delegate = self
        self.navigationController?.pushViewController(cropViewController, animated: true)
    }
   
}
