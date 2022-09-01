//
//  TabBarVC.swift
//  Silverwolf
//
//  Created by Mac on 04/04/22.
//

import UIKit

class TabBarVC: UITabBarController,UITabBarControllerDelegate {
    
    @IBOutlet weak var tabbar: UITabBar!
   // let defaults = MyUserDefaults()
    var Firstname = String()
    var Lastname = String()
    var Email = String()
    var Phone = String()
    var Designation = String()
    var Address = String()
    var id = Int()
    var empId = Int()

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
               let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "ScheduleVC") as! ScheduleVC
        homeVC.firstName = Firstname.self
        homeVC.lastName = Lastname.self
                          let tabOneBarItem = UITabBarItem(title: "Tab 1", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
                              homeVC.tabBarItem = tabOneBarItem

               // shop tab
               let shopStoybaord = UIStoryboard(name: "Home", bundle: nil)
               let shopVC = shopStoybaord.instantiateViewController(withIdentifier: "TimesheetVC") as! TimesheetVC
        shopVC.firstName = Firstname.self
        shopVC.lastName = Lastname.self
        shopVC.id = id.self
        shopVC.empId = empId.self
        print(empId)
        

               //offers tab
               let offersStoryboard = UIStoryboard(name: "Home", bundle: nil)
               let offersVC = offersStoryboard.instantiateViewController(withIdentifier: "NotificationsVC") as! NotificationsVC
      
               //more tab
     
               let moreStoryboard = UIStoryboard(name: "Home", bundle: nil)
               let moreVC = moreStoryboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        moreVC.firstName = Firstname.self
        moreVC.lastName = Lastname.self
        moreVC.email = Email.self
        moreVC.phone = Phone.self
        moreVC.tabBarController?.tabBar.isHidden = false
//Not In Use For Now
        moreVC.designation = Designation.self
        moreVC.address = Address.self
        moreVC.tabBarController?.tabBar.isHidden = false
               let vc1 = UINavigationController(rootViewController: homeVC)
               let vc2 = UINavigationController(rootViewController:shopVC)
               let vc3 = UINavigationController(rootViewController:offersVC)
               let vc4 = UINavigationController(rootViewController:moreVC)
               self.viewControllers = [vc1 , vc2 , vc3 , vc4]
               self.delegate = self
    }
    
    // buttons shakhsiyan
    
    override func viewWillAppear(_ animated: Bool) {
    
        setTabBarItems()
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        tabbar.layer.cornerRadius = 20
        tabbar.layer.masksToBounds = true
        tabbar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    func setTabBarItems(){
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        tabBarController?.tabBar.isHidden = false
        let myTabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
        myTabBarItem1.image = UIImage(named: "schedule")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        myTabBarItem1.selectedImage = UIImage(named: "schedule")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
         myTabBarItem1.title = "Schedule"
         
         myTabBarItem1.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
         let myTabBarItem2 = (self.tabBar.items?[1])! as UITabBarItem
        myTabBarItem2.image = UIImage(named: "timesheet")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        myTabBarItem2.selectedImage = UIImage(named: "timesheet")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        myTabBarItem2.title = "Timesheet"

         myTabBarItem2.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)


         let myTabBarItem3 = (self.tabBar.items?[2])! as UITabBarItem
        myTabBarItem3.image = UIImage(named: "Notifications")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        myTabBarItem3.selectedImage = UIImage(named: "Notifications")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
         myTabBarItem3.title = "Notifications"

         myTabBarItem3.imageInsets = UIEdgeInsets(top:0, left: 0, bottom: 0, right: 0)

         let myTabBarItem4 = (self.tabBar.items?[3])! as UITabBarItem
        myTabBarItem4.image = UIImage(named: "Profile")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        myTabBarItem4.selectedImage = UIImage(named: "Profile")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
         myTabBarItem4.title = "Profile"
      
         myTabBarItem4.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    }
}
