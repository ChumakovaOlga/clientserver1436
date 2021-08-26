//
//  FruitListViewController.swift
//  cs
//
//  Created by Olga Chumakova on 15.08.2021.
//

import UIKit

protocol FruitListViewControllerDelegate: AnyObject {
    func fruitDidSelect(fruit:String)
}

class FruitListViewController: UITableViewController {
    let fruits = ["Авокадо", "Банан", "Яблоко", "Апельсин", "Груша", "Слива", "Виноград", "Абрикос", "Персик", "Лимон", "Грейпфрут", "Ананас", "Инжир", "Вишня", "Алыча", "Хурма"]
   //Делегат слабая ссылка на первый объект
    weak var delegate: FruitListViewControllerDelegate?
    
    //Кложер
    var fruitSelect:((String) ->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return fruits.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = fruits[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fruit = fruits[indexPath.row]
        delegate?.fruitDidSelect(fruit: fruit)
        fruitSelect?(fruit)
        navigationController?.popViewController(animated: true)
    }
}
