//
//  CollectionViewController.swift
//  WorshipPads
//
//  Created by Carlos Rodriguez on 3/6/21.
//



/*
 

 class LoginViewController: UIViewController {

     //good practice: put this numbers into contants
     struct Constants {
         static let cornerRadius: CGFloat = 8.0
     }
     
     private let usernameEmailField: UITextField = {
         let field = UITextField()
         field.placeholder = "Username or Email..."
         field.returnKeyType = .next
         field.leftViewMode = .always
         field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
         field.autocapitalizationType = .none
         field.autocorrectionType = .no
         field.layer.masksToBounds = true
         field.layer.cornerRadius = Constants.cornerRadius
         field.backgroundColor = .secondarySystemBackground
         field.layer.borderWidth = 1.0
         field.layer.borderColor = UIColor.secondaryLabel.cgColor
         return field
     }()
     
     private let passwordField: UITextField = {
         let field = UITextField()
         field.isSecureTextEntry = true
         field.placeholder = "Password..."
         field.returnKeyType = .continue
         field.leftViewMode = .always
         field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
         field.autocapitalizationType = .none
         field.autocorrectionType = .no
         field.layer.masksToBounds = true
         field.layer.cornerRadius = Constants.cornerRadius
         field.backgroundColor = .secondarySystemBackground
         field.layer.borderWidth = 1.0
         field.layer.borderColor = UIColor.secondaryLabel.cgColor
         return field
     }()
     
     private let loginButton: UIButton = {
         let button = UIButton()
         button.setTitle("Log In", for: .normal)
         button.layer.masksToBounds = true
         button.backgroundColor = .systemBlue
         button.setTitleColor(.white, for: .normal)
         return button
     }()
     
     private let termsButton: UIButton = {
         let button = UIButton()
         button.setTitle("Terms of Services", for: .normal)
         button.setTitleColor(.secondaryLabel, for: .normal)
         return button
     }()
     
     private let privacyButton: UIButton = {
         let button = UIButton()
         button.setTitle("Privacy Policy", for: .normal)
         button.setTitleColor(.secondaryLabel, for: .normal)
         return button
     }()
     
     private let createAccountButton: UIButton = {
         let button = UIButton()
         button.setTitleColor(.label, for: .normal)
         button.setTitle("New User? Create an Account", for: .normal)
         return button
     }()
     
     private let headerView: UIView = {
         let header = UIView()
         header.clipsToBounds = true // so nothing overflows
         let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
         header.addSubview(backgroundImageView)
         return header
     }()
     
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         loginButton.addTarget(self, action: #selector(didTapLoginButton),
                               for: .touchUpInside)
         
         createAccountButton.addTarget(self, action: #selector(didTapCreateAccountButton),
                                       for: .touchUpInside)
         termsButton.addTarget(self, action: #selector(didTapTermsButton),
                               for: .touchUpInside)
         
         privacyButton.addTarget(self, action: #selector(didTapPrivacyButton),
                                 for: .touchUpInside)

         usernameEmailField.delegate = self
         passwordField.delegate = self
         
         // Do any additional setup after loading the view.
         view.backgroundColor = .systemBackground //based on darkmode
         
         addSubviews()
     }
     
     override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
     
         //assign frames here
         
         //header
         headerView.frame = CGRect(x: 0,
                                   y: 0.0,
                                   width: view.width,
                                   height: view.height/3.0
         )
         
         usernameEmailField.frame = CGRect(x: 25,
                                           y: headerView.bottom + 40,
                                           width: view.width - 50,
                                           height: 52.0
         )
         
         passwordField.frame = CGRect(x: 25,
                                      y: usernameEmailField.bottom + 10,
                                      width: view.width-50,
                                      height: 52.0
         )
         
         loginButton.frame = CGRect(x: 25,
                                    y: passwordField.bottom + 10,
                                    width: view.width-50,
                                    height: 52.0
         )
         
         createAccountButton.frame = CGRect(x: 25,
                                            y: loginButton.bottom + 10,
                                            width: view.width-50,
                                            height: 52.0
         )
         
         termsButton.frame = CGRect(x: 10,
                                    y: view.height-view.safeAreaInsets.bottom-100,
                                            width: view.width-20,
                                            height: 50
         )
         
         privacyButton.frame = CGRect(x: 10,
                                      y: view.height-view.safeAreaInsets.bottom-50,
                                              width: view.width-20,
                                              height: 50
         )
         
         configureHeaderView()
         
         
     }
     
     private func configureHeaderView() {
         guard headerView.subviews.count == 1 else {
             return
         }
         guard let backgroundView = headerView.subviews.first else {
             return
         }
         
         backgroundView.frame = headerView.bounds
         // Add instagram logo
         
         let imageView = UIImageView(image: UIImage(named: "text"))
         headerView.addSubview(imageView)
         imageView.contentMode = .scaleAspectFit
         imageView.frame = CGRect(x: headerView.width/4.0,
                                  y: view.safeAreaInsets.top,
                                  width: headerView.width/2.0,
                                  height: headerView.height - view.safeAreaInsets.top)
     }
     
     //UI totally programatically
     
     private func addSubviews() {
         view.addSubview(usernameEmailField)
         view.addSubview(passwordField)
         view.addSubview(loginButton)
         view.addSubview(termsButton)
         view.addSubview(privacyButton)
         view.addSubview(createAccountButton)
         view.addSubview(headerView)
     }
     
     
     @objc private func didTapLoginButton() {
         //1. dismiss the keyboard
         passwordField.resignFirstResponder()
         usernameEmailField.resignFirstResponder()
         //2. double-check that we have text
         guard let usernameEmail = usernameEmailField.text, !usernameEmail.isEmpty,
               let password = passwordField.text, !password.isEmpty, password.count >= 8 else {
             return
         }

         // login functionality
     }
     
     @objc private func didTapTermsButton() {
         guard let url = URL(string: "https://help.instagram.com/1215086795543252") else {
             return
         }
         
         let vc = SFSafariViewController(url: url)
         present(vc, animated: true)
     }
     
     @objc private func didTapPrivacyButton() {
         guard let url = URL(string: "https://help.instagram.com/519522125107875") else {
             return
         }
         
         let vc = SFSafariViewController(url: url)
         present(vc, animated: true)
         
     }
     
     @objc private func didTapCreateAccountButton() {
         let vc = RegistrationViewController()
         present(vc, animated: true)
     }
     
     

 }

 extension LoginViewController: UITextFieldDelegate {
     func textFieldShouldReturn( _ textField: UITextField) -> Bool {
         if textField == usernameEmailField {
             passwordField.becomeFirstResponder()
         }else if textField == passwordField {
             didTapLoginButton()
         }
         return true
     }
 }

 
 
 */

import UIKit

import AVFoundation
import MediaPlayer

var Cpad = AVAudioPlayer()


class HomeViewcontroller: UICollectionViewController {
    
    
    
    
    
    
// UI ELEMENTS
    
    let myButton: StopBtn = {
        let stopButton = StopBtn(frame: CGRect(x: 108, y: 590, width: 200, height: 80))
        stopButton.setBackgroundImage(#imageLiteral(resourceName: "stopbutton"), for: .normal)
        stopButton.showsTouchWhenHighlighted = true
        stopButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return stopButton
    }()
    
    
    
    
    // Contains data to supply the collectionview
    let dataSource: [String] = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
    
    var controlCell: Int = 100
    
    
    
    
    
    

    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutElementsOnTheScreen()
        setupCollectionViewElements()

        print(" CONTROL CELLL VALUE IN VIEW DID LOAD----", controlCell)
    }
    
    
    
    func layoutElementsOnTheScreen() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 15, left: 22, bottom: 187, right: 22)
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.headerReferenceSize = CGSize(width: 20, height: 125)
        layout.footerReferenceSize = CGSize(width: 20, height: 55)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    }
    
    func setupCollectionViewElements() {
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "testCell")
        //header
        collectionView.register(Header.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.identifier)
        //footer
        collectionView.register(Footer.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: Footer.identifier)
        //add button to collection view
        collectionView.addSubview(myButton)
        //delegates
        collectionView.delegate = self
        collectionView.dataSource = self
        let bgColor = #colorLiteral(red: 0.0941, green: 0.0941, blue: 0.0941, alpha: 1) /* #181818 */
        collectionView.backgroundColor = bgColor
        let volumeView = MPVolumeView(frame: CGRect(x: 20, y: 705, width: 360, height: 30))
        //add volumeView to collectionView
        collectionView.addSubview(volumeView)
        collectionView.clipsToBounds = true
        //add collectionView to the parent view
        view.addSubview(collectionView!)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    //what happens when button is pushed .... delegator?
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
        print(" CONTROL CELL VALUE ON BTN CLICK----", self.controlCell)
        if Cpad.isPlaying {
            Cpad.setVolume(0, fadeDuration: 3)
        }
        
    } // ACTION BUTTON ENDS
    


    
    //MARK: Methods
    
    //ADVISE: TEST IF I NEED TO USE IT OR NOT
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
        //collectionView?.backgroundColor = .red
    }
    
    /* STAY HERE UNTIL YOU FIGURE OUT HOW TO DISPLAY THE FOOTER !!! */
    //HEADER & FOOTER
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        //where do I return the footer to? this is the function where we dequeue sections (header and footer sections)
        
        if kind == UICollectionView.elementKindSectionFooter {
            //RETURN A FOOTER
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: Footer.identifier, for: indexPath) as! Footer
            footer.configure()
            footer.backgroundColor = .darkGray
            
            return footer
        }
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.identifier, for: indexPath) as! Header
        
        header.configure()
        //header color
        header.backgroundColor = .black
        return header
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    
    //footer
    
    /* -------- THIS IS THE MOST IMPORTANT PART RIGHT NOW OF MY PROJECT -------------- */
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //ADVISE: CHECK HOW GUARD WORKS IN COLLECTIONVIEWCELLS
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath) as! CollectionViewCell
        
        //cell.setup(with: "test")
        cell.setup(with: dataSource[indexPath.row])
        //cell.noteLabel.textColor = .black //I'M A BEAST BOY !!!!!!
        cell.noteLabel.font = UIFont(name: "Avenir-Heavy", size: 35)
        return cell
    }
    

    //SELECTING A CELL
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath) as! CollectionViewCell
        
        if Cpad.isPlaying {
            print(" CPAD IS PLAYING---STOP IT AND CHANGE CELL UI")
            cell.isSelected = false
            Cpad.stop()
        } else {
            print(" CPAD IS NOT PLAYING---PLAY THE CORD AND CHANGE UI ")
            do {
                Cpad = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: (dataSource[indexPath.row]), ofType: "wav")!))
            } catch {
                Swift.print(error)
            }
            cell.isSelected = true
            Cpad.play()
        }
        
   
    }

}




