//
//  LoginViewController.swift
//  1l_Tsymbalyuk
//
//  Created by Admin on 16.06.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
///////////////////////////////////////////////////////////////
//      IBOutlets
///////////////////////////////////////////////////////////////

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPass: UITextField!
    @IBOutlet weak var scrolView: UIScrollView!
    
///////////////////////////////////////////////////////////////
//      IBActions
///////////////////////////////////////////////////////////////
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        let name = userName.text!
        let pass = userPass.text!
        
        if name == "admin" && pass == "admin" {
            print("OK")
        } else {
            print("Authorization failed!")
        }
        
    }
    
///////////////////////////////////////////////////////////////
//      LifeCycle
///////////////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hideKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyBoard))
        self.scrolView?.addGestureRecognizer(hideKeyboardTap)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
///////////////////////////////////////////////////////////////
//      UI methods
///////////////////////////////////////////////////////////////
    
    @objc func keyboardWasShown (notification: Notification) {
        
        let info = notification.userInfo! as NSDictionary
        let keyboardSize = (info.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0)
        
        self.scrolView?.contentInset = contentInsets
        self.scrolView?.scrollIndicatorInsets = contentInsets
        
    }
    
    @objc func keyboardWillBeHidden (notification: Notification) {
        
        let contentInsets = UIEdgeInsets.zero
        
        self.scrolView?.contentInset = contentInsets
        self.scrolView?.scrollIndicatorInsets = contentInsets
        
    }
    
    @objc func hideKeyBoard () {
        
        self.scrolView?.endEditing(true)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
