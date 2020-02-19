//
//  TableViewController.swift
//  VIT Faculty
//
//  Created by Aneesh Prabu on 03/08/19.
//  Copyright © 2019 Aneesh Prabu. All rights reserved.
//

import UIKit


fileprivate struct cellData {
    var opened = Bool()
    var Name = String()
    var Prefix = String()
    var sectionData = [String]()
}

class TableViewController: UITableViewController {
    
    //MARK: - Initialize variables
    var dataManager = DataManager()
    fileprivate var tableViewData = [cellData]()
    var selectedRow = IndexPath()

    
    
    //MARK: - Searching outlets and variables
    @IBOutlet var searchBar: UISearchBar!
    var isSearching: Bool = false
    fileprivate var filteredData = [cellData]()
    
    
    

    
    
    //MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInset = UIEdgeInsets.zero
        
        configureNavigator()
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.search

        
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
            
            tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        }
        
        
    }
    

    // MARK: - Table view delegate

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        if isSearching {
            return filteredData.count
        } else {
            return tableViewData.count
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

            return 1
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.clipsToBounds = true
        
        if tableViewData[indexPath.section].opened == true {
            cell.accessoryType = .detailButton
        }else {
            cell.accessoryType = .detailDisclosureButton
        }
        cell.selectionStyle = .gray

        
        if isSearching {
            cell.EmpID.text = filteredData[indexPath.section].sectionData[0]
            cell.Name.text = filteredData[indexPath.section].sectionData[1]
            cell.Prefix.text = filteredData[indexPath.section].sectionData[2]
            cell.SchoolName.text = filteredData[indexPath.section].sectionData[3]
            cell.BuildingName.text = filteredData[indexPath.section].sectionData[4]
            cell.FloorNo.text = filteredData[indexPath.section].sectionData[5]
            cell.CabinLocation.text = filteredData[indexPath.section].sectionData[6]
            cell.RoomNo.text = filteredData[indexPath.section].sectionData[7]
            cell.CabinNo.text = filteredData[indexPath.section].sectionData[8]
            cell.IntercomNumber.text = filteredData[indexPath.section].sectionData[9]
            cell.Email.text = filteredData[indexPath.section].sectionData[10]
            
            return cell
        }
        else {
            if indexPath.row == 0 {


                cell.EmpID.text = tableViewData[indexPath.section].sectionData[0]
                cell.Name.text = tableViewData[indexPath.section].sectionData[1]
                cell.Prefix.text = tableViewData[indexPath.section].sectionData[2]
                cell.SchoolName.text = tableViewData[indexPath.section].sectionData[3]
                cell.BuildingName.text = tableViewData[indexPath.section].sectionData[4]
                cell.FloorNo.text = tableViewData[indexPath.section].sectionData[5]
                cell.CabinLocation.text = tableViewData[indexPath.section].sectionData[6]
                cell.RoomNo.text = tableViewData[indexPath.section].sectionData[7]
                cell.CabinNo.text = tableViewData[indexPath.section].sectionData[8]
                cell.IntercomNumber.text = tableViewData[indexPath.section].sectionData[9]
                cell.Email.text = tableViewData[indexPath.section].sectionData[10]

                return cell
            }
        return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

            
        if tableViewData[indexPath.section].opened == true {
            tableViewData[indexPath.section].opened = false
            
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .right)
            
        }
        else {
            tableViewData[indexPath.section].opened = true
            
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .left)
            
        }

    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableViewData[indexPath.section].opened == true {
            
            return 150

        }
        else {
            return 70
        }
    }
    
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        selectedRow = indexPath
        performSegue(withIdentifier: "goToFullDescription", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFullDescription" {
            let destinationVC = segue.destination as! DetailViewController
            
            if isSearching == true {
                
                destinationVC.isSearching = true
                
                destinationVC.EmpID = filteredData[selectedRow.section].sectionData[0]
                print(destinationVC.EmpID)
                
                
                
                destinationVC.Name = filteredData[selectedRow.section].sectionData[1]
                destinationVC.Prefix = filteredData[selectedRow.section].sectionData[2]
                destinationVC.School = filteredData[selectedRow.section].sectionData[3]
                
                destinationVC.Building = filteredData[selectedRow.section].sectionData[4]
                destinationVC.Location = filteredData[selectedRow.section].sectionData[6]
                destinationVC.CabinNo = filteredData[selectedRow.section].sectionData[7]
                
                destinationVC.Email = filteredData[selectedRow.section].sectionData[10]
                
            }
            
            destinationVC.selectedRow = self.selectedRow
            
        }
    }
    
    
    
    
    //MARK: - Navigation config
 
    private func configureNavigator() {
        guard let navigationController = navigationController else { return }
        navigationController.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .compact)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        navigationController.view.backgroundColor = .clear
        
    }

    
    
}


//MARK: - Search bar methods

extension TableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" || searchBar.text?.count == 0{
            isSearching = false
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
            view.endEditing(true)
            tableView.reloadData()
            
        }
        else {
            isSearching = true
            filteredData = tableViewData.filter({$0.Name.prefix(searchText.count) == searchText})
            tableView.reloadData()
        }
    }
    
}
