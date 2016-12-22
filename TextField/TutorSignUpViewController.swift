//
//  TutorSignUpViewController.swift
//  TextField
//
//  Created by Zoe on 12/21/16.
//  Copyright © 2016 CosmicMind. All rights reserved.
//

import UIKit
import Eureka
import Material
import ChameleonFramework

class TutorSignUpViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(
            gradientStyle: UIGradientStyle.topToBottom,
            withFrame: self.view.frame,
            andColors: [ Color.blue.lighten5, Color.blue.lighten4 ]
        )
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

class CustomCellsController : FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form 
            /*Section() {
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
            }*/
            +++ Section()
            
            <<< WeekDayRow(){
                $0.value = [.monday, .wednesday, .friday]
            }
            
            <<< TextFloatLabelRow() {
                $0.title = "Float Label Row, type something to see.."
            }
            
            <<< IntFloatLabelRow() {
                $0.title = "Float Label Row, type something to see.."
            }
   
            
        
           
                +++ Section()
                
                <<< TextRow() {
                    $0.title = "Required Rule"
                    $0.add(rule: RuleRequired())
                    $0.validationOptions = .validatesOnChange
                }
                
                
                +++ Section()
                
                <<< TextRow() {
                    $0.title = "Email Rule"
                    $0.add(rule: RuleRequired())
                    var ruleSet = RuleSet<String>()
                    ruleSet.add(rule: RuleRequired())
                    ruleSet.add(rule: RuleEmail())
                    $0.add(ruleSet: ruleSet)
                    $0.validationOptions = .validatesOnChangeAfterBlurred
                }
                
                +++ Section()
                
                <<< URLRow() {
                    $0.title = "URL Rule"
                    $0.add(rule: RuleURL())
                    $0.validationOptions = .validatesOnChange
                    }
                    .cellUpdate { cell, row in
                        if !row.isValid {
                            cell.titleLabel?.textColor = .red
                        }
                }
                
                
                +++ Section()
                <<< PasswordRow() {
                    $0.title = "Password"
                    $0.add(rule: RuleMinLength(minLength: 8))
                    $0.add(rule: RuleMaxLength(maxLength: 13))
                    }
                    .cellUpdate { cell, row in
                        if !row.isValid {
                            cell.titleLabel?.textColor = .red
                        }
                }
                
                
                +++ Section()
                
                <<< IntRow() {
                    $0.title = "Range Rule"
                    $0.add(rule: RuleGreaterThan(min: 2))
                    $0.add(rule: RuleSmallerThan(max: 999))
                    }
                    .cellUpdate { cell, row in
                        if !row.isValid {
                            cell.titleLabel?.textColor = .red
                        }
                }
                
                +++ Section()
                
                <<< PasswordRow("password") {
                    $0.title = "Password"
                }
                <<< PasswordRow() {
                    $0.title = "Confirm Password"
                    $0.add(rule: RuleRequired())
                    }
                    .cellUpdate { cell, row in
                        if !row.isValid {
                            cell.titleLabel?.textColor = .red
                        }
                }
                
                
                +++ Section()
                
                <<< TextRow() {
                    $0.title = "Required Rule"
                    $0.add(rule: RuleRequired())
                    $0.validationOptions = .validatesOnChange
                    }
                    .cellUpdate { cell, row in
                        if !row.isValid {
                            cell.titleLabel?.textColor = .red
                        }
                    }
                    .onRowValidationChanged { cell, row in
                        let rowIndex = row.indexPath!.row
                        while row.section!.count > rowIndex + 1 && row.section?[rowIndex  + 1] is LabelRow {
                            row.section?.remove(at: rowIndex + 1)
                        }
                        if !row.isValid {
                            for (index, validationMsg) in row.validationErrors.map({ $0.msg }).enumerated() {
                                let labelRow = LabelRow() {
                                    $0.title = validationMsg
                                    $0.cell.height = { 30 }
                                }
                                row.section?.insert(labelRow, at: row.indexPath!.row + index + 1)
                            }
                        }
                }
                
                
                
                <<< EmailRow() {
                    $0.title = "Email Rule"
                    $0.add(rule: RuleRequired())
                    $0.add(rule: RuleEmail())
                    $0.validationOptions = .validatesOnChangeAfterBlurred
                    }
                    .cellUpdate { cell, row in
                        if !row.isValid {
                            cell.titleLabel?.textColor = .red
                        }
                    }
                    .onRowValidationChanged { cell, row in
                        let rowIndex = row.indexPath!.row
                        while row.section!.count > rowIndex + 1 && row.section?[rowIndex  + 1] is LabelRow {
                            row.section?.remove(at: rowIndex + 1)
                        }
                        if !row.isValid {
                            for (index, validationMsg) in row.validationErrors.map({ $0.msg }).enumerated() {
                                let labelRow = LabelRow() {
                                    $0.title = validationMsg
                                    $0.cell.height = { 30 }
                                }
                                row.section?.insert(labelRow, at: row.indexPath!.row + index + 1)
                            }
                        }
                }
                
                
                
                <<< URLRow() {
                    $0.title = "URL Rule"
                    $0.add(rule: RuleURL())
                    $0.validationOptions = .validatesOnChange
                    }
                    .cellUpdate { cell, row in
                        if !row.isValid {
                            cell.titleLabel?.textColor = .red
                        }
                    }
                    .onRowValidationChanged { cell, row in
                        let rowIndex = row.indexPath!.row
                        while row.section!.count > rowIndex + 1 && row.section?[rowIndex  + 1] is LabelRow {
                            row.section?.remove(at: rowIndex + 1)
                        }
                        if !row.isValid {
                            for (index, validationMsg) in row.validationErrors.map({ $0.msg }).enumerated() {
                                let labelRow = LabelRow() {
                                    $0.title = validationMsg
                                    $0.cell.height = { 30 }
                                }
                                row.section?.insert(labelRow, at: row.indexPath!.row + index + 1)
                            }
                        }
                }
                
                
                <<< PasswordRow() {
                    $0.title = "Password"
                    $0.add(rule: RuleMinLength(minLength: 8))
                    $0.add(rule: RuleMaxLength(maxLength: 13))
                    }
                    .cellUpdate { cell, row in
                        if !row.isValid {
                            cell.titleLabel?.textColor = .red
                        }
                    }
                    .onRowValidationChanged { cell, row in
                        let rowIndex = row.indexPath!.row
                        while row.section!.count > rowIndex + 1 && row.section?[rowIndex  + 1] is LabelRow {
                            row.section?.remove(at: rowIndex + 1)
                        }
                        if !row.isValid {
                            for (index, validationMsg) in row.validationErrors.map({ $0.msg }).enumerated() {
                                let labelRow = LabelRow() {
                                    $0.title = validationMsg
                                    $0.cell.height = { 30 }
                                }
                                row.section?.insert(labelRow, at: row.indexPath!.row + index + 1)
                            }
                        }
                }
                
                
                <<< PasswordRow() {
                    $0.title = "Confirm Password"
                    $0.add(rule: RuleRequired())
                    }
                    .cellUpdate { cell, row in
                        if !row.isValid {
                            cell.titleLabel?.textColor = .red
                        }
                    }
                    .onRowValidationChanged { cell, row in
                        let rowIndex = row.indexPath!.row
                        while row.section!.count > rowIndex + 1 && row.section?[rowIndex  + 1] is LabelRow {
                            row.section?.remove(at: rowIndex + 1)
                        }
                        if !row.isValid {
                            for (index, validationMsg) in row.validationErrors.map({ $0.msg }).enumerated() {
                                let labelRow = LabelRow() {
                                    $0.title = validationMsg
                                    $0.cell.height = { 30 }
                                }
                                row.section?.insert(labelRow, at: row.indexPath!.row + index + 1)
                            }
                        }
                }
                
                
                
                <<< IntRow() {
                    $0.title = "Range Rule"
                    $0.add(rule: RuleGreaterThan(min: 2))
                    $0.add(rule: RuleSmallerThan(max: 999))
                    }
                    .cellUpdate { cell, row in
                        if !row.isValid {
                            cell.titleLabel?.textColor = .red
                        }
                    }
                    .onRowValidationChanged { cell, row in
                        let rowIndex = row.indexPath!.row
                        while row.section!.count > rowIndex + 1 && row.section?[rowIndex  + 1] is LabelRow {
                            row.section?.remove(at: rowIndex + 1)
                        }
                        if !row.isValid {
                            for (index, validationMsg) in row.validationErrors.map({ $0.msg }).enumerated() {
                                let labelRow = LabelRow() {
                                    $0.title = validationMsg
                                    $0.cell.height = { 30 }
                                }
                                row.section?.insert(labelRow, at: row.indexPath!.row + index + 1)
                            }
                        }
                }
                
                
                +++ Section()
                <<< ButtonRow() {
                    $0.title = "Tap to force form validation"
                    }
                    .onCellSelection { cell, row in
                        row.section?.form?.validate()
            }
        LabelRow.defaultCellUpdate = { cell, row in
            cell.contentView.backgroundColor = .red
            cell.textLabel?.textColor = .white
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 13)
            cell.textLabel?.textAlignment = .right
            
        }
        
        TextRow.defaultCellUpdate = { cell, row in
            if !row.isValid {
                cell.titleLabel?.textColor = .red
            }
        }

        
        
        }
    }

