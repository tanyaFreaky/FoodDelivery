//
//  LoginPresenter.swift
//  Food Delivery
//
//  Created by Tanya on 11.03.2024.
//


import Foundation

protocol LoginViewOutput: AnyObject {
    func loginStart(login: String, password: String)
    func registrationStart()
    func goToFacebookLogin()
    func goToGoogleLogin()
    func goToSignIn()
    func goToSignUp()
    func goToForgotPass()
    func back()
}

class LoginPresenter {
    
    private var coordinator: AppCoordinator?
    weak var viewInput: LoginViewInput?
    
    init(coordinator: AppCoordinator? = nil, viewInput: LoginViewInput? = nil) {
        self.coordinator = coordinator
        self.viewInput = viewInput
    }
    
}

private extension LoginPresenter {
    func goToMainScene() {
        coordinator?.showMainScene()
    }
}

extension LoginPresenter: LoginViewOutput {
    func loginStart(login: String, password: String) {
        viewInput?.startLoader()
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
            if login.lowercased() == "test@mail.com" && password == "Test123" {
                DispatchQueue.main.async { [weak self] in
                    self?.viewInput?.stopLoader()
                    self?.goToMainScene()
                }
            } else {
                DispatchQueue.main.async { [weak self] in
                    self?.viewInput?.stopLoader()
                    print("Wrong login or password")
                }
            }
        }
    }
    
    func registrationStart() {
        
    }
    
    func goToFacebookLogin() {
        
    }
    
    func goToGoogleLogin() {
        
    }
    
    func goToSignIn() {
        coordinator?.showSignInScene()
    }
    
    func goToSignUp() {
        coordinator?.showSignUpScene()
    }
    
    func goToForgotPass() {
        
    }
    
    func back() {
        
    }
    
    
}
