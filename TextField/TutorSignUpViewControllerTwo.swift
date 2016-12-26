//
//  TutorSignUpViewControllerTwo.swift
//  TutorMe
//
//  Created by Zoe on 12/25/16.
//  Copyright © 2016 CosmicMind. All rights reserved.
//

import UIKit
import Eureka

class TutorSignUpViewControllerTwo : FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*form +++
            Section() {
                var header = HeaderFooterView<EurekaLogoViewNib>(.nibFile(name: "EurekaSectionHeader", bundle: nil))
                header.onSetupView = { (view, section) -> () in
                    view.imageView.alpha = 0;
                    UIView.animate(withDuration: 2.0, animations: { [weak view] in
                        view?.imageView.alpha = 1
                    })
                    view.layer.transform = CATransform3DMakeScale(0.9, 0.9, 1)
                    UIView.animate(withDuration: 1.0, animations: { [weak view] in
                        view?.layer.transform = CATransform3DIdentity
                    })
                }
                $0.header = header
            }
            +++ Section("WeekDay cell")
            
            <<< WeekDayRow(){
                $0.value = [.monday, .wednesday, .friday]
            }
            
            <<< TextFloatLabelRow() {
                $0.title = "Float Label Row, type something to see.."
            }
            
            <<< IntFloatLabelRow() {
                $0.title = "Float Label Row, type something to see.."
        }*/
    }
}


class EurekaLogoViewNib: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class EurekaLogoView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let imageView = UIImageView(image: UIImage(named: "Eureka"))
        imageView.frame = CGRect(x: 0, y: 0, width: 320, height: 130)
        imageView.autoresizingMask = .flexibleWidth
        self.frame = CGRect(x: 0, y: 0, width: 320, height: 130)
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
