//
//  CommonMethods.swift
//  SimplePopupDemo
//
//  Created by TAHIYAH ALAM KHAN on 6/18/17.
//  Copyright © 2017 Rezoanul Alam Riad. All rights reserved.
//

import Foundation
import UIKit
import SimpleKeychain
class CommonMethods {
    
    private let _commonMethodsObjC = CommonMethodsObjC()
    
    public func getGithubApiSecret() -> String?
    {
        let gitSecretToken = A0SimpleKeychain().string(forKey: K.gitHubSecretTokenKeyName)
        
        return gitSecretToken;
        
    }
    
        
    public func setButtonDesign(btnSender : UIButton) -> Void {
        btnSender.setTitleColor(K.AppColor.ButtonColors.TextColor, for: .normal)
        btnSender.layer.cornerRadius = 4
        btnSender.backgroundColor = K.UIColorFromRGB(rgbValueHex: 0x4990E2)
        
        let maskPath1 = UIBezierPath(roundedRect: btnSender.bounds,
                                    byRoundingCorners: [.topLeft, .topRight],
                                    cornerRadii: CGSize(width: 12.0, height: 12.0))
        
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = btnSender.bounds
        maskLayer1.path = maskPath1.cgPath
        btnSender.layer.mask = maskLayer1
    }
    public func setXbuttonDesign(btnSender : UIButton) -> Void {
        let gradientColor = UIColor.init(colorLiteralRed: 0.051, green: 0.416, blue: 0.604, alpha: 1)
        //[UIColor colorWithRed: 0.051 green: 0.416 blue: 0.604 alpha: 1];
        
        btnSender.layer.cornerRadius = 25.0
        
        btnSender.setTitleColor(gradientColor, for: .normal)
        
    }
    
    //MARK: Wrapper methods of Legacy Objective C
    public func isNULL( value : Any? ) -> Bool{
        let result = self._commonMethodsObjC.isNULL(value)
        
        return result
    }
    
}
