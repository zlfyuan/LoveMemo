//
//  ContentView.swift
//  LoveMemo
//
//  Created by zluof on 2024/11/8.
//

import SwiftUI
import CoreData
import SwiftUI
import SpriteKit


struct SnowParticleView: UIViewRepresentable {
    func makeUIView(context: Context) -> SKView {
        let skView = SKView()
        skView.allowsTransparency = true
        let scene = SKScene(size: UIScreen.main.bounds.size)
        scene.backgroundColor = .clear

        if let particle = SKEmitterNode(fileNamed: "MyParticleSnow.sks") {
            particle.position = CGPoint(x: scene.size.width / 2, y: scene.size.height)
       
            particle.particleSpeed = 20
            particle.yAcceleration = -10
            scene.addChild(particle)
        }
        
        skView.presentScene(scene)
        return skView
    }

    func updateUIView(_ uiView: SKView, context: Context) {}
}

struct SnowView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            SnowParticleView()
                            .ignoresSafeArea()
        }
    }
}

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        SnowView()
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
