//
//  AccueilViewController.swift
//  miniprojet
//
//  Created by daly on 7/4/2022.
//

import UIKit

class AccueilViewController: UIViewController{
  
    @IBOutlet weak var changeText: UINavigationItem!
    
    
    
    @IBOutlet weak var restoCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    var categories : [DishResto] =  [
            .init(id: "id1", name: "exemple", picture: "https://firebasestorage.googleapis.com/v0/b/mini-projet-2e934.appspot.com/o/images%2Fphoto_adress.jpg?alt=media", about: "about", category: [], reservation: [], nbplaces: [], menu: [], localisation: []),
            .init(id: "id2", name: "exemple2", picture: "https://firebasestorage.googleapis.com/v0/b/mini-projet-2e934.appspot.com/o/images%2Fphoto_adress.jpg?alt=media", about: "about2", category: [], reservation: [], nbplaces: [], menu: [], localisation: []),
            .init(id: "id3", name: "exemple", picture: "https://firebasestorage.googleapis.com/v0/b/mini-projet-2e934.appspot.com/o/images%2Fphoto_adress.jpg?alt=media", about: "about3", category: [], reservation: [], nbplaces: [], menu: [], localisation: []),
            .init(id: "id4", name: "exemple'", picture: "https://firebasestorage.googleapis.com/v0/b/mini-projet-2e934.appspot.com/o/images%2Fphoto_adress.jpg?alt=media", about: "about4", category: [], reservation: [], nbplaces: [], menu: [], localisation: [])
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        registerCells()
        // Do any additional setup after loading the view.
    }
    
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        cell.setup(category: categories[indexPath.row])
        return cell
    }
}


