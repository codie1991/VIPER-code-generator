//
//  MainView.swift
//
//  Created: DATE
//

import UIKit

protocol TEMPLATEViewInterface: class {

    var input: TEMPLATEViewPresenterInput? { get set }
    // Methods provided for the Presenter to update the UI
}

class TEMPLATEView: UIViewController {

    var input: TEMPLATEViewPresenterInput?

    init() {

        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("Dealloc \(self.dynamicType)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .greenColor()

        let button = UIButton()

        button.setTitle("Close", forState: .Normal)
        button.addTarget(self, action: "buttonPressed", forControlEvents: .TouchUpInside)

        view.addSubview(button)
        // style and set constraints

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        edgesForExtendedLayout = .None
        navigationController?.setNavigationBarHidden(false, animated: false)

        input?.willAppear()
    }

    // MARK: - Actions

    func buttonPressed() {

        input?.done()

    }

}

extension TEMPLATEView: TEMPLATEViewInterface {

}
