//
//  AnimatedLoginView.swift
//  ToDoList
//
//  Created by Suad Demiri on 12.06.24.
//

import SwiftUI
import SplineRuntime

struct AnimatedLoginView: View {
    var body: some View {
        VStack () {
                   OnBoard3DView()
                       .frame(height: 550)
                       .ignoresSafeArea()
                       .cornerRadius(20)
                   
                   Text("3D Icons")
                       .foregroundStyle(Color.white)
                       .font(.largeTitle)
                       .fontWeight(.heavy)
                       .shadow(color: .black.opacity(0.15), radius: 2, x: 2, y: 2)
                       .padding(.vertical,50)
                   
                   Spacer()
               }
               .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
               .background(LinearGradient(colors: [Color.purple,Color.black], startPoint: .zero, endPoint: .bottomTrailing))
               .cornerRadius(20)
               .ignoresSafeArea()
           }
    }





struct OnBoard3DView: View {
    var body: some View {
        // fetching from cloud
                let url = URL(string: "https://build.spline.design/lTJlovmcoLIVOP9azXkz/scene.splineswift")!

                // // fetching from local
                // let url = Bundle.main.url(forResource: "scene", withExtension: "splineswift")!

                SplineView(sceneFileURL: url).ignoresSafeArea(.all)
            }
    }


#Preview {
    AnimatedLoginView()
}



