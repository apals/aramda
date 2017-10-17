//
//  ViewController.swift
//  Aramda
//
//  Created by Jesper Sandstrom on 10/17/17.
//  Copyright © 2017 jeppes. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    let defaultState: State = State()
    var sub: Disposable?
    
    struct State {
        var count: Int = 0
    }
    
    enum Action {
        case INCREMENT
        case DECREMENT
        case COLOR(color: UIColor)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let incrementStream = plusButton.rx.tap.map { Action.INCREMENT }
        let decrementStream = minusButton.rx.tap.map { Action.DECREMENT }
        
        sub = Observable.merge(incrementStream, decrementStream)
            .startWith(Action.INCREMENT)
            .scan(defaultState, accumulator: reduce)
            .subscribe(onNext: render)
    }
    
    func reduce(state: State = State(), action: Action) -> State {
        var state = state
        switch action {
        case .INCREMENT: state.count += 1
        default: state.count -= 1
        }
        return state
    }
    
    func render(state: State) {
        label.text = "\(state.count)"
    }
    
    @IBAction func get(_ sender: UIButton) {
        Http.get(endpoint: "exhibitors", type: [Exhibitor].self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        sub?.dispose()
    }
    
}


