//
//  ViewController.swift
//  Homework11Zoo
//
//  Created by mac on 12.11.2017.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet  private weak var tableView: UITableView!
    private var datasource: [String : [Animals]] = [:]
    private var allAnimals: [Animals] = []
    private var animalKeys: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        generateRandomData()
    }
    
    private func generateRandomData() {
        allAnimals.append(Animals(kind: "Birds", name: "Parrot", image: #imageLiteral(resourceName: "Parrot")))
        allAnimals.append(Animals(kind: "Birds", name: "Stork", image: #imageLiteral(resourceName: "Aist")))
        allAnimals.append(Animals(kind: "Fishes", name: "Clown-fish", image: #imageLiteral(resourceName: "ClownFish")))
        allAnimals.append(Animals(kind: "Fishes", name: "Macropod", image: #imageLiteral(resourceName: "Fish1")))
        allAnimals.append(Animals(kind: "Beasts", name: "Bear", image: #imageLiteral(resourceName: "Bear")))
        allAnimals.append(Animals(kind: "Beasts", name: "Leopard", image:#imageLiteral(resourceName: "Leopard")))
        allAnimals.append(Animals(kind: "Beasts", name: "Dog", image: #imageLiteral(resourceName: "Dog2")))
        allAnimals.append(Animals(kind: "Beasts", name: "Mouse", image: #imageLiteral(resourceName: "Mouse")))
        for animal in allAnimals {
            if var animalss = datasource[animal.kind] {
                animalss.append(animal)
                datasource[animal.kind] = animalss
            } else {
                datasource[animal.kind] = [animal]
            }
        }
        animalKeys = Array(datasource.keys)
    }
    private func getAnimal(for indexPath: IndexPath) -> Animals? {
        let key = animalKeys[indexPath.section]
        let animalForSection = datasource[key]
        return animalForSection?[indexPath.row]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showDetails",
            let desVC = segue.destination as? DetailsViewController else { return }
        guard let cell = sender as? UITableViewCell  else { return }
        guard let indexPath = tableView.indexPath(for: cell)  else { return }
        guard let item = getAnimal(for: indexPath) else { return }
        desVC.animal = item
    }

}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return datasource.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = animalKeys[section]
        let animalForSection = datasource[key] ?? []
        return animalForSection.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animalKeys[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableCell", for: indexPath) as?
         AnimalTableViewCell else {
            fatalError("Error: Cell has wrong type")
        }
        guard let item = getAnimal(for: indexPath) else {
            fatalError("Error: Animals has wrong indexPath")
        }
        cell.update(title: item.name, image: item.image)
        return cell
    }
}
