//
//  ViewController.swift
//  NewProject
//
//  Created by Nayan Pawar on 18/04/23.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegisterUser: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLoginScreen()
        txtEmail.text = "umeshpawar123@gmail.com"
        txtPassword.text = "Umesh123@"
 
    }
    
    func setUpLoginScreen() {
        loginView.layer.cornerRadius = 20.0
        loginView.clipsToBounds = true
        btnLogin.layer.cornerRadius = 17.5
        btnLogin.clipsToBounds = true
        btnRegisterUser.layer.cornerRadius = 17.5
        btnRegisterUser.clipsToBounds = true
    }
    
    
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                // Handle the error and pass it to the completion block
                completion(.failure(error))
                return
            }
            // Authentication successful, perform the necessary actions
            print("Successfully logged in with email and password")
            
            // Pass a success result to the completion block
            completion(.success(()))
            
        }
    }
    
    
    @IBAction func btnLoginClicked(_ sender: Any) {
  
        
        guard let email = txtEmail.text, !email.isEmpty else {
            
            // Show an alert message to the user indicating that the email field is empty
            let alert = UIAlertController(title: "Error", message: "Please enter your email", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        guard let password = txtPassword.text, !password.isEmpty else {
            // Show an alert message to the user indicating that the password field is empty
            let alert = UIAlertController(title: "Error", message: "Please enter your password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        login(email: email, password: password) { result in
            switch result {
            case .success:
                // Authentication successful, perform the necessary actions
                print("Authentication and API call successful")
                UserDefaults.standard.set(true, forKey: "LoggedIn")
                // Navigate to Main VC
                func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                    
                    if segue.identifier == "toMainVC" {
                        if let mainVC = segue.destination as? MainViewController {
                        }
                    }
                }
                self.performSegue(withIdentifier: "toMainVC", sender: self)
                
            case .failure(let error):
                // Handle the error and show an alert message to the user
                let errorMessage = error.localizedDescription
                let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
    }
    @IBAction func btnRegisterUserClicked(_ sender: UIButton) {
        
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if segue.identifier == "toRegisterVC" {
                if let destinationVC = segue.destination as? RegistrationViewController {
                }
            }
        }
        performSegue(withIdentifier: "toRegisterVC", sender: self)
    }
    
    
}








