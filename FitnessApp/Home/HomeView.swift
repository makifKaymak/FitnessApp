//
//  HomeView.swift
//  FitnessApp
//
//  Created by Mehmet Akif Kaymak on 8.09.2024.
//

import SwiftUI

struct HomeView: View {
    @State var calories: Int = 123
    @State var active: Int = 52
    @State var stand: Int = 8
    
    var mockActivites = [
        Activity(id: 0, title: "Today steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .green, amount: "9,812"),
        Activity(id: 1, title: "Today", subtitle: "Goal 1,000", image: "figure.walk", tintColor: .red, amount: "812"),
        Activity(id: 2, title: "Today steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .blue, amount: "9,812"),
        Activity(id: 3, title: "Today steps", subtitle: "Goal 50,000", image: "figure.run", tintColor: .purple, amount: "55,812")
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("Welcome")
                    .font(.largeTitle)
                    .padding()
                
                HStack {
                    
                    Spacer()
                    
                    VStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Calories")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.red)
                            
                            Text("123 kcal")
                                .bold()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Active")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.green)
                            
                            Text("52 mins")
                                .bold()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Stand")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.red)
                            
                            Text("8 hours")
                                .bold()
                        }
                    }
                    
                    Spacer()
                    
                    ZStack {
                        ProgressCircleView(progress: $calories, goal: 600, color: .red)
                        ProgressCircleView(progress: $active, goal: 60, color: .green)
                            .padding(.all, 20)
                        ProgressCircleView(progress: $stand, goal: 12, color: .blue)
                            .padding(.all, 40)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding()
                
                HStack {
                    Text("Fitness Activity")
                        .font(.title2)
                    
                    Spacer()
                    
                    Button {
                        print("show more")
                    } label: {
                        Text("Show more")
                            .padding(.all, 10)
                            .foregroundStyle(.white)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                    ForEach(mockActivites, id: \.id) { activity in
                        ActivityCard(activity: activity)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    HomeView()
}
