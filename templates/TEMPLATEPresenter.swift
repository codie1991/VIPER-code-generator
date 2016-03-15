//
//  TEMPLATEPresenter.swift
//
//  Created: DATE
//

import MBCore
import ShowsApi

protocol TEMPLATEViewPresenterInput {

    func willAppear()
    // Methods called on the Presenter (the view's delegate) to respond to events
    func done()
}

protocol TEMPLATEInteractorOutput {
    // Methods called on the Presenter (the interactors delegate) to respond to business logic
}

class TEMPLATEPresenter {

    private weak var view: TEMPLATEViewInterface?
    private let interactor: TEMPLATEInteractorInterface
    private let wireframe: TEMPLATEWireframeInterface

    required init(view: TEMPLATEViewInterface, interactor: TEMPLATEInteractorInterface, wireframe: TEMPLATEWireframeInterface) {

        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe

        self.view?.input = self
        self.interactor.output = self
    }

    deinit {
        print("Dealloc \(self.dynamicType)")
    }

}

extension TEMPLATEPresenter: TEMPLATEInteractorOutput {

}

extension TEMPLATEPresenter: TEMPLATEViewPresenterInput {

    func willAppear() {

        // Get required data from the interactor, and refresh the view
    }

    // Delegate methods for the view result in calls to the wireframe (for navigation)
    // or the interactor for business logic

    func done() {
        wireframe.done()
    }

}
