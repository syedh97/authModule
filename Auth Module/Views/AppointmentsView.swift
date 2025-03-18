import SwiftUI

struct AppointmentsView: View {
    @StateObject var appointmentsviewmodel = AppointmentsViewModel()
//    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        
            ZStack{
                BackGround()
                VStack {
                    if appointmentsviewmodel.appointments.isEmpty {
                        Text("No appointments available")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                    } else {
                        // ScrollView to display all the appointments
                        ScrollView {
                            ForEach(appointmentsviewmodel.appointments) { appointment in
                                // NavigationLink to AppointmentsDetailView
                                NavigationLink(destination: Testapptdetail(appt: appointment)) {
                                    VStack(alignment: .leading, spacing: 10) {
                                        // Appointment Date & Time
                                        HStack {
                                            Image("Subtract") // Placeholder image
                                            let formattedDate = formatDate(appointment.date).formattedDate
                                            let apptTime = formatDate(appointment.date).apptTime
                                            
                                            // Display formatted date
                                            Text(formattedDate)
                                            
                                            Spacer()
                                            
                                            HStack {
                                                Image("Clock Circle")
                                                Text(apptTime)
                                                
                                                Text("|")
                                                
                                                Text("\(appointment.duration) mins")
                                            }
                                        }
                                        Divider()
                                        HStack {
                                            Image(systemName: "person.circle")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                            
                                            VStack(alignment: .leading) {
                                                Text(" \(appointment.mufti_detail.name)")
                                            }
                                            
                                            Spacer()
                                            
                                            // Appointment Status
                                            Text(statusText(for: appointment.status))
                                                .padding(5)
                                                .background(statusBackgroundColor(for: appointment.status))
                                                .cornerRadius(5)
                                        }
                                        
                                        // Category
                                        HStack {
                                            Text("Category")
                                            Spacer()
                                            Text(appointment.category)
                                        }
                                        
                                        // Description
                                        Text(appointment.description)
                                            .padding(.vertical)
                                            .font(.body)
                                    }
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.gray.opacity(0.5))
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                }
                                .buttonStyle(PlainButtonStyle()) // To avoid default button style from NavigationLink
                            }
                        }
                    }
                }
                .onAppear {
                    appointmentsviewmodel.fetchQueries() // Fetch queries when the view appears
                }
            }
//            .navigationBarBackButtonHidden(true)
//          .navigationBarItems(leading: Button(action: {
//                // Add custom back action
//         presentationMode.wrappedValue.dismiss()
//            }) {
//                Image(systemName: "chevron.left") // Use only back arrow icon
//                   .foregroundColor(.cyan)
//           })
            
    }
}

#Preview {
    AppointmentsView()
}


