//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

open class XIBView: UIView {
    public init() {
        super.init(frame: .zero)
        loadSelfFromNib()
        setup()
    }

    override public init(frame: CGRect = .zero) {
        super.init(frame: frame)
        loadSelfFromNib()
        setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadSelfFromNib()
        setup()
    }

    open func setup() { }
}
