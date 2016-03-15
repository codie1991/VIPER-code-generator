//
//  MainWireframe.swift
//
//  Created: DATE
//

import Foundation
import MBCore
import ShowsApi

protocol TEMPLATEWireframeInterface {

    // Methods to navigate to other screens / modules
    func done()

}

class TEMPLATEWireframe {

    private let navigationController: UINavigationController
    private var moduleDelegate: TEMPLATEModuleDelegate?

    required init(navigationController: UINavigationController, moduleDelegate: TEMPLATEModuleDelegate) {

        self.navigationController = navigationController
        self.moduleDelegate = moduleDelegate

    }

    deinit {
        print("Dealloc \(self.dynamicType)")
    }

}

extension TEMPLATEWireframe: TEMPLATEWireframeInterface {

    func done() {
        moduleDelegate?.CAMEL_TEMP_NAMEModuleIsFinished()
    }

}
