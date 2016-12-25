//
//  AboutThisAppViewController.swift
//  TutorMe
//
//  Created by Zoe on 12/24/16.
//  Copyright © 2016 CosmicMind. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

var currentUserIsTutor: Bool?

class AboutThisAppViewController: UIViewController {
    var isTutor: Bool?
    var ref: FIRDatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
         self.view.addBackground(imageName: "mixed2")
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressedOkay(_ sender: Any) {
        let userID = FIRAuth.auth()?.currentUser?.uid
        ref = FIRDatabase.database().reference()
        
        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            self.isTutor = value?["isTutor"] as? Bool
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
        if isTutor != nil {
            if isTutor == true {
                let storyboard = UIStoryboard(name: "Tutor", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "tutorPagingMenuNC") as! UINavigationController
                self.present(controller, animated: true, completion: nil)
            } else {
                let storyboard = UIStoryboard(name: "Tutee", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "tuteePagingMenuNC") as! UINavigationController
                self.present(controller, animated: true, completion: nil)
            }
        }

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
