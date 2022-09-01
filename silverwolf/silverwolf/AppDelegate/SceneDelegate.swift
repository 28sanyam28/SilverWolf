//
//  SceneDelegate.swift
//  silverwolf
//
//  Created by Mac on 30/03/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)
    {
        guard let _ = (scene as? UIWindowScene) else { return }
        let key = "UserData"
        if let retrievedCodableObject = UserDefaults.standard.codableObject(dataType: UserData.self, key: key) {
            print("\(retrievedCodableObject.token ?? "")")
            if retrievedCodableObject.token != ""
            {
                gotoHome(userData: retrievedCodableObject)
            }
        } else {
          print("Not yet saved with key \(key)")
        }

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    func gotoHome(userData:UserData?)
    {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
       // self.navigationController?.pushViewController(vc, animated: true)
        guard let data = userData else{return}
        vc.Firstname = data.firstName ?? ""
        vc.Lastname = data.lastName ?? ""
        vc.Email = data.email ?? ""
        //vc.Phone = data.phone ?? ""
        //vc.Designation = data.designation ?? ""
        //vc.Address = data.address ?? ""
        let navVC = UINavigationController(rootViewController: vc)

        navVC.navigationBar.isHidden = true
        navVC.navigationBar.tintColor = .white
        navVC.navigationBar.barStyle = .black
        navVC.navigationBar.barTintColor = .black
        self.window?.rootViewController = navVC
        self.window?.makeKeyAndVisible()
        
    }


}

