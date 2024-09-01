import UIKit
import SnapKit
import Then

// 공지사항을 표시하는 뷰 컨트롤러
class NoticeViewController: UIViewController {
    
    let noticeText = UILabel().then {
        $0.text = "공지"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    
    let subView = UIView().then {
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 4
        $0.layer.cornerRadius = 20
    }
    
    let subLabel = UILabel().then {
        $0.text = "주요 공지 확인 하러 가기!"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.textAlignment = .center
    }
    
    let line = UIImageView().then {
        $0.backgroundColor = .lightGray
    }
    
    let tableView = UITableView().then {
        $0.register(NoticeCell.self, forCellReuseIdentifier: NoticeCell.identifier)
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
    }
    
    let notices = ["대충 공지 1", "대충 공지 2", "대충 공지 3", "대충 공지 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func layout() {
        [
            noticeText,
            subView,
            subLabel,
            line,
            tableView
        ].forEach { view.addSubview($0) }
        
        noticeText.snp.makeConstraints {
            $0.top.equalToSuperview().inset(68)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(18)
        }
        
        subView.snp.makeConstraints {
            $0.top.equalTo(noticeText.snp.bottom).offset(22)
            $0.left.right.equalToSuperview().inset(17)
            $0.height.equalTo(43)
        }
        
        subLabel.snp.makeConstraints {
            $0.center.equalTo(subView.snp.center)
        }
        
        line.snp.makeConstraints {
            $0.top.equalTo(subView.snp.bottom).offset(15)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(line.snp.bottom).offset(10)
            $0.left.right.bottom.equalToSuperview()
        }
    }
}

// 커스텀 셀 클래스
class NoticeCell: UITableViewCell {
    static let identifier = "NoticeCell"
    
    let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }
    
    let dateLabel = UILabel().then {
        $0.textColor = .darkGray
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(named: "basicColor")
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        
        addSubview()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 셀 사이의 간격
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16))
    }
    
    private func addSubview() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.left.equalToSuperview().inset(12)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.left.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
}

extension NoticeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NoticeCell.identifier, for: indexPath) as? NoticeCell else {
            return UITableViewCell()
        }
        
        cell.titleLabel.text = notices[indexPath.row]
        cell.dateLabel.text = "8월 3일"
        
        return cell
    }
    
    // 셀의 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // 셀을 위에서 얼마나 떨어뜨리나
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let spacerView = UIView()
        spacerView.backgroundColor = .clear
        return spacerView
    }
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = NoticeContentsViewController()
        
        detailVC.noticeTitle.text = notices[indexPath.row]
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
