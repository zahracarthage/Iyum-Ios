//
//  SceneDelegate.swift
//  miniprojet
//
//  Created by iMac on 6/4/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        

       
      }
    
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
               // the url is going to be in userActivity.webpageURL
        
        guard let url = userActivity.webpageURL else {return}
     
        if (userActivity.webpageURL?.pathComponents[2] != nil)
        {
           
            let userId = userActivity.webpageURL?.pathComponents[1]
            let token = userActivity.webpageURL?.pathComponents[2]
            print(userId)
            print(token)
            
             if self.window?.rootViewController?.presentedViewController != nil {
                 self.window?.rootViewController?.dismiss(animated: false, completion: nil)
                    }

            let Main =  self.window?.rootViewController?.storyboard?.instantiateViewController(withIdentifier: "ResetPassword") as? ResetPasswordViewController
            
            //Main.userIdentification = "fd"
            Main?.userIdFromUrl = userId
            Main?.UsertokenFromUrl = token
           // Main.userToken = "aa"
            
            Main?.modalPresentationStyle = .fullScreen
            self.window?.rootViewController?.present(Main!, animated: true, completion: nil)
            
            
        }
        else {print("doesn't contain")}
            
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

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    
   
    
   


}

