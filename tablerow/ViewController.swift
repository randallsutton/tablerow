import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tableViewRightSideConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension        
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomCell

        if indexPath.row % 3 == 0 {
            cell.leftLabel.text = "Row \(indexPath.row) with some super short text"
        }
        else if indexPath.row % 3 == 1 {
            cell.leftLabel.text = "Row \(indexPath.row) with some super long text that nobody can read because it is so very very long"
        }
        else {
            cell.leftLabel.text = "Row \(indexPath.row) with some super long text that nobody can read because it is so very very very very very very very long"
        }
        
        if indexPath.row % 2 == 0 {
            cell.rightLabel.text = "Right"
        }
        else {
            cell.rightLabel.text = "Right Large"
        }
        

        return cell
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        self.tableViewRightSideConstraint.constant = 250.0 - CGFloat(self.slider.value)
    }
}

