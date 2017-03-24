//
//  ViewController.swift
//  Pinterest
//
//  Created by Jessica Ellison on 3/23/17.
//  Copyright © 2017 JessCodes. All rights reserved.
//

import UIKit
import PinterestSDK

class ViewController: UIViewController {
  
  @IBOutlet weak var loginButton: UIButton!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
  }
  @IBAction func loginButtonTapped(_ sender: UIButton) {
    
    PDKClient.sharedInstance().authenticate(withPermissions:
      [PDKClientReadPublicPermissions,
       PDKClientWritePublicPermissions,
       PDKClientReadRelationshipsPermissions,
       PDKClientWriteRelationshipsPermissions], from: self, withSuccess: { (result) in
        //
        if ((result?.user().firstName!) != nil) {
          let name = result?.user().firstName!
          print("This person: \(name) signed in!")
        } else {
          
          print(result?.user().firstName! ?? "User does not have first name")
          
        }
        
    }) { (error) in
      //
    }
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

