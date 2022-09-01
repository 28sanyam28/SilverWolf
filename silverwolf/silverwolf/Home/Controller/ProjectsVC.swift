//
//  ProjectsVC.swift
//  Silverwolf
//
//  Created by Mac on 04/04/22.
//

import UIKit

class ProjectsVC: UIViewController {

    
    @IBOutlet weak var projectTV: UITableView!
    
    @IBOutlet weak var backViewSearch: UIView!
    
    @IBOutlet weak var locationView: UIView!
    
    @IBOutlet weak var btnAdd: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.projectTV.register(UINib(nibName: "ProjectsTableViewCell", bundle: nil), forCellReuseIdentifier: "ProjectsTableViewCell")
        
        locationView.layer.cornerRadius = 5
        backViewSearch.layer.cornerRadius = backViewSearch.frame.height/2
        btnAdd.layer.cornerRadius = btnAdd.frame.height/2
        
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


extension ProjectsVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = projectTV.dequeueReusableCell(withIdentifier: "ProjectsTableViewCell", for: indexPath) as! ProjectsTableViewCell
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return 205
       
        }
    
    
    
}
