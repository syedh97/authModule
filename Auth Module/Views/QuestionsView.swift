import SwiftUI

struct QuestionsView: View {
@StateObject var questionsviewModel = QuestionsViewModel()
    var body: some View {
        ZStack {
            BackGround()
            
            VStack(alignment: .leading, spacing: 20) {
                // Search Bar Section
                HStack {
                    Image(systemName: "magnifyingglass") // Using system name for magnifier icon
                    TextField("Enter your question", text: .constant(""))
                }
                .padding()
                .background(Color.gray.opacity(0.5))
                .cornerRadius(8)
                
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(questionsviewModel.queries, id: \.id) { query in
                            NavigationLink(destination: QuestionsDetailView(question: query)) {
                                VStack(alignment: .leading, spacing: 10) {
                                    HStack {
                                        Image(systemName: "person.circle")
                                            .resizable()
                                            .frame(width: 35, height: 35)
                                        
                                        VStack(alignment:.leading) {
                                            Text(query.user_detail.name)
                                            Text(formatCreatedAt(query.created_at))
                                                .font(Font.poppinMedium(size: 10))
                                        }
                                        
                                        Spacer()
                                        
                                        Text(statusText(for: query.status))
                                            .padding(5)
                                            .background(statusBackgroundColor(for: query.status))
                                            .cornerRadius(5)
                                    }
                                    
                                    Text(query.question)
                                        .lineLimit(1)
                                        .truncationMode(.tail)
                                        .padding()
                                        .cornerRadius(8)
                                }
                                .padding()
                                .background(Color.gray.opacity(0.5))
                                .cornerRadius(8)
                                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .foregroundColor(.white)
                }
                .onAppear {
                    if questionsviewModel.queries.isEmpty {
                        questionsviewModel.fetchQueries() // Fetch queries when the view appears
                        // Fetch queries when the view appears
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

