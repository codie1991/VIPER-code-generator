//
//  MainWireframe.swift
//
//  Created: DATE
//

import Foundation

protocol TEMPLATEWireframeInterface {

    // Methods to navigate to other screens / modules
    func done()

}

class TEMPLATEWireframe {

    private let navigationController: UINavigationController
    private var moduleDelegate: TEMPLATEModuleDelegate?
    var pushedVCStack: [UIViewController]?

    required init(navigationController: UINavigationController, moduleDelegate: TEMPLATEModuleDelegate) {

        self.navigationController = navigationController
        self.moduleDelegate = moduleDelegate

    }

    deinit {
        print("Dealloc \(self.dynamicType)")
    }

    private func popSubModule() {

        guard let stack = pushedVCStack where !stack.isEmpty else {
            return
        }
        
        navigationController.setViewControllers(stack, animated: true)
        pushedVCStack = nil

    }

}

extension TEMPLATEWireframe: TEMPLATEWireframeInterface {

    func done() {
        moduleDelegate?.CAMEL_TEMP_NAMEModuleIsFinished()
    }

}
