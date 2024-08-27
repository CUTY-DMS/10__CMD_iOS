import UIKit
import SnapKit
import Then


class LoginViewController: UIViewController {
    
    let mainLabel = UILabel() .then{
        $0.textColor = .black
        $0.text = "로그인"
        $0.font = UIFont.systemFont(ofSize:50, weight: .bold)
    }
    
    let subLabel = UILabel() .then{
        $0.textColor = .textField
        $0.text = "기존 계정으로 로그인 하세요~"
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
    
    let loginButton = UIButton() .then{
        $0.setTitle("로그인", for: .normal)
        $0.layer.cornerRadius = 18
        $0.backgroundColor = .textField
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        $0.setTitleColor(.black, for: .normal)
    }
    
    let signUpButton = UIButton() .then{
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.setTitle("회원가입 하기", for: .normal)
        $0.setTitleColor(.textField, for: .normal)
        $0.addTarget(nil, action: #selector(signUpButtonTap), for: .touchUpInside)
    }
    
    @objc func signUpButtonTap() {
        let nextView = SignUpViewController()
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(mainLabel)
        view.addSubview(subLabel)
        view.addSubview(idTextField)
        view.addSubview(passWordTextField)
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
        
        
        
        mainLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(180)
            $0.left.equalToSuperview().inset(43)
        }
        
        subLabel.snp.makeConstraints{
            $0.top.equalTo(mainLabel.snp.bottom).offset(15)
            $0.left.equalToSuperview().inset(48)
        }
        
        idTextField.snp.makeConstraints{
            $0.top.equalTo(mainLabel.snp.bottom).offset(100)
            $0.left.equalToSuperview().inset(38)
            $0.right.equalToSuperview().inset(36)
            $0.height.equalTo(55)
        }
        
        passWordTextField.snp.makeConstraints{
            $0.top.equalTo(idTextField.snp.bottom).offset(27)
            $0.left.equalToSuperview().inset(38)
            $0.right.equalToSuperview().inset(36)
            $0.height.equalTo(55)
        }
        
        loginButton.snp.makeConstraints{
            $0.top.equalTo(passWordTextField.snp.bottom).offset(100)
            $0.left.equalToSuperview().inset(44)
            $0.right.equalToSuperview().inset(44)
            $0.height.equalTo(55)
        }
        
        signUpButton.snp.makeConstraints{
            $0.top.equalTo(loginButton.snp.bottom).offset(48)
            $0.centerX.equalToSuperview()
        }
    }


}

extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}
