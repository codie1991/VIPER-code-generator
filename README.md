# VIPER-code-generator

This is a CLI tool for creating V.I.P.E.R modules in swift for iOS development.

## setup
To setup the tool for your project please add the `make_viper_module.sh` and `template` folder to your project.
I like to store it inside a folder called `Modules` in my Xcode project. This helps organise the finder files, then just a drag -> drop to Xcode to import.

## To Use
to use the module creator, browse in the Terminal to the `./make_viper_module.sh` this is followed by a single argument which is the `ModuleName`
e.g. `./make_viper_module.sh MyModuleName`

Pretty simple.

## Module Architecture
Basics of a module include the `View`, `Presenter`, `Interactor`, `Wireframe` and the `Builder`.

### The View
This is just a `ViewController`. It is a dumb class, it's told what to do. It exposes a `Protocol` where you can add methods that the `Presenter` can call. It also has a delegate called `input` which directs all actions to the `Presenter`.

### The Presenter
Acting as the hub, this is a plain object. It routes input request for navigation to the `Wireframe`, requests data or preforms business logic with the `Interactor`. It is also where we format our data models into display models for the `View`. This can be done inside the class if simple models or create a static class that builds them for you.

## The Interactor
This is where business logic goes such as API calls or data processing. Exposes a simple `Protocol` for the `Presenter` to call on, and also has a delegate called `output` which directs all data responses back to the `Presenter`. This is where any other services are called as per the VIPER model that you may require.

## The Wireframe
This is controlled again by the `Presenter` through an exposed `Protocol`. This controls navigating away from this module and building the stack at the current time. A delegate method exists to alert another module that this one is finished, when this is called the `popSubModule` method can be called to remove any extra modules.

## The Builder
The way a module works is by exposing a single ViewController, this is what iOS has given us and is built around. Using a static builder class which returns a `ViewController` subclass, the `View`, `Wireframe` and `Interactor` are created, then injected into a `Presenter`. Once this has been setup everything is started from the `ViewController`'s `viewWillAppear` method.

## Improvement
- an example module
- better documentation
