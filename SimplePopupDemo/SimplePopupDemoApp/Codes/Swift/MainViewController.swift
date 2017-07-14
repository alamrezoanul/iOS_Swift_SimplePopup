//
//  MainViewController.swift
//  SimplePopupDemo
//
//  Created by TAHIYAH ALAM KHAN on 6/19/17.
//  Copyright © 2017 Rezoanul Alam Riad. All rights reserved.
//

import Foundation
import UIKit

import SimpleKeychain
class MainViewController: UIViewController, PopupToInputsecretViewControllerDelegate {
    
    //MARK: Design Outlets -
    @IBOutlet var vwMainContainer: UIView!
    
    @IBOutlet weak var btnGetRepoList: UIButton!
    
    //MARK: Custom Created Variables -
    let _commonMethods = CommonMethods()
    let strSegueMainToGetSecretPopup = "segueMainToGetSecretPopup"
    
    //MARK: Overriden Base Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let strGitSecret = _commonMethods.getGithubApiSecret()
        
        if ( _commonMethods.isNULL(value: strGitSecret) )
        {
            //MARK: Show the popup here for getting input for New Secret
            self.performSegue(withIdentifier: strSegueMainToGetSecretPopup, sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Callbacks All -
    //MARK: Callback of Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if( segue.identifier == strSegueMainToGetSecretPopup )
        {
            //MARK: Assign the delegate here
            let popupVC = segue.destination as? PopupToInputsecretViewController
            popupVC?.delegate = self
            
        }
    }
    //MARK: Callback of Popup
    func refreshTableViewWith(gitSecret: String?) {
        print("Github Secret: %@", gitSecret )
    }
    
    //MARK: Callback of UITableView
    
    //MARK: Custom Private Methods -
}
