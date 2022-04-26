//
//  AccueilViewController.swift
//  miniprojet
//
//  Created by daly on 7/4/2022.
//

import UIKit

class AccueilViewController: UIViewController{
    
    @IBOutlet weak var changeText: UINavigationItem!
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var CheckProfileBtn: UIButton!
    @IBOutlet weak var AllDishCollectionView: UICollectionView!
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var restoCollectionView: UICollectionView!
    
    var categories = ["Traditionelle"," burgers","cuisine americaine","plats","sandwich"]
    

   var restosAll : [DishResto] = []
    var restosAllEx : [DishResto] = []

    var tail : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        CheckProfileBtn.layer.cornerRadius = CheckProfileBtn.frame.size.width / 2
        getallResto()
        AllDishCollectionView.dataSource = self
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        registerCells()
        self.categoryCollectionView.reloadData()
   self.restoCollectionView.reloadData()
   self.AllDishCollectionView.reloadData()
        // Do any additional setup after loading the view.
       
   
    }
    
    private func getallResto()
    {
        AccueilViewModel().findAllResto{ [self] success, results in
            if success {
                restosAll = []
                self.restosAll.append(contentsOf: results!)
                print(self.restosAll.count)
                tail = self.restosAll.count
                Test.restosAll = self.restosAll
                     self.categoryCollectionView.reloadData()
                self.restoCollectionView.reloadData()
                self.AllDishCollectionView.reloadData()
            }
        }
    }
    var rest : DishResto?

    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        restoCollectionView.register(UINib(nibName: RestoCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: RestoCollectionViewCell.identifier)
        AllDishCollectionView.register(UINib(nibName: AllDIshCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: AllDIshCollectionViewCell.identifier)
    }
    
    /*@IBAction func change(_ sender: Any) {
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        navigationController?.pushViewController(vc, animated: true)
    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension AccueilViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case categoryCollectionView:
            return categories.count
        case restoCollectionView:
            return tail
        case AllDishCollectionView :
            return tail
        default: return 0
        }
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mSgueDetailRestau" {
            let destination = segue.destination as! DetailRestauViewController
            destination.resto = sender as? DishResto
                }
      
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let res = Test.restosAll[indexPath.row]
        performSegue(withIdentifier: "mSgueDetailRestau", sender: res)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case restoCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestoCollectionViewCell.identifier, for: indexPath) as! RestoCollectionViewCell
            cell.setup(resto: Test.restosAll[indexPath.row])
            return cell
        case AllDishCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllDIshCollectionViewCell.identifier, for: indexPath) as! AllDIshCollectionViewCell
            cell.setup(resto: Test.restosAll[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
        
    }
    
    
   
    
    
       

}



