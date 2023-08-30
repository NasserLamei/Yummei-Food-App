//
//  ListDishesViewController.swift
//  Yummie
//
//  Created by nassermac on 8/24/23.
//  Copyright © 2023 Nasser Co. All rights reserved.
//

import UIKit
import ProgressHUD

class ListDishesViewController: UIViewController {
 // MARK: - Outlets .
    @IBOutlet weak var tableView: UITableView!
// MARK: - Propireties .
       var dishes = [Dish]()
    var category:DishCategory!
// MARK: - VC Lifecycle .
    override func viewDidLoad(){
        super.viewDidLoad()
       fetchCategoryDishes()
        title = category.title
        setUpTableView()
    }
// MARK: - Private Methods .
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Cells.dishListCell, bundle: nil), forCellReuseIdentifier: Cells.dishListCell)
        
    }
    func fetchCategoryDishes(){
        ProgressHUD.show()
        ApiManger.shared.fetchCatogriesDishes(id:category.id!){[weak self] (error, DataObject) in
            if let error = error {
                ProgressHUD.showError(error.localizedDescription)
            }else if let categoriesArr = DataObject{
                ProgressHUD.dismiss()
                self?.dishes = categoriesArr
                self?.tableView.reloadData()
            }
        }
    }
}
// MARK: - UITableViewDelegate,UITableViewDataSource .
extension ListDishesViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.dishListCell, for: indexPath) as! DishListTabelViewCell
        cell.setUp(dish: dishes[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let dishController = storyboard?.instantiateViewController(withIdentifier: Views.dishDetails) as! DishDetailViewController
        dishController.dish = dishes[indexPath.row]
        self.navigationController?.pushViewController(dishController, animated: true)
    }
    
    
}
