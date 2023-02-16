//
//  AdvanceFilterViewController.swift
//  Genie
//
//  Created by Krify on 18/06/20.
//  Copyright © 2020 Appzilla.tech. All rights reserved.
//

import UIKit

import Popover
import MRCountryPicker
import SwiftyJSON
import PickerView
import SwiftRangeSlider

class AdvanceFilterViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var advancedFilterLabel: UILabel!
    @IBOutlet var filtersSwitches: [UISwitch]!
    
    @IBOutlet weak var sexualOrientationSwitch: UISwitch!
    @IBOutlet weak var starSignSwitch: UISwitch!
    @IBOutlet weak var religionSwitch: UISwitch!
    @IBOutlet weak var heightSwitch: UISwitch!
    @IBOutlet weak var exerciseSwitch: UISwitch!
    @IBOutlet weak var politicsSwitch: UISwitch!
    @IBOutlet weak var kidsStatusSwitch: UISwitch!
    
    @IBOutlet weak var kidsSwitch: UISwitch!
    @IBOutlet weak var relationshipStatusSwitch: UISwitch!
    @IBOutlet weak var lookingforSwitch: UISwitch!
    @IBOutlet weak var petsSwitch: UISwitch!
    @IBOutlet weak var smokingSwitch: UISwitch!
    @IBOutlet weak var drinkingSwitch: UISwitch!
    @IBOutlet weak var educationLevelSwitch: UISwitch!
    
    
    @IBOutlet weak var sexualOrientationBtn: UIButton!
    @IBOutlet weak var starSignBtn: UIButton!
    @IBOutlet weak var religionbtn: UIButton!
    @IBOutlet weak var heightBtn: UIButton!
    @IBOutlet weak var exerciseBtn: UIButton!
    @IBOutlet weak var politicsBtn: UIButton!
    
    @IBOutlet weak var kidsStatusBtn: UIButton!
    @IBOutlet weak var kidsBtn: UIButton!
    @IBOutlet weak var relationShipStatausBtn: UIButton!
    @IBOutlet weak var lookingForBtn: UIButton!
    
    @IBOutlet weak var petsBtn: UIButton!
    
    @IBOutlet weak var smokingBtn: UIButton!
    @IBOutlet weak var drinkingBtn: UIButton!
    @IBOutlet weak var educationLevelBtn: UIButton!
    @IBOutlet weak var scrollerVw: UIScrollView!
    @IBOutlet weak var sliderRangeLabel: UILabel!
    @IBOutlet weak var baseVW: UIView!
    @IBOutlet weak var educationVW: UIView!
    @IBOutlet var roundedcornerviews: [UIView]!
    @IBOutlet weak var drinkingVw: UIView!
    @IBOutlet weak var smokesVw: UIView!
    
    @IBOutlet weak var petsVw: UIView!
    @IBOutlet weak var lookingforVw: UIView!
    @IBOutlet weak var kidsVw: UIView!
    
    @IBOutlet weak var politicsVw: UIView!
    
    @IBOutlet weak var exerciseVw: UIView!
    @IBOutlet weak var heightVw: UIView!
    @IBOutlet weak var religionVw: UIView!
    @IBOutlet weak var starSignVw: UIView!
    @IBOutlet weak var sexualOrientationVw: UIView!
    
    
    @IBOutlet weak var educationlevelHt: NSLayoutConstraint!
    @IBOutlet weak var educationplusImg: UIImageView!
    @IBOutlet weak var drinkingplusImg: UIImageView!
    @IBOutlet weak var smokesImg: UIImageView!
    @IBOutlet weak var lookingforImg: UIImageView!
    @IBOutlet weak var petsPlusImg: UIImageView!
    @IBOutlet weak var relationshipStatusPlusImg: UIImageView!
    @IBOutlet weak var kidsPlusImg: UIImageView!
    @IBOutlet weak var kidsStatusplusImg: UIImageView!
    @IBOutlet weak var politicsPlusImg: UIImageView!
    @IBOutlet weak var exercisePlusImg: UIImageView!
    @IBOutlet weak var heightPlusImg: UIImageView!
    @IBOutlet weak var religionPlusImg: UIImageView!
    @IBOutlet weak var starsignPlusImg: UIImageView!
    @IBOutlet weak var sexualorientationPlusImg: UIImageView!
    @IBOutlet weak var heightsliderVw: RangeSlider!
    @IBOutlet weak var lookingforVwHt: NSLayoutConstraint!
    @IBOutlet weak var relationshipStatusHt: NSLayoutConstraint!
    @IBOutlet weak var relationshipStatusVw: UIView!
    
    @IBOutlet weak var kidsStatusVw: UIView!
    
    
    
    
    
    @IBOutlet weak var drinkingvwHt: NSLayoutConstraint!
    
    @IBOutlet weak var petsvwHt: NSLayoutConstraint!
    @IBOutlet weak var sexualorientationVwHt: UIView!
    
    
    
    
    
    @IBOutlet weak var smokesvwHt: NSLayoutConstraint!
    @IBOutlet weak var sexualorienationVwHt: NSLayoutConstraint!
    @IBOutlet weak var starsignViewHt: NSLayoutConstraint!
    
    @IBOutlet weak var religionvwht: NSLayoutConstraint!
    @IBOutlet weak var exerciseVwHt: NSLayoutConstraint!
    @IBOutlet weak var heightVwHt: NSLayoutConstraint!
    
    @IBOutlet weak var politicsHt: NSLayoutConstraint!
    @IBOutlet weak var kidsStatusVwHt: NSLayoutConstraint!
    @IBOutlet weak var kidsHt: NSLayoutConstraint!
    
    @IBOutlet var roundedBtns: [customButton]!
    
    
    @IBOutlet var religionsBtns: [customButton]!
    
    @IBOutlet var starsignBtns: [customButton]!
    
    @IBOutlet var sexualOrientationBtns: [customButton]!
    
    
    
    //MARK: Variables
    let relegionPicker = UIPickerView()
    let starPicker = UIPickerView()
    let sexPicker = UIPickerView()
    var educationLevel : String = ""
    var drinking: String = ""
    var smoking: String = ""
    var pets: String = ""
    var lookingFor: String = ""
    var relationshipStatStr: String = ""
    var kidsStatusStr: String = ""
    var kids: String = ""
    var politics: String = ""
    var exercise: String = ""
    
    var religion: String = ""
    var zodiacSign: String = ""
    var sexualOrientation: [String] = []
    var tableOrientationData = [String]()
    var instaStatus : String = ""
    var instaImages : [String] = []
    var instaUserId : String = ""
    var livesIn : String = ""
    var fontOfBtns        : CGFloat       = 10
    var educationArr = [String]()
    var kidsstatusArr  = [String]()
    var relationshipArray  =  [String]()
    var eduButtonArr : [UIButton] = []
    var drinkArr = [String]()
    var drinkButtonArr : [UIButton] = []
    var smokeArr = [String]()
    var smokeButtonArr : [UIButton] = []
    var petsArr = [String]()
    var petsButtonArr : [UIButton] = []
    var relationStatusButtonArr : [UIButton] = []
    var lookingForArr = [String]()
    var lookButtonArr : [UIButton] = []
    var kidsArr = [String]()
    var kidsButtonArr : [UIButton] = []
    var kidsStatusArr : [UIButton] = []
    var politicsArr = [String]()
    var politicButtonArr : [UIButton] = []
    var exerciseArr = [String]()
    var exerciseButtonArr : [UIButton] = []
    var relegionArr : [String]?
    var StarArr : [String]?
    var SexArr: [String]?
    var selectedSexArr = NSMutableArray()
    var height_picker = UIPickerView()
    var feetArray = ["0","1","2","3","4","5","6","7","8","9"]
    var inchesArray = ["0","1","2","3","4","5","6","7","8","9","10","11"]
    var selectedheight = "0"
    var selectedInches = "0"
    
    var moreinfoDelegae  : MoreinfoVCDelegate?
    var tempRelegion  = ""
    var tempStarSign = ""
    var tempAdderss = ""
    var tempHeight = ""
    var tempEducation = ""
    var tempexercise = ""
    var tempPolitics = ""
    var tempKids = ""
    var tempLookingfor = ""
    var tempPets = ""
    var tempSmoke = ""
    var tempDrinking = ""
    var tempRelationship = ""
    var tempkidsStatus = ""
    var tempsexualOrientation = [String]()
    var showTempData = false
    var pickedReligion = ""
    var pickedStarsign = ""
    
    var selectCountryPop                                                = Popover()
    let countryPickerLib                                                = MRCountryPicker.init()
    var originalcountriesCodes                                          = [Country]()
    var showingcountriesCodes                                           = [Country]()
    var selectedCountryCodes                                            = [Country]()
    var prevCountryCodes                                                = [Country]()
    var profilecompletePercentage                                       = 0.0
    var profileURL : [Image]                                            = []
    var jobTitle                                                      =  ""
    var educationTitle                                                =  ""
    var aboutData                                                     =  ""
    
    var educationlevelDulicateHt = CGFloat.zero
    var drinkingDuplicateHt = CGFloat.zero
    var smokesDuplicateHt = CGFloat.zero
    var petsDuplicateHt = CGFloat.zero
    var lookingforDuplicateHt = CGFloat.zero
    var relationshipStatusDuplicateHt = CGFloat.zero
    var kidsDuplicateHt = CGFloat.zero
    
    var kidsStatusDuplicateHt = CGFloat.zero
    
    var politicsDuplicateHt = CGFloat.zero
    var exerciseDuplicateHt = CGFloat.zero
    var nopercentagePopUP                                                = Popover()
    var noprofilepercentagePopUPVw : LocationServicesPopUpView? = nil
    var freefilters = 0
    var paidfilters = 0
    
    var usedFilters = 0
    var totalfilters = 0
    var alreadyhaveFilters  : Int?
    var selectedFilters = JSON()
    var pendingfilters = 0
    var minimumHeight : Int?
    var maximumHeight : Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        relegionArr = []
        StarArr = []
        SexArr = []
        
        print("Ref count \(String(describing: [self .classForCoder])) : \(CFGetRetainCount(self))")
        loadingDefaultUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getSettings()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        heightsliderVw.frame.size.width = self.view.frame.width - 40;
        
    }
    deinit {
        print("dinit: called \(String(describing: [self .classForCoder]))")
    }
    func loadingDefaultUI()
    {
        selectCountryPop.animationOut = 0
        selectCountryPop.animationIn = 0
        nopercentagePopUP.animationOut = 0
        nopercentagePopUP.animationIn = 0
        scrollerVw.alpha = 0
        sliderRangeLabel.text = "4 to 6"
        heightsliderVw.lowerValue = 4
        heightsliderVw.upperValue = 6
        heightsliderVw.minimumValue = 0
        heightsliderVw.maximumValue = 11
        
//        relegionArr = ["Hindu","Muslim","Sikh","Christian","Jain","Buddhist","Jewish","Atheist","Agnostic","Spiritual"]
//        StarArr = ["Aries", "Taurus","Gemini", "Cancer","Leo","Virgo","Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
//        SexArr = ["Straight","Gay","Lesbian","Bisexual","Asexual","Demisexual","Pansexual","Queer","Bicurious","Aromantic"]
        
//        relegionArr = wg_relegionArr
//        StarArr = wg_StarArr
//        SexArr = wg_SexArr
        
        
        var editprofileArray = getJSONOptionals(Constant.EDIT_PROFILE_DATA_ARRAY)
        if   editprofileArray == nil
        {
            globalAPIClass.shared.getEditProfileData { (issucess) in
                
                editprofileArray = getJSONOptionals(Constant.EDIT_PROFILE_DATA_ARRAY)
                if editprofileArray != nil
                {
                    
                    self.educationArr = editprofileArray!["EducationLevel"].arrayObject as! [String]
                    self.drinkArr  = editprofileArray!["Drinking"].arrayObject as! [String]
                    self.smokeArr = editprofileArray!["Smoking"].arrayObject as! [String]
                    self.petsArr = editprofileArray!["Pets"].arrayObject as! [String]
                    self.lookingForArr = editprofileArray!["Looking for"].arrayObject as! [String]
                    self.kidsArr = editprofileArray!["Kids"].arrayObject as! [String]
                    self.politicsArr = editprofileArray!["Politics"].arrayObject as! [String]
                    self.exerciseArr = editprofileArray!["Exercise"].arrayObject as! [String]
                    self.relationshipArray = editprofileArray!["Relationship status"].arrayObject as! [String]
                    self.kidsstatusArr = editprofileArray!["Kid's Status"].arrayObject as! [String]
                    //self.EthnicityArray = editprofileArray!["Ethnicity"].arrayObject as! [String]
                    
                    self.relegionArr = editprofileArray!["religion"].arrayObject as? [String]
                    self.StarArr = editprofileArray!["zodiacSign"].arrayObject as? [String]
                    self.SexArr = editprofileArray!["sexualOrientation"].arrayObject as? [String]
                    
                    self.setupTheView()
                    
                    
                }
                
            }
        }
        else
        {
            
            educationArr = editprofileArray!["EducationLevel"].arrayObject as! [String]
            drinkArr  = editprofileArray!["Drinking"].arrayObject as! [String]
            smokeArr = editprofileArray!["Smoking"].arrayObject as! [String]
            petsArr = editprofileArray!["Pets"].arrayObject as! [String]
            lookingForArr = editprofileArray!["Looking for"].arrayObject as! [String]
            kidsArr = editprofileArray!["Kids"].arrayObject as! [String]
            politicsArr = editprofileArray!["Politics"].arrayObject as! [String]
            exerciseArr = editprofileArray!["Exercise"].arrayObject as! [String]
            relationshipArray = editprofileArray!["Relationship status"].arrayObject as! [String]
            kidsstatusArr = editprofileArray!["Kid's Status"].arrayObject as! [String]
            
            self.relegionArr = editprofileArray!["religion"].arrayObject as? [String]
            self.StarArr = editprofileArray!["zodiacSign"].arrayObject as? [String]
            self.SexArr = editprofileArray!["sexualOrientation"].arrayObject as? [String]
            
            setupTheView()
            
        }
        
        
        
        
        setCornerRadiusToViews(roundedBtns, cornerRadius: 15.0)
        setCornerRadiusToViews(roundedcornerviews, cornerRadius: 15.0)
        
        setBorderwithcoloer(roundedBtns, borderwidth: 1.0, bordercolor: .white)
        
        
        getSettings()
        
        
    }
    
    @IBAction func heightsliderValueChanged(_ sender: RangeSlider) {
        
        
        minimumHeight = Int(sender.lowerValue)
        maximumHeight = Int(sender.upperValue)
        
        
    }
    
    
    func setupTheView()
    {
        
        //educationArr = ["High School","Undergraduate","Postgraduation","Doctorate","Trade School","No Education"]
        var X: Int = 0
        var Y: Int = 0
        let width = self.view.frame.width - 40
        for j in 0..<educationArr.count
        {
            let i = educationArr[j]
            let btn = UIButton()
            btn.setTitle(i, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: fontOfBtns)
            btn.setTitleColor(.black, for: .normal)
            btn.frame = CGRect(x: X, y: Y, width: Int(btn.intrinsicContentSize.width+20), height: 30)
            if (j ==  educationArr.count - 1 )
            {
                educationlevelHt.constant = CGFloat(Y + 40)
            }
            if btn.frame.origin.x + btn.frame.size.width + 20 > width{
                X = 0
                Y = Y + 40
                btn.frame = CGRect(x: X, y: Y, width: Int(btn.intrinsicContentSize.width+20), height: 30)
                if (j ==  educationArr.count - 1 )
                {
                    educationlevelHt.constant = CGFloat(Y + 40)
                }
            }
            btn.layer.cornerRadius = 15
            btn.layer.borderWidth = 1.0
            btn.layer.borderColor = UIColor.white.cgColor
            btn.backgroundColor = .clear
            btn.setTitleColor(.white, for: .normal)
            
            if showTempData
            {
                
                if tempEducation == i{
                    btn.setTitleColor(.systemPink, for: .normal)
                    btn.backgroundColor = .white
                    btn.layer.borderColor = appPinkColor.cgColor
                    btn.tag = 1
                    self.educationLevel = btn.titleLabel?.text ?? ""
                }
                
            }
            else
            {
                if  selectedFilters[Constant().signUPConst.EDUCATION_LEVEL].arrayValue.count > 0{
                    
                    if selectedFilters[Constant().signUPConst.EDUCATION_LEVEL].arrayValue[0].stringValue == i
                    {
                        btn.setTitleColor(.systemPink, for: .normal)
                        btn.backgroundColor = .white
                        btn.layer.borderColor = appPinkColor.cgColor
                        btn.tag = 1
                        self.educationLevel = btn.titleLabel?.text ?? ""
                    }
                    
                    
                }
            }
            
            
            btn.addTarget(self, action: #selector(cmdEducation(_:)), for: .touchUpInside)
            self.educationVW.addSubview(btn)
            X = X + Int(btn.frame.size.width) + 10
            
            
            if X > Int(width){
                Y = Y + 40
                X = 0
                
            }
            eduButtonArr.append(btn)
        }
        educationlevelDulicateHt = self.educationlevelHt.constant
        educationlevelHt.constant = 0
        educationVW.alpha = 0
        if selectedFilters[Constant().signUPConst.EDUCATION_LEVEL].arrayValue.count > 0{
            educationlevelHt.constant =  educationlevelDulicateHt
            educationVW.alpha = 1
            usedFilters = usedFilters + 1
            educationplusImg.image = UIImage.init(named: "minus")
            educationLevelBtn.tag = 1
            print("test data as \(Constant().signUPConst.EDUCATION_LEVEL)")
            educationLevelSwitch.setOn(true, animated: false)
        }
        
        
        
        
        
        //drinkArr = ["Socially","Frequently","Never"]
        var X1: Int = 0
        var Y1: Int = 0
        let width1 = self.view.frame.width - 40
        for j in 0..<drinkArr.count{
            
            let i = drinkArr[j]
            let btn = UIButton()
            btn.setTitle(i, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: fontOfBtns)
            btn.setTitleColor(.black, for: .normal)
            btn.frame = CGRect(x: X1, y: Y1, width: Int(btn.intrinsicContentSize.width+20), height: 30)
            if (j ==  drinkArr.count - 1 )
            {
                drinkingvwHt.constant = CGFloat(Y1 + 40)
            }
            if btn.frame.origin.x + btn.frame.size.width + 20 > width1{
                X1 = 0
                Y1 = Y1 + 40
                btn.frame = CGRect(x: X1, y: Y1, width: Int(btn.intrinsicContentSize.width+20), height: 30)
                if (j ==  drinkArr.count - 1 )
                {
                    drinkingvwHt.constant = CGFloat(Y1 + 40)
                }
            }
            btn.layer.cornerRadius = 15
            btn.layer.borderWidth = 1.0
            btn.layer.borderColor = UIColor.white.cgColor
            btn.backgroundColor = .clear
            btn.setTitleColor(.white, for: .normal)
            
            if showTempData
            {
                
                if tempDrinking == i{
                    btn.setTitleColor(.systemPink, for: .normal)
                    btn.layer.borderColor = appPinkColor.cgColor
                    btn.backgroundColor = .white
                    btn.tag = 1
                    self.drinking = btn.titleLabel?.text ?? ""
                }
                
            }
            else
            {
                if  selectedFilters[Constant().signUPConst.DRINKING].arrayValue.count > 0{
                    
                    if selectedFilters[Constant().signUPConst.DRINKING].arrayValue[0].stringValue == i
                    {
                        btn.setTitleColor(.systemPink, for: .normal)
                        btn.layer.borderColor = appPinkColor.cgColor
                        btn.backgroundColor = .white
                        btn.tag = 1
                        self.drinking = btn.titleLabel?.text ?? ""
                    }
                    
                    
                }
            }
            
            btn.addTarget(self, action: #selector(cmdDrink(_:)), for: .touchUpInside)
            self.drinkingVw.addSubview(btn)
            X1 = X1 + Int(btn.frame.size.width) + 10
            
            
            if X1 > Int(width1){
                Y1 = Y1 + 40
                X1 = 0
                
            }
            drinkButtonArr.append(btn)
        }
        self.drinkingDuplicateHt = drinkingvwHt.constant
        self.drinkingVw.alpha = 0
        self.drinkingvwHt.constant = 0
        if selectedFilters[Constant().signUPConst.DRINKING].arrayValue.count > 0{
            self.drinkingVw.alpha = 1
            self.drinkingvwHt.constant = drinkingDuplicateHt
            usedFilters = usedFilters + 1
            
            drinkingplusImg.image = UIImage.init(named: "minus")
            drinkingBtn.tag = 1
            drinkingSwitch.setOn(true, animated: false)
        }
        
        
        
        
        
        
        
        
        
        
        //smokeArr = ["Socially","Regularly","Never"]
        var X2: Int = 0
        var Y2: Int = 0
        let width2 = self.view.frame.width - 40
        for j in 0..<smokeArr.count{
            let i = smokeArr[j]
            let btn = UIButton()
            btn.setTitle(i, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: fontOfBtns)
            btn.setTitleColor(.black, for: .normal)
            
            btn.frame = CGRect(x: X2, y: Y2, width: Int(btn.intrinsicContentSize.width+20), height: 30)
            if (j ==  smokeArr.count - 1 )
            {
                smokesvwHt.constant = CGFloat(Y2 + 40)
            }
            
            if btn.frame.origin.x + btn.frame.size.width > width2{
                X2 = 0
                Y2 = Y2 + 40
                btn.frame = CGRect(x: X2, y: Y2, width: Int(btn.intrinsicContentSize.width+20), height: 30)
                if (j ==  smokeArr.count - 1 )
                {
                    smokesvwHt.constant = CGFloat(Y2 + 40)
                }
                
            }
            btn.backgroundColor = .clear
            btn.layer.cornerRadius = 15
            btn.layer.borderWidth = 1.0
            btn.layer.borderColor = UIColor.white.cgColor
            btn.setTitleColor(.white, for: .normal)
            
            if showTempData
            {
                if tempSmoke == i{
                    btn.setTitleColor(.systemPink, for: .normal)
                    btn.layer.borderColor = appPinkColor.cgColor
                    btn.backgroundColor = .white
                    btn.tag = 1
                    self.smoking = btn.titleLabel?.text ?? ""
                }
                
            }
            else
            {
                if  selectedFilters[Constant().signUPConst.SMOKING].arrayValue.count > 0{
                    if selectedFilters[Constant().signUPConst.SMOKING].arrayValue[0].stringValue == i
                    {
                        btn.setTitleColor(.systemPink, for: .normal)
                        btn.layer.borderColor = appPinkColor.cgColor
                        btn.backgroundColor = .white
                        btn.tag = 1
                        self.smoking = btn.titleLabel?.text ?? ""
                    }
                    
                }
                
            }
            
            
            btn.addTarget(self, action: #selector(cmdSmoke(_:)), for: .touchUpInside)
            self.smokesVw .addSubview(btn)
            X2 = X2 + Int(btn.frame.size.width) + 10
            
            
            if X2 > Int(width2){
                Y2 = Y2 + 40
                X2 = 0
                
            }
            smokeButtonArr.append(btn)
        }
        
        self.smokesDuplicateHt = self.smokesvwHt.constant
        self.smokesvwHt.constant = 0
        self.smokesVw.alpha = 0
        if  selectedFilters[Constant().signUPConst.SMOKING].arrayValue.count > 0{
            self.smokesvwHt.constant = smokesDuplicateHt
            self.smokesVw.alpha = 1
            usedFilters = usedFilters + 1
            smokesImg.image = UIImage.init(named: "minus")
            smokingBtn.tag = 1
            smokingSwitch.setOn(true, animated: false)
        }
        
   
        var X3: Int = 0
        var Y3: Int = 0
        let width3 = self.view.frame.width - 40
        for j in 0..<petsArr.count{
            let i = petsArr[j]
            let btn = UIButton()
            btn.setTitle(i, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: fontOfBtns)
            btn.setTitleColor(.black, for: .normal)
            
            btn.frame = CGRect(x: X3, y: Y3, width: Int(btn.intrinsicContentSize.width+20), height: 30)
            if (j ==  petsArr.count - 1 )
            {
                petsvwHt.constant = CGFloat(Y3 + 40)
            }
            
            if btn.frame.origin.x + btn.frame.size.width > width3{
                X3 = 0
                Y3 = Y3 + 40
                btn.frame = CGRect(x: X3, y: Y3, width: Int(btn.intrinsicContentSize.width+20), height: 30)
                if (j ==  petsArr.count - 1 )
                {
                    petsvwHt.constant = CGFloat(Y3 + 40)
                }
                
            }
            btn.backgroundColor = .clear
            btn.layer.cornerRadius = 15
            btn.layer.borderWidth = 1.0
            btn.layer.borderColor = UIColor.white.cgColor
            btn.setTitleColor(.white, for: .normal)
            
            
            
            
            
            if showTempData
            {
                if tempPets == i{
                    btn.setTitleColor(.systemPink, for: .normal)
                    btn.layer.borderColor = appPinkColor.cgColor
                    btn.tag = 1
                    btn.backgroundColor = .white
                    self.pets = btn.titleLabel?.text ?? ""
                }
                
            }
            else
            {
                
                
                if  selectedFilters[Constant().signUPConst.PETS].arrayValue.count > 0{
                    
                    if selectedFilters[Constant().signUPConst.PETS].arrayValue[0].stringValue == i
                    {
                        btn.setTitleColor(.systemPink, for: .normal)
                        btn.layer.borderColor = appPinkColor.cgColor
                        btn.tag = 1
                        btn.backgroundColor = .white
                        self.pets = btn.titleLabel?.text ?? ""
                    }
                    
                }
            }
            
            btn.addTarget(self, action: #selector(cmdPets(_:)), for: .touchUpInside)
            self.petsVw.addSubview(btn)
            X3 = X3 + Int(btn.frame.size.width) + 10
            
            if X3 > Int(width3){
                Y3 = Y3 + 40
                X3 = 0
                
            }
            
            
            petsButtonArr.append(btn)
        }
        
        self.petsDuplicateHt = self.petsvwHt.constant
        self.petsvwHt.constant = 0
        self.petsVw.alpha = 0
        if  selectedFilters[Constant().signUPConst.PETS].arrayValue.count > 0{
            self.petsvwHt.constant = self.petsDuplicateHt
            self.petsVw.alpha = 1
            usedFilters = usedFilters + 1
            petsPlusImg.image = UIImage.init(named: "minus")
            petsBtn.tag = 1
            petsSwitch.setOn(true, animated: false)
        }
        
        
        
        
        //lookingForArr = ["Relationship","Something Casual","See how it goes","Don't know yet","Marriage"]
        var X4: Int = 0
        var Y4: Int = 0
        let width4 = self.view.frame.width - 40
        
        for j in 0..<lookingForArr.count{
            let i = lookingForArr[j]
            let btn = UIButton()
            btn.setTitle(i, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: fontOfBtns)
            btn.setTitleColor(.black, for: .normal)
            
            btn.frame = CGRect(x: X4, y: Y4, width: Int(btn.intrinsicContentSize.width+20), height: 30)
            if (j ==  lookingForArr.count - 1 )
            {
                lookingforVwHt.constant = CGFloat(Y4 + 40)
            }
            if btn.frame.origin.x + btn.frame.size.width > width4{
                X4 = 0
                Y4 = Y4 + 40
                btn.frame = CGRect(x: X4, y: Y4, width: Int(btn.intrinsicContentSize.width+20), height: 30)
                if (j ==  lookingForArr.count - 1 )
                {
                    lookingforVwHt.constant = CGFloat(Y4 + 40)
                }
            }
            btn.backgroundColor = .clear
            btn.layer.cornerRadius = 15
            btn.layer.borderWidth = 1.0
            btn.layer.borderColor = UIColor.white.cgColor
            btn.setTitleColor(.white, for: .normal)
            
            
            
            
            if showTempData
            {
                if tempLookingfor == i{
                    btn.setTitleColor(.systemPink, for: .normal)
                    btn.layer.borderColor = appPinkColor.cgColor
                    btn.tag = 1
                    btn.backgroundColor = .white
                    self.lookingFor = btn.titleLabel?.text ?? ""
                }
                
            }
            else
            {
                
                
                if  selectedFilters[Constant().signUPConst.LOOKING_FOR].arrayValue.count > 0{
                    
                    if selectedFilters[Constant().signUPConst.LOOKING_FOR].arrayValue[0].stringValue == i
                    {
                        btn.setTitleColor(.systemPink, for: .normal)
                        btn.layer.borderColor = appPinkColor.cgColor
                        btn.tag = 1
                        btn.backgroundColor = .white
                        self.lookingFor = btn.titleLabel?.text ?? ""
                    }
                }
            }
            
            btn.addTarget(self, action: #selector(cmdLookFor(_:)), for: .touchUpInside)
            self.lookingforVw.addSubview(btn)
            X4 = X4 + Int(btn.frame.size.width) + 10
            
            if X4 > Int(width4){
                Y4 = Y4 + 40
                X4 = 0
                
            }
            
            lookButtonArr.append(btn)
        }
        
        
        self.lookingforDuplicateHt = self.lookingforVwHt.constant
        self.lookingforVwHt.constant = 0
        self.lookingforVw.alpha = 0
        if  selectedFilters[Constant().signUPConst.LOOKING_FOR].arrayValue.count > 0{
            self.lookingforVwHt.constant = lookingforDuplicateHt
            self.lookingforVw.alpha = 1
            usedFilters = usedFilters + 1
            lookingforImg.image = UIImage.init(named: "minus")
            lookingForBtn.tag = 1
            
            lookingforSwitch.setOn(true, animated: false)
        }
        
        
        
        
        //Relationshipstatus = ["Relationship","Something Casual","See how it goes","Don't know yet","Marriage"]
        //RELATION_STATUS  UD_RELATIONSHIP_STATUS
        var X9: Int = 0
        var Y9: Int = 0
        let width9 = self.view.frame.width - 40
        
        for j in 0..<relationshipArray.count{
            let i = relationshipArray[j]
            let btn = UIButton()
            btn.setTitle(i, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: fontOfBtns)
            btn.setTitleColor(.black, for: .normal)
            
            btn.frame = CGRect(x: X9, y: Y9, width: Int(btn.intrinsicContentSize.width+20), height: 30)
            if (j ==  relationshipArray.count - 1 )
            {
                relationshipStatusHt .constant = CGFloat(Y9 + 40)
            }
            if btn.frame.origin.x + btn.frame.size.width > width4{
                X9 = 0
                Y9 = Y9 + 40
                btn.frame = CGRect(x: X9, y: Y9, width: Int(btn.intrinsicContentSize.width+20), height: 30)
                if (j ==  lookingForArr.count - 1 )
                {
                    relationshipStatusHt.constant = CGFloat(Y9 + 40)
                }
            }
            btn.backgroundColor = .clear
            btn.layer.cornerRadius = 15
            btn.layer.borderWidth = 1.0
            btn.layer.borderColor = UIColor.white.cgColor
            btn.setTitleColor(.white, for: .normal)
            
            if showTempData
            {
                if tempRelationship == i{
                    btn.setTitleColor(.systemPink, for: .normal)
                    btn.layer.borderColor = appPinkColor.cgColor
                    btn.tag = 1
                    btn.backgroundColor = .white
                    self.relationshipStatStr = btn.titleLabel?.text ?? ""
                }
                
            }
            else
            {
                
                if  selectedFilters[Constant().signUPConst.RELATIONSHIP_STATUS].arrayValue.count > 0{
                    if selectedFilters[Constant().signUPConst.RELATIONSHIP_STATUS].arrayValue[0].stringValue == i
                    {
                        btn.setTitleColor(.systemPink, for: .normal)
                        btn.layer.borderColor = appPinkColor.cgColor
                        btn.tag = 1
                        btn.backgroundColor = .white
                        self.relationshipStatStr = btn.titleLabel?.text ?? ""
                    }
                }
            }
            
            btn.addTarget(self, action: #selector(cmdRelationshipStatusFor(_:)), for: .touchUpInside)
            self.relationshipStatusVw.addSubview(btn)
            X9 = X9 + Int(btn.frame.size.width) + 10
            
            if X9 > Int(width9){
                Y9 = Y9 + 40
                X9 = 0
                
            }
            
            relationStatusButtonArr.append(btn)
        }
        self.relationshipStatusDuplicateHt = self.relationshipStatusHt.constant
        self.relationshipStatusVw.alpha = 0
        self.relationshipStatusHt.constant = 0
        if  selectedFilters[Constant().signUPConst.RELATIONSHIP_STATUS].arrayValue.count > 0{
            self.relationshipStatusVw.alpha = 1
            self.relationshipStatusHt.constant = relationshipStatusDuplicateHt
            usedFilters = usedFilters + 1
            relationshipStatusPlusImg.image = UIImage.init(named: "minus")
            relationShipStatausBtn.tag = 1
            relationshipStatusSwitch.setOn(true, animated: false)
        }
        
        
        
        
        
        
        //kidsArr = ["Want Someday","Don't Want","Have and want more","Have and don't want more"]
        var X5: Int = 0
        var Y5: Int = 0
        let width5 = self.view.frame.width - 40
        for j in 0..<kidsArr.count{
            let i = kidsArr[j]
            let btn = UIButton()
            btn.setTitle(i, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: fontOfBtns)
            btn.setTitleColor(.black, for: .normal)
            
            btn.frame = CGRect(x: X5, y: Y5, width: Int(btn.intrinsicContentSize.width+20), height: 30)
            if (j ==  kidsArr.count - 1 )
            {
                kidsHt.constant = CGFloat(Y5 + 40)
            }
            if btn.frame.origin.x + btn.frame.size.width > width5{
                X5 = 0
                Y5 = Y5 + 40
                btn.frame = CGRect(x: X5, y: Y5, width: Int(btn.intrinsicContentSize.width+20), height: 30)
                if (j ==  kidsArr.count - 1 )
                {
                    kidsHt.constant = CGFloat(Y5 + 40)
                }
            }
            btn.backgroundColor = .clear
            btn.layer.cornerRadius = 15
            btn.layer.borderWidth = 1.0
            btn.layer.borderColor = UIColor.white.cgColor
            btn.setTitleColor(.white, for: .normal)
            
            
            if showTempData
            {
                if tempKids == i{
                    btn.setTitleColor(.systemPink, for: .normal)
                    btn.layer.borderColor = appPinkColor.cgColor
                    btn.backgroundColor = .white
                    btn.tag = 1
                    self.kids = btn.titleLabel?.text ?? ""
                }
            }
            else
            {
                if    selectedFilters[Constant().signUPConst.KIDS].arrayValue.count > 0{
                    
                    if selectedFilters[Constant().signUPConst.KIDS].arrayValue[0].stringValue == i
                    {
                        btn.setTitleColor(.systemPink, for: .normal)
                        btn.layer.borderColor = appPinkColor.cgColor
                        btn.backgroundColor = .white
                        btn.tag = 1
                        self.kids = btn.titleLabel?.text ?? ""
                    }
                    
                }
                
            }
            
            btn.addTarget(self, action: #selector(cmdKids(_:)), for: .touchUpInside)
            self.kidsVw.addSubview(btn)
            X5 = X5 + Int(btn.frame.size.width) + 10
            if X5 > Int(width5){
                Y5 = Y5 + 40
                X5 = 0
                
            }
            
            
            kidsButtonArr.append(btn)
        }
        
        kidsDuplicateHt = self.kidsHt.constant
        
        self.kidsVw.alpha = 0
        self.kidsHt.constant = 0
        if  selectedFilters[Constant().signUPConst.KIDS].arrayValue.count > 0{
            
            self.kidsVw.alpha = 1
            self.kidsHt.constant = kidsDuplicateHt
            usedFilters = usedFilters + 1
            kidsPlusImg.image = UIImage.init(named: "minus")
            kidsBtn.tag = 1
            kidsSwitch.setOn(true, animated: false)
        }
        
        
        
        
        
        //kidsStatus = ["Want Someday","Don't Want","Have and want more","Have and don't want more"] UD_KIDSSTATUS
        var X8: Int = 0
        var Y8: Int = 0
        let width8 = self.view.frame.width - 40
        for j in 0..<kidsstatusArr.count{
            let i = kidsstatusArr[j]
            let btn = UIButton()
            btn.setTitle(i, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: fontOfBtns)
            btn.setTitleColor(.black, for: .normal)
            
            btn.frame = CGRect(x: X8, y: Y8, width: Int(btn.intrinsicContentSize.width+20), height: 30)
            if (j ==  kidsstatusArr.count - 1 )
            {
                kidsStatusVwHt.constant = CGFloat(Y8 + 40)
            }
            if btn.frame.origin.x + btn.frame.size.width > width8{
                X8 = 0
                Y8 = Y8 + 40
                btn.frame = CGRect(x: X8, y: Y8, width: Int(btn.intrinsicContentSize.width+20), height: 30)
                if (j ==  kidsstatusArr.count - 1 )
                {
                    kidsStatusVwHt.constant = CGFloat(Y8 + 40)
                }
            }
            btn.backgroundColor = .clear
            btn.layer.cornerRadius = 15
            btn.layer.borderWidth = 1.0
            btn.layer.borderColor = UIColor.white.cgColor
            btn.setTitleColor(.white, for: .normal)
            
            
            if showTempData
            {
                if tempkidsStatus == i{
                    btn.setTitleColor(.systemPink, for: .normal)
                    btn.layer.borderColor = appPinkColor.cgColor
                    btn.backgroundColor = .white
                    btn.tag = 1
                    self.kidsStatusStr = btn.titleLabel?.text ?? ""
                }
            }
            else
            {
                if  selectedFilters[Constant().signUPConst.KIDS_STATUS].arrayValue.count > 0{
                    if selectedFilters[Constant().signUPConst.KIDS_STATUS].arrayValue[0].stringValue == i
                    {
                        btn.setTitleColor(.systemPink, for: .normal)
                        btn.layer.borderColor = appPinkColor.cgColor
                        btn.backgroundColor = .white
                        btn.tag = 1
                        self.kidsStatusStr = btn.titleLabel?.text ?? ""
                    }
                }
                
            }
            
            btn.addTarget(self, action: #selector(cmdKidsStatusFor(_:)), for: .touchUpInside)
            self.kidsStatusVw.addSubview(btn)
            X8 = X8 + Int(btn.frame.size.width) + 10
            if X8 > Int(width8){
                Y8 = Y8 + 40
                X8 = 0
                
            }
            
            
            kidsStatusArr.append(btn)
        }
        
        kidsStatusDuplicateHt = kidsStatusVwHt.constant
        self.kidsStatusVw.alpha = 0
        self.kidsStatusVwHt.constant = 0
        if  selectedFilters[Constant().signUPConst.KIDS_STATUS].arrayValue.count > 0{
            
            self.kidsStatusVw.alpha = 1
            self.kidsStatusVwHt.constant = kidsStatusDuplicateHt
            usedFilters = usedFilters + 1
            kidsStatusplusImg.image = UIImage.init(named: "minus")
            kidsStatusBtn.tag = 1
            kidsStatusSwitch.setOn(true, animated: false)
        }
        
        
        
        
        
        
        
        
        
        
        
        //politicsArr = ["Apolitical","Moderate","Liberal","Conservative"]
        var X6: Int = 0
        var Y6: Int = 0
        let width6 = self.view.frame.width - 40
        for j in 0..<politicsArr.count{
            let i = politicsArr[j]
            let btn = UIButton()
            btn.setTitle(i, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: fontOfBtns)
            btn.setTitleColor(.black, for: .normal)
            
            btn.frame = CGRect(x: X6, y: Y6, width: Int(btn.intrinsicContentSize.width+20), height: 30)
            if (j ==  politicsArr.count - 1 )
            {
                politicsHt.constant = CGFloat(Y6 + 40)
            }
            if btn.frame.origin.x + btn.frame.size.width > width6{
                X6 = 0
                Y6 = Y6 + 40
                btn.frame = CGRect(x: X6, y: Y6, width: Int(btn.intrinsicContentSize.width+20), height: 30)
                if (j ==  politicsArr.count - 1 )
                {
                    politicsHt.constant = CGFloat(Y6 + 40)
                }
            }
            btn.backgroundColor = .clear
            btn.layer.cornerRadius = 15
            btn.layer.borderWidth = 1.0
            btn.layer.borderColor = UIColor.white.cgColor
            btn.setTitleColor(.white, for: .normal)
            
            if showTempData
            {
                if tempPolitics == i{
                    btn.setTitleColor(.systemPink, for: .normal)
                    btn.layer.borderColor = appPinkColor.cgColor
                    btn.backgroundColor = .white
                    btn.tag = 1
                    self.politics = btn.titleLabel?.text ?? ""
                }
            }
            else
            {
                
                if  selectedFilters[Constant().signUPConst.POLITICS].arrayValue.count > 0{
                    
                    if selectedFilters[Constant().signUPConst.POLITICS].arrayValue[0].stringValue == i
                    {
                        btn.setTitleColor(.systemPink, for: .normal)
                        btn.layer.borderColor = appPinkColor.cgColor
                        btn.backgroundColor = .white
                        btn.tag = 1
                        self.politics = btn.titleLabel?.text ?? ""
                    }
                    
                }
                
            }
            
            btn.addTarget(self, action: #selector(cmdPolitics(_:)), for: .touchUpInside)
            self.politicsVw.addSubview(btn)
            X6 = X6 + Int(btn.frame.size.width) + 10
            
            if X6 > Int(width6){
                Y6 = Y6 + 40
                X6 = 0
                
            }
            
            
            
            politicButtonArr.append(btn)
        }
        
        
        
        self.politicsDuplicateHt = politicsHt.constant
        self.politicsVw.alpha = 0
        self.politicsHt.constant = 0
        if  selectedFilters[Constant().signUPConst.POLITICS].arrayValue.count > 0{
            
            self.politicsVw.alpha = 1
            self.politicsHt.constant =  self.politicsDuplicateHt
            usedFilters = usedFilters + 1
            
            politicsPlusImg.image = UIImage.init(named: "minus")
            politicsBtn.tag = 1
            politicsSwitch.setOn(true, animated: false)
        }
        
        
        
        
        
        
        
        // exerciseArr = ["Active","Sometimes","Almost Never"]
        var X7: Int = 0
        var Y7: Int = 0
        let width7 = self.view.frame.width - 40
        for j in 0..<exerciseArr.count{
            let i = exerciseArr[j]
            let btn = UIButton()
            btn.setTitle(i, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: fontOfBtns)
            btn.setTitleColor(.black, for: .normal)
            
            btn.frame = CGRect(x: X7, y: Y7, width: Int(btn.intrinsicContentSize.width+20), height: 30)
            if (j ==  exerciseArr.count - 1 )
            {
                exerciseVwHt.constant = CGFloat(Y7 + 40)
            }
            if btn.frame.origin.x + btn.frame.size.width > width7{
                X7 = 0
                Y7 = Y7 + 40
                btn.frame = CGRect(x: X7, y: Y7, width: Int(btn.intrinsicContentSize.width+20), height: 30)
                if (j ==  exerciseArr.count - 1 )
                {
                    exerciseVwHt.constant = CGFloat(Y7 + 40 )
                }
            }
            btn.backgroundColor = .clear
            btn.layer.cornerRadius = 15
            btn.layer.borderWidth = 1.0
            btn.layer.borderColor = UIColor.white.cgColor
            btn.setTitleColor(.white, for: .normal)
            
            
            if showTempData
            {
                
                if tempexercise == i{
                    btn.setTitleColor(.systemPink, for: .normal)
                    btn.layer.borderColor = appPinkColor.cgColor
                    btn.tag = 1
                    btn.backgroundColor = .white
                    self.exercise = btn.titleLabel?.text ?? ""
                }
                
            }
            else
            {
                if  selectedFilters[Constant().signUPConst.EXERCISE].arrayValue.count > 0{
                    
                    if selectedFilters[Constant().signUPConst.EXERCISE].arrayValue[0].stringValue == i
                    {
                        btn.setTitleColor(.systemPink, for: .normal)
                        btn.layer.borderColor = appPinkColor.cgColor
                        btn.tag = 1
                        btn.backgroundColor = .white
                        self.exercise = btn.titleLabel?.text ?? ""
                    }
                    
                }
                
            }
            
            btn.addTarget(self, action: #selector(cmdExercise(_:)), for: .touchUpInside)
            self.exerciseVw.addSubview(btn)
            X7 = X7 + Int(btn.frame.size.width) + 10
            
            if X7 > Int(width7){
                Y7 = Y7 + 40
                X7 = 0
                
            }
            
            exerciseButtonArr.append(btn)
        }
        
        
        self.exerciseDuplicateHt = self.exerciseVwHt.constant
        self.exerciseVw.alpha = 0
        self.exerciseVwHt.constant = 0
        if  selectedFilters[Constant().signUPConst.EXERCISE].arrayValue.count > 0{
            self.exerciseVw.alpha = 1
            self.exerciseVwHt.constant = self.exerciseDuplicateHt
            usedFilters = usedFilters + 1
            exercisePlusImg.image = UIImage.init(named: "minus")
            exerciseBtn.tag = 1
            exerciseSwitch.setOn(true, animated: false)
        }
        
        
        
        self.heightVw.alpha = 0
        self.heightVwHt.constant = 0
        
        self.religionVw.alpha = 0
        self.religionvwht.constant = 0
        
        self.starSignVw.alpha = 0
        self.starsignViewHt.constant = 0
        
        
        self.sexualOrientationVw.alpha = 0
        self.sexualorienationVwHt.constant = 0
        
        
        
        if selectedFilters[Constant().signUPConst.HEIGHT_FILTER].arrayValue.count > 0
        {
            if selectedFilters[Constant().signUPConst.HEIGHT_FILTER].arrayValue[0].stringValue == "i"
            {
                self.heightVwHt.constant = 60
                self.heightVw.alpha = 1
            }
        }
        
        
        
        if selectedFilters[Constant().signUPConst.RELEGION].arrayValue.count > 0
        {
            let selectedReligions = selectedFilters[Constant().signUPConst.RELEGION].arrayValue
            
            for rel in selectedReligions
            {
                for btn in religionsBtns
                {
                    if btn.titleLabel?.text! == rel.stringValue
                    {
                        btn.tag = 1
                        btn.backgroundColor = .white
                        btn.setTitleColor(.systemPink, for: .normal)
                        
                    }
                }
                
            }
            self.religionvwht.constant = 160
            self.religionVw.alpha = 1
            
        }
        
        
        
        
        if selectedFilters[Constant().signUPConst.STAR_SIGN].arrayValue.count > 0
        {
            
            let selectedStarsigns = selectedFilters[Constant().signUPConst.STAR_SIGN].arrayValue
            for rel in selectedStarsigns
            {
                for btn in starsignBtns
                {
                    if btn.titleLabel?.text! == rel.stringValue
                    {
                        btn.tag = 1
                        btn.backgroundColor = .white
                        btn.setTitleColor(.systemPink, for: .normal)
                        
                    }
                }
                
            }
            self.starsignViewHt.constant = 160
            self.starSignVw.alpha = 1
            
        }
        
        
        
        if selectedFilters[Constant().signUPConst.SEXUAL_ORIENTATION].arrayValue.count > 0
        {
            
            let selectedSexualOrientation = selectedFilters[Constant().signUPConst.SEXUAL_ORIENTATION].arrayValue
            for rel in selectedSexualOrientation
            {
                for btn in sexualOrientationBtns
                {
                    if btn.titleLabel?.text! == rel.stringValue
                    {
                        btn.tag = 1
                        btn.backgroundColor = .white
                        btn.setTitleColor(.systemPink, for: .normal)
                        
                    }
                }
                
            }
            self.sexualorienationVwHt.constant = 160
            self.sexualOrientationVw.alpha = 1
            
        }
        
        
    }
    
    
    func getSettings()
    {
        
        startLoad(0, .star, .custom(color: .black))
        
        Utility.getSettings(userId :DEFAULTS.string(forKey: Constant().UD_USER_USER_ID)!,controller: self, completionHandler: { (response, error) in
            if error == nil && response != nil {
                for switche in self.filtersSwitches
                {
                    switche.setOn(false, animated: false)
                }
                self.scrollerVw.alpha = 1
                self.totalfilters =  response!["user"]["total_filters_available"].intValue
                _ = response!["user"]["total_filters_pending"].intValue
                //                  let usedFilters = response!["user"]["total_filters_used"].intValue
                
                self.selectedFilters = response!["user"]["advanced_filters"]
                print("selected filters are \(self.selectedFilters)" )
                self.setupTheView()
                var numberoffiletrsUsed = 0
                for switche in self.filtersSwitches
                {
                    if switche.isOn
                    {
                        numberoffiletrsUsed = numberoffiletrsUsed + 1
                    }
                }
                self.advancedFilterLabel.text = "Adanced Filters(\(self.totalfilters - numberoffiletrsUsed))"
                
            }
            else
            {
                self.showToast(message: "Slow network connection, Please try again")
            }
            stopLoad()
        })
        
    }
    
    
    
    //
    //    @objc func cmdExercise(_ sender: UIButton){
    //           resetBtn(arr: exerciseButtonArr)
    //           if sender.tag == 0{
    //               sender.setTitleColor(appPinkColor, for: .normal)
    //               sender.layer.borderColor = appPinkColor.cgColor
    //               sender.tag = 1
    //                sender.backgroundColor = .white
    //               self.exercise = sender.titleLabel?.text ?? ""
    //           }else{
    //               sender.setTitleColor(.white, for: .normal)
    //               sender.layer.borderColor = UIColor.white.cgColor
    //               sender.tag = 0
    //               self.exercise =  ""
    //           }
    //           self.CalculateProfilePrcentage()
    //       }
    //
    
    
    
    
    @objc func cmdEducation(_ sender: UIButton){
        resetBtn(arr: eduButtonArr)
        if sender.tag == 0{
            sender.setTitleColor(.systemPink, for: .normal)
            sender.layer.borderColor = appPinkColor.cgColor
            sender.tag = 1
            sender.backgroundColor = .white
            self.educationLevel = sender.titleLabel?.text ?? ""
        }else{
            sender.setTitleColor(.white, for: .normal)
            sender.layer.borderColor = UIColor.white.cgColor
            sender.backgroundColor = .clear
            sender.tag = 0
            self.educationLevel = ""
        }
        
    }
    
    
    
    
    
    func resetBtn(arr:[UIButton]){
        for item in arr{
            let btn = item as UIButton
            btn.setTitleColor(.white, for: .normal)
            btn.backgroundColor = .clear
            btn.layer.borderColor = UIColor.white.cgColor
            btn.tag = 0
        }
    }
    
    
    @objc func cmdDrink(_ sender: UIButton){
        resetBtn(arr: drinkButtonArr)
        if sender.tag == 0{
            sender.setTitleColor(.systemPink, for: .normal)
            sender.layer.borderColor = appPinkColor.cgColor
            sender.tag = 1
            sender.backgroundColor = .white
            self.drinking = sender.titleLabel?.text ?? ""
            print(drinking)
        }else{
            sender.setTitleColor(.white, for: .normal)
            sender.layer.borderColor = UIColor.white.cgColor
            sender.backgroundColor = .clear
            sender.tag = 0
            self.drinking = ""
        }
    }
    
    
    @objc func cmdSmoke(_ sender: UIButton){
        resetBtn(arr: smokeButtonArr)
        if sender.tag == 0{
            sender.setTitleColor(.systemPink, for: .normal)
            sender.layer.borderColor = appPinkColor.cgColor
            sender.tag = 1
            sender.backgroundColor = .white
            self.smoking = sender.titleLabel?.text ?? ""
        }else{
            sender.setTitleColor(.white, for: .normal)
            sender.tag = 0
            sender.layer.borderColor = UIColor.white.cgColor
            self.smoking =  ""
        }
    }
    @objc func cmdPets(_ sender: UIButton){
        resetBtn(arr: petsButtonArr)
        if sender.tag == 0{
            sender.setTitleColor(.systemPink, for: .normal)
            sender.layer.borderColor = appPinkColor.cgColor
            sender.backgroundColor = .white
            sender.tag = 1
            self.pets = sender.titleLabel?.text ?? ""
        }else{
            sender.setTitleColor(.white, for: .normal)
            sender.layer.borderColor = UIColor.white.cgColor
            sender.tag = 0
            self.pets = ""
        }
    }
    
    @objc func cmdLookFor(_ sender: UIButton){
        resetBtn(arr: lookButtonArr)
        if sender.tag == 0{
            sender.setTitleColor(.systemPink, for: .normal)
            sender.layer.borderColor = appPinkColor.cgColor
            sender.tag = 1
            sender.backgroundColor = .white
            self.lookingFor = sender.titleLabel?.text ?? ""
        }else{
            sender.setTitleColor(.white, for: .normal)
            sender.layer.borderColor = UIColor.white.cgColor
            self.lookingFor =  ""
        }
    }
    
    @objc func cmdRelationshipStatusFor(_ sender: UIButton){
        resetBtn(arr: relationStatusButtonArr)
        if sender.tag == 0{
            sender.setTitleColor(.systemPink, for: .normal)
            sender.layer.borderColor = appPinkColor.cgColor
            sender.tag = 1
            sender.backgroundColor = .white
            self.relationshipStatStr = sender.titleLabel?.text ?? ""
        }else{
            sender.setTitleColor(.white, for: .normal)
            sender.layer.borderColor = UIColor.white.cgColor
            self.relationshipStatStr =  ""
        }
    }
    
    @objc func cmdKidsStatusFor(_ sender: UIButton){
        resetBtn(arr: kidsStatusArr)
        if sender.tag == 0{
            sender.setTitleColor(.systemPink, for: .normal)
            sender.layer.borderColor = appPinkColor.cgColor
            sender.tag = 1
            sender.backgroundColor = .white
            self.kidsStatusStr = sender.titleLabel?.text ?? ""
        }else{
            sender.setTitleColor(.white, for: .normal)
            sender.layer.borderColor = UIColor.white.cgColor
            self.kidsStatusStr =  ""
        }
    }
    
    
    
    @objc func cmdKids(_ sender: UIButton){
        resetBtn(arr: kidsButtonArr)
        if sender.tag == 0{
            sender.setTitleColor(.systemPink, for: .normal)
            sender.layer.borderColor = appPinkColor.cgColor
            sender.backgroundColor = .white
            sender.tag = 1
            self.kids = sender.titleLabel?.text ?? ""
        }else{
            sender.setTitleColor(.white, for: .normal)
            sender.layer.borderColor = UIColor.white.cgColor
            sender.tag = 0
            self.kids = ""
        }
    }
    
    @objc func cmdPolitics(_ sender: UIButton){
        resetBtn(arr: politicButtonArr)
        if sender.tag == 0{
            sender.setTitleColor(.systemPink, for: .normal)
            sender.layer.borderColor = appPinkColor.cgColor
            sender.tag = 1
            sender.backgroundColor = .white
            self.politics = sender.titleLabel?.text ?? ""
        }else{
            sender.setTitleColor(.white, for: .normal)
            sender.layer.borderColor = UIColor.white.cgColor
            sender.tag = 0
            self.politics =  ""
        }
    }
    
    @objc func cmdExercise(_ sender: UIButton){
        resetBtn(arr: exerciseButtonArr)
        if sender.tag == 0{
            sender.setTitleColor(.systemPink, for: .normal)
            sender.layer.borderColor = appPinkColor.cgColor
            sender.tag = 1
            sender.backgroundColor = .white
            self.exercise = sender.titleLabel?.text ?? ""
        }else{
            sender.setTitleColor(.white, for: .normal)
            sender.layer.borderColor = UIColor.white.cgColor
            sender.tag = 0
            self.exercise =  ""
        }
    }
    
    
    
    
    
    
    
    
    
    @IBAction func backbtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
    
    
    
    
    @IBAction func educationLevelTapped(_ sender: UIButton) {
        if sender.tag == 0
        {
            
            //            if totalfilters - usedFilters <= 0
            //            {
            //                showPopupofcredits()
            //                return
            //            }
            //            usedFilters = usedFilters + 1
            
            
            
            educationplusImg.image = UIImage.init(named: "minus")
            
            sender.tag = 1
            view.layoutIfNeeded()
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.educationlevelHt.constant = self.educationlevelDulicateHt
                self.educationVW.alpha = 1
                self.view.layoutIfNeeded()
            })
            
        }
        else
        {
            //            usedFilters = usedFilters - 1
            //            if usedFilters < 0
            //            {
            //                usedFilters = 0
            //            }
            sender.tag = 0
            view.layoutIfNeeded()
            
            educationplusImg.image = UIImage.init(named: "plus")
            UIView.animate(withDuration: 0.5, animations: {
                self.educationlevelHt.constant = 0
                self.educationVW.alpha = 0
                self.view.layoutIfNeeded()
            })
        }
        
        
        
    }
    
    
    @IBAction func educationLevelSubBtnsTapped(_ sender: customButton) {
        
        
        /*
         
         for btn in educationalBtns
         {
         if btn != sender
         {
         btn.tag = 0
         btn.backgroundColor = .clear
         btn.setTitleColor(.white, for: .normal)
         }
         }
         
         if sender.tag == 0
         {
         sender.tag = 1
         sender.backgroundColor = .white
         sender.setTitleColor(.systemPink, for: .normal)
         
         
         }
         else
         {
         sender.tag = 0
         sender.backgroundColor = .clear
         sender.setTitleColor(.white, for: .normal)
         
         }
         
         */
        
        
        
    }
    
    
    
    
    
    @IBAction func drinkingTapped(_ sender: UIButton)
    {
        
        if sender.tag == 0
        {
            
            //            if totalfilters - usedFilters <= 0
            //            {
            //                showPopupofcredits()
            //                return
            //            }
            //            usedFilters = usedFilters + 1
            
            
            drinkingplusImg.image = UIImage.init(named: "minus")
            
            sender.tag = 1
            view.layoutIfNeeded()
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.drinkingvwHt .constant = self.drinkingDuplicateHt
                self.drinkingVw.alpha = 1
                self.view.layoutIfNeeded()
            })
            
        }
        else
        {
            //            usedFilters = usedFilters - 1
            //            if usedFilters < 0
            //            {
            //                usedFilters = 0
            //            }
            
            sender.tag = 0
            view.layoutIfNeeded()
            
            drinkingplusImg.image = UIImage.init(named: "plus")
            UIView.animate(withDuration: 0.5, animations: {
                self.drinkingvwHt.constant = 0
                self.drinkingVw.alpha = 0
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    
    
    @IBAction func sexualorientationTapped(_ sender: UIButton) {
        
        
        
        if sender.tag == 0
        {
            //            if totalfilters - usedFilters <= 0
            //            {
            //                showPopupofcredits()
            //                return
            //            }
            //            usedFilters = usedFilters + 1
            
            sexualorientationPlusImg.image = UIImage.init(named: "minus")
            
            sender.tag = 1
            view.layoutIfNeeded()
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.sexualorienationVwHt.constant = 160
                self.sexualOrientationVw.alpha = 1
                self.view.layoutIfNeeded()
            })
            
        }
        else
        {
            
            //            usedFilters = usedFilters - 1
            //            if usedFilters < 0
            //            {
            //                usedFilters = 0
            //            }
            sender.tag = 0
            view.layoutIfNeeded()
            sexualorientationPlusImg.image = UIImage.init(named: "plus")
            
            UIView.animate(withDuration: 0.5, animations: {
                self.sexualorienationVwHt.constant = 0
                self.sexualOrientationVw.alpha = 0
                self.view.layoutIfNeeded()
            })
        }
        
    }
    
    @IBAction func sexualorientationSubBtnsTapped(_ sender: customButton) {
        
        if sender.tag == 0
        {
            sender.tag = 1
            sender.backgroundColor = .white
            sender.setTitleColor(.systemPink, for: .normal)
            
            
        }
        else
        {
            sender.tag = 0
            sender.backgroundColor = .clear
            sender.setTitleColor(.white, for: .normal)
            
        }
        
        
        
        
        
        
    }
    
    
    
    @IBAction func starSignTapped(_ sender: UIButton) {
        if sender.tag == 0
        {
            
            //            if totalfilters - usedFilters <= 0
            //            {
            //                showPopupofcredits()
            //                return
            //            }
            //            usedFilters = usedFilters + 1
            
            starsignPlusImg.image = UIImage.init(named: "minus")
            
            sender.tag = 1
            view.layoutIfNeeded()
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.starsignViewHt.constant = 160
                self.starSignVw.alpha = 1
                self.view.layoutIfNeeded()
            })
            
        }
        else
        {
            
            //            usedFilters = usedFilters - 1
            //            if usedFilters < 0
            //            {
            //                usedFilters = 0
            //            }
            
            sender.tag = 0
            view.layoutIfNeeded()
            
            starsignPlusImg.image = UIImage.init(named: "plus")
            UIView.animate(withDuration: 0.5, animations: {
                self.starsignViewHt.constant = 0
                self.starSignVw.alpha = 0
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    
    @IBAction func starSignSubBtnTapped(_ sender: customButton) {
        if sender.tag == 0
        {
            sender.tag = 1
            sender.backgroundColor = .white
            sender.setTitleColor(.systemPink, for: .normal)
            
            
        }
        else
        {
            sender.tag = 0
            sender.backgroundColor = .clear
            sender.setTitleColor(.white, for: .normal)
            
        }
        
        
    }
    
    
    
    @IBAction func religionTapped(_ sender: UIButton) {
        
        if sender.tag == 0
        {
            
            //            if totalfilters - usedFilters <= 0
            //            {
            //                showPopupofcredits()
            //                return
            //            }
            //            usedFilters = usedFilters + 1
            //
            
            
            religionPlusImg.image = UIImage.init(named: "minus")
            
            sender.tag = 1
            view.layoutIfNeeded()
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.religionvwht.constant = 160
                self.religionVw.alpha = 1
                self.view.layoutIfNeeded()
            })
            
        }
        else
        {
            //            usedFilters = usedFilters - 1
            //            if usedFilters < 0
            //            {
            //                usedFilters = 0
            //            }
            religionPlusImg.image = UIImage.init(named: "plus")
            sender.tag = 0
            view.layoutIfNeeded()
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.religionvwht.constant = 0
                self.religionVw.alpha = 0
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    
    @IBAction func religionSubBtnsTapped(_ sender: customButton) {
        
        //        for btn in educationalBtns
        //        {
        //            if btn != sender
        //            {
        //                btn.tag = 0
        //                btn.backgroundColor = .clear
        //                btn.setTitleColor(.white, for: .normal)
        //            }
        //        }
        
        if sender.tag == 0
        {
            sender.tag = 1
            sender.backgroundColor = .white
            sender.setTitleColor(.systemPink, for: .normal)
            
            
        }
        else
        {
            sender.tag = 0
            sender.backgroundColor = .clear
            sender.setTitleColor(.white, for: .normal)
            
        }
        
        
        
        
        
    }
    
    @IBAction func heightTapped(_ sender: UIButton) {
        if sender.tag == 0
        {
            
            //            if totalfilters - usedFilters <= 0
            //            {
            //                showPopupofcredits()
            //                return
            //            }
            //            usedFilters = usedFilters + 1
            
            
            heightPlusImg.image = UIImage.init(named: "minus")
            
            sender.tag = 1
            view.layoutIfNeeded()
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.heightVwHt.constant = 60
                self.heightVw.alpha = 1
                self.view.layoutIfNeeded()
            })
            
        }
        else
        {
            //            usedFilters = usedFilters - 1
            //            if usedFilters < 0
            //            {
            //                usedFilters = 0
            //            }
            sender.tag = 0
            view.layoutIfNeeded()
            
            heightPlusImg.image = UIImage.init(named: "plus")
            UIView.animate(withDuration: 0.5, animations: {
                self.heightVwHt.constant = 0
                self.heightVw.alpha = 0
                self.view.layoutIfNeeded()
            })
        }
        
    }
    
    
    @IBAction func exercisweTapped(_ sender: UIButton) {
        
        if sender.tag == 0
        {
            
            //            if totalfilters - usedFilters <= 0
            //            {
            //                showPopupofcredits()
            //                return
            //            }
            //            usedFilters = usedFilters + 1
            
            
            exercisePlusImg.image = UIImage.init(named: "minus")
            
            sender.tag = 1
            view.layoutIfNeeded()
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.exerciseVwHt.constant = self.exerciseDuplicateHt
                self.exerciseVw.alpha = 1
                self.view.layoutIfNeeded()
            })
            
        }
        else
        {
            //            usedFilters = usedFilters - 1
            //            if usedFilters < 0
            //            {
            //                usedFilters = 0
            //            }
            sender.tag = 0
            view.layoutIfNeeded()
            exercisePlusImg.image = UIImage.init(named: "plus")
            
            UIView.animate(withDuration: 0.5, animations: {
                self.exerciseVwHt.constant = 0
                self.exerciseVw.alpha = 0
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    
    
    @IBAction func politicsTaped(_ sender: UIButton) {
        
        if sender.tag == 0
        {
            
            //            if totalfilters - usedFilters <= 0
            //            {
            //                showPopupofcredits()
            //                return
            //            }
            //            usedFilters = usedFilters + 1
            
            
            politicsPlusImg.image = UIImage.init(named: "minus")
            
            sender.tag = 1
            view.layoutIfNeeded()
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.politicsHt.constant = self.politicsDuplicateHt
                self.politicsVw.alpha = 1
                self.view.layoutIfNeeded()
            })
            
        }
        else
        {
            //            usedFilters = usedFilters - 1
            //            if usedFilters < 0
            //            {
            //                usedFilters = 0
            //            }
            sender.tag = 0
            view.layoutIfNeeded()
            
            politicsPlusImg.image = UIImage.init(named: "plus")
            UIView.animate(withDuration: 0.5, animations: {
                self.politicsHt.constant = 0
                self.politicsVw.alpha = 0
                self.view.layoutIfNeeded()
            })
        }
        
    }
    
    
    
    
    @IBAction func kidsStatusTapped(_ sender: UIButton) {
        if sender.tag == 0
        {
            //            if totalfilters - usedFilters <= 0
            //            {
            //                showPopupofcredits()
            //                return
            //            }
            //            usedFilters = usedFilters + 1
            
            
            
            kidsStatusplusImg.image = UIImage.init(named: "minus")
            
            sender.tag = 1
            view.layoutIfNeeded()
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.kidsStatusVwHt.constant = self.kidsStatusDuplicateHt
                self.kidsStatusVw.alpha = 1
                self.view.layoutIfNeeded()
            })
            
        }
        else
        {
            //            usedFilters = usedFilters - 1
            //            if usedFilters < 0
            //            {
            //                usedFilters = 0
            //            }
            
            sender.tag = 0
            view.layoutIfNeeded()
            
            kidsStatusplusImg.image = UIImage.init(named: "plus")
            UIView.animate(withDuration: 0.5, animations: {
                self.kidsStatusVwHt.constant = 0
                self.kidsStatusVw.alpha = 0
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    
    
    @objc func closeErrorpopup(_ sender : UIButton) {
        self.hide_noprofilepercentagePopUPVw()
        
    }
    
    func hide_noprofilepercentagePopUPVw() {
        if noprofilepercentagePopUPVw != nil {
            noprofilepercentagePopUPVw?.alpha = 0
            noprofilepercentagePopUPVw?.removeFromSuperview()
            nopercentagePopUP.dismiss()
            noprofilepercentagePopUPVw = nil
        }
    }
    
    
    @objc func gotocreditscreen(_ sender : UIButton) {
        
        self.hide_noprofilepercentagePopUPVw()
        
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: Constant.CREDIT_UPDATE_VC) as! creditUpdateVC
        vc.type = 8
        vc.headerText = "Number of filters"
        vc.creditDelegate = self
        //                                vc.creditDelegate = self
        //                                if invisiblechckBoxBtn.tag == 1
        //                                {
        //                                    vc.isautorenew = true
        //                                }
        //                                if self.userSettings != nil {
        //                                    vc.userSettings = self.userSettings
        //                                    vc.getSettingsData = self.getSettingsData
        //                                }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func showPopupofcredits() {
        if noprofilepercentagePopUPVw == nil {
            noprofilepercentagePopUPVw                                    = Bundle.main.loadNibNamed("CustomViews", owner: self, options: nil)![9] as? LocationServicesPopUpView
            self.nopercentagePopUP.popoverColor = .clear;
            self.nopercentagePopUP.arrowSize = CGSize.init(width: 0, height: 0);
            self.noprofilepercentagePopUPVw?.frame = CGRect.init(x: 0, y: 0, width:  UIScreen.main.bounds.width * 0.75, height: 200)
            self.noprofilepercentagePopUPVw?.loadingDefaultUI()
            self.noprofilepercentagePopUPVw?.messageLabel.text = "Please buy more filters"
            self.noprofilepercentagePopUPVw?.settingsButton.setTitle("Ok", for: .normal)
            self.noprofilepercentagePopUPVw?.closeBtn.addTarget(self, action: #selector(self.closeErrorpopup(_:)), for: .touchUpInside)
            self.noprofilepercentagePopUPVw?.settingsButton.addTarget(self, action: #selector(self.gotocreditscreen(_:)), for: .touchUpInside)
            self.nopercentagePopUP.show(self.noprofilepercentagePopUPVw!, point: CGPoint.init(x: self.view.center.x, y: self.view.center.y - 100 ))
        }
        
        
    }
    
    @IBAction func kidsTapped(_ sender: UIButton) {
        
        
        if sender.tag == 0
        {
            
            //            if totalfilters - usedFilters <= 0
            //            {
            //                showPopupofcredits()
            //                return
            //            }
            //            usedFilters = usedFilters + 1
            
            
            
            
            kidsPlusImg.image = UIImage.init(named: "minus")
            
            sender.tag = 1
            view.layoutIfNeeded()
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.kidsHt.constant = self.kidsDuplicateHt
                self.kidsVw.alpha = 1
                self.view.layoutIfNeeded()
            })
            
        }
        else
        {
            
            //            usedFilters = usedFilters - 1
            //            if usedFilters < 0
            //            {
            //                usedFilters = 0
            //            }
            kidsPlusImg.image = UIImage.init(named: "plus")
            sender.tag = 0
            view.layoutIfNeeded()
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.kidsHt.constant = 0
                self.kidsVw.alpha = 0
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    
    @IBAction func smokesTapped(_ sender: UIButton) {
        if sender.tag == 0
        {
            
            //            if totalfilters - usedFilters <= 0
            //            {
            //                showPopupofcredits()
            //                return
            //            }
            //            usedFilters = usedFilters + 1
            
            
            
            
            smokesImg.image = UIImage.init(named: "minus")
            
            sender.tag = 1
            view.layoutIfNeeded()
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.smokesvwHt.constant = self.kidsStatusDuplicateHt
                self.smokesVw.alpha = 1
                self.view.layoutIfNeeded()
            })
            
        }
        else
        {
            //            usedFilters = usedFilters - 1
            //            if usedFilters < 0
            //            {
            //                usedFilters = 0
            //            }
            sender.tag = 0
            view.layoutIfNeeded()
            
            smokesImg.image = UIImage.init(named: "plus")
            UIView.animate(withDuration: 0.5, animations: {
                self.smokesvwHt.constant = 0
                self.smokesVw.alpha = 0
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    @IBAction func petsTapped(_ sender: UIButton) {
        if sender.tag == 0
        {
            
            //            if totalfilters - usedFilters <= 0
            //            {
            //                showPopupofcredits()
            //                return
            //            }
            //            usedFilters = usedFilters + 1
            
            
            
            petsPlusImg.image = UIImage.init(named: "minus")
            
            sender.tag = 1
            view.layoutIfNeeded()
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.petsvwHt.constant = self.kidsStatusDuplicateHt
                self.petsVw.alpha = 1
                self.view.layoutIfNeeded()
            })
            
        }
        else
        {
            //            usedFilters = usedFilters - 1
            //            if usedFilters < 0
            //            {
            //                usedFilters = 0
            //            }
            //
            sender.tag = 0
            view.layoutIfNeeded()
            
            petsPlusImg.image = UIImage.init(named: "plus")
            UIView.animate(withDuration: 0.5, animations: {
                self.petsvwHt.constant = 0
                self.petsVw.alpha = 0
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    @IBAction func lookingForTapped(_ sender: UIButton) {
        if sender.tag == 0
        {
            
            //            if totalfilters - usedFilters <= 0
            //            {
            //                showPopupofcredits()
            //                return
            //            }
            //            usedFilters = usedFilters + 1
            
            
            
            lookingforImg.image = UIImage.init(named: "minus")
            
            sender.tag = 1
            view.layoutIfNeeded()
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.lookingforVwHt.constant = self.lookingforDuplicateHt
                self.lookingforVw.alpha = 1
                self.view.layoutIfNeeded()
            })
            
        }
        else
        {
            //            usedFilters = usedFilters - 1
            //            if usedFilters < 0
            //            {
            //                usedFilters = 0
            //            }
            sender.tag = 0
            view.layoutIfNeeded()
            
            lookingforImg.image = UIImage.init(named: "plus")
            UIView.animate(withDuration: 0.5, animations: {
                self.lookingforVwHt.constant = 0
                self.lookingforVw.alpha = 0
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    
    @IBAction func relationshipStatusTapped(_ sender: UIButton) {
        
        
        
        
        
        if sender.tag == 0
        {
            
            //            if totalfilters - usedFilters <= 0
            //            {
            //                showPopupofcredits()
            //                return
            //            }
            //            usedFilters = usedFilters + 1
            
            
            
            
            relationshipStatusPlusImg.image = UIImage.init(named: "minus")
            
            sender.tag = 1
            view.layoutIfNeeded()
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.relationshipStatusHt.constant = self.relationshipStatusDuplicateHt
                self.relationshipStatusVw .alpha = 1
                self.view.layoutIfNeeded()
            })
            
        }
        else
        {
            //            usedFilters = usedFilters - 1
            //            if usedFilters < 0
            //            {
            //                usedFilters = 0
            //            }
            sender.tag = 0
            view.layoutIfNeeded()
            
            relationshipStatusPlusImg.image = UIImage.init(named: "plus")
            UIView.animate(withDuration: 0.5, animations: {
                self.relationshipStatusHt.constant = 0
                self.relationshipStatusVw.alpha = 0
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    @IBAction func doneTapped(_ sender: UIButton) {
        
        var filtersData = Dictionary<String, Any>()
        if !educationLevel.isEmpty && educationLevelSwitch.isOn
        {
            filtersData[Constant().signUPConst.EDUCATION_LEVEL] = [educationLevel]
        }
        
        if !drinking.isEmpty && drinkingSwitch.isOn
        {
            filtersData[Constant().signUPConst.DRINKING] = [drinking]
            
        }
        
        if !smoking.isEmpty && smokingSwitch.isOn
        {
            filtersData[Constant().signUPConst.SMOKING] = [smoking]
            
        }
        
        if !pets.isEmpty && petsSwitch.isOn
        {
            filtersData[Constant().signUPConst.PETS] = [pets]
            
        }
        
        if !lookingFor.isEmpty && lookingforSwitch.isOn
        {
            filtersData[Constant().signUPConst.LOOKING_FOR] = [lookingFor]
            
        }
        
        if !relationshipStatStr.isEmpty  && relationshipStatusSwitch.isOn
        {
            filtersData[Constant().signUPConst.RELATIONSHIP_STATUS] = [relationshipStatStr]
            
        }
        
        if !kids.isEmpty  && kidsSwitch.isOn
        {
            filtersData[Constant().signUPConst.KIDS] = [kids]
            
        }
        
        if !kidsStatusStr.isEmpty  && kidsStatusSwitch.isOn
        {
            
            filtersData[Constant().signUPConst.KIDS_STATUS] = [kidsStatusStr]
        }
        
        if !politics.isEmpty  && politicsSwitch.isOn
        {
            
            filtersData[Constant().signUPConst.POLITICS] = [politics]
        }
        
        if !exercise.isEmpty && exerciseSwitch.isOn
        {
            filtersData[Constant().signUPConst.EXERCISE] = [exercise]
            
        }
        
        if  minimumHeight != nil && maximumHeight != nil  && heightSwitch.isOn
        {
            
            filtersData[Constant().signUPConst.HEIGHT_FILTER] = [minimumHeight!, maximumHeight!]
            
        }
        
        if  religionSwitch.isOn
        {
            var religionSelectedArray = [String]()
            for btn in religionsBtns
            {
                if btn.tag == 1
                {
                    religionSelectedArray.append((btn.titleLabel?.text!)!)
                }
            }
            
            if religionSelectedArray.count > 0
            {
                filtersData[Constant().signUPConst.RELEGION] = religionSelectedArray
            }
            
        }
        if   starSignSwitch.isOn
        {
            var starSignSelectedArray = [String]()
            for btn in starsignBtns
            {
                if btn.tag == 1
                {
                    starSignSelectedArray.append((btn.titleLabel?.text!)!)
                }
            }
            
            if starSignSelectedArray.count > 0
            {
                filtersData[Constant().signUPConst.STAR_SIGN] = starSignSelectedArray
            }
        }
        if sexualOrientationSwitch.isOn
        {
            var sexualOrientationSelectedArray = [String]()
            for btn in sexualOrientationBtns
            {
                if btn.tag == 1
                {
                    sexualOrientationSelectedArray.append((btn.titleLabel?.text!)!)
                }
            }
            
            if sexualOrientationSelectedArray.count > 0
            {
                filtersData[Constant().signUPConst.SEXUAL_ORIENTATION] = sexualOrientationSelectedArray
            }
            
        }
        
        
        print("added advacne filters are \(filtersData)")
        
        var numberoffiletrsUsed = 0
        for switche in filtersSwitches
        {
            if switche.isOn
            {
                numberoffiletrsUsed = numberoffiletrsUsed + 1
            }
        }
        
        
        //        filtersData[Constant().signUPConst.KIDS] = ""
        //        filtersData[Constant().signUPConst.POLITICS] = ""
        //        filtersData[Constant().signUPConst.EXERCISE] = ""
        //        filtersData[Constant().signUPConst.RELEGION] = ""
        //        filtersData[Constant().signUPConst.LIVES_IN] = ""
        //        filtersData[Constant().signUPConst.STAR_SIGN] = ""
        //        filtersData[Constant().signUPConst.SEXUAL_ORIENTATION] = ""
        //
        
        /*
         Constant().signUPConst.EDUCATION_LEVEL : delegateeducation,
         Constant().signUPConst.DRINKING :delegatedrinking,
         Constant().signUPConst.SMOKING :delegatesmoking,
         Constant().signUPConst.PETS : delegatepets,
         Constant().signUPConst.LOOKING_FOR : delegatelookingfor,
         Constant().signUPConst.KIDS : delegatekidsfor,
         Constant().signUPConst.POLITICS:delegatepolitics,
         Constant().signUPConst.EXERCISE : delegateexercise,
         Constant().signUPConst.RELEGION : delegatedreligion,
         Constant().signUPConst.LIVES_IN: delegatelivesin,
         Constant().signUPConst.STAR_SIGN : delegatezodiacsign,
         Constant().signUPConst.SEXUAL_ORIENTATION : delegatesexualorientation,
         "display_name_as" : nameTextfield.text!,
         "country_grew_up_in" : countriesChoosen,
         "relationship_status" : delegateRelationShipFor,
         "kids_status" : delegatekidsStatusfor,
         "profile_completed_percentage" : profilecompletePercentage
         
         */
        
        
        // self.moreinfoDelegae?.gotmoredata(relationstatus: relationshipStatStr, kidsStatus: kidsStatusStr,education: educationLevel, drinking: drinking, smoking: smoking, pets: pets, politics: politics, exercise: exercise, religion: religion, zodiacsign: zodiacSign, sexualrientation: sexualOrientation, livesin: livesIn, height: textheight.text!, lookinfor : lookingFor, kids :kids, selectedCountries: selectedCountryCodes )
        
        
        
        let myID = DEFAULTS.string(forKey: Constant().UD_USER_USER_ID)
        
        let parameters = ["id": myID! ,
                          "advanced_filters" :  filtersData,
                          "total_filters_used" : numberoffiletrsUsed
                          
        ] as [String : Any]
        
        
        DataManager.alamofirePostRequestWithHeaderAndCompletion(url: BASE_URL + SAVE_SETTINGS, viewcontroller: self, parameters: parameters as [String : AnyObject], header: getactiveHeaders()) { (response, error) in
            
            if error == nil && response != nil{
                
                // print("respone as \(response)")
                saveDefaults(value: false, Key: Constant().USER_WISHSETTING_CHANGED)
                DEFAULTS.setValue(nil, forKey: Constant().TOP_SINGLE_CARD)
                DEFAULTS.setValue(nil, forKey: Constant().BOTTOM_SINGLE_CARD)
                DEFAULTS.setValue(nil, forKey: Constant().TOP_Second_CARD)
                DEFAULTS.setValue(nil, forKey: Constant().BOTTOM_SECOND_CARD)
                DEFAULTS.setValue(nil, forKey: Constant().PROFILE_CARD_DATA)
                DEFAULTS.setValue([String](), forKey: Constant().ALREADY_HAVE_DATA)
                DEFAULTS.set(nil, forKey: Constant().USER_FETCH_ID);
                DEFAULTS.synchronize()
                appDel.navigateToDashboardVC()
                
            }
            else {
                Utility.showAlertMessage(title: "Settings", message: "Advance filters not saved", view: self)
            }
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    @IBAction func slidingChanged(_ sender: RangeSlider) {
        
        sliderRangeLabel.text = "\(Int(sender.lowerValue)) - \(Int(sender.upperValue))"
    }
    
    
    
    
    
    
    
    @IBAction func switchingFilterTapped(_ sender: UISwitch) {
        
        var numberoffiletrsUsed = 0
        
        if sender.isOn
        {
            
            for switche in filtersSwitches
            {
                if switche.isOn
                {
                    numberoffiletrsUsed = numberoffiletrsUsed + 1
                }
            }
            
            if numberoffiletrsUsed > totalfilters
            {
                sender.setOn(false, animated: false)
                showPopupofcredits()
                return
            }
            self.advancedFilterLabel.text = "Adanced Filters(\(totalfilters - numberoffiletrsUsed))"
            
            
        }
        else
        {
            for switche in filtersSwitches
            {
                if switche.isOn
                {
                    numberoffiletrsUsed = numberoffiletrsUsed + 1
                }
            }
            
            
            self.advancedFilterLabel.text = "Adanced Filters(\(totalfilters - numberoffiletrsUsed))"
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
}




//MARK: Credit update vc delegate Methods
extension AdvanceFilterViewController : creditUpdateVCDelegate
{
    func refreshTheData() {
        
        //getSettings()
    }
    
    func gotDisclosedLikes(data: [JSON], iswishlikes: Typeoflikes) {
        
    }
    
    
}
