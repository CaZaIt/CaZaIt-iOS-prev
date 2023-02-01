import UIKit

class RateView: BaseView {

    var starNumber: Int = 5 {
        didSet { bind() }
    }
    var currentStar: Int = 0

    private var buttons: [UIButton] = []

    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        view.backgroundColor = .white

        return view
    }()

    
    lazy var starFillImage: UIImage? = {
        return UIImage(systemName: "star.fill",
                       withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .medium))?.withTintColor(UIColor(red: 0.553, green: 0.376, blue: 0.376, alpha: 1), renderingMode: .alwaysOriginal)
    }()
    
    

    lazy var starEmptyImage: UIImage? = {
        return UIImage(systemName: "star",
                       withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .medium))?.withTintColor(UIColor(red: 0.553, green: 0.376, blue: 0.376, alpha: 1), renderingMode: .alwaysOriginal)
    }()

    override func configure() {
        super.configure()

        starNumber = 5
        addSubviews()
        setupLayout()
    }

    private func addSubviews() {
        addSubview(stackView)
    }

    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -605).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 180).isActive = true
    }

    override func bind() {
        super.bind()

        for i in 0..<5 {
            let button = UIButton()
            button.setImage(starEmptyImage, for: .normal)
            button.tag = i
            buttons += [button]
            stackView.addArrangedSubview(button)
            button.addTarget(self, action: #selector(didTapButton(sender:)), for: .touchUpInside)
        }
    }

    @objc
    private func didTapButton(sender: UIButton) {
        let end = sender.tag

        for i in 0...end {
            buttons[i].setImage(starFillImage, for: .normal)
        }
        for i in end + 1..<starNumber {
            buttons[i].setImage(starEmptyImage, for: .normal)
        }

        currentStar = end + 1
    }
}
