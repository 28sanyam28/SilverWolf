////
////  SiteSafetyAssessmentFormVC.swift
////  silverwolf
////
////  Created by Mac on 14/04/22.
////
//
//import UIKit
//
//class SiteSafetyAssessmentFormVC: UIViewController {
//
//
//    @IBOutlet weak var siteFormTV: UITableView!
//
//    var arr = [String?]()
//    var hiddenSections = Set<Int>()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.arr = ["","",""]
//        self.siteFormTV.register(UINib(nibName: "SiteDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "SiteDetailsTableViewCell")
//        self.siteFormTV.register(UINib(nibName: "ClaimInformationTableCell", bundle: nil), forCellReuseIdentifier: "ClaimInformationTableCell")
//        self.siteFormTV.register(UINib(nibName: "BuildingInformationTableCell", bundle: nil), forCellReuseIdentifier: "BuildingInformationTableCell")
//        self.siteFormTV.register(UINib(nibName: "ClaimDescTableViewCell", bundle: nil), forCellReuseIdentifier: "ClaimDescTableViewCell")
//        self.siteFormTV.register(UINib(nibName: "ResultantTableViewCell", bundle: nil), forCellReuseIdentifier: "ResultantTableViewCell")
//        self.siteFormTV.estimatedRowHeight = 40
//        self.siteFormTV.rowHeight = UITableView.automaticDimension
//
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
//
//
//
//extension SiteSafetyAssessmentFormVC: UITableViewDelegate, UITableViewDataSource{
//
////    func numberOfSections(in tableView: UITableView) -> Int {
////        return 5
////    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        if self.hiddenSections.contains(section) {
////            return 0
////        }
//
//        return 5
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        if indexPath.row == 0 {
//        let cell = siteFormTV.dequeueReusableCell(withIdentifier: "SiteDetailsTableViewCell", for: indexPath) as! SiteDetailsTableViewCell
//        cell.layer.borderWidth = 1
//        cell.layer.borderColor = UIColor.lightGray.cgColor
//        cell.isExpanded = false
//
//            return cell
//        } else if indexPath.row == 1 {
//            let cell = siteFormTV.dequeueReusableCell(withIdentifier: "ClaimInformationTableCell", for: indexPath) as! ClaimInformationTableCell
//            cell.layer.borderWidth = 1
//            cell.layer.borderColor = UIColor.lightGray.cgColor
//            cell.isExpanded = false
//
//                return cell
//        }else if indexPath.row == 2 {
//            let cell = siteFormTV.dequeueReusableCell(withIdentifier: "BuildingInformationTableCell", for: indexPath) as! BuildingInformationTableCell
//            cell.layer.borderWidth = 1
//            cell.layer.borderColor = UIColor.lightGray.cgColor
//           cell.isExpanded = false
//
//                return cell
//        }else if indexPath.row == 3 {
//            let cell = siteFormTV.dequeueReusableCell(withIdentifier: "ClaimDescTableViewCell", for: indexPath) as! ClaimDescTableViewCell
//            cell.layer.borderWidth = 1
//            cell.layer.borderColor = UIColor.lightGray.cgColor
//            cell.isExpanded = false
//
//                return cell
//        }else if indexPath.row == 4 {
//            let cell = siteFormTV.dequeueReusableCell(withIdentifier: "ResultantTableViewCell", for: indexPath) as! ResultantTableViewCell
//            cell.layer.borderWidth = 1
//            cell.layer.borderColor = UIColor.lightGray.cgColor
//            cell.isExpanded = false
//
//                return cell
//        }
//
//        return UITableViewCell()
//    }
//
////    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
////        let sectionButton = UIButton()
////        sectionButton.setTitle(String(section),
////                               for: .normal)
////        sectionButton.backgroundColor = .systemBlue
////        sectionButton.tag = section
////        sectionButton.addTarget(self,
////                                action: #selector(self.hideSection(sender:)),
////                                for: .touchUpInside)
////
////        return sectionButton
////    }
////
////    @objc
////    private func hideSection(sender: UIButton) {
////        let section = sender.tag
////
////        func indexPathsForSection() -> [IndexPath] {
////            var indexPaths = [IndexPath]()
////
////            for row in 0..<5 {
////                indexPaths.append(IndexPath(row: row,
////                                            section: section))
////            }
////
////            return indexPaths
////        }
////
////        if self.hiddenSections.contains(section) {
////            self.hiddenSections.remove(section)
////            self.siteFormTV.insertRows(at: indexPathsForSection(),
////                                      with: .fade)
////        } else {
////            self.hiddenSections.insert(section)
////            self.siteFormTV.deleteRows(at: indexPathsForSection(),
////                                      with: .fade)
////        }
////    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 0{
//            guard let cell = tableView.cellForRow(at: indexPath) as? SiteDetailsTableViewCell
//                   else { return }
//
//                   UIView.animate(withDuration: 0.3, animations: {
//                       tableView.beginUpdates()
//                    cell.layoutIfNeeded()
//                    cell.bottomView.isHidden = false
//                       cell.isExpanded = !cell.isExpanded
//                    self.siteFormTV.scrollToRow(at: indexPath, at: .bottom, animated: true)
//                   // tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.top, animated: true)
//                       tableView.endUpdates()
//
//                   })
//        }else if indexPath.row == 1 {
//            guard let cell = tableView.cellForRow(at: indexPath) as? ClaimInformationTableCell
//
//                   else { return }
//
//                   UIView.animate(withDuration: 0.3, animations: {
//                       tableView.beginUpdates()
//                    cell.layoutIfNeeded()
//                    cell.bottomView.isHidden = false
//                       cell.isExpanded = !cell.isExpanded
//                    self.siteFormTV.scrollToRow(at: indexPath, at: .bottom, animated: true)
//                   // tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.top, animated: true)
//                       tableView.endUpdates()
//
//                   })
//        }
//        else if indexPath.row == 2 {
//            guard let cell = tableView.cellForRow(at: indexPath) as? BuildingInformationTableCell
//                   else { return }
//
//                   UIView.animate(withDuration: 0.3, animations: {
//                       tableView.beginUpdates()
//                    cell.layoutIfNeeded()
//                    cell.bottomView.isHidden = false
//                       cell.isExpanded = !cell.isExpanded
//                    self.siteFormTV.scrollToRow(at: indexPath, at: .bottom, animated: true)
//                   // tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.top, animated: true)
//                       tableView.endUpdates()
//
//                   })
//        }else if indexPath.row == 3 {
//            guard let cell = tableView.cellForRow(at: indexPath) as? ClaimDescTableViewCell
//                   else { return }
//
//                   UIView.animate(withDuration: 0.3, animations: {
//                       tableView.beginUpdates()
//                    cell.layoutIfNeeded()
//                    cell.bottomView.isHidden = false
//                    cell.isExpanded = !cell.isExpanded
//                    self.siteFormTV.scrollToRow(at: indexPath, at: .bottom, animated: true)
//                   // tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.top, animated: true)
//                       tableView.endUpdates()
//
//                   })
//        }else if indexPath.row == 4 {
//            guard let cell = tableView.cellForRow(at: indexPath) as? ResultantTableViewCell
//                   else { return }
//
//                   UIView.animate(withDuration: 0.3, animations: {
//                       tableView.beginUpdates()
//                    cell.layoutIfNeeded()
//                    cell.bottomView.isHidden = false
//                       cell.isExpanded = !cell.isExpanded
//                    self.siteFormTV.scrollToRow(at: indexPath, at: .bottom, animated: true)
//                   // tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.top, animated: true)
//                       tableView.endUpdates()
//
//                   })
//        }
//    }
//
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//
//        if indexPath.row == 0{
//
//            guard let cell = tableView.cellForRow(at: indexPath) as? SiteDetailsTableViewCell
//                else { return }
//            UIView.animate(withDuration: 0.3, animations: {
//                tableView.beginUpdates()
//                cell.isExpanded = false
//                cell.bottomView.isHidden = true
//                tableView.endUpdates()
//            })
//        }else if indexPath.row == 1 {
//            guard let cell = tableView.cellForRow(at: indexPath) as? ClaimInformationTableCell
//                else { return }
//            UIView.animate(withDuration: 0.3, animations: {
//                tableView.beginUpdates()
//                cell.isExpanded = false
//                cell.bottomView.isHidden = true
//                tableView.endUpdates()
//            })
//        }
//        else if indexPath.row == 2 {
//            guard let cell = tableView.cellForRow(at: indexPath) as? BuildingInformationTableCell
//                else { return }
//            UIView.animate(withDuration: 0.3, animations: {
//                tableView.beginUpdates()
//                cell.isExpanded = false
//                cell.bottomView.isHidden = true
//                tableView.endUpdates()
//            })
//        }else if indexPath.row == 3 {
//            guard let cell = tableView.cellForRow(at: indexPath) as? ClaimDescTableViewCell
//                else { return }
//            UIView.animate(withDuration: 0.3, animations: {
//                tableView.beginUpdates()
//                cell.isExpanded = false
//                cell.bottomView.isHidden = true
//                tableView.endUpdates()
//            })
//        }else if indexPath.row == 4 {
//            guard let cell = tableView.cellForRow(at: indexPath) as? ResultantTableViewCell
//                else { return }
//            UIView.animate(withDuration: 0.3, animations: {
//                tableView.beginUpdates()
//                cell.isExpanded = false
//                cell.bottomView.isHidden = true
//                tableView.endUpdates()
//            })
//        }
//
//
//    }
//
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        if indexPath.row == 0 {
//
//            let cell = tableView.cellForRow(at: indexPath) as? SiteDetailsTableViewCell
//
//            if cell?.isExpanded == true {
//                return 605
//            }else {
//                return 40
//            }
//        }else if indexPath.row == 1 {
//
//            let cell = tableView.cellForRow(at: indexPath) as? ClaimInformationTableCell
//
//            if cell?.isExpanded == true {
//                return 545
//            }else {
//                return 55
//            }
//        }else if indexPath.row == 2 {
//
//            let cell = tableView.cellForRow(at: indexPath) as? BuildingInformationTableCell
//
//            if cell?.isExpanded == true {
//                return 1350
//            }else {
//                return 55
//            }
//        }else if indexPath.row == 3 {
//
//            let cell = tableView.cellForRow(at: indexPath) as? ClaimDescTableViewCell
//
//            if cell?.isExpanded == true {
//                return 217
//            }else {
//                return 40
//            }
//        }else if indexPath.row == 4 {
//
//            let cell = tableView.cellForRow(at: indexPath) as? ResultantTableViewCell
//
//            if cell?.isExpanded == true {
//                return 450
//            }else {
//                return 40
//            }
//        }
//        return 40
//    }
//
//
//}
