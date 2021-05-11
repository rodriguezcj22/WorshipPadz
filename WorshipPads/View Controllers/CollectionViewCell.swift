/*
 import UIKit

 class TestCollectionViewCell: UICollectionViewCell {
     
     @IBOutlet var noteLabel: UILabel!

     
     override func awakeFromNib() {
         super.awakeFromNib()
         // Initialization code
 
         let backgroundViewImage = UIImageView(frame: bounds)
         backgroundViewImage.image = #imageLiteral(resourceName: "bluebutton")
         self.backgroundView = backgroundViewImage

         //Selected Background View
         let selectedBackgroundViewImage = UIImageView(frame: bounds)
         selectedBackgroundViewImage.image = #imageLiteral(resourceName: "greenbutton")
         self.selectedBackgroundView = selectedBackgroundViewImage
     }
     
     func deselectCell(sender: UIButton!) {
         print("DESELECT CELL WAS REACHED !!!!!!!!!!! ")
     }
     
     func setup(with note: String){
         print(" LABELA ---", noteLabel) //eventually delete " LABELA ---"
         noteLabel.text = note
         noteLabel.textColor = .white //3/30, is doing what I intend!
     }
 }
 
 
 
 */

import UIKit

class CollectionViewCell: UICollectionViewCell {

    //THIS IS WHERE THE UI FOR THE CELL IS CHANGED
    
    
    @IBOutlet var cellContainerView: UIView!
    @IBOutlet var noteLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        noteLabel.textColor = .black
        
        
        defaultAndSelectedBackgroundImages()
        //isSelected = false //not selected -
        //this whole ya mean it's running 12 times, 1 time for each cell
        
    }

    //when stop button is pressed, chnage the state of that cell to DESELECTED
    
    func defaultAndSelectedBackgroundImages() {
        let defaultCellBackgroundImage = UIImageView(frame: bounds)
        defaultCellBackgroundImage.image = #imageLiteral(resourceName: "bluebutton")
        //cellContainerView.addSubview(defaultCellBackgroundImage)
        self.backgroundView = defaultCellBackgroundImage
        
        //Selected Background View
        let selectedBackgroundImage = UIImageView(frame: bounds)
        selectedBackgroundImage.image = #imageLiteral(resourceName: "greenbutton")
        //cellContainerView.addSubview(selectedBackgroundImage)
        self.selectedBackgroundView = selectedBackgroundImage
    }
    

    
    override var isSelected: Bool {
        didSet {
            if(isSelected) {
                //noteLabel.textColor = .green //background - NOT the noteLabel!!!
                //cellContainerView.backgroundColor = .green
                
                //greenCell.image = #imageLiteral(resourceName: "greenbutton")
                //may need a size
                //greenCell.sizeToFit()
                //cellContainerView.addSubview(greenCell)
            } else {
                //noteLabel.textColor = .red
                //cellContainerView.backgroundColor = .systemBackground
                //cellContainerView.addSubview(blueCell)
                
                //blueCell.image = #imageLiteral(resourceName: "bluebutton")
                //cellContainerView.addSubview(blueCell)
            }
        }
    }

    
    
    func setup(with note: String) {
        print(" LABELA ---", noteLabel)
        noteLabel.text = note
        //noteLabel.adjustsFontSizeToFitWidth = true


    }
    
    
    /*
    func setup(with note: String){
        print(" LABELA ---", noteLabel) //eventually delete " LABELA ---"
        noteLabel.text = note
        noteLabel.textColor = .white //3/30, is doing what I intend!
    }
    */
    
    
    
}




/*
 


 /*
 import UIKit

 class MyCollectionViewCell: UICollectionViewCell {

     static let identifier = "Cell"
     @IBOutlet var btn: UIButton!
     @IBOutlet var labela: UILabel!
     //@IBOutlet var notesLabel: UILabel!
     
     override func awakeFromNib() {
             super.awakeFromNib()
             // Initialization code
         
             //observe // execute the function here?
         
         }
     
     override func layoutSubviews() {
         super.layoutSubviews()
         //notesLabel?.frame = bounds
     }
     
     func setup(with note: String){
         print(" BUTTON----", btn)
         print(" LABELA ---", labela)
         btn.setTitle("TEST TITLE", for: .normal) //the hell is this? delete?
         labela.text = note
         //labela.textColor = .black // 4/26
         print(note)
     }
 }
  */
 
 */




