import UIKit

class CollectionViewCell: UICollectionViewCell{

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var noteLabel: UILabel! // problem with this somewhere
    
    static let identifier = "CollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        noteLabel.textColor = .black
        //i think this noteLabel color is also set somewhere else
    }

    func setup(with note: String) {
        //print(" LABELA ---", noteLabel)
        noteLabel.text = note
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }

}
