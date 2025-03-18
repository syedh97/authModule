
import SwiftUI

struct Testapptdetail: View {
    
    var appt: Appointments
    
//    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        
        ZStack{
            BackGround()
            
            VStack(alignment: .leading, spacing: 20){
                
                HStack{
                    Text("Appointment Status")
                    Spacer()
                    Text(statusText(for: appt.status))
                }
                
                Text("Booked With: ")
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 60, height: 60)
                    VStack(alignment: .leading) {
                        Text("\(appt.mufti_detail.name)")
                            .font(Font.poppinRegular(size: 18))
                        
                        Text("Family law, home Finance..")
                            .font(Font.poppinLight(size: 14))
                    }
                }
                
                HStack{
                    Text("Category")
                    Spacer()
                    Text("\(appt.category)")
                }
                
                HStack{
                    Text("Phone number:")
                    Spacer()
                    Text("\(appt.contact_number)")
                }
                
                HStack{
                    Text("Email Address: ")
                    Spacer()
                    Text("\(appt.email)")
                }
                
                HStack{
                    Text("Appointment Duration")
                    Spacer()
                    Text("\(appt.duration) mins")
                    
                }
                HStack{
                    Text("Charges: ")
                    Spacer()
                    Text("\(appt.consultation_fee)")
                    
                }
                VStack(alignment: .leading){
                    
                Text("Description: ")
             
                Text("\(appt.description)")
                    Spacer()
                
            }

                
                Spacer()
            }
//            .navigationBarBackButtonHidden(true)
//            .navigationBarItems(leading: Button(action: {
//                // Add custom back action
//                presentationMode.wrappedValue.dismiss()
//            }) {
//                Image(systemName: "chevron.left") // Use only back arrow icon
//                    .foregroundColor(.cyan)
//            })
            
            .font(Font.poppinMedium(size: 16))
            .foregroundColor(.white)
            .padding()
           
        }
    }
}
