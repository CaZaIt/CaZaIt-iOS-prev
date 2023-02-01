import UIKit
import SnapKit

class InfoViewController: UIViewController{
    
    
    //카페 사진
    lazy var imageBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.945, green: 0.945, blue: 0.937, alpha: 1)
        return view
    }()

    lazy var pageViewController: UIPageViewController = {
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)

        return vc
    }()
    
    let imageView1: UIImageView = {
        let ImageView = UIImageView()
        ImageView.image = UIImage(named: "cafe1")
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        ImageView.contentMode = .scaleToFill
        return ImageView
        
    }()
    
    let imageView2: UIImageView = {
        let ImageView = UIImageView()
        ImageView.backgroundColor = .red
        ImageView.image = UIImage(named: "cafe2")
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        ImageView.contentMode = .scaleToFill
        return ImageView
        
    }()
    
    let imageView3: UIImageView = {
        let ImageView = UIImageView()
        ImageView.backgroundColor = .red
        ImageView.image = UIImage(named: "cafe3")
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        ImageView.contentMode = .scaleToFill
        return ImageView
        
    }()

    lazy var vc1: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .clear
        return vc
    }()

    lazy var vc2: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .clear
     return vc
    }()

    lazy var vc3: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .clear

        return vc
    }()

    lazy var dataViewControllers: [UIViewController] = {
        return [vc1, vc2, vc3]
    }()
    
    //하얀 배경
    let white: UILabel = {
        let view = UILabel()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let white2: UILabel = {
        let view = UILabel()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let white3: UILabel = {
        let view = UILabel()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //카페 이름
    let cafename: UILabel = {
        let cafeName = UILabel()
        cafeName.text = "카페이름"
        cafeName.textColor = .black
        cafeName.translatesAutoresizingMaskIntoConstraints = false
        cafeName.font = .boldSystemFont(ofSize: 26)
        return cafeName
    }()

    //카페위치
    let cafelocation: UILabel = {
        let cafeLocation = UILabel()
        cafeLocation.text = "카페 위치"
        cafeLocation.textColor = .black
        cafeLocation.translatesAutoresizingMaskIntoConstraints = false
        cafeLocation.font = .italicSystemFont(ofSize: 13)
        return cafeLocation
    }()

    private enum Constants {
        static let segmentedControlHeight: CGFloat = 58
    }

    // Container view of the segmented control
    private lazy var segmentedControlContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = UIColor(red: 0.49, green: 0.357, blue: 0.318, alpha: 1)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()

    // Customised segmented control
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()

//        // Remove background and divider colors
//        segmentedControl.backgroundColor = UIColor(red: 0.49, green: 0.357, blue: 0.318, alpha: 1)
//        segmentedControl.tintColor = UIColor(red: 0.49, green: 0.357, blue: 0.318, alpha: 1)

        // Append segments
        segmentedControl.insertSegment(withTitle: "카페정보", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "위치/교통", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "평점 및 후기", at: 2, animated: true)
        //egmentedControl.layer.cornerRadius = 15
        
        //segmentedControl.layer.cornerRadius = 30
        segmentedControl.layer.masksToBounds = true
        //segmentedControl.roun
        segmentedControl.clipsToBounds = true

        // Select first segment by default
        segmentedControl.selectedSegmentIndex = 0
        //segmentedControl.layer.cornerRadius = 15

        // Change text color and the font of the NOT selected (normal) segment
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .normal)

        // Change text color and the font of the selected segment
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.553, green: 0.376, blue: 0.376, alpha: 1),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .selected)
    
        // Set up event handler to get notified when the selected segment changes
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)

        // Return false because we will set the constraints with Auto Layout
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()

    //information list
    var dataSource: [Cafe] = [  .init(menuImage: UIImage(named: "coffee")! ,name: "아메리카노", price: "3500원", description: "설명"),
                                .init(menuImage: UIImage(named: "coffee")! ,name: "아메리카노", price: "3500원", description: "설명"),
                                .init(menuImage: UIImage(named: "coffee")! ,name: "아메리카노", price: "3500원", description: "설명"),
                                .init(menuImage: UIImage(named: "coffee")! ,name: "아메리카노", price: "3500원", description: "설명"),
                                .init(menuImage: UIImage(named: "coffee")! ,name: "아메리카노", price: "3500원", description: "설명")    ]

    lazy var containerView: UIView = {
        let view = UIView()

        return view
    }()

    lazy var informationTableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.separatorStyle = .none
        view.rowHeight = 113 //(101+12)
        view.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.className)

        return view
    }()
    
    //location
    let locationImageView: UIImageView = {
            let ImageView = UIImageView()
            ImageView.image = UIImage(named: "map")
            ImageView.translatesAutoresizingMaskIntoConstraints = false
            ImageView.contentMode = .scaleToFill
            return ImageView
        
    }()
    //let mapView = NMFMapView(frame: view.frame)


    //review
    let review: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    let align: UILabel = {
        let label = UILabel()
        label.text = "최근 작성순 ﹀"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor =  UIColor(red: 0.553, green: 0.376, blue: 0.376, alpha: 1)
        return label
    }()
    
 
    let average_star = UIImageView(image: UIImage(systemName: "star",
                                                  withConfiguration: UIImage.SymbolConfiguration(pointSize: 21, weight: .bold, scale: .medium))?.withTintColor(UIColor(red: 0.553, green: 0.376, blue: 0.376, alpha: 1), renderingMode: .alwaysOriginal))
    //weight = 굵기 , scale = 크기
    
    let average_review: UILabel = {
        let label = UILabel()
        label.text = "4.6"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 30)
        //label.font = UIFont(name: "Inter-Medium", size: 30)
        label.textColor =  UIColor(red: 0.553, green: 0.376, blue: 0.376, alpha: 1)
        return label
    }()
    
    let five: UILabel = {
        let label = UILabel()
        label.text = "/ 5"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor =  UIColor(red: 0.553, green: 0.376, blue: 0.376, alpha: 1)
        return label
    }()
    
    let line: UILabel = {
        let view = UILabel()
        //view.frame = CGRect(x: 0, y: 0, width: 351, height: 10)
        view.backgroundColor = UIColor(red: 0.553, green: 0.376, blue: 0.376, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var reviewDataSource: [Review] = [  .init(star: "5개", nickname: "닉네임", date: "| 3시간전", comment: "좋아요"),
                                        .init(star: "5개", nickname: "닉네임", date: "| 3시간전", comment: "좋아요")
                                        ,.init(star: "5개", nickname: "닉네임", date: "| 3시간전", comment: "좋아요")
                                        ,.init(star: "5개", nickname: "닉네임", date: "| 3시간전", comment: "좋아요")
                                        ,.init(star: "5개", nickname: "닉네임", date: "| 3시간전", comment: "좋아요")
                                        ,.init(star: "5개", nickname: "닉네임", date: "| 3시간전", comment: "좋아요")
  ]

    lazy var reviewContainerView: UIView = {
        let view = UIView()
        return view
    }()

    lazy var reviewTableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.separatorStyle = .none
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.rowHeight = 113 //(101+12)
        view.register(ReviewTableViewCell.self, forCellReuseIdentifier: ReviewTableViewCell.className)
        return view
    }()
    
    //edit button
    let editbutton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "edit"), for: .normal)
        button.backgroundColor = UIColor(red: 0.363, green: 0.142, blue: 0.142, alpha: 1)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 51 / 2
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.363, green: 0.142, blue: 0.142, alpha: 1)

        self.navigationController?.navigationBar.isHidden = false

//        let backbutton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        self.navigationItem.backBarButtonItem = backbutton
//        self.navigationItem.backBarButtonItem?.tintColor = .white

        setupDelegate()
        configure()

        //information
        view.addSubview(containerView)
        containerView.addSubview(informationTableView)
        containerView.snp.makeConstraints { maker in
            maker.top.equalTo(segmentedControl.snp.bottom)
            maker.width.equalToSuperview()
            maker.height.equalTo(311) //information 길이
        }

        informationTableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }


        //review
        view.addSubview(review)
        review.snp.makeConstraints { maker in
            maker.top.equalTo(segmentedControl.snp.bottom)
            maker.width.equalTo(view.snp.width)
            maker.height.equalTo(392)
        }
        review.isHidden = true
        
        review.addSubview(reviewContainerView)
        reviewContainerView.addSubview(reviewTableView)

        reviewContainerView.snp.makeConstraints { maker in
            maker.top.equalTo(segmentedControl.snp.bottom).inset(-80)
            maker.leading.equalTo(view.snp.leading)
            maker.centerX.equalToSuperview()
            maker.width.equalToSuperview()
            maker.height.equalTo(312) //information 길이
        }
        

        reviewTableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        
        review.addSubview(align)
        NSLayoutConstraint.activate([
            align.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 34),
            align.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24)
        ])
        
        review.addSubview(average_review)
        NSLayoutConstraint.activate([
            average_review.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            average_review.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 294.68)
        ])
        
        review.addSubview(five)
        NSLayoutConstraint.activate([
            five.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 35),
            five.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 346.68)
        ])
        
        review.addSubview(average_star)
        average_star.snp.makeConstraints { maker in
            maker.top.equalTo(segmentedControl.snp.bottom).inset(-28)
            maker.leading.equalTo(view.snp.leading).inset(255)
        }
        
        review.addSubview(line)
        line.snp.makeConstraints { maker in
            maker.top.equalTo(segmentedControl.snp.bottom).inset(-64)
            maker.width.equalTo(351)
            maker.height.equalTo(1)
            maker.centerX.equalTo(view.snp.centerX)
        }
        
        view.addSubview(white3)
        white3.snp.makeConstraints { maker in
            maker.top.equalTo(segmentedControl.snp.bottom)
            maker.bottom.equalTo(line.snp.top).offset(20)
            maker.leading.trailing.equalToSuperview()
            }
        white3.isHidden = true
        

    }
    
    
    private func setupDelegate() {
        pageViewController.dataSource = self
        pageViewController.delegate = self
    }

    private func configure() {
    
        view.addSubview(imageView1)
        imageView1.snp.makeConstraints { maker in
            maker.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            maker.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(230)
            maker.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            maker.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)        }


        view.addSubview(imageView2)
        imageView2.snp.makeConstraints { maker in
            maker.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            maker.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(230)
            maker.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            maker.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)        }

        view.addSubview(imageView3)
        imageView3.snp.makeConstraints { maker in
            maker.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            maker.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(230)
            maker.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            maker.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)        }
        
        view.addSubview(imageBackgroundView)
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        vc1.view.addSubview(imageView1)
        vc2.view.addSubview(imageView2)
        vc3.view.addSubview(imageView3)
        
        imageBackgroundView.snp.makeConstraints { maker in
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            maker.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(230)
            maker.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            maker.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }


        pageViewController.view.snp.makeConstraints { maker in
            maker.edges.equalTo(imageBackgroundView.snp.edges)
        }
        pageViewController.didMove(toParent: self)
        
        
        view.addSubview(white)
        white.snp.makeConstraints { maker in
            maker.top.equalTo(imageBackgroundView.snp.bottom)
            maker.bottom.equalTo(imageBackgroundView.snp.bottom).offset(90)
            maker.leading.trailing.equalToSuperview()
        }
        
        
        if let firstVC = dataViewControllers.first {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }


        view.addSubview(cafename)
        NSLayoutConstraint.activate([
            cafename.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27),
            cafename.topAnchor.constraint(equalTo: imageBackgroundView.bottomAnchor, constant: 20)
        ])
        
        view.addSubview(cafelocation)
        NSLayoutConstraint.activate([
            cafelocation.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27),
            cafelocation.topAnchor.constraint(equalTo: imageBackgroundView.bottomAnchor, constant: 60)
        ])


        view.addSubview(segmentedControlContainerView)
        segmentedControlContainerView.addSubview(segmentedControl)

        
        segmentedControlContainerView.snp.makeConstraints { maker in
            maker.top.equalTo(white.snp.bottom)
            maker.bottom.equalTo(white.snp.bottom).offset(58)
            maker.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            maker.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }


        // Constrain the segmented control to the container view
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: segmentedControlContainerView.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: segmentedControlContainerView.leadingAnchor),
            segmentedControl.centerXAnchor.constraint(equalTo: segmentedControlContainerView.centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: segmentedControlContainerView.centerYAnchor)
            ])
        
        
        //location
        
        view.addSubview(white2)
        white2.snp.makeConstraints { maker in
            maker.top.equalTo(segmentedControl.snp.bottom)
            maker.leading.trailing.equalToSuperview()
            maker.height.equalTo(300)
        }
        white2.isHidden = true
        
        view.addSubview(locationImageView)
        locationImageView.snp.makeConstraints { maker in
            maker.top.equalTo(white.snp.bottom).offset(81)
            maker.centerX.equalTo(view.snp.centerX)
            maker.width.equalTo(339)
            maker.height.equalTo(269) //information 길이
        }
        locationImageView.isHidden = true
        
    }
    
    private func editButton() {
        view.addSubview(editbutton)
        view.bringSubviewToFront(self.editbutton)
        editbutton.snp.makeConstraints { maker in
            maker.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(329)
            maker.top.equalTo(segmentedControlContainerView.snp.bottom).offset(210)
            maker.width.height.equalTo(51)
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        informationTableView.selectRow(at: IndexPath(row: 0, section: 0),
                            animated: true,
                            scrollPosition: .top)
        
        reviewTableView.selectRow(at: IndexPath(row: 0, section: 0),
                            animated: true,
                            scrollPosition: .top)
        
        
    }
    
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        changeSegmentedControlLinePosition()
    }

    // Change position of the underline
    private func changeSegmentedControlLinePosition() {
        let segmentIndex = CGFloat(segmentedControl.selectedSegmentIndex)
        let segmentWidth = segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments)
        _ = segmentWidth * segmentIndex
        // UIView.animate(withDuration: 0.3, animations: { [weak self] in
        // self?.leadingDistanceConstraint.constant = leadingDistance
        //self?.layoutIfNeeded()
        //})
        
        //시도
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            view.addSubview(containerView)
            containerView.isHidden = false
            white2.isHidden = true
            locationImageView.isHidden = true
            white3.isHidden = true
            review.isHidden = true
            editbutton.isHidden = true

        
        case 1:
            view.addSubview(white2)
            view.addSubview(locationImageView)
            containerView.isHidden = true
            white2.isHidden = false
            locationImageView.isHidden = false
            white3.isHidden = true
            review.isHidden = true
            editbutton.isHidden = true


        default:
            view.addSubview(review)
            editButton()
            containerView.isHidden = true
            white2.isHidden = true
            locationImageView.isHidden = true
            white3.isHidden = false
            review.isHidden = false
            editbutton.isHidden = false
        }
    }
    
    @objc func buttonClicked() {
        let nextVC = WriteReviewViewController()
        present(nextVC, animated: true, completion: nil)
    }
    
//    @objc func buttonClicked() {
//        let nextVC = WriteReviewViewController()
//        navigationController?.pushViewController(nextVC, animated: true)
//        //self.navigationItem.title = "리뷰쓰기"
//        //self.navigationController?.navigationBar.tintColor = .white
//
//    }

    
}

extension InfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
        //reviewDataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == informationTableView{
            let cell = informationTableView.dequeueReusableCell(withIdentifier: MyTableViewCell.className) as! MyTableViewCell
            cell.model = dataSource[indexPath.row]
            return cell
        }else if tableView == reviewTableView{
            let cell = reviewTableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.className) as! ReviewTableViewCell
            cell.model = reviewDataSource[indexPath.row]
            return cell
        }
       //let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.className) as! MyTableViewCell
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        //cell.model = dataSource[indexPath.row]
        //return cell
        return UITableViewCell()
    }
    /*
    func reviewTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reviewDataSource.count
    }

    func reviewTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reviewTableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.className) as! ReviewTableViewCell
        cell.model = reviewDataSource[indexPath.row]
        return cell
    }*/
}


extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}

extension InfoViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return dataViewControllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == dataViewControllers.count {
            return nil
        }
        return dataViewControllers[nextIndex]
    }
}
