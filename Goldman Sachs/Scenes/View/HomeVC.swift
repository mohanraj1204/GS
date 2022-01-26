//
//  HomeVC.swift
//  Goldman Sachs
//
//  Created by Mohanraj on 26/01/22.
//

import UIKit

class HomeVC: UIViewController {
    static let NibName = "HomeVC"
    
    @IBOutlet weak var txtVwExplanation: UITextView!
    @IBOutlet weak var imgVw: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    
    var viewModel : HomeViewModel = HomeViewModelImpl()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        getNasaDetails()
    }
    
    private func setupNavigationBar(){
        self.title = "NASA"
        let logoutBarButtonItem = UIBarButtonItem(title: "Date", style: .done, target: self, action: #selector(chooseDate))
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
    }
    
    @objc func chooseDate(){
        let datePicker: UIDatePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .compact
        datePicker.frame = CGRect(x: 10, y: 50, width: self.view.frame.width, height: 200)
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = UIColor.white
        datePicker.addTarget(self, action: #selector(self.datePickerValueChanged(_:)), for: .valueChanged)
        self.view.addSubview(datePicker)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let selectedDate: String = dateFormatter.string(from: sender.date)
        print("Selected value \(selectedDate)")
        viewModel.setDate = selectedDate
    }

    
    private func setupUI(){
        self.lblDate.text = viewModel.getDate
        self.lblTitle.text = viewModel.getTitle
        self.txtVwExplanation.text = viewModel.getExplanation
        self.imgVw.setImageFrom(urlStr: viewModel.getImageURL)
    }
    
    private func getNasaDetails(){
        viewModel.getNasaDetailsFromSerer { (model) in
            self.setupUI()
        } error: { (error) in
            print(error.localizedDescription)
        }
    }
    
    
}
