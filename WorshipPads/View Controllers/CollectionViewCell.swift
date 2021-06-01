import UIKit

class CollectionViewCell: UICollectionViewCell{
    
    
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var noteLabel: UILabel! // problem with this somewhere
    
    
    
    static let identifier = "CollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        noteLabel.textColor = .black //should I keep the question mark? it wasn't there before

        //defaultAndSelectedBackgroundImages()
    }
 
    // WORKS - UI cell background is set here
    
    /*
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
 */
 
    
    
    //the way it should be done? replace setup?
    public func configure(with image: UIImage) {
        imageView.image = #imageLiteral(resourceName: "greenbutton")
    }
     
    func setup(with note: String) {
        //print(" LABELA ---", noteLabel)
        noteLabel.text = note
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }

}



/*
 class MyCollectionViewCell: UICollectionViewCell {

     @IBOutlet var imageView: UIImageView!
     
     static let identifier = "MyCollectionView"
     
     override func awakeFromNib() {
         super.awakeFromNib()
         // Initialization code
     }
     
     public func configure(with image: UIImage) {
         imageView.image = image
         
     }
     
     static func nib() -> UINib{
         return UINib(nibName: "MyCollectionViewCell", bundle: nil)
     }
 }

 
 
 */
