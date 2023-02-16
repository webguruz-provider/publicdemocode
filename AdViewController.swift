//
//  AdViewController.swift
//  Genie
//
//  Created by Sanchit on 26/07/22.
//  Copyright © 2022 Appzilla.tech. All rights reserved.
//

import UIKit
import Koloda
import SwiftyJSON
import AVKit
import AVFoundation
import Alamofire
import SDWebImage

struct SwipedData {
    var advertID = ""
    var action = ""
}

class AdViewController: UIViewController {

    @IBOutlet weak var upperCardView                            : KolodaView!
    @IBOutlet weak var lowerCardView                            : KolodaView!
    @IBOutlet weak var singleCardView                           : KolodaView!
    @IBOutlet weak var upperParentview                          : UIView!
    @IBOutlet weak var lowerParentView                          : UIView!
    @IBOutlet weak var cardSuperView                            : UIView!
    @IBOutlet weak var singleParentView                         : UIView!
    
    weak var draggableuppercard : DraggableCardView? = nil
    weak var draggablelowercard: DraggableCardView? = nil
    weak var wishVC : WishVC? = nil
    
    var swipingPercent: CGFloat = 0.0
    var swipingDirection : SwipeResultDirection?
    var isdragging   = false
    var advertSingleCardArray      =   [JSON]()
    var advertDoubleCardArray      =   [JSON]()
    var cardType = ""
    var swipeCounter = 0
    var SwipedDataArray = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Ref count \(String(describing: [self .classForCoder])) : \(CFGetRetainCount(self))")
    }
    deinit {
        print("dinit: called \(String(describing: [self .classForCoder]))")
    }
    override func viewWillAppear(_ animated: Bool) {
        
        if cardType == "single" {
            self.upperParentview.isHidden = true
            self.upperCardView.isHidden = true
            self.lowerParentView.isHidden = true
            self.lowerCardView.isHidden = true
            self.singleCardView.isHidden = false
            self.singleParentView.isHidden = false
            
            self.singleCardView.delegate = self
            self.singleCardView.dataSource = self
        }else {
            self.upperParentview.isHidden = false
            self.upperCardView.isHidden = false
            self.lowerParentView.isHidden = false
            self.lowerCardView.isHidden = false
            self.singleCardView.isHidden = true
            self.singleParentView.isHidden = true
            
            self.lowerCardView.delegate = self
            self.lowerCardView.dataSource = self
            self.upperCardView.delegate = self
            self.upperCardView.dataSource = self
            
        }
    }
    
    func callAdvertSendSwipeAapiFromCardView(item:String)
    {
        if item == "single"
        {
            let action1 = advertSingleCardArray0["data"][0]["advertID"].stringValue
            let dict1 = ["advertID": action1, "action": "right", "isFromSingle":true] as [String : Any]
            SwipedDataArray = [dict1]
            callAdvertSendSwipeApi()
        }
    
        if item == "double"
        {
            let action1 = advertDoubleCardArray0["data"][0]["advertID"].stringValue
            let action2 = advertDoubleCardArray0["data"][1]["advertID"].stringValue
            let dict1 = ["advertID": action1, "action": "right", "isFromSingle":false] as [String : Any]
            let dict2 = ["advertID": action2, "action": "left", "isFromSingle":false] as [String : Any]
            SwipedDataArray = [dict1,dict2]
            callAdvertSendSwipeApi()
        }
    }
    
}

extension AdViewController : KolodaViewDelegate, KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        if koloda == upperCardView && advertDoubleCardArray.count > 0 {
            return 1//advertDoubleCardArray.count
        }else if koloda == lowerCardView && advertDoubleCardArray.count > 0{
            return 1//advertDoubleCardArray.count
        }else if koloda == singleCardView && advertSingleCardArray.count > 0 {
            return 1//advertDoubleCardArray.count
        }else {
            return 0
        }
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        print("koloda viewForCardAt - \(koloda) index - \(index)")
        
        let imageSliderCard  = Bundle.main.loadNibNamed("alreadyMatchPopup", owner: self, options: nil)![5] as! ImageSliderCardAdView
        
        if koloda == upperCardView {
            imageSliderCard.loadingDefaultUI2(advertDoubleCardArray[0], imageName: "", modeVw: .uppercard, VC: self)
            imageSliderCard.frame = upperCardView.frame
            return imageSliderCard//UIView()

        }else if koloda == lowerCardView {
            imageSliderCard.loadingDefaultUI2(advertDoubleCardArray[1], imageName: "", modeVw: .lowercard, VC: self)
            imageSliderCard.frame = lowerCardView.frame
            return imageSliderCard//UIView()
        }else if koloda == singleCardView {
               imageSliderCard.loadingDefaultUI2(advertSingleCardArray[0], imageName: "", modeVw: .singlecard, VC: self)
               imageSliderCard.frame = singleCardView.frame
               return imageSliderCard//UIView()
           }else {
            return UIView()
        }
        
    }
    
    func koloda(_ koloda: KolodaView, didShowCardAt index: Int){
        print("Showing card Index: \(index)")
        if koloda == upperCardView {
        }else if koloda == lowerCardView {
        }else if koloda == singleCardView {
        }
    }
    
    //- On the gestureRecognizerDelegate
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        print("didselected");
    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection){
    print("koloda - \(koloda) index - \(index)")
        
        swipeCounter = swipeCounter + 1
        isAdViewPresent = false
        
        if koloda == upperCardView {
            if direction == .right {
                if advertDoubleCardArray.count > 0 {

                    let action1 = advertDoubleCardArray[0]["advertID"].stringValue
                    let action2 = advertDoubleCardArray[1]["advertID"].stringValue
                    let dict1 = ["advertID": action1, "action": "right", "isFromSingle":false] as [String : Any]
                    let dict2 = ["advertID": action2, "action": "left", "isFromSingle":false] as [String : Any]
                    
                    SwipedDataArray = [dict1,dict2]
                    advertDoubleCardArray      =   [JSON]()
                    DispatchQueue.main.asyncAfter(deadline: .now() ) { [self] in
                        callAdvertSendSwipeApi()
                    }
                }
                
                
            }else if direction == .left {
                if advertDoubleCardArray.count > 0 {
                    
                    let action1 = advertDoubleCardArray[0]["advertID"].stringValue
                    let action2 = advertDoubleCardArray[1]["advertID"].stringValue
                    let dict1 = ["advertID": action1, "action": "left", "isFromSingle":false] as [String : Any]
                    let dict2 = ["advertID": action2, "action": "right", "isFromSingle":false] as [String : Any]
                    
                    SwipedDataArray = [dict1,dict2]
                    advertDoubleCardArray      =   [JSON]()
                    DispatchQueue.main.asyncAfter(deadline: .now() ) { [self] in
                        callAdvertSendSwipeApi()
                    }
                }
            }
        }

        if koloda == lowerCardView {

            if direction == .right {
                if advertDoubleCardArray.count > 0 {
                    let action1 = advertDoubleCardArray[1]["advertID"].stringValue
                    let action2 = advertDoubleCardArray[0]["advertID"].stringValue
                    let dict1 = ["advertID": action1, "action": "right", "isFromSingle":false] as [String : Any]
                    let dict2 = ["advertID": action2, "action": "left", "isFromSingle":false] as [String : Any]
                    
                    SwipedDataArray = [dict1,dict2]
                    advertDoubleCardArray      =   [JSON]()
                    DispatchQueue.main.asyncAfter(deadline: .now() ) { [self] in
                        callAdvertSendSwipeApi()
                    }
                }
            }else if direction == .left {
                if advertDoubleCardArray.count > 0 {
                    let action1 = advertDoubleCardArray[1]["advertID"].stringValue
                    let action2 = advertDoubleCardArray[0]["advertID"].stringValue
                    let dict1 = ["advertID": action1, "action": "left", "isFromSingle":false] as [String : Any]
                    let dict2 = ["advertID": action2, "action": "right", "isFromSingle":false] as [String : Any]
                    
                    SwipedDataArray = [dict1,dict2]
                    advertDoubleCardArray      =   [JSON]()
                    DispatchQueue.main.asyncAfter(deadline: .now() ) { [self] in
                        callAdvertSendSwipeApi()
                    }
                }

            }

        }
        
        if koloda == singleCardView {
            
            if direction == .right {
                if advertSingleCardArray.count > 0 {
                    let action1 = advertSingleCardArray[0]["advertID"].stringValue
                    let dict1 = ["advertID": action1, "action": "right", "isFromSingle":true] as [String : Any]
                    SwipedDataArray = [dict1]
                    advertSingleCardArray      =   [JSON]()
                    DispatchQueue.main.asyncAfter(deadline: .now() ) { [self] in
                        callAdvertSendSwipeApi()
                    }
                }
            }else if direction == .left {
                if advertSingleCardArray.count > 0 {
                    let action1 = advertSingleCardArray[0]["advertID"].stringValue
                    let dict1 = ["advertID": action1, "action": "left", "isFromSingle":true] as [String : Any]
                    SwipedDataArray = [dict1]
                    advertSingleCardArray      =   [JSON]()
                    DispatchQueue.main.asyncAfter(deadline: .now() ) { [self] in
                        callAdvertSendSwipeApi()
                    }
                }
            }
            
        }
        
        

    }
    
    func koloda(_ koloda: KolodaView, draggedCardWithPercentage finishPercentage: CGFloat, in direction: SwipeResultDirection) {
        draggableuppercard = nil
        draggablelowercard = nil
        isdragging = true
        swipingPercent = finishPercentage
        swipingDirection = direction
        if koloda == upperCardView {
            self.cardSuperView.bringSubviewToFront(lowerParentView)
            _ = koloda.viewForCard(at: upperCardView.currentCardIndex) as! ImageSliderCardAdView
            if direction == .right {
                
                //Reflect these movemonets in bottomcard
                draggableuppercard = koloda.visibleCards.first
                draggablelowercard = lowerCardView.visibleCards.first
                if draggableuppercard != nil && draggablelowercard != nil {
                    self.draggablelowercard!.contentView!.transform.tx = -self.draggableuppercard!.transform.tx
                    self.draggablelowercard!.contentView!.transform.ty =  self.draggableuppercard!.transform.ty
                    self.draggablelowercard!.contentView!.transform.a = self.draggableuppercard!.transform.a
                    self.draggablelowercard!.contentView!.transform.b = self.draggableuppercard!.transform.b
                    self.draggablelowercard!.contentView!.transform.c = self.draggableuppercard!.transform.c
                    self.draggablelowercard!.contentView!.transform.d = self.draggableuppercard!.transform.d
                }
                let reflectedCard = lowerCardView.viewForCard(at: lowerCardView.currentCardIndex) as? ImageSliderCardAdView

                if reflectedCard != nil {
                }
               
            }else if direction == .left {
                
                //Reflect these movemonets in bottomcard
                draggableuppercard = koloda.visibleCards.first
                draggablelowercard = lowerCardView.visibleCards.first
                if draggableuppercard != nil && draggablelowercard != nil {
                    self.draggablelowercard!.contentView!.transform.tx = -self.draggableuppercard!.transform.tx
                    self.draggablelowercard!.contentView!.transform.ty =  self.draggableuppercard!.transform.ty
                    self.draggablelowercard!.contentView!.transform.a = self.draggableuppercard!.transform.a
                    self.draggablelowercard!.contentView!.transform.b = self.draggableuppercard!.transform.b
                    self.draggablelowercard!.contentView!.transform.c = self.draggableuppercard!.transform.c
                    self.draggablelowercard!.contentView!.transform.d = self.draggableuppercard!.transform.d
                }
                let reflectedCard = lowerCardView.viewForCard(at: lowerCardView.currentCardIndex) as? ImageSliderCardAdView
                if reflectedCard != nil {
                    
                }
                
            }
            
        }else if koloda == lowerCardView {

            self.cardSuperView.bringSubviewToFront(upperParentview)
            _ = koloda.viewForCard(at: lowerCardView.currentCardIndex) as! ImageSliderCardAdView
            if direction == .right {
                
                //Reflect these movemonets in bottomcard
                draggablelowercard  = koloda.visibleCards.first
                draggableuppercard = upperCardView.visibleCards.first
                if draggableuppercard != nil && draggablelowercard != nil
                {
                    self.draggableuppercard!.contentView!.transform.tx = -self.draggablelowercard!.transform.tx
                    self.draggableuppercard!.contentView!.transform.ty =  self.draggablelowercard!.transform.ty
                    self.draggableuppercard!.contentView!.transform.a = self.draggablelowercard!.transform.a
                    self.draggableuppercard!.contentView!.transform.b = self.draggablelowercard!.transform.b
                    self.draggableuppercard!.contentView!.transform.c = self.draggablelowercard!.transform.c
                    self.draggableuppercard!.contentView!.transform.d = self.draggablelowercard!.transform.d
                    
                }
                let reflectedCard = upperCardView.viewForCard(at: upperCardView.currentCardIndex) as? ImageSliderCardAdView
                if reflectedCard != nil {
                
                }
                
            }else if direction == .left {
                
                //Reflect these movemonets in bottomcard
                draggablelowercard  = koloda.visibleCards.first
                draggableuppercard = upperCardView.visibleCards.first
                if draggableuppercard != nil && draggablelowercard != nil {
                    self.draggableuppercard!.contentView!.transform.tx = -self.draggablelowercard!.transform.tx
                    self.draggableuppercard!.contentView!.transform.ty =  self.draggablelowercard!.transform.ty
                    self.draggableuppercard!.contentView!.transform.a = self.draggablelowercard!.transform.a
                    self.draggableuppercard!.contentView!.transform.b = self.draggablelowercard!.transform.b
                    self.draggableuppercard!.contentView!.transform.c = self.draggablelowercard!.transform.c
                    self.draggableuppercard!.contentView!.transform.d = self.draggablelowercard!.transform.d
                    
                }
                let reflectedCard = upperCardView.viewForCard(at: upperCardView.currentCardIndex) as? ImageSliderCardAdView
                if reflectedCard != nil {
                    
                }
            }
        }else if koloda == singleCardView {
            _ = koloda.viewForCard(at: singleCardView.currentCardIndex) as! ImageSliderCardAdView
            if direction == .right {
            
            }else if direction == .left {
                
            }
            

        }
    }
    
    func kolodaPanFinished(_ koloda: KolodaView, card: DraggableCardView) {
        
        print("swipingpercent as \(swipingPercent)")
        
        //Reflect these movemonets in bottomcard
        if koloda == self.upperCardView {
            self.draggablelowercard = self.lowerCardView.visibleCards.first
            if   self.draggablelowercard != nil && swipingPercent < 100 {
                self.draggablelowercard?.resetViewPositionAndTransformations()
                //print("reset the transfrom")
                //Make the reflected heart images as normal
                if swipingDirection != nil {
                    if swipingDirection! == .right {
                        let reflectedCard = lowerCardView.viewForCard(at: lowerCardView.currentCardIndex) as? ImageSliderCardAdView
                        if reflectedCard != nil {
//                            reflectedCard!.rejectImage.stopAnimatingGif()
//                            reflectedCard!.rejectImage.alpha =   0
                        }
                    }
                }
                
                
            }else {
                if swipingDirection != nil {
                    if swipingDirection! == .right {
                        //print("swiping direction is right")
                        let mediatorCard = lowerCardView.viewForCard(at: lowerCardView.currentCardIndex) as? ImageSliderCardAdView
                        if mediatorCard != nil {
//                            mediatorCard!.rejectImage.alpha = 1
//                            mediatorCard!.rejectImage.startAnimatingGif()
                        }
                        
                        //self.sharetheCards(cardEnum: .uppercardadd)
                        let lowercard = self.lowerCardView.viewForCard(at: self.lowerCardView.currentCardIndex) as? ImageSliderCardAdView
                        
                        if lowercard != nil {
//                            lowercard!.slidingImages.removeAll()
//                            lowercard!.typeofcardsTodisplay.removeAll()
                        }
                        self.lowerCardView.swipe(.left, force: true)
                        
                    }
                    
                }
            }
            
        }else if koloda == self.lowerCardView {
            self.draggableuppercard = self.upperCardView.visibleCards.first
            if   self.draggableuppercard != nil && swipingPercent < 100 {
                
                self.draggableuppercard?.resetViewPositionAndTransformations()
                //print("reset the data")
                
                if swipingDirection != nil {
                    if swipingDirection! == .right {
                        let reflectedCard = upperCardView.viewForCard(at: upperCardView.currentCardIndex) as? ImageSliderCardAdView
                        if reflectedCard != nil {
//                            reflectedCard!.rejectImage.stopAnimatingGif()
//                            reflectedCard!.rejectImage.alpha =   0
                        }
                    }
                }
            }else {
                if swipingDirection != nil {
                    if swipingDirection! == .right {
                        //print("swiping direction is right")
                        let mediatorCard = upperCardView.viewForCard(at: upperCardView.currentCardIndex) as? ImageSliderCardAdView
                        if mediatorCard != nil {
//                            mediatorCard!.rejectImage.alpha = 1
//                            mediatorCard!.rejectImage.startAnimatingGif()
                        }
                        
                        
                        
                        let uppercard = self.upperCardView.viewForCard(at: self.upperCardView.currentCardIndex) as? ImageSliderCardAdView
                        if uppercard != nil {
//                            uppercard!.slidingImages.removeAll()
//                            uppercard!.typeofcardsTodisplay.removeAll()
                        }
                        self.upperCardView.swipe(.left, force: true)
                        
                        
                    }
                }
                
            }
            
        }
        swipingPercent = 0.0
        self.upperParentview.isUserInteractionEnabled = true
        self.lowerParentView.isUserInteractionEnabled = true
        self.view.isUserInteractionEnabled = true
//        self.isdragging = false
        swipingDirection = nil
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
//
//        }
        
    }
    
}

extension AdViewController {
    
    func callGetAdvertDataApi() {
        print("advertView-> callGetAdvertDataApi Called")
        
        DataManager.alamofireRequestForServer(url: "\(BASE_URL)\(GET_Advert_Data)", method: .post, encoding: JSONEncoding.default, viewcontroller: nil, parameters: [:], header: getactiveHeaders()) { [self] (jsonDataa, isSuccess) in
            
            URLCache.shared.removeAllCachedResponses()
            
            let jsonData = jsonDataa
            
            if isSuccess == .success {
                
                print("-> callGetAdvertDataApi Called : success - \(jsonData)")
                let advertData = jsonData["adverts"]
                print("advertData--", advertData)
                saveDefaults(value: 0, Key:  Constant.ADVERT_SINGLE_SWIPE_COUNTER)
                saveDefaults(value: 0, Key:  Constant.ADVERT_DOUBLE_SWIPE_COUNTER)
                if !(advertData["single"]["data"].arrayValue.isEmpty) {
                    let singleCardData = advertData["single"]
                    print("singleCardData--", singleCardData)
                    saveDefaults(value: singleCardData.dictionaryObject, Key:  Constant.ADVERT_SINGLE_SWIPE_DATA)
                    print(DEFAULTS.object(forKey: Constant.ADVERT_SINGLE_SWIPE_DATA) as Any)
                    
                    let data = singleCardData["data"]
                    DispatchQueue.main.asyncAfter(deadline: .now() ) { [self] in
                    SDWebImageManager.shared.loadImage(with: data[0]["url"].url,  options: .highPriority, progress: { (process, process1, imgeurl) in
                        print("downloading....")
                    }) { (img, imgData, error, type, issucess, imgurl) in
                        saveImageOnDevice(publicPathurl: data[0]["url"].stringValue, imgData: imgData)
                    }
                    
                    SDWebImageManager.shared.loadImage(with: data[0]["background"].url,  options: .highPriority, progress: { (process, process1, imgeurl) in
                        print("downloading....")
                    }) { (img, imgData, error, type, issucess, imgurl) in
                        saveImageOnDevice(publicPathurl: data[0]["background"].stringValue, imgData: imgData)
                    }
                    }
                }
                else
                {
                    let js = JSON()
                    saveDefaults(value: js.dictionaryObject, Key:  Constant.ADVERT_SINGLE_SWIPE_DATA)
                }
                
                if !(advertData["choice"]["data"].arrayValue.isEmpty) {
                    let ulCardData = advertData["choice"]
                    print("ulCardData--", ulCardData)
                    saveDefaults(value: ulCardData.dictionaryObject, Key:  Constant.ADVERT_DOUBLE_SWIPE_DATA)
                    print(DEFAULTS.object(forKey: Constant.ADVERT_DOUBLE_SWIPE_DATA) as Any)
                    
                    let data = ulCardData["data"]
                    DispatchQueue.main.asyncAfter(deadline: .now() ) { [self] in
                    SDWebImageManager.shared.loadImage(with: data[0]["url"].url,  options: .highPriority, progress: { (process, process1, imgeurl) in
                        print("downloading....")
                    }) { (img, imgData, error, type, issucess, imgurl) in
//                        stopLoadImmediately()
                        saveImageOnDevice(publicPathurl: data[0]["url"].stringValue, imgData: imgData)
                    }
                    
                    
                    SDWebImageManager.shared.loadImage(with: data[1]["url"].url,  options: .highPriority, progress: { (process, process1, imgeurl) in
                        print("downloading....")
                    }) { (img, imgData, error, type, issucess, imgurl) in
//                        stopLoadImmediately()
                        saveImageOnDevice(publicPathurl: data[1]["url"].stringValue, imgData: imgData)
                    }
                    
                    SDWebImageManager.shared.loadImage(with: data[0]["background"].url,  options: .highPriority, progress: { (process, process1, imgeurl) in
                        print("downloading....")
                    }) { (img, imgData, error, type, issucess, imgurl) in
//                        stopLoadImmediately()
                        saveImageOnDevice(publicPathurl: data[0]["background"].stringValue, imgData: imgData)
                    }
                    
                    SDWebImageManager.shared.loadImage(with: data[1]["background"].url,  options: .highPriority, progress: { (process, process1, imgeurl) in
                        print("downloading....")
                    }) { (img, imgData, error, type, issucess, imgurl) in
//                        stopLoadImmediately()
                        saveImageOnDevice(publicPathurl: data[1]["background"].stringValue, imgData: imgData)
                    }
                    }
                }
                else
                {
                    
                    let js = JSON()
                    saveDefaults(value: js.dictionaryObject, Key:  Constant.ADVERT_DOUBLE_SWIPE_DATA)
                }
                
                self.view.removeFromSuperview()
                self.wishVC?.enableTabButtons(isFromAdverts: true)
               
            
            }else if isSuccess == .nonetwork {
                if appDel.window?.rootViewController != nil {
                    appDel.window!.rootViewController!.showToast(message: "Please check your network connection and try again")
                }
            }else {
                Utility.showAlertMessage(title: "Alert", message: "Server error occured", view: self)
            }
        }
    }
    
    func callAdvertSendSwipeApi() {
        globalAPIClass.shared.callingAdvertSendSwipeAPI(paramData: SwipedDataArray) { isSuccess in
            if isSuccess {
                self.callGetAdvertDataApi()
            }
            else
            {
                self.showToast(message: Constant().INTERNAL_ERROR_MSG)
            }
        }
    }
}


extension JSON {
    mutating func appendIfKeyValuePair(key: String, value: Any){
        if var dict = self.dictionaryObject {
            dict[key] = value
            self = JSON(dict)
        }
    }
}
