//
//  ViewController.swift
//  Companion Taxi
//
//  Created by Malika on 12/04/22.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        ref = Database.database().reference()

        ref.child("drivers").getData(completion:  { error, snapshot in
          guard error == nil else {
            print(error!.localizedDescription)
            return;
          }
          let userName = snapshot.value as? String ?? "Unknown";
        })
    }


}

