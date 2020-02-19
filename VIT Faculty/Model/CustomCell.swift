//
//  CustomCell.swift
//  VIT Faculty
//
//  Created by Aneesh Prabu on 03/08/19.
//  Copyright © 2019 Aneesh Prabu. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var EmpID: UILabel!
    @IBOutlet weak var Prefix: UILabel!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var SchoolName: UILabel!
    @IBOutlet weak var BuildingName: UILabel!
    @IBOutlet weak var FloorNo: UILabel!
    @IBOutlet weak var CabinLocation: UILabel!
    @IBOutlet weak var RoomNo: UILabel!
    @IBOutlet weak var CabinNo: UILabel!
    @IBOutlet weak var IntercomNumber: UILabel!
    @IBOutlet weak var Email: UILabel!
    
    
    
    @IBOutlet var Dept: UILabel!
    @IBOutlet var _EmpID: UILabel!
    @IBOutlet var CabinDetails: UILabel!
    @IBOutlet var Floor: UILabel!
    @IBOutlet var _CabinNumber: UILabel!
    @IBOutlet var _Intercom: UILabel!
    @IBOutlet var _Email: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.white


        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
