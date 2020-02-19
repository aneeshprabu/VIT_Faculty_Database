//
//  DetailViewController.swift
//  VIT Faculty
//
//  Created by Aneesh Prabu on 06/08/19.
//  Copyright © 2019 Aneesh Prabu. All rights reserved.
//

import UIKit

fileprivate struct cellData {
    var opened = Bool()
    var Name = String()
    var Prefix = String()
    var sectionData = [String]()
}


class DetailViewController: UIViewController {
    
    //MARK: - Initialize View Controller
    var imageView = UIImage()
    var selectedRow = IndexPath()
    var dataManager = DataManager()
    fileprivate var tableViewData = [cellData]()
    var isSearching = false
    var EmpID: String = ""
    var Name: String = ""
    var Prefix: String = ""
    var School: String = ""
    var Building: String = ""
    var Location: String = ""
    var CabinNo: String = ""
    var Email: String = ""

    
    
    //MARK: - Initialize outlets
    @IBOutlet var _Name: UILabel!
    @IBOutlet var _Email: UILabel!
    @IBOutlet var _Prefix: UILabel!
    @IBOutlet var _School: UILabel!
    @IBOutlet var _Building: UILabel!
    @IBOutlet var _Location: UILabel!
    @IBOutlet var _CabinNo: UILabel!
    @IBOutlet var _IntercomNumber: UILabel!
    @IBOutlet var facultyImage: UIImageView!
    
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let navigationController = navigationController else { return }
        
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .compact)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        navigationController.view.backgroundColor = .white
        

        for data in dataManager.allSheet1s() {
            let dataInCell = cellData(opened: false, Name: data.item2!,
                                      Prefix: data.item1!, sectionData: [data.item0!,
                                                                         data.item2!,
                                                                         data.item1!,
                                                                         data.item3!,
                                                                         data.item4!,
                                                                         data.item5!,
                                                                         data.item6!,
                                                                         data.item7!,
                                                                         data.item8!,
                                                                         data.item9!,
                                                                         data.item10!
                ])
            
            tableViewData.append(dataInCell)
        }
        
        if isSearching {
            
            facultyImage.image = UIImage(imageLiteralResourceName: EmpID)
            _Name.text = Name
            _Prefix.text = Prefix
            _School.text = School
            _Building.text = Building
            _Location.text = Location
            _CabinNo.text = CabinNo
            _Email.text = Email

        } else
        
        if isSearching == false {
        
            EmpID = tableViewData[selectedRow.section].sectionData[0].trimmingCharacters(in: .whitespacesAndNewlines)
            
            facultyImage.image = UIImage(imageLiteralResourceName: EmpID)

            _Name.text = tableViewData[selectedRow.section].sectionData[1].trimmingCharacters(in: .whitespacesAndNewlines)
            _Prefix.text = tableViewData[selectedRow.section].sectionData[2].trimmingCharacters(in: .whitespacesAndNewlines)
            _School.text = tableViewData[selectedRow.section].sectionData[3].trimmingCharacters(in: .whitespacesAndNewlines)

            _Building.text = tableViewData[selectedRow.section].sectionData[4].trimmingCharacters(in: .whitespacesAndNewlines)
            _Location.text = tableViewData[selectedRow.section].sectionData[6].trimmingCharacters(in: .whitespacesAndNewlines)
            _CabinNo.text = tableViewData[selectedRow.section].sectionData[7].trimmingCharacters(in: .whitespacesAndNewlines)

            _Email.text = tableViewData[selectedRow.section].sectionData[10].trimmingCharacters(in: .whitespacesAndNewlines)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
