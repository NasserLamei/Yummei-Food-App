//
//  ListOrdersViewController.swift
//  Yummie
//
//  Created by nassermac on 8/25/23.
//  Copyright © 2023 Nasser Co. All rights reserved.
//

import UIKit
import ProgressHUD

class ListOrdersViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
               setUpTableView()
        title = "Orders"
    }
    override func viewDidAppear(_ animated: Bool) {
        ProgressHUD.show()
        fetchAllOrdersFromApi()
    }
    // MARK: - Proprites .
    var listOforders = [Orders]()
    // MARK: - Prinate Methods .
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Cells.dishListCell, bundle: nil), forCellReuseIdentifier: Cells.dishListCell)
    }
   private func fetchAllOrdersFromApi(){
        ApiManger.shared.fetchAllOrdersFromApi {[weak self] (error, order) in
            if let error = error {
                ProgressHUD.showError(error.localizedDescription)
            }else if let categoriesArr = order{
                ProgressHUD.dismiss()
                self?.listOforders = categoriesArr
                self?.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource.
extension ListOrdersViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOforders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.dishListCell, for: indexPath) as! DishListTabelViewCell
        cell.setUp(order: listOforders[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dishDetailsVC = storyboard?.instantiateViewController(withIdentifier: Views.dishDetails) as! DishDetailViewController
    dishDetailsVC.dish = listOforders[indexPath.row].dish
        self.navigationController?.pushViewController(dishDetailsVC, animated: true)
    }
    
    
}
