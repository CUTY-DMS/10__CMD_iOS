import Then
import SnapKit
import UIKit

class MenuViewController: UIViewController, UITextViewDelegate {

    let txtView = UITextView().then {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .meal
        $0.addLeftPadding(19)
        $0.addTopPadding(17)
    }

    let titleLabel = UILabel().then {
        $0.text = "급식"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.textAlignment = .center
    }

    let subView = UIView().then {
        $0.layer.borderColor = UIColor.subView.cgColor
        $0.layer.borderWidth = 4
        $0.layer.cornerRadius = 20
    }

    let subLabel = UILabel().then {
        $0.text = "원하는 급식 메뉴!"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.textAlignment = .center
    }

    let postButton = UIButton().then {
        $0.setImage(UIImage(named: "PostButton"), for: .normal)
    }

    let line = UIView().then {
        $0.backgroundColor = .meal
    }

    let placeholderLabel = UILabel().then {
        $0.text = "희망하는 급식 메뉴를 적어주세요!"
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        txtView.delegate = self
        attribute()
        add()
        layout()
    }
    
    func attribute() {
        view.backgroundColor = .white
    }
    
    func add() {
        [
            titleLabel,
            subView,
            subLabel,
            line,
            txtView,
            placeholderLabel,
            postButton
        ].forEach{ view.addSubview($0) }
    }
    
    func layout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(68)
            $0.centerX.equalToSuperview()
        }

        subView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(22)
            $0.left.right.equalToSuperview().inset(17)
            $0.height.equalTo(43)
        }

        subLabel.snp.makeConstraints {
            $0.top.equalTo(subView.snp.top).inset(7)
            $0.bottom.equalTo(subView.snp.bottom).inset(7)
            $0.centerX.equalToSuperview()
        }

        postButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(89)
            $0.right.equalToSuperview().inset(18)
            $0.height.equalTo(47)
            $0.width.equalTo(47)
        }

        line.snp.makeConstraints {
            $0.top.equalTo(subView.snp.bottom).offset(65)
            $0.right.left.equalToSuperview().inset(1)
            $0.width.equalTo(430)
            $0.height.equalTo(1)
        }

        txtView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(150)
            $0.left.right.equalToSuperview().inset(31)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(180)
        }

        placeholderLabel.snp.makeConstraints {
            $0.top.equalTo(txtView.snp.top).offset(17)
            $0.left.equalTo(txtView.snp.left).offset(22)
            $0.height.equalTo(20)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholderLabel.isHidden = true
    }
}

extension UITextView {
    func addLeftPadding(_ amount: CGFloat) {
        self.textContainerInset = UIEdgeInsets(top: self.textContainerInset.top, left: amount, bottom: self.textContainerInset.bottom, right: self.textContainerInset.right)
    }

    func addTopPadding(_ amount: CGFloat) {
        self.textContainerInset = UIEdgeInsets(top: amount, left: self.textContainerInset.left, bottom: self.textContainerInset.bottom, right: self.textContainerInset.right)
    }
}
