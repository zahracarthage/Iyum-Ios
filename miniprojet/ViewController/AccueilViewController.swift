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
    
    @IBOutlet weak var AllDishCollectionView: UICollectionView!
    
    @IBOutlet weak var restoCollectionView: UICollectionView!
    
    @IBOutlet weak var CheckProfileBtn: UIButton!
    
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
                restosAllEx = self.restosAll
                print(restosAllEx)
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
        let res = restosAllEx[indexPath.row]
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
            cell.setup(resto: restosAllEx[indexPath.row])
            return cell
        case AllDishCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllDIshCollectionViewCell.identifier, for: indexPath) as! AllDIshCollectionViewCell
            cell.setup(resto: restosAllEx[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
        
    }
}



