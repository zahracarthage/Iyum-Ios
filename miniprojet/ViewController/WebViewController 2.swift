//
//  WebViewController.swift
//  miniprojet
//
//  Created by daly on 12/4/2022.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet var webView : UIWebView!
    
    var url = URL(string: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlreq = URLRequest(url: url!)
        webView.loadRequest(urlreq)
        // Do any additional setup after loading the view.
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
