//
//  ViewController.swift
//  Mars
//
//  Created by Ronnie Kissos on 8/26/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 70, height: 100)
        collectionView.collectionViewLayout = layout
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func simulateMartianRobots(input: String, maxX: Int, maxY: Int, scentSet: inout Set<String>) -> String {
        // Parse input and create robots
        var robotInputs: [String] = input.components(separatedBy: "\n")
        var robotResults: [String] = []
        
        // Process each robot's instructions
        for robotInput in robotInputs {
            let inputComponents = robotInput.split(separator: " ")
            guard inputComponents.count >= 4,
                  let x = Int(inputComponents[0]),
                  let y = Int(inputComponents[1]),
                  let orientation = inputComponents[2].first else {
                // Invalid input, skip this robot
                continue
            }
            
            let instructions = String(inputComponents[3])
            let robot = Robot(x: x, y: y, orientation: Orientation(rawValue: orientation) ?? <#default value#>)
            robot.executeInstructions(instructions: instructions, maxX: maxX, maxY: maxY, scentSet: &scentSet)
            
            robotResults.append("\(robot.x) \(robot.y) \(robot.orientation)")
        }
        
        return robotResults.joined(separator: "\n")
    }

}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print("You tapped me")
    }
}
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        
        cell.configure(with: UIImage(named: "image")!)
        
        return cell
    }
    
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView( collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
   
    
}

