//
//  RegistrationViewController.swift
//  NewProject
//
//  Created by Nayan Pawar on 20/04/23.
//

import UIKit
import Firebase


class RegistrationViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var registrationView: UIView!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpRegistrationScreen()
        
    }
    
    func setUpRegistrationScreen(){
        registrationView.layer.cornerRadius = 20.0
        registrationView.clipsToBounds = true
        btnSignUp.layer.cornerRadius = 17.5
        btnSignUp.clipsToBounds = true
    }
    
    //    func registerUser(firstName: String, lastName: String, email: String, password: String, confirmPassword: String) -> Bool {
    //
    //        // Check if the password and confirm password match
    //        guard password == confirmPassword else {
    //
    //            let alert = UIAlertController(title: "Error", message: "Password and confirm password do not match.", preferredStyle: .alert)
    //            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    //            present(alert, animated: true, completion: nil)
    //            return false
    //        }
    //
    //        // Check if the password is at least 8 characters long
    //        guard password.count >= 8 else {
    //            let alert = UIAlertController(title: "Error", message: "Password must be at least 8 characters long.", preferredStyle: .alert)
    //            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    //            present(alert, animated: true, completion: nil)
    //            return false
    //        }
    //
    //        // Check if the password contains at least one uppercase letter, one lowercase letter, and one digit
    //        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$"
    //        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
    //        guard passwordPredicate.evaluate(with: password) else {
    //            let alert = UIAlertController(title: "Error", message: "Password must contain at least one uppercase letter, one lowercase letter, and one digit.", preferredStyle: .alert)
    //            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    //            present(alert, animated: true, completion: nil)
    //            return false
    //        }
    //
    //        // Check if the email is valid
    //        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    //        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
    //        guard emailPredicate.evaluate(with: email) else {
    //            let alert = UIAlertController(title: "Error", message: "Invalid email address.", preferredStyle: .alert)
    //            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    //            present(alert, animated: true, completion: nil)
    //            return false
    //        }
    //
    //        // Store the user details in UserDefaults
    //        let userDetails = ["firstName": firstName, "lastName": lastName, "email": email, "password": password]
    //        UserDefaults.standard.set(userDetails, forKey: "userDetails")
    //
    //        // Return true to indicate successful registration
    //        return true
    //    }
    
    func registerUser(firstName: String, lastName: String, email: String, password: String, confirmPassword: String) {
        
        // Check if password and confirm password match
        guard password == confirmPassword else {
            // Passwords don't match, show an alert to the user
            let alertController = UIAlertController(title: "Error", message: "Passwords do not match", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        // Register the user with Firebase
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            // Check if there was an error
            if let error = error {
                // Handle the error and show an alert to the user
                let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                return
            }
            
            // After successfull registration, perform neccessary action
            print("Successfully created an user")
            
            // Navigate to Main VC
            func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                
                if segue.identifier == "toMainVC" {
                    if let mainVC = segue.destination as? MainViewController {
                    }
                }
            }
            self.performSegue(withIdentifier: "toMainVC", sender: self)
            
            
            // Attempt to register the user
            //            let registrationSuccessful = registerUser(firstName: firstName, lastName: lastName, email: email, password: password, confirmPassword: confirmPassword)
            //            //
            //            //        // If registration was successful, go back to the login screen
            //            if registrationSuccessful {
            //
            //                // Show an alert message
            //                let alert = UIAlertController(title: "Registration Successful", message: "You have successfully registered.", preferredStyle: .alert)
            //                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            //                present(alert, animated: true, completion: nil)
            //            }
        }
    }
    
    @IBAction func btnSignUpClicked(_ sender: Any) {
        
        //
        //        // Get the user input values
        //        guard let firstName = txtFirstName.text,
        //              let lastName = txtLastName.text,
        //              let email = txtEmail.text,
        //              let password = txtPassword.text,
        //              let confirmPassword = txtConfirmPassword.text else {
        //            return
        //        }
        //
        //        // Attempt to register the user
        //        let registrationSuccessful = registerUser(firstName: firstName, lastName: lastName, email: email, password: password, confirmPassword: confirmPassword)
        //
        //        // If registration was successful, go back to the login screen
        //        if registrationSuccessful {
        //
        //            // Show an alert message
        //            let alert = UIAlertController(title: "Registration Successful", message: "You have successfully registered.", preferredStyle: .alert)
        //            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        //            present(alert, animated: true, completion: nil)
        //
        //            navigationController?.popViewController(animated: true)
        //
        //
        //        }
        
        
        
        // Get the user's input from the registration form
        let firstName = txtFirstName.text ?? ""
        let lastName = txtLastName.text ?? ""
        let email = txtEmail.text ?? ""
        let password = txtPassword.text ?? ""
        let confirmPassword = txtConfirmPassword.text ?? ""
        
        // Call the registerUser function to register the user with Firebase
        registerUser(firstName: firstName, lastName: lastName, email: email, password: password, confirmPassword: confirmPassword)
        
        
        
    }

    
}
