import Foundation

class AppointmentsViewModel: ObservableObject {
    @Published var appointments: [Appointments] = []

    // Function to fetch queries from the API with POST method and parameters
    func fetchQueries() {
        // Ensure the URL is valid
        guard let url = URL(string: "https://dashboard.mymuftiapp.com/public/api/profile/myAppointments") else {
            print("Invalid URL")
            return
        }
        
        // Create a URLRequest object for a POST request
        var request = URLRequest(url: url)
        request.httpMethod = "POST" // We are making a POST request
        
        // Add headers
        request.setValue("application/json", forHTTPHeaderField: "Accept")  // Expect JSON response
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")  // Send JSON request body
        
        // Create the body parameters
        let parameters: [String: Any] = [
            "user_id": 385,
            "search": "",
            "page": 1
        ]
        
        // Convert parameters to JSON data
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            request.httpBody = jsonData
        } catch {
            print("Failed to serialize parameters to JSON: \(error)")
            return
        }
        
        // Make the network request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle potential errors
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            // Ensure we received data
            guard let data = data else {
                print("No data received.")
                return
            }
            
            // Debugging: print the raw response data
            if let responseString = String(data: data, encoding: .utf8) {
                print("Raw Response: \(responseString)")
            }

            // Try decoding the response as JSON
            do {
                let decodedResponse = try JSONDecoder().decode(ApptResponse.self, from: data)
                DispatchQueue.main.async {
                   // print("Decoded Appointments: \(decodedResponse.data)")  // check the decoded data
                    self.appointments = decodedResponse.data
                }
            } catch {
                print("Failed to decode response: \(error)")
                if let errorData = String(data: data, encoding: .utf8) {
                    print("Response Data: \(errorData)")
                }
            }
        }
        
        // Start the network request
        task.resume()
    }
}

