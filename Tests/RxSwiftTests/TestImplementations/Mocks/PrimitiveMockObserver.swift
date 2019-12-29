//
//  PrimitiveMockObserver.swift
//  Tests
//
//  Created by Krunoslav Zaher on 6/4/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import RxSwift
import RxTest

final class PrimitiveMockObserver<Element> : ObserverType {
    private let events = Synchronized([Recorded<Event<Element>>]())

    var events: [Recorded<Event<Element>>] {
        self.events.value
    }
    
    func on(_ event: Event<Element>) {
        self.events.mutate { $0.append(Recorded(time: 0, value: event)) }
    }
}
