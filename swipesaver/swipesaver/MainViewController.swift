//
//  MainViewController.swift
//  swipesaver
//
//  Created by Andry on 4/24/25.
//

import Foundation
import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var incomeTableView: UITableView!
    @IBOutlet weak var expensesTableView: UITableView!
    
    var currentMonth = Calendar.current.component(.month, from: Date())
    var currentYear = Calendar.current.component(.year, from: Date())

    // Dummy data for now – replace with your real data
    var incomeEntries: [String] = ["Salary", "Freelance"]
    var expenseEntries: [String] = ["Rent", "Groceries", "Utilities"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSwipeGestures()
        setupTableViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    func setupSwipeGestures() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .right {
            currentMonth -= 1
            if currentMonth < 1 {
                currentMonth = 12
                currentYear -= 1
            }
        } else if gesture.direction == .left {
            currentMonth += 1
            if currentMonth > 12 {
                currentMonth = 1
                currentYear += 1
            }
        }
        updateUI()
    }
    
    func updateUI() {
        // Update month label
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        if let date = Calendar.current.date(from: DateComponents(year: currentYear, month: currentMonth, day: 1)) {
            monthLabel.text = dateFormatter.string(from: date)
        }
        
        // Get entries and update tables
        let entries = BudgetManager.shared.getMonthEntries(month: currentMonth, year: currentYear)
        let balance = BudgetManager.shared.calculateBalance(for: entries)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        balanceLabel.text = formatter.string(from: NSNumber(value: balance))
        
        // Reload table views
        incomeTableView.reloadData()
        expensesTableView.reloadData()
    }
    
    func setupTableViews() {
        incomeTableView.delegate = self
        incomeTableView.dataSource = self
        expensesTableView.delegate = self
        expensesTableView.dataSource = self
        
        incomeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "IncomeCell")
        expensesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ExpensesCell")
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == incomeTableView {
            return incomeEntries.count
        } else {
            return expenseEntries.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == incomeTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "IncomeCell", for: indexPath)
            cell.textLabel?.text = incomeEntries[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExpensesCell", for: indexPath)
            cell.textLabel?.text = expenseEntries[indexPath.row]
            return cell
        }
    }
}
