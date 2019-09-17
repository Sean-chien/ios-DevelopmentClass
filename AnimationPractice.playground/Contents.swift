import UIKit
import PlaygroundSupport

let liveView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
liveView.backgroundColor = .white

PlaygroundPage.current.liveView = liveView

let square = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
square.backgroundColor = .purple
liveView.addSubview(square)

UIView.animate(withDuration: 2.0, animations: {
  square.backgroundColor = .orange
  let scaleTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
  let translateTransform = CGAffineTransform(translationX: 200, y: 200)
  let rotateTransform = CGAffineTransform(rotationAngle: .pi)
  
  let comboTransform = scaleTransform    .concatenating(rotateTransform).concatenating(translateTransform)
  square.transform = comboTransform
}) { (_) in
  // after animation block is done
  UIView.animate(withDuration: 2.0, animations: {
    square.transform = .identity
  })
}



