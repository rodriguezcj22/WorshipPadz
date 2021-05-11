import UIKit

class CollectionViewCell: UICollectionViewCell {

    //THIS IS WHERE THE UI FOR THE CELL IS CHANGED
    
    
    //@IBOutlet var cellContainerView: UIView!
    //they are using a UIImageView
    @IBOutlet var noteLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        noteLabel.textColor = .black
        
        
        defaultAndSelectedBackgroundImages()
        //isSelected = false //not selected -
        //this whole ya mean it's running 12 times, 1 time for each cell
        
    }

    // DID NOT WORK
    func deselectTheCurrentHighlightedCell() {
        let defaultCellBackgroundImage = UIImageView(frame: bounds)
        defaultCellBackgroundImage.image = #imageLiteral(resourceName: "bluebutton")
        //cellContainerView.addSubview(defaultCellBackgroundImage)
        self.backgroundView = defaultCellBackgroundImage
    }
    
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
    }

    
    
    func setup(with note: String) {
        print(" LABELA ---", noteLabel)
        noteLabel.text = note
        //noteLabel.adjustsFontSizeToFitWidth = true


    }
    

}
