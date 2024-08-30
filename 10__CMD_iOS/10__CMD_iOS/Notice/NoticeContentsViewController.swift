import UIKit
import SnapKit
import Then

class NoticeContentsViewController: UIViewController {
    
    let noticeText = UILabel().then {
        $0.text = "공지"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    let noticeTitle = UILabel().then{
        $0.text = ""
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 23, weight: .bold)
    }
    let noticeDate = UILabel().then{
        $0.text = "2024/07/12"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
    }
    let Line = UIImageView().then {
        $0.image = UIImage(named: "Line")
    }
    let noticeContents = UILabel().then {
        $0.text = "내용 내용 내용 내용 내용 내용 내요 내용 ㄴ요내요내ㅛ 내요 ㄴ애ㅛㄴ 애ㅛㄴ앤욘애뇽ㄴ애ㅛㄴㅇㅇ"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 13, weight: .light)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        
        view.backgroundColor = .white
    }
    
    func layout() {
        [
            noticeText,
            noticeTitle,
            noticeDate,
            Line,
            noticeContents,
        ].forEach { view.addSubview($0) }
        noticeText.snp.makeConstraints {
            $0.top.equalToSuperview().inset(28)
            $0.left.equalToSuperview().inset(157)
            $0.right.equalToSuperview().inset(157)
            $0.height.equalTo(18)
            $0.width.equalTo(100)
        }
        noticeTitle.snp.makeConstraints {
            $0.top.equalTo(noticeText.snp.bottom).offset(98)
            $0.left.equalToSuperview().inset(25)
            $0.right.equalToSuperview().inset(99)
            $0.height.equalTo(28)
            $0.width.equalTo(269)
        }
        noticeDate.snp.makeConstraints {
            $0.top.equalTo(noticeTitle.snp.bottom).offset(7)
            $0.left.equalToSuperview().inset(33)
            $0.right.equalToSuperview().inset(306)
            $0.height.equalTo(12)
            $0.width.equalTo(54)
        }
        Line.snp.makeConstraints {
            $0.top.equalTo(noticeDate.snp.bottom).offset(16)
            $0.left.equalToSuperview().inset(0)
            $0.right.equalToSuperview().inset(0)
            $0.height.equalTo(1)
            $0.width.equalTo(393)
        }
        noticeContents.snp.makeConstraints {
            $0.top.equalTo(Line.snp.bottom).offset(21)
            $0.left.equalToSuperview().inset(25)
            $0.right.equalToSuperview().inset(27)
            $0.height.equalTo(86)
            $0.width.equalTo(341)
        }
        
    }
}
