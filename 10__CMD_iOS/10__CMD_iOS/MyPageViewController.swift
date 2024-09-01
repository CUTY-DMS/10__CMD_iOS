
import UIKit
import SnapKit
import Then

class MyPageViewController: UIViewController {
    let myPageText = UILabel().then{
        $0.text = "마이페이지"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 50, weight: .bold)
    }
    let Line = UIImageView().then {
        $0.image = UIImage(named: "Line")
    }
    let userInformation = UIImageView().then {
        $0.image = UIImage(named: "information")
    }
    let informationText = UILabel().then {
        $0.text = "회원 정보"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    }
    let nameText = UILabel().then {
        $0.text = "이름"
        $0.textColor = UIColor.black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    let userName = UILabel().then {
        $0.text = "박지민"
        $0.textColor = UIColor.black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
    let classNumberText = UILabel().then {
        $0.text = "학번"
        $0.textColor = UIColor.black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    let userClassNumber = UILabel().then {
        $0.text = "1109"
        $0.textColor = UIColor.black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
    let birthText = UILabel().then {
        $0.text = "생년월일"
        $0.textColor = UIColor.black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    let userBirth = UILabel().then {
        $0.text = "2008.12.24"
        $0.textColor = UIColor.black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
    let specialtyText = UILabel().then {
        $0.text = "전공"
        $0.textColor = UIColor.black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    let userSpecialty = UILabel().then {
        $0.text = "iOS"
        $0.textColor = UIColor.black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
    let clubText = UILabel().then {
        $0.text = "전공 동아리"
        $0.textColor = UIColor.black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    let userClub = UILabel().then {
        $0.text = "DMS"
        $0.textColor = UIColor.black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
    let seatText = UILabel().then {
        $0.text = "자리 배치"
        $0.textColor = UIColor.black
        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    }
    let seatView = UIButton().then {
        $0.backgroundColor = UIColor(named: "seatViewColor")
        $0.layer.cornerRadius = 10
    }
    // 학생들 누르는거 어케하노 부분
    
    
    let checkButton = UIButton().then {
            $0.setTitle("확인", for: .normal)
            $0.setTitleColor(UIColor(named: "checkColor"), for: .normal)
            $0.backgroundColor = UIColor(named: "checkBoxColor")
        $0.layer.cornerRadius = 18
        } // rayout 잡아주세요
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        
        view.backgroundColor = .white
    }
    
    func layout() {
        [
            myPageText,
            Line,
            userInformation,
            informationText,
            nameText,userName,
            classNumberText,userClassNumber,
            birthText,userBirth,
            specialtyText,userSpecialty,
            clubText,userClub,
            seatText
        ].forEach { view.addSubview($0) }
        
        myPageText.snp.makeConstraints {
            $0.top.equalToSuperview().inset(79)
            $0.left.equalToSuperview().inset(43)
            $0.right.equalToSuperview().inset(133)
            $0.height.equalTo(60)
            $0.width.equalTo(217)
        }
        Line.snp.makeConstraints {
            $0.top.equalTo(myPageText.snp.bottom).offset(26)
            $0.left.equalToSuperview().inset(0)
            $0.right.equalToSuperview().inset(0)
            $0.height.equalTo(1)
            $0.width.equalTo(393)
        }
        userInformation.snp.makeConstraints {
            $0.top.equalTo(Line.snp.bottom).offset(20)
            $0.left.equalToSuperview().inset(25)
            $0.right.equalToSuperview().inset(25)
            $0.height.equalTo(535)
            $0.width.equalTo(343)
        }
        informationText.snp.makeConstraints {
            $0.top.equalTo(userInformation.snp.top).offset(34)
            $0.left.equalTo(userInformation.snp.left).offset(30)
            $0.right.equalTo(userInformation.snp.right).offset(224)
            $0.height.equalTo(29)
            $0.width.equalTo(89)
        }
        nameText.snp.makeConstraints {
            $0.top.equalTo(informationText.snp.bottom).offset(34)
            $0.left.equalTo(userInformation.snp.left).offset(30)
            $0.right.equalTo(userInformation.snp.right).offset(285)
            $0.height.equalTo(18)
            $0.width.equalTo(28)
        }
        userName.snp.makeConstraints {
            $0.top.equalTo(userInformation.snp.top).offset(98)
            $0.left.equalTo(userInformation.snp.left).offset(138)
            $0.right.equalTo(userInformation.snp.right).offset(162)
            $0.height.equalTo(15)
            $0.width.equalTo(43)
        }
        classNumberText.snp.makeConstraints {
            $0.top.equalTo(nameText.snp.bottom).offset(14)
            $0.left.equalTo(userInformation.snp.left).offset(30)
            $0.right.equalTo(userInformation.snp.right).offset(285)
            $0.height.equalTo(18)
            $0.width.equalTo(28)
        }
        userClassNumber.snp.makeConstraints {
            $0.top.equalTo(userName.snp.bottom).offset(13)
            $0.left.equalTo(userInformation.snp.left).offset(138)
            $0.right.equalTo(userInformation.snp.right).offset(162)
            $0.height.equalTo(21)
            $0.width.equalTo(56)
        }
        birthText.snp.makeConstraints {
            $0.top.equalTo(classNumberText.snp.bottom).offset(14)
            $0.left.equalTo(userInformation.snp.left).offset(30)
            $0.right.equalTo(userInformation.snp.right).offset(257)
            $0.height.equalTo(18)
            $0.width.equalTo(56)
        }
        userBirth.snp.makeConstraints {
            $0.top.equalTo(userClassNumber.snp.bottom).offset(14)
            $0.left.equalTo(userInformation.snp.left).offset(138)
            $0.right.equalTo(userInformation.snp.right).offset(87)
            $0.height.equalTo(21)
            $0.width.equalTo(118)
        }
        specialtyText.snp.makeConstraints {
            $0.top.equalTo(birthText.snp.bottom).offset(11)
            $0.left.equalTo(userInformation.snp.left).offset(30)
            $0.right.equalTo(userInformation.snp.right).offset(285)
            $0.height.equalTo(21)
            $0.width.equalTo(28)
        }
        userSpecialty.snp.makeConstraints {
            $0.top.equalTo(userBirth.snp.bottom).offset(11)
            $0.left.equalTo(userInformation.snp.left).offset(138)
            $0.right.equalTo(userInformation.snp.right).offset(87)
            $0.height.equalTo(21)
            $0.width.equalTo(28)
        }
        clubText.snp.makeConstraints {
            $0.top.equalTo(specialtyText.snp.bottom).offset(14)
            $0.left.equalTo(userInformation.snp.left).offset(30)
            $0.right.equalTo(userInformation.snp.right).offset(244)
            $0.height.equalTo(18)
            $0.width.equalTo(69)
        }
        userClub.snp.makeConstraints {
            $0.top.equalTo(userSpecialty.snp.bottom).offset(11)
            $0.left.equalTo(userInformation.snp.left).offset(138)
            $0.right.equalTo(userInformation.snp.right).offset(170)
            $0.height.equalTo(21)
            $0.width.equalTo(35)
        }
        seatText.snp.makeConstraints {
            $0.top.equalTo(clubText.snp.bottom).offset(18)
            $0.left.equalTo(userInformation.snp.left).offset(30)
            $0.right.equalTo(userInformation.snp.right).offset(244)
            $0.height.equalTo(29)
            $0.width.equalTo(89)
        }
    }
}
