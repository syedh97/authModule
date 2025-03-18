import SwiftUI

struct QuestionsDetailView: View {
    var question: Query
    
    @ObservedObject var questionsviewModel = QuestionsViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack {
            
            BackGround() // Assuming this is your custom background
            
            VStack(alignment: .leading, spacing: 20) {
                
                // Static details for question status and other info
                HStack {
                    Text("Question request Status: ")
                    Spacer()
                    Text(statusText(for: question.status))
                        .padding(5)
                        .background(statusBackgroundColor(for: question.status))
                        .cornerRadius(5)
                }
                
                HStack {
                    Text("Questioned On: ")
                    Spacer()
                    Text(formatCreatedAt(question.created_at))
                }
                
                HStack {
                    Text("Fiqa: ")
                    Spacer()
                    Text(question.fiqa)
                }
                
                HStack {
                    Text("Category: ")
                    Spacer()
                    Text("No data")
                }
                
                Text("Questioned From:")
                
                // User info section
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 60, height: 60)
                    VStack(alignment: .leading) {
                        Text("Mufti Haneef")
                            .font(Font.poppinRegular(size: 18))
                        
                        Text("Family law, home Finance..")
                            .font(Font.poppinLight(size: 14))
                    }
                }
                
                // Ensure ScrollView content aligns to the leading edge
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Question:")
                        
                        Text(question.question) // Display the question content
                
                        Spacer()
                    }
                }
                .onAppear {
                    
                    questionsviewModel.fetchQueries()
                    // Fetch queries when the view appears
                }
//                .navigationBarItems(leading: Button(action: {
//                    // Add custom back action
//                    presentationMode.wrappedValue.dismiss()
//                }) {
//                    Image(systemName: "chevron.left") // Use only back arrow icon
//                        .foregroundColor(.cyan)
//                })
                
                 // Apply padding to VStack for outer content
            }
            .font(Font.poppinMedium(size: 16))
            .foregroundColor(.white)
            .padding()
            
        }
    }
    
}
