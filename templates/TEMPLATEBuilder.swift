//
//  TEMPLATEBuilder.swift
//
//  Created: DATE
//

protocol TEMPLATEModuleDelegate {
    func CAMEL_TEMP_NAMEModuleIsFinished()
}

class TEMPLATEBuilder {

    class func buildModule(navigationController: UINavigationController, moduleDelegate: TEMPLATEModuleDelegate) -> UIViewController {

        let view = TEMPLATEView()
        let interactor = TEMPLATEInteractor()
        let wireframe = TEMPLATEWireframe(navigationController: navigationController, moduleDelegate: moduleDelegate)

        let _ = TEMPLATEPresenter(view: view, interactor: interactor, wireframe: wireframe)

        return view
    }

}
