//
//  LocationServicePermissionView.swift
//  Genie
//
//  Created by Krify on 25/03/20.
//  Copyright © 2020 Appzilla.tech. All rights reserved.
//

import UIKit

class LocationServicePermissionView: UIView {

    @IBOutlet weak var locationServiceVw: UIView!
    @IBOutlet weak var gotosettingButton: UIButton!
    @IBOutlet weak var genieMsg: UILabel!
    @IBOutlet weak var messageView: UIView!
     @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var backgroundImg: UIImageView!
    
    func loadingDefaultUI()
    {
        settingsView.layer.cornerRadius = 20.0
        settingsView.clipsToBounds = true
        
        backgroundImg.layer.cornerRadius = 20.0
        backgroundImg.clipsToBounds = true
    }

    deinit {
        print("dinit: called \(String(describing: [self .classForCoder]))")
    }

}
