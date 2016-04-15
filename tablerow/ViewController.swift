import UIKit

class ViewController: UIViewController {
    // MARK: Outlets
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewRightSideConstraint: NSLayoutConstraint!
    
    // MARK: Variables
    
    var sliderMaxValue: Float = 0.0
    var sliderNeedsUpdate = true
    
    // MARK: UIView

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if self.sliderNeedsUpdate {
            // Setup the slider values
            self.sliderMaxValue = Float(self.tableView.frame.width)
            self.slider.maximumValue = self.sliderMaxValue
            self.slider.value = self.sliderMaxValue
            
            // Finish the update
            self.sliderNeedsUpdate = false
        }
    }
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        // Reset the constraint
        self.tableViewRightSideConstraint.constant = 0
        
        // Let the slider know it needs to update
        self.sliderNeedsUpdate = true
    }
    
    
    // MARK: UISlider
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        self.tableViewRightSideConstraint.constant = CGFloat(self.sliderMaxValue) - CGFloat(self.slider.value)
    }
}

// MARK: UITableView

extension ViewController: UITableViewDataSource, UITableViewDelegate  {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomCell
        
        if indexPath.row % 3 == 0 {
            cell.leftLabel.text = "Row \(indexPath.row) with some super short text"
        }
        else if indexPath.row % 3 == 1 {
            cell.leftLabel.text = "Row \(indexPath.row) with some super long text that nobody can read because it is so very long"
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
}

