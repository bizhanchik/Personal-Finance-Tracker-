import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var operationSign: String?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var popupButton: UIButton!
    @IBOutlet weak var ballanceText: UILabel!
    @IBOutlet weak var txtDepositAmount: UITextField!
    @IBOutlet weak var txtInterestRate: UITextField!
    @IBOutlet weak var popupPeriodButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var balance: Double = 0.0
    var operations: [(arrow: UIImage?, amount: String)] = []
    var selectedPeriod: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setuptableview()
        setPopUpButton()
        setupPopupButton()
    }
    
    func setuptableview(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyCell.self, forCellReuseIdentifier: "Mycell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Mycell", for: indexPath) as! MyCell
        let operation = operations[indexPath.row]
        cell.configure(arrow: operation.arrow, amount: operation.amount)
        return cell
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operations.count
    }
        
    func setPopUpButton() {
        let optionClosure = { (action: UIAction) in
            self.operationSign = action.title
        }
        
        popupButton.menu = UIMenu(children: [
            UIAction(title: "+ или -", state: .on, handler: optionClosure),
            UIAction(title: "+", handler: optionClosure),
            UIAction(title: "-", handler: optionClosure)
        ])
        
        popupButton.showsMenuAsPrimaryAction = true
        popupButton.changesSelectionAsPrimaryAction = true
    }

    @IBAction func addOperation(_ sender: Any) {
        guard let inputText = txtField.text, let amount = Double(inputText) else {
            print("Invalid input")
            return
        }
        
        if operationSign == "+" {
            balance += amount
            operations.insert((arrow: UIImage(named: "arrow_up"), amount: "\(amount)"), at: 0)
        } else if operationSign == "-" {
            balance -= amount
            operations.insert((arrow: UIImage(named: "arrow_down"), amount: "-\(amount)"), at: 0)
        } else {
            print("Chose operation")
            return
        }

        ballanceText.text = String(format: "%.2f", balance)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        
        txtField.text = ""
        operationSign = nil
        
        popupButton.setTitle("+ или -", for: .normal)
    }
    
    func setupPopupButton() {
        let optionClosure = { (action: UIAction) in
            self.selectedPeriod = action.title
            self.popupPeriodButton.setTitle(action.title, for: .normal)
        }

        popupPeriodButton.menu = UIMenu(children: [
            UIAction(title: "1 месяц", handler: optionClosure),
            UIAction(title: "3 месяца", handler: optionClosure),
            UIAction(title: "6 месяцев", handler: optionClosure),
            UIAction(title: "12 месяцев", handler: optionClosure),
            UIAction(title: "24 месяца", handler: optionClosure)
        ])

        popupPeriodButton.showsMenuAsPrimaryAction = true
        popupPeriodButton.changesSelectionAsPrimaryAction = true
    }
    
    @IBAction func calculateDeposit(_ sender: Any) {
        guard let depositAmountText = txtDepositAmount.text,
              let interestRateText = txtInterestRate.text,
              let depositAmount = Double(depositAmountText),
              let interestRate = Double(interestRateText),
              let periodText = selectedPeriod,
              let months = getMonths(for: periodText) else {
            resultLabel.text = "Пожалуйста, заполните все поля правильно."
            return
        }

        let finalAmount = depositAmount * pow(1 + (interestRate / 100) / 12, Double(months))
        resultLabel.text = String(format: "Через %@ будет %.2f", periodText, finalAmount)
    }
    
    func getMonths(for period: String) -> Int? {
        switch period {
        case "1 месяц":
            return 1
        case "3 месяца":
            return 3
        case "6 месяцев":
            return 6
        case "12 месяцев":
            return 12
        case "24 месяца":
            return 24
        default:
            return nil
        }
    }
}
