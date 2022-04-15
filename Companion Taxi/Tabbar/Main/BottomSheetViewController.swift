//
//  BottomSheetViewController.swift
//  Companion Taxi
//
//  Created by Malika on 13/04/22.
//

import UIKit
import SnapKit


protocol BottomSheetDelegate: AnyObject {
    func didTapOnCity(city: Address)
}

struct Address {
    var city : String
    var latitude : CGFloat
    var longitude : CGFloat
}
final class BottomSheetController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    weak var delegate: BottomSheetDelegate?
    
    let cities: [Address] = [
     Address(city: "Tashkent", latitude: 41.311081, longitude: 69.240562),
     Address(city: "Tashkent region", latitude: 41.09600, longitude: 69.445999),
     Address(city: "Andijan", latitude: 40.815356, longitude: 72.28375),
     Address(city: "Bukhoro", latitude: 39.77472, longitude: 64.42861),
     Address(city: "Samarkand", latitude: 39.652451, longitude: 66.970139),
     Address(city: "Khiva", latitude: 41.383333, longitude: 60.366667),
     Address(city: "Khorezm", latitude: 41.3565336, longitude: 60.8566686),
     Address(city: "Navoiy", latitude: 40.103922, longitude: 65.368833),
     Address(city: "Fergana", latitude: 40.3842, longitude: 71.7843),
     Address(city: "Kashkadarya", latitude: 38.8333, longitude: 66.0833),
     Address(city: "Syrdarya", latitude: 40.8436, longitude: 68.6617),
     Address(city: "Namangan", latitude: 40.9983, longitude: 71.67257),
     Address(city: "Surkhandarya", latitude: 67.2392796, longitude: 37.677266),
     Address(city: "Jizzakh", latitude: 40.1158, longitude: 67.8422)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .white
        tableView.snp.makeConstraints{
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(50)
            
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(BottomSheetCell.self, forCellReuseIdentifier: "BottomSheetCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { cities.count }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {  50 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BottomSheetCell") as? BottomSheetCell  else { return UITableViewCell() }
        
        cell.selectionStyle  = .blue
        cell.titleLabel.text = cities[indexPath.row].city
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didTapOnCity(city: cities[indexPath.row])
    }
}
