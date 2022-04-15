//
//  MainCell.swift
//  Companion Taxi
//
//  Created by Malika on 13/04/22.
//

import UIKit


protocol MainCellDelegate: AnyObject {
    func didSelectCalendar(date: String)
}

class MainCell: UITableViewCell {
    
    let iconImageView = UIImageView()
    let infoView = UIView()
    let searchButton = UIButton()
    let fromIconImageView = UIImageView()
    let toIconImageView = UIImageView()
    let calendarIconView = UIImageView()
    let personIconView = UIImageView()
    var fromButton = UIButton()
    var toButton = UIButton()
    
    var fromLabel = UILabel()
    var toLabel = UILabel()
    
    var personTextField = UITextField()
    var calendarTextField = UITextField()
    var datePicker: UIDatePicker!
    weak var delegate: MainCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func makeConstraints(){
        
        self.contentView.addSubview(iconImageView)
        iconImageView.image = UIImage(named: "Rectangle 3")
        iconImageView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(268)
        }
        
        self.contentView.addSubview(infoView)
        infoView.backgroundColor = .black
        infoView.layer.cornerRadius = 30
        infoView.snp.makeConstraints { make in
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(250)
            make.top.equalTo(iconImageView.snp.bottom).offset(32)
            make.bottom.equalTo(-100)
        }
        
        let containerView = UIView()
        containerView.backgroundColor = .clear
        infoView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(50)
        }
        
        containerView.addSubview(fromIconImageView)
        fromIconImageView.image = UIImage(named: "Round")
        fromIconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(25)
            make.left.equalTo(25)
        }
        
        containerView.addSubview(fromLabel)
        fromLabel.textColor = .white
        fromLabel.font = UIFont.boldSystemFont(ofSize: 15)
        fromLabel.text = "From where"
        fromLabel.snp.makeConstraints { make in
            make.left.equalTo(60)
            make.right.equalTo(-10)
            make.centerY.equalToSuperview()
        }
        
        containerView.addSubview(fromButton)
        fromButton.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.centerY.equalToSuperview()
        }
        
        let containerView1 = UIView()
        containerView1.backgroundColor = .clear
        infoView.addSubview(containerView1)
        containerView1.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(containerView.snp.bottom)
            make.height.equalTo(50)
        }
        
        containerView1.addSubview(toIconImageView)
        toIconImageView.image = UIImage(named: "Round")
        toIconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(25)
            make.left.equalTo(25)
        }
        
        containerView1.addSubview(toLabel)
        toLabel.textColor = .white
        toLabel.font = UIFont.boldSystemFont(ofSize: 15)
        toLabel.text = "To where"
        toLabel.snp.makeConstraints { make in
            make.left.equalTo(60)
            make.right.equalTo(-10)
            make.centerY.equalToSuperview()
        }
        
        containerView1.addSubview(toButton)
        toButton.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.centerY.equalToSuperview()
        }
        
        let containerView2 = UIView()
        containerView2.backgroundColor = .clear
        infoView.addSubview(containerView2)
        containerView2.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(containerView1.snp.bottom)
            make.height.equalTo(50)
        }
        
        containerView2.addSubview(calendarIconView)
        calendarIconView.image = UIImage(named: "Combined-Shape-4")
        calendarIconView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(25)
            make.left.equalTo(25)
        }
        
        containerView2.addSubview(calendarTextField)
        calendarTextField.textColor = .white
        calendarTextField.font = UIFont.boldSystemFont(ofSize: 15)
        calendarTextField.text = "Today"
        calendarTextField.snp.makeConstraints { make in
            make.left.equalTo(60)
            make.right.equalTo(-10)
            make.centerY.equalToSuperview()
        }
        
//        containerView2.addSubview(calendarButton)
//        calendarButton.snp.makeConstraints { make in
//            make.left.equalTo(0)
//            make.right.equalTo(0)
//            make.centerY.equalToSuperview()
//        }
        
        let containerView3 = UIView()
        containerView3.backgroundColor = .clear
        infoView.addSubview(containerView3)
        containerView3.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(containerView2.snp.bottom)
            make.height.equalTo(50)
        }
        
        containerView3.addSubview(personIconView)
        personIconView.image = UIImage(named: "Group (1)")
        personIconView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(25)
            make.left.equalTo(25)
        }
        
        
        personTextField.text = "1"
        personTextField.textColor = .white
        personTextField.keyboardType = .numberPad
        personTextField.font = UIFont.boldSystemFont(ofSize: 15)
        containerView3.addSubview(personTextField)
        personTextField.snp.makeConstraints { make in
            make.left.equalTo(60)
            make.right.equalTo(-10)
            make.centerY.equalToSuperview()
        }
        
        let containerView4 = UIView()
        containerView4.backgroundColor = UIColor.init(hexString: "#E9932F")
        DispatchQueue.main.async {
            containerView4.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 30)
        }
        infoView.addSubview(containerView4)
        containerView4.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(containerView3.snp.bottom)
            make.height.equalTo(50)
        }
        
        containerView4.addSubview(searchButton)
        searchButton.backgroundColor = .clear
        searchButton.setTitle("Search", for: .normal)
        searchButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        searchButton.setTitleColor(.white, for: .normal)
        searchButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        showCalendar()
    }
    
   func showCalendar(){
        //Formate Date
      datePicker = UIDatePicker(frame: CGRect(x: 0,
                                                   y: 0,
                                                   width: self.frame.width,
                                                   height: 216))
       
       if #available(iOS 13.4, *) {
                  datePicker!.preferredDatePickerStyle = .wheels
             }
       datePicker.datePickerMode = .date
       datePicker.minimumDate = Date()
       //ToolBar
       let toolbar = UIToolbar(frame: CGRect(x: 0,
                                             y: 0,
                                             width: self.frame.width,
                                             height: 44))
       toolbar.sizeToFit()
       let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
       let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
      let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

     toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
       calendarTextField.inputAccessoryView = toolbar
       calendarTextField.inputView = datePicker

     }

      @objc func donedatePicker(){

       let formatter = DateFormatter()
       formatter.dateFormat = "dd/MM/yyyy"
       calendarTextField.text = formatter.string(from: datePicker.date)
          self.delegate?.didSelectCalendar(date: calendarTextField.text ?? "")
       self.endEditing(true)
     }

     @objc func cancelDatePicker(){
        self.endEditing(true)
      }
}
