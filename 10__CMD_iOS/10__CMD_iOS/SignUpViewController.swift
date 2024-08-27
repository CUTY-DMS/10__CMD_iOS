import Then
import SnapKit
import UIKit

class SignUpViewController: UIViewController{
    
    let mainLabel = UILabel() .then{
        $0.textColor = .black
        $0.text = "회원가입"
        $0.font = UIFont.systemFont(ofSize:50, weight: .bold)
    }
    
    let subLabel = UILabel() .then{
        $0.textColor = .textField
        $0.text = "새로운 계정을 만들어요~"
        $0.font = UIFont.systemFont(ofSize:16, weight: .thin)
    }
    
    let idTextField = UITextField() .then{
        $0.placeholder = "아이디"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.layer.borderColor = UIColor.textField.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 18
        $0.addLeftPadding()
    }
    
    let passWordTextField = UITextField() .then{
        $0.placeholder = "비밀번호"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.layer.cornerRadius = 18
        $0.layer.borderColor = UIColor.textField.cgColor
        $0.layer.borderWidth = 1
        $0.isSecureTextEntry = true
        $0.addLeftPadding()
    }
    
    let checkPassWordTextField = UITextField() .then{
        $0.placeholder = "비밀번호 확인"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.layer.cornerRadius = 18
        $0.layer.borderColor = UIColor.textField.cgColor
        $0.layer.borderWidth = 1
        $0.isSecureTextEntry = true
        $0.addLeftPadding()
    }
    
    let checkTextField = UITextField() .then{
        $0.placeholder = "인증 번호를 입력해주세요."
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.layer.cornerRadius = 18
        $0.layer.borderColor = UIColor.textField.cgColor
        $0.layer.borderWidth = 1
        $0.addLeftPadding()
    }
    
    let signUpButton = UIButton() .then{
        $0.setTitle("회원가입", for: .normal)
        $0.layer.cornerRadius = 18
        $0.backgroundColor = .textField
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        $0.setTitleColor(.black, for: .normal)
    }
    
    let loginButton = UIButton() .then{
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.setTitle("로그인 하기", for: .normal)
        $0.setTitleColor(.textField, for: .normal)
        $0.addTarget(nil, action: #selector(loginButtonTap), for: .touchUpInside)
    }
    
    @objc func loginButtonTap() {
        let beforView = LoginViewController()
        self.navigationController?.popViewController(animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(mainLabel)
        view.addSubview(subLabel)
        view.addSubview(idTextField)
        view.addSubview(passWordTextField)
        view.addSubview(signUpButton)
        view.addSubview(loginButton)
        view.addSubview(checkTextField)
        view.addSubview(checkPassWordTextField)
        
        
        mainLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(136)
            $0.left.equalToSuperview().inset(43)
        }
        
        subLabel.snp.makeConstraints{
            $0.top.equalTo(mainLabel.snp.bottom).offset(15)
            $0.left.equalToSuperview().inset(48)
        }
        
        idTextField.snp.makeConstraints{
            $0.top.equalTo(mainLabel.snp.bottom).offset(80)
            $0.left.equalToSuperview().inset(38)
            $0.right.equalToSuperview().inset(36)
            $0.height.equalTo(55)
        }
        
        passWordTextField.snp.makeConstraints{
            $0.top.equalTo(idTextField.snp.bottom).offset(25)
            $0.left.equalToSuperview().inset(38)
            $0.right.equalToSuperview().inset(36)
            $0.height.equalTo(55)
        }
        
        checkPassWordTextField.snp.makeConstraints{
            $0.top.equalTo(passWordTextField.snp.bottom).offset(25)
            $0.left.equalToSuperview().inset(38)
            $0.right.equalToSuperview().inset(36)
            $0.height.equalTo(55)
        }
        
        checkTextField.snp.makeConstraints{
            $0.top.equalTo(checkPassWordTextField.snp.bottom).offset(25)
            $0.left.equalToSuperview().inset(38)
            $0.right.equalToSuperview().inset(36)
            $0.height.equalTo(55)
        }
        
        signUpButton.snp.makeConstraints{
            $0.top.equalTo(checkTextField.snp.bottom).offset(60)
            $0.left.equalToSuperview().inset(44)
            $0.right.equalToSuperview().inset(44)
            $0.height.equalTo(55)
        }
        
        loginButton.snp.makeConstraints{
            $0.top.equalTo(signUpButton.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
    }


}
