//
//  TEMPLATEInteractor.swift
//
//  Created: DATE
//

protocol TEMPLATEInteractorInterface {

    var output: TEMPLATEInteractorOutput? { get set }
// Calls to the interactor typically return immediately, or use a copmpletion block
// to handle the (async) return of data, e.g.

}

class TEMPLATEInteractor {

    var output: TEMPLATEInteractorOutput?

    deinit {
        print("Dealloc \(self.dynamicType)")
    }

}

extension TEMPLATEInteractor: TEMPLATEInteractorInterface {


}
