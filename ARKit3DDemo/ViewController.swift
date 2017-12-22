//
//  ViewController.swift
//  https://appcoda.com/arkit-3d-object/
//  Created by Jayven Nhan on 23/10/17.
//  Copyright © 2017 Jayven Nhan. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPaperPlane()
        configureLighting()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    func addPaperPlane(x: Float = 0, y: Float = 0, z: Float = -0.5) {
        // recursively parameter decides whether SceneKit searches child node subtree using a preorder traversal
        guard let paperPlaneScene = SCNScene(named: "paperPlane.scn"), let paperPlaneNode = paperPlaneScene.rootNode.childNode(withName: "paperPlane", recursively: true) else { return }
        paperPlaneNode.position = SCNVector3(x, y, z)
        sceneView.scene.rootNode.addChildNode(paperPlaneNode)
    }
    
    func configureLighting() {
        // SceneKit automatically adds lights to the scene. Technically, SceneKit automatically adds and places an omnidirectional light source when rendering scenes that contain no lights or only contain ambient lights.
        sceneView.autoenablesDefaultLighting = true
        /* the view automatically creates one or more SCNLight objects, adds them to the scene, and updates their properties to reflect estimated lighting information from the
        camera scene. You would want to set this value to false if you want to directly control all lighting in the SceneKit scene.*/
        sceneView.automaticallyUpdatesLighting = true
    }
}

