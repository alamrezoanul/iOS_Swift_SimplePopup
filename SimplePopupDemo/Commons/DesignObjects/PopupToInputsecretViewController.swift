//
//  PopupToInputsecretViewController.swift
//  SimplePopupDemo
//
//  Created by TAHIYAH ALAM KHAN on 6/20/17.
//  Copyright © 2017 Rezoanul Alam Riad. All rights reserved.
//
// This is a example of Tightly Coupled Popup with a Storyboard And Segue with UIView Controller 

import Foundation
import UIKit

//MARK: step 1 Add Protocol here
protocol PopupToInputsecretViewControllerDelegate: class {
    func refreshTableViewWith(gitSecret: String?)
}

class PopupToInputsecretViewController: UIViewController {
    
    //MARK: Design Outlets -
    @IBOutlet var vwMainContainer: UIView!
    
    
    @IBOutlet weak var vwContainer: UIView!
    
    @IBOutlet weak var btnCancel: UIButton!
    
    
    @IBOutlet weak var txtGitSecret: UITextField!
    
    @IBOutlet weak var btnSaveSecret: UIButton!
    
    
    //MARK: Create a delegate property here, don't forget to make it weak!
    weak var delegate: PopupToInputsecretViewControllerDelegate?
    
    //MARK: Custom Variables
    private let _commonMethods = CommonMethods()
    
    //MARK: overriden methods of base
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.vwContainer.layer.cornerRadius = 12.0
        
        self.vwContainer.backgroundColor = K.AppColor.white;
        self.vwContainer.alpha = 1;
        
        
        _commonMethods.setButtonDesign(btnSender: self.btnSaveSecret)
        _commonMethods.setXbuttonDesign(btnSender: self.btnCancel)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Private Custom Methods
    private func validateSecret(_ validate: Bool , strSecret : String? )
    {
        if( validate )
        {
            //Validate the secret here
            
            
            
        }
        
        
        dismissView()
    }
    @IBAction func buttonAction(_ sender: UIButton) {
        
        var  alert : UIAlertController? = nil
        if( sender == self.btnSaveSecret )
        {
            if( txtGitSecret.text?.isEmpty )!
            {
                alert = UIAlertController(title: "", message: "Secret Can't be empty!", preferredStyle: .alert)
                
                //Action : Yes
                let callActionHandlerOkay = { (action:UIAlertAction!) -> Void in
                    
                    alert?.dismiss(animated: true, completion: nil)
                    
                }
                
                let callActionOkay = UIAlertAction(title: "Okay", style: .default, handler: callActionHandlerOkay)
                alert?.addAction(callActionOkay)
                
            }
            else
            {
                self.validateSecret(true, strSecret: self.txtGitSecret.text)
            }
        }
        else if( sender == self.btnCancel )
        {
            
            if( txtGitSecret.text?.isEmpty )!
            {
                dismissView()
            }
            else
            {
                alert = UIAlertController(title: K.cancelWithValueTitleText, message: K.cancelWithValueBodyText, preferredStyle: .actionSheet)
                
                //Action : Yes
                let callActionHandlerYes = { (action:UIAlertAction!) -> Void in
                    
                    self.validateSecret(true, strSecret: self.txtGitSecret.text)
                    
                }
                
                let callActionYes = UIAlertAction(title: "Yes, Save Before Exit", style: .default, handler: callActionHandlerYes)
                alert?.addAction(callActionYes)
                
                //Action : No
                let callActionHandlerNo = { (action:UIAlertAction!) -> Void in
                    
                    self.validateSecret(false, strSecret: self.txtGitSecret.text)
                    
                }
                let callActionNo = UIAlertAction(title: "No, Just Exit!", style: .default, handler: callActionHandlerNo)
                alert?.addAction(callActionNo)
                
                //Action : Cancel
                let callActionHandlerCancel = { (action:UIAlertAction!) -> Void in
                    
                    alert?.dismiss(animated: true, completion: nil)
                }
                let callActionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: callActionHandlerCancel)
                alert?.addAction(callActionCancel)
                
            }
            
        }
        
        if( alert != nil )
        {
            self.present(alert!, animated: true, completion: nil)
        }
        
    }
    private func dismissView() {
        self.dismiss(animated: true, completion: nil)
        
        delegate?.refreshTableViewWith(gitSecret: self.txtGitSecret.text!)
    }
    
}
