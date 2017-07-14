//
//  Constants.swift
//  SimplePopupDemo
//
//  Created by TAHIYAH ALAM KHAN on 6/18/17.
//  Copyright © 2017 Rezoanul Alam Riad. All rights reserved.
//
import UIKit
struct K {
    
    // MARK: String Constants -
    static let gitHubSecretTokenKeyName = "Github-Access-Token"
    static let cancelWithValueTitleText = "You have enterd a Secret"
    static let cancelWithValueBodyText = "Do you want to save it before Exit?"
    
    // MARK: Function Constants -
    static func UIColorFromRGB(rgbValueHex: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValueHex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValueHex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValueHex & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }    
    
    // MARK: Object Constants -
    struct AppColor {
        
        static let white = UIColor.white
        
        private struct Alphas {
            static let Opaque = CGFloat(1)
            static let SemiOpaque = CGFloat(0.8)
            static let SemiTransparent = CGFloat(0.5)
            static let Transparent = CGFloat(0.3)
        }
        
        static let appPrimaryColor =  UIColor.white.withAlphaComponent(Alphas.SemiOpaque)
        static let appSecondaryColor =  UIColor.blue.withAlphaComponent(Alphas.Opaque)
        
        struct ButtonColors {
            static let TextColor = UIColor.white
        }
        
        struct TextColors {
            static let Error = AppColor.appSecondaryColor
            static let Success = UIColor(red: 0.1303, green: 0.9915, blue: 0.0233, alpha: Alphas.Opaque)
        }
        
        struct TabBarColors{
            static let Selected = UIColor.white
            static let NotSelected = UIColor.black
        }
        
        struct OverlayColor {
            static let SemiTransparentBlack = UIColor.black.withAlphaComponent(Alphas.Transparent)
            static let SemiOpaque = UIColor.black.withAlphaComponent(Alphas.SemiOpaque)
            static let demoOverlay = UIColor.black.withAlphaComponent(0.6)
        }
    }
}
