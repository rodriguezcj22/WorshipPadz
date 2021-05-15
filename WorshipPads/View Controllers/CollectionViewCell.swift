import UIKit

class CollectionViewCell: UICollectionViewCell{
    
    
    @IBOutlet var noteLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        noteLabel?.textColor = .black //should I keep the question mark? it wasn't there before

        defaultAndSelectedBackgroundImages()
    }
    
    /*
    func blueCellProperties(){
        let blueCell = UIImageView(frame: bounds)
        blueCell.image = #imageLiteral(resourceName: "bluebutton")
        self.backgroundView = blueCell
        print("IT'S EVEN IN HERE!!! ")
    }
 */
    
    //public weak var delegate: CustomCollectionViewDelegate?

    // WORKS - UI cell background is set here
    
    func defaultAndSelectedBackgroundImages() {
        let defaultCellBackgroundImage = UIImageView(frame: bounds)
        defaultCellBackgroundImage.image = #imageLiteral(resourceName: "bluebutton")
        //cellContainerView.addSubview(defaultCellBackgroundImage)
        self.backgroundView = defaultCellBackgroundImage
        
        //Selected Background View
        let selectedBackgroundImage = UIImageView(frame: bounds)
        selectedBackgroundImage.image = #imageLiteral(resourceName: "greenbutton") //change back to green
        //cellContainerView.addSubview(selectedBackgroundImage)
        self.selectedBackgroundView = selectedBackgroundImage
    }
    
    /*
    //delete
    func defaultBackground(clearBackground: Bool) {
        
        if clearBackground == true {
            print("it reached clearbackground if=true")
            let defaultCellBackgroundImage = UIImageView(frame: bounds)
            defaultCellBackgroundImage.image = #imageLiteral(resourceName: "bluebutton")
            self.backgroundView = defaultCellBackgroundImage
        }else {
            print("defaultBackground function is tripping")
        }
        
    }
    */

    
    /*
    //not working!
    override var isSelected: Bool {
        didSet {
            if(isSelected) {
               let selectedBackgroundImage = UIImageView(frame: bounds)
                selectedBackgroundImage.image = #imageLiteral(resourceName: "greenbutton") //change back to green
                //cellContainerView.addSubview(selectedBackgroundImage)
                self.selectedBackgroundView = selectedBackgroundImage
            } else {
                let defaultCellBackgroundImage = UIImageView(frame: bounds)
                defaultCellBackgroundImage.image = #imageLiteral(resourceName: "bluebutton")
                //cellContainerView.addSubview(defaultCellBackgroundImage)
                self.backgroundView = defaultCellBackgroundImage
            }
        }
    } */

    
    
    func setup(with note: String) {
        print(" LABELA ---", noteLabel)
        noteLabel.text = note
        //noteLabel.adjustsFontSizeToFitWidth = true
    }
}

extension CollectionViewCell: Togglable{
    
    //what happens when that button is stopped?
    func didTapStopButton() {
        print("yes it is the fuck accessing everything else")
        //blueCellProperties()
    }
    
}
