//
//  3DView.swift
//  SwiftUI-SceneKit-3DModel
//
//  Created by mehmet karanlık on 12.07.2022.
//

import SwiftUI
import SceneKit

struct ThreeDView: View {
   @StateObject var vm = ThreeDViewModel()
   let bounds = UIScreen.main.bounds
    var body: some View {
       ZStack {
          LinearGradient(colors: [.black,.black], startPoint: .top, endPoint: .bottom)
             .ignoresSafeArea()
          VStack {
                SceneView(scene: {
                   let scene = SCNScene(named: vm.planets[vm.selectedIndex].modelName)
                   scene?.background.contents = UIColor.black
                   return scene
                }(), options: [.allowsCameraControl,.autoenablesDefaultLighting], preferredFramesPerSecond: 60, antialiasingMode: .multisampling4X)
             .frame(width: bounds.width, height: bounds.height / 2 , alignment: .center)

             buttonRow()

             Text(vm.planets[vm.selectedIndex].name)
                .font(.largeTitle)
                .foregroundColor(.white)
                .bold()
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,32)
                .padding(.top,16)

             Text(vm.planets[vm.selectedIndex].details)
                .padding(.horizontal,32)
                .padding(.top,5)
                .foregroundColor(.white)

             Spacer()
          }
          .ignoresSafeArea()
       }
    }

   @ViewBuilder
   func buttonRow() -> some View {
      HStack {
         Button {
            vm.previousPlanet()
         } label: {
            Image(systemName: "chevron.left")
               .imageModifier()
         }

         Spacer()
         Button {
            vm.nextPlanet()
         } label: {
            Image(systemName: "chevron.right")
               .imageModifier()
         }

      }
      .frame(maxWidth: .infinity)
      .padding(.horizontal,32)
   }
}

struct _DView_Previews: PreviewProvider {
    static var previews: some View {
       ThreeDView()
    }
}


extension Image {
   func imageModifier() -> some View {
      self
         .font(.title2)
         .fontWeight(.bold)
   }
}
