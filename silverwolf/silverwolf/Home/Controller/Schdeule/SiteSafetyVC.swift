//
//  SiteSafetyVC.swift
//  silverwolf
//
//  Created by Mac on 20/04/22.
//

import UIKit

class SiteSafetyVC: UIViewController, ExpandableHeaderViewDelegate {

    @IBOutlet weak var SiteSafetyTV: UITableView!


    var sections = [
        Section(genre: "1. Site Details",
                movies: [""],
                expanded: false),
        Section(genre: "2. Claim Information",
                movies: [""],
                expanded: false),
        Section(genre: "3. Building Information",
                movies: [""],
                expanded: false),
        Section(genre: "4. Claim Description",
                movies: [""],
                expanded: false),
        Section(genre: "5. Resultant Damage",
                movies: [""],
                expanded: false),
        Section(genre: "6. Maintenance/Non-event Issues",
                movies: [""],
                expanded: false),
        Section(genre: "7. Conclusion",
                movies: [""],
                expanded: false),
        Section(genre: "8. Make Safe Works",
                movies: [""],
                expanded: false),
        Section(genre: "9. Resultant Damage Repair Recommendations/scope Of Works",
                movies: [""],
                expanded: false),
        Section(genre: "10. Maintenance/remedial Damage Repair Recommendations/scope Of Works",
                movies: [""],
                expanded: false),
        Section(genre: "11. Site Photos",
                movies: [""],
                expanded: false),
        Section(genre: "12. Mud Plan/sketch",
                movies: [""],
                expanded: false)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        self.SiteSafetyTV.register(UINib(nibName: "SiteDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "SiteDetailsTableViewCell")
        self.SiteSafetyTV.register(UINib(nibName: "ClaimInformationTableCell", bundle: nil), forCellReuseIdentifier: "ClaimInformationTableCell")
        self.SiteSafetyTV.register(UINib(nibName: "BuildingInformationTableCell", bundle: nil), forCellReuseIdentifier: "BuildingInformationTableCell")
        self.SiteSafetyTV.register(UINib(nibName: "ClaimDescTableViewCell", bundle: nil), forCellReuseIdentifier: "ClaimDescTableViewCell")
        self.SiteSafetyTV.register(UINib(nibName: "ResultantTableViewCell", bundle: nil), forCellReuseIdentifier: "ResultantTableViewCell")
        self.SiteSafetyTV.register(UINib(nibName: "MaintenanceIssuesTableViewCell", bundle: nil), forCellReuseIdentifier: "MaintenanceIssuesTableViewCell")
        self.SiteSafetyTV.register(UINib(nibName: "ConclusionTableCell", bundle: nil), forCellReuseIdentifier: "ConclusionTableCell")
        self.SiteSafetyTV.register(UINib(nibName: "MakeSafeWorksTableCell", bundle: nil), forCellReuseIdentifier: "MakeSafeWorksTableCell")
        self.SiteSafetyTV.register(UINib(nibName: "ResultantDamageTableCell", bundle: nil), forCellReuseIdentifier: "ResultantDamageTableCell")
        self.SiteSafetyTV.register(UINib(nibName: "MaintenanceDamageTableCell", bundle: nil), forCellReuseIdentifier: "MaintenanceDamageTableCell")
        self.SiteSafetyTV.register(UINib(nibName: "SitePhotosTableCell", bundle: nil), forCellReuseIdentifier: "SitePhotosTableCell")

    }



}

extension SiteSafetyVC : UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].movies.count
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        if let footer = view as? UITableViewHeaderFooterView {
            footer.contentView.backgroundColor = UIColor.white
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.customInit(title: sections[section].genre, section: section, delegate: self)
        return header
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
        let cell = SiteSafetyTV.dequeueReusableCell(withIdentifier: "SiteDetailsTableViewCell", for: indexPath) as! SiteDetailsTableViewCell

            return cell
        }else if indexPath.section == 1 {
            let cell = SiteSafetyTV.dequeueReusableCell(withIdentifier: "ClaimInformationTableCell", for: indexPath) as! ClaimInformationTableCell

                return cell
        }else if indexPath.section == 2 {
            let cell = SiteSafetyTV.dequeueReusableCell(withIdentifier: "BuildingInformationTableCell", for: indexPath) as! BuildingInformationTableCell

                return cell
        }else if indexPath.section == 3 {
            let cell = SiteSafetyTV.dequeueReusableCell(withIdentifier: "ClaimDescTableViewCell", for: indexPath) as! ClaimDescTableViewCell

                return cell
        }else if indexPath.section == 4 {
            let cell = SiteSafetyTV.dequeueReusableCell(withIdentifier: "ResultantTableViewCell", for: indexPath) as! ResultantTableViewCell

                return cell
        }else if indexPath.section == 5 {
            let cell = SiteSafetyTV.dequeueReusableCell(withIdentifier: "MaintenanceIssuesTableViewCell", for: indexPath) as! MaintenanceIssuesTableViewCell

                return cell
        }else if indexPath.section == 6 {
            let cell = SiteSafetyTV.dequeueReusableCell(withIdentifier: "ConclusionTableCell", for: indexPath) as! ConclusionTableCell

                return cell
        }else if indexPath.section == 7 {
            let cell = SiteSafetyTV.dequeueReusableCell(withIdentifier: "MakeSafeWorksTableCell", for: indexPath) as! MakeSafeWorksTableCell

                return cell
        }else if indexPath.section == 8 {
            let cell = SiteSafetyTV.dequeueReusableCell(withIdentifier: "ResultantDamageTableCell", for: indexPath) as! ResultantDamageTableCell

                return cell
        }else if indexPath.section == 9 {
            let cell = SiteSafetyTV.dequeueReusableCell(withIdentifier: "MaintenanceDamageTableCell", for: indexPath) as! MaintenanceDamageTableCell

                return cell
        }else if indexPath.section == 10 {
            let cell = SiteSafetyTV.dequeueReusableCell(withIdentifier: "SitePhotosTableCell", for: indexPath) as! SitePhotosTableCell

                return cell
        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell")!
//       // cell.textLabel?.text = sections[indexPath.section].movies[indexPath.row]
        return UITableViewCell()
    }

    func toggleSection(header: ExpandableHeaderView, section: Int) {
        sections[section].expanded = !sections[section].expanded


        SiteSafetyTV.beginUpdates()
        for i in 0 ..< sections[section].movies.count {
            SiteSafetyTV.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        SiteSafetyTV.endUpdates()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (sections[indexPath.section].expanded) {
            if indexPath.section == 0 {
                return 560
            }else if indexPath.section == 1 {
                return 463
            }else if indexPath.section == 2 {
                return 1480
            }else if indexPath.section == 3 {
                return 250
            }else if indexPath.section == 4 {
                return 460
            }else if indexPath.section == 5 {
                return 520
            }else if indexPath.section == 6 {
                return 250
            }else if indexPath.section == 7 {
                return 350
            }else if indexPath.section == 8 {
                return 580
            }else if indexPath.section == 9 {
                return 590
            }else if indexPath.section == 10 {
                return 590
            }else {
            return 660
            }
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let simpleVC = SimpleVC()
//        simpleVC.customInit(imageName: sections[indexPath.section].movies[indexPath.row])
//        tableView.deselectRow(at: indexPath, animated: true)
//        self.navigationController?.pushViewController(simpleVC, animated: true)
    }

}
