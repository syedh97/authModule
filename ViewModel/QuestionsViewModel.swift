import SwiftUI

class QuestionsViewModel: ObservableObject {
    @Published var queries: [Query] = []
/*    private var hasFetched = false*/ // Add a flag to check if data has already been fetched

    func fetchQueries() {
        // If data is already fetched, do nothing
//        if hasFetched {
//            print("Data already fetched. Skipping API call.")
//            return
//        }
        
        // Ensure the URL is valid
        guard let url = URL(string: "https://dashboard.mymuftiapp.com/public/api/profile/askForMe") else {
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
            "mufti_id": 9,
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
            
            // Check the response status code
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    print("Received non-200 response: \(httpResponse.statusCode)")
                    return
                }
                
                // Check if the response is of type HTML (which shouldn't happen for this endpoint)
                if let contentType = httpResponse.allHeaderFields["Content-Type"] as? String,
                   contentType.contains("html") {
                    print("Received HTML response instead of JSON.")
                    if let htmlString = String(data: data, encoding: .utf8) {
                        print("HTML Response: \(htmlString)") // Log the HTML response for debugging
                    }
                    return
                }
            }
            
            // Try decoding the response as JSON
            do {
                let decodedResponse = try JSONDecoder().decode(QueriesResponse.self, from: data)
                
                // Dispatch back to the main queue to update the UI
                DispatchQueue.main.async {
                    self.queries = decodedResponse.data
//                    self.hasFetched = true // Set flag to true after fetching data
//                    print("Data fetched successfully.")
                }
            } catch {
                print("Failed to decode response: \(error)")
                
                // Debugging: Print the raw response data for further inspection
                if let errorData = String(data: data, encoding: .utf8) {
                    print("Response Data: \(errorData)")
                }
            }
        }
        
        // Start the network request
        task.resume()
    }
}
