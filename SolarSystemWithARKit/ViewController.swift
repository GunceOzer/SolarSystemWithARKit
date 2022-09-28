//
//  ViewController.swift
//  SolarSystemWithARKit
//
//  Created by Günce Özer on 28.09.2022.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
    
        let sun = createSphere(radius: 0.3, content: "sun.jpeg", vector: SCNVector3(0,0.2,-1))
        let mercury = createSphere(radius: 0.2, content: "mercury.jpeg", vector: SCNVector3(0.5,0.2,-1))
        let venus = createSphere(radius: 0.25, content: "venus.png", vector: SCNVector3(1.0,0.2,-1))
        let earth = createSphere(radius: 0.3, content: "earth.jpeg", vector: SCNVector3(1.5,0.2,-1))
        let mars = createSphere(radius: 0.1, content: "mars.png", vector: SCNVector3(2,0.2,-1))
        let jupiter = createSphere(radius: 0.5, content: "jupiter.jpeg", vector: SCNVector3(2.5,0.2,-1))
        let saturn = createSphere(radius: 0.4, content: "saturn.jpeg", vector: SCNVector3(3,0.2,-1))
        let uranus = createSphere(radius: 0.27, content: "uranus.jpeg", vector: SCNVector3(3.5,0.2,-1))
        let neptune = createSphere(radius: 0.3, content: "neptune.jpeg", vector: SCNVector3(4,0.2,-1))
        
        sceneView.scene.rootNode.addChildNode(sun)
        sceneView.scene.rootNode.addChildNode(mercury)
        sceneView.scene.rootNode.addChildNode(venus)
        sceneView.scene.rootNode.addChildNode(earth)
        sceneView.scene.rootNode.addChildNode(mars)
        sceneView.scene.rootNode.addChildNode(jupiter)
        sceneView.scene.rootNode.addChildNode(saturn)
        sceneView.scene.rootNode.addChildNode(uranus)
        sceneView.scene.rootNode.addChildNode(neptune)
        
        
        
        sceneView.automaticallyUpdatesLighting = true
    }
    func createSphere(radius : CGFloat , content : String , vector: SCNVector3)->SCNNode{
        
        let mySphere = SCNSphere(radius: radius)
        let sphereMaterial = SCNMaterial()
        sphereMaterial.diffuse.contents = UIImage(named: "art.scnassets/\(content)")
        
                                                  
        mySphere.materials = [sphereMaterial]
        let node = SCNNode()
        node.position = vector
        node.geometry = mySphere
        sceneView.scene.rootNode.addChildNode(node)
        
        return node
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
