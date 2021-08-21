//
//  ChooseFruitViewController.swift
//  cs
//
//  Created by Olga Chumakova on 15.08.2021.
//

import UIKit
//Первый контроллер

class ChooseFruitViewController: UIViewController, FruitListViewControllerDelegate {
    
    @IBOutlet weak var fruitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //делегат
    func fruitDidSelect(fruit: String) {
        //fruitLabel.text = fruit //при выборе его там, мы отобразим его здесь
    }
    @IBAction func chooseFruitAction(_ sender: Any) {  //переход вперед
        
        //Второй контроллер
        let fruitList = FruitListViewController()
        fruitList.delegate = self
        
        //кложер
        fruitList.fruitSelect = {[weak self] fruit in
            self?.fruitLabel.text = fruit
        }
        navigationController?.pushViewController(fruitList, animated: true)
    }
}
