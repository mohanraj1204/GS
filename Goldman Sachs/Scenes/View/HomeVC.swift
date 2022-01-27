//
//  HomeVC.swift
//  Goldman Sachs
//
//  Created by Mohanraj on 26/01/22.
//

import UIKit

class HomeVC: UIViewController {
    static let NibName = "HomeVC"
    
    @IBOutlet weak var btnFav: UIButton!
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var txtVwExplanation: UITextView!
    @IBOutlet weak var imgVw: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    
    var viewModel : HomeViewModel = HomeViewModelImpl()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitals()
        setupNavigationBar()
        getNasaDetails()
        setupDatePicker()
    }
    
    private func setupInitals(){
        self.btnFav.addTarget(self, action: #selector(onClkFavUnFav(sender:)), for: .touchUpInside)

    }
    private func setupNavigationBar(){
        self.title = "NASA"
    }
    
    private func setupDatePicker(){
        let datePicker: UIDatePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .inline
        datePicker.datePickerMode = .date
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = UIColor.white
        datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(self.datePickerValueChanged(_:)), for: .allEvents)
        txtDate.inputView = datePicker
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let selectedDate: String = dateFormatter.string(from: sender.date)
        print("Selected value \(selectedDate)")
        viewModel.setDate = selectedDate
        txtDate.text = selectedDate
        txtDate.resignFirstResponder()
        self.getNasaDetails()
    }

    @objc func onClkFavUnFav(sender : UIButton){
        viewModel.setFavUnFav {
            self.btnFav.setTitle(self.viewModel.getFav, for: .normal)
        }
    }
    
    private func setupUI(){
        self.txtDate.text = viewModel.setDate
        self.lblDate.text = viewModel.getDate
        self.lblTitle.text = viewModel.getTitle
        self.btnFav.setTitle(viewModel.getFav, for: .normal)
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
