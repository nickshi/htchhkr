//
//  LetSidePanelVC.swift
//  htchhkr
//
//  Created by nick.shi on 3/2/18.
//  Copyright © 2018 nick.shi. All rights reserved.
//

import UIKit
import Firebase

class LeftSidePanelVC: UIViewController {

    @IBOutlet weak var lblAccountType: UILabel!
    @IBOutlet weak var userImageView: RoundImageView!
    @IBOutlet weak var loginOutbtn: UIButton!
    @IBOutlet weak var pickupModeSwitch: UISwitch!
    @IBOutlet weak var lblPickupMode: UILabel!
    @IBOutlet weak var lblUserEmail: UILabel!
    
    let appDelegate = AppDelegate.getAppDelegate()
    
    let currentUserId = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pickupModeSwitch.isOn = false
        pickupModeSwitch.isHidden = true
        lblPickupMode.isHidden = true
        userImageView.isHidden = true
        lblPickupMode.isHidden = true
 
        
        observePassengersAndDrivers()
        
        if Auth.auth().currentUser == nil {
            lblUserEmail.text = ""
            lblAccountType.text = ""
            userImageView.isHidden = true
            loginOutbtn.setTitle("Sign Up / Login", for: .normal)
        } else {
            lblUserEmail.text = Auth.auth().currentUser?.email
            lblAccountType.text = ""
            userImageView.isHidden = false
            loginOutbtn.setTitle("Logout", for: .normal)
        }
    }
    
    @IBAction func switchWasToggled(_ sender: Any) {
        if pickupModeSwitch.isOn {
            lblPickupMode.text = "PICKUP MODE ENABLED"
            DataService.instance.REF_DRIVERS.child(currentUserId!).updateChildValues(["isPickupModeEnable": true])
        } else {
            lblPickupMode.text = "PICKUP MODE DISABLED"
            DataService.instance.REF_DRIVERS.child(currentUserId!).updateChildValues(["isPickupModeEnable": false])
        }
        appDelegate.MenuContainerVC.toggleLeftPanel()
    }
    func observePassengersAndDrivers() {
        DataService.instance.REF_USERS.observeSingleEvent(of: .value) { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    if snap.key == Auth.auth().currentUser?.uid {
                        self.lblAccountType.text = "PASSENGER"
                    }
                }
            }
        }
        
        DataService.instance.REF_DRIVERS.observeSingleEvent(of: .value) { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    if snap.key == Auth.auth().currentUser?.uid {
                        self.lblAccountType.text = "DRIVER"
                        self.pickupModeSwitch.isHidden = false
                        
                        let switchStatus = snap.childSnapshot(forPath: "isPickupModeEnable").value as! Bool
                        self.pickupModeSwitch.isOn = switchStatus
                        self.lblPickupMode.isHidden = false
                    }
                }
            }
        }
    }
    
    @IBAction func signupLoginBtnPressed(_ sender: Any) {
        
        if Auth.auth().currentUser == nil {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            
            let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
            present(loginVC!, animated: true, completion: nil)
        } else {
            do {
                try Auth.auth().signOut()
                lblUserEmail.text = ""
                lblAccountType.text = ""
                userImageView.isHidden = true
                lblPickupMode.isHidden = true
                pickupModeSwitch.isHidden = true
                lblPickupMode.isHidden = true
                loginOutbtn.setTitle("Sign Up / Login", for: .normal)
            } catch (let error) {
                print(error)
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
