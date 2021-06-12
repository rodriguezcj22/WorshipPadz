import UIKit

class CollectionViewCell: UICollectionViewCell{

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var noteLabel: UILabel!
    
    static let identifier = "CollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        noteLabel.textColor = .black
    }

    func setup(with note: String) {
        noteLabel.text = note
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
}
