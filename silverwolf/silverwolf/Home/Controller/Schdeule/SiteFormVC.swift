//
//  SiteFormVC.swift
//  silverwolf
//
//  Created by Mac on 28/04/22.
//

import UIKit

class SiteFormVC: UIViewController {

    @IBOutlet weak var SiteFormTV: UITableView!
    
    var thereIsCellTapped = false
    var selectedRowIndex = -1
    override func viewDidLoad() {
        super.viewDidLoad()

        self.SiteFormTV.register(UINib(nibName: "SiteDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "SiteDetailsTableViewCell")
        self.SiteFormTV.register(UINib(nibName: "ClaimInformationTableCell", bundle: nil), forCellReuseIdentifier: "ClaimInformationTableCell")
        self.SiteFormTV.register(UINib(nibName: "BuildingInformationTableCell", bundle: nil), forCellReuseIdentifier: "BuildingInformationTableCell")
        self.SiteFormTV.register(UINib(nibName: "ClaimDescTableViewCell", bundle: nil), forCellReuseIdentifier: "ClaimDescTableViewCell")
        self.SiteFormTV.register(UINib(nibName: "ResultantTableViewCell", bundle: nil), forCellReuseIdentifier: "ResultantTableViewCell")
        self.SiteFormTV.register(UINib(nibName: "MaintenanceIssuesTableViewCell", bundle: nil), forCellReuseIdentifier: "MaintenanceIssuesTableViewCell")
        self.SiteFormTV.register(UINib(nibName: "ConclusionTableCell", bundle: nil), forCellReuseIdentifier: "ConclusionTableCell")
        self.SiteFormTV.register(UINib(nibName: "MakeSafeWorksTableCell", bundle: nil), forCellReuseIdentifier: "MakeSafeWorksTableCell")
        self.SiteFormTV.register(UINib(nibName: "ResultantDamageTableCell", bundle: nil), forCellReuseIdentifier: "ResultantDamageTableCell")
        self.SiteFormTV.register(UINib(nibName: "MaintenanceDamageTableCell", bundle: nil), forCellReuseIdentifier: "MaintenanceDamageTableCell")
        self.SiteFormTV.register(UINib(nibName: "SitePhotosTableCell", bundle: nil), forCellReuseIdentifier: "SitePhotosTableCell")
    }
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension SiteFormVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
        let cell = SiteFormTV.dequeueReusableCell(withIdentifier: "SiteDetailsTableViewCell", for: indexPath) as! SiteDetailsTableViewCell

            return cell
        }else if indexPath.row == 1{
            let cell = SiteFormTV.dequeueReusableCell(withIdentifier: "ClaimInformationTableCell", for: indexPath) as! ClaimInformationTableCell

                return cell
        }else if indexPath.row == 2{
            let cell = SiteFormTV.dequeueReusableCell(withIdentifier: "BuildingInformationTableCell", for: indexPath) as! BuildingInformationTableCell

                return cell
        }else if indexPath.row == 3{
            let cell = SiteFormTV.dequeueReusableCell(withIdentifier: "ClaimDescTableViewCell", for: indexPath) as! ClaimDescTableViewCell

                return cell
        }else if indexPath.row == 4{
            let cell = SiteFormTV.dequeueReusableCell(withIdentifier: "ResultantTableViewCell", for: indexPath) as! ResultantTableViewCell

                return cell
        }else if indexPath.row == 5 {
            let cell = SiteFormTV.dequeueReusableCell(withIdentifier: "MaintenanceIssuesTableViewCell", for: indexPath) as! MaintenanceIssuesTableViewCell

                return cell
        }else if indexPath.row == 6 {
            let cell = SiteFormTV.dequeueReusableCell(withIdentifier: "ConclusionTableCell", for: indexPath) as! ConclusionTableCell

                return cell
        }else if indexPath.row == 7 {
            let cell = SiteFormTV.dequeueReusableCell(withIdentifier: "MakeSafeWorksTableCell", for: indexPath) as! MakeSafeWorksTableCell

                return cell
        }else if indexPath.row == 8 {
            let cell = SiteFormTV.dequeueReusableCell(withIdentifier: "ResultantDamageTableCell", for: indexPath) as! ResultantDamageTableCell

                return cell
        }else if indexPath.row == 9 {
            let cell = SiteFormTV.dequeueReusableCell(withIdentifier: "MaintenanceDamageTableCell", for: indexPath) as! MaintenanceDamageTableCell

                return cell
        }else if indexPath.row == 10 {
            let cell = SiteFormTV.dequeueReusableCell(withIdentifier: "SitePhotosTableCell", for: indexPath) as! SitePhotosTableCell

                return cell
        }
//        else if indexPath.row == 11 {
//            let cell = SiteFormTV.dequeueReusableCell(withIdentifier: "ExpandableFormTableViewCell", for: indexPath) as! ExpandableFormTableViewCell
//
//                return cell
//        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            if indexPath.row == selectedRowIndex {
                return 1000 //Expanded
            }
            return 60 //Not expanded
        }else if  indexPath.row == 1 {
            if indexPath.row == selectedRowIndex {
                return 640 //Expanded
            }
            return 60 //Not expanded
        }else if  indexPath.row == 2 {
            if indexPath.row == selectedRowIndex {
                return 1420 //Expanded
            }
            return 60 //Not expanded
        }else if  indexPath.row == 3 {
            if indexPath.row == selectedRowIndex {
                return 255 //Expanded
            }
            return 60 //Not expanded
        }else if  indexPath.row == 4 {
            if indexPath.row == selectedRowIndex {
                return 460 //Expanded
            }
            return 60 //Not expanded
        }
        else if  indexPath.row == 5 {
            if indexPath.row == selectedRowIndex {
                return 500 //Expanded
            }
            return 60 //Not expanded
        }
        else if  indexPath.row == 6 {
            if indexPath.row == selectedRowIndex {
                return 460 //Expanded
            }
            return 60 //Not expanded
        }
        else if  indexPath.row == 7 {
            if indexPath.row == selectedRowIndex {
                return 460 //Expanded
            }
            return 60 //Not expanded
        }
        else if  indexPath.row == 8 {
            if indexPath.row == selectedRowIndex {
                return 460 //Expanded
            }
            return 95 //Not expanded
        }
        else if  indexPath.row == 9 {
            if indexPath.row == selectedRowIndex {
                return 460 //Expanded
            }
            return 125 //Not expanded
        }
        else if  indexPath.row == 10 {
            if indexPath.row == selectedRowIndex {
                return 460 //Expanded
            }
            return 70 //Not expanded
        }
//        else if  indexPath.row == 11 {
//            if indexPath.row == selectedRowIndex {
//                return 460 //Expanded
//            }
//            return 70 //Not expanded
//        }
        return 1
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if selectedRowIndex == indexPath.row {
                selectedRowIndex = -1
            } else {
                selectedRowIndex = indexPath.row
            }
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
}
