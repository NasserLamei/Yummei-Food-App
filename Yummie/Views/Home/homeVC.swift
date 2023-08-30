//
//  homeVC.swift
//  Yummie
//
//  Created by nassermac on 8/17/23.
//  Copyright © 2023 Nasser Co. All rights reserved.
//

import UIKit
import ProgressHUD
class homeVC: UIViewController {
    //MARK:- Outlets .
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    //MARK:- Propireties .
    var categories = [DishCategory]()
    var popular = [Dish]()
    var specials = [Dish]()
    //MARK:- VC LifeCycle .
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.show()
        
        let def = UserDefaults()
        def.set(true, forKey: UserDefaultsKeys.isLoggedIn)
        fetchAllDataFromApi()
        setUpBarButton()
        self.navigationItem.title = "Yummie"
        setUpCategoryCollectionView()
        setUpPopularCollectionview()
        setUpSpecialsCollectionView()
    }
    //MARK:- Private Methods .
    private func fetchAllDataFromApi(){
        ApiManger.shared.getDishCategoriesFromApi { [weak self] (error, DataObject) in
            if let error = error {
                ProgressHUD.show(error.localizedDescription)
            }else if let categoriesArr = DataObject{
                ProgressHUD.dismiss()
                self?.categories = categoriesArr.categories
                self?.popular = categoriesArr.populars
                self?.specials = categoriesArr.specials
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.specialsCollectionView.reloadData()


            }
        }
    }


    private func setUpCategoryCollectionView(){
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(UINib(nibName: Cells.categoryCell, bundle: nil), forCellWithReuseIdentifier: Cells.categoryCell)
    }
    private func setUpPopularCollectionview(){
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.register(UINib(nibName: Cells.dishPortraitCell, bundle: nil), forCellWithReuseIdentifier: Cells.dishPortraitCell)
    }
    private func setUpSpecialsCollectionView(){
        specialsCollectionView.delegate = self
        specialsCollectionView.dataSource = self
        specialsCollectionView.register(UINib(nibName: Cells.dishLandscapeCell, bundle: nil), forCellWithReuseIdentifier: Cells.dishLandscapeCell)
    }

    @objc func cartBtnTapped(){
        let listOrderVC = storyboard?.instantiateViewController(withIdentifier: Views.listOrders) as! ListOrdersViewController
        self.navigationController?.pushViewController(listOrderVC, animated: true)
    }
    
    private func setUpBarButton(){
        if let image = UIImage(named: "Order")?.withRenderingMode(.alwaysOriginal){
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(cartBtnTapped))
        }
    }
}
//MARK:- UICollectionViewDelegate,UICollectionViewDataSource .
extension homeVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch collectionView {
        case categoryCollectionView :
           return categories.count
        case popularCollectionView :
          return popular.count
        case specialsCollectionView :
            return specials.count
        default : return 0
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.categoryCell, for: indexPath) as! CategoryCollectionViewCell
            cell.setUp(category: categories[indexPath.row])
            return cell
        case popularCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.dishPortraitCell, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setUp(dish: popular[indexPath.row])
            return cell
        case specialsCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.dishLandscapeCell, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setUp(dish: specials[indexPath.row])
            return cell
        default : return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView{
            let dishListController = storyboard?.instantiateViewController(withIdentifier: Views.listDishes) as! ListDishesViewController
            dishListController.category = categories[indexPath.row]
            self.navigationController?.pushViewController(dishListController, animated: true)
        }else{
            let dishController = storyboard?.instantiateViewController(withIdentifier: Views.dishDetails) as! DishDetailViewController
            dishController.dish = (collectionView == popularCollectionView ? popular[indexPath.row] : specials[indexPath.row])
            self.navigationController?.pushViewController(dishController, animated: true)
        }
    }
    
    
}
