//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by nassermac on 8/23/23.
//  Copyright © 2023 Nasser Co. All rights reserved.


import UIKit
import ProgressHUD

class DishDetailViewController: UIViewController {
    // MARK: - outlets
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    // MARK: - Proprites
    var dish: Dish!
    // MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDish()

    }
    // MARK: - Actions
    @IBAction func placeOrderBtnclicked(_ sender: UIButton) {
        guard let name = nameTextField.text?.trimmingCharacters(in: .whitespaces),
            !name.isEmpty else {
                ProgressHUD.showError("Please Enter Your Name")
                return
        }
        ProgressHUD.show("Placing Order ... ")
        ApiManger.shared.placeOrderToApi(id: dish.id ?? "", name: name) {[weak self](error, msg) in
            if let error = error {
            ProgressHUD.showError(error.localizedDescription)
            }
            else {
                self?.nameTextField.text = ""
            ProgressHUD.showSuccess("Your Order Has Been Recieved")
            }
        }
        }
        
    // MARK: - Private Methods
    private func viewDish(){
        self.dishImageView.kf.setImage(with: dish.image?.asUrl)
        self.titleLabel.text = dish.name
        self.caloriesLabel.text = dish.formattedCalories
        self.descriptionLabel.text = dish.description
    }

}
