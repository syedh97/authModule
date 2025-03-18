
import SwiftUI

// Function to format the created_at string
func formatCreatedAt(_ createdAt: String) -> String {
    // Step 1: Create a DateFormatter to convert the string into a Date object
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // The format of the input string
    
    // Step 2: Convert the string into a Date object
    if let date = inputFormatter.date(from: createdAt) {
        // Step 3: Create a DateFormatter to format the Date into the desired format
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MMM dd, yyyy" // Desired output format
        
        // Step 4: Convert the Date object to a formatted string
        return outputFormatter.string(from: date)
    }
    
    // Return the original string if date conversion fails
    return createdAt
}

// Function to get status text
func statusText(for status: Int) -> String {
    switch status {
    case 1:
        return "Accepted"
    case 0:
        return "Rejected"
    case 3:
        return "Pending"
    default:
        return "Unknown" // Default case if status is unexpected
    }
}

// Function to get background color for status
func statusBackgroundColor(for status: Int) -> Color {
    switch status {
    case 1:
        return Color.green.opacity(0.3) // Accepted status - green
    case 0:
        return Color.red.opacity(0.3) // Rejected status - red
    case 2:
        return Color.yellow.opacity(0.3) // Pending status - yellow
    default:
        return Color.gray.opacity(0.3) // Default color if status is unknown
    }
}

// Helper functions
func formatDate(_ date: String) -> (formattedDate: String, apptTime: String) {
    // Format the date from the API to a readable string (e.g., "17 Dec, 2023")
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    // Try to convert the string to a Date object
    if let dateObj = formatter.date(from: date) {
        // Formatting the full date (e.g., "17 Dec, 2023")
        formatter.dateFormat = "dd MMM, yyyy"
        let formattedDate = formatter.string(from: dateObj)
        
        // Formatting the time (e.g., "16:18" for 16:18:00)
        formatter.dateFormat = "HH:mm"
        let apptTime = formatter.string(from: dateObj)
        
        // Return both formatted date and appointment time
        return (formattedDate, apptTime)
    }
    
    // If the date format doesn't match, return the original input as both
    return (date, date)
}



/*

func statusText(for status: Int) -> String {
        // Display different status text based on the status code
        switch status {
        case 1:
            return "Pending"
        case 2:
            return "Completed"
        default:
            return "Unknown"
        }
    }
    
func statusBackgroundColor(for status: Int) -> Color {
        // Display different background color based on the status code
        switch status {
        case 1:
            return Color.yellow
        case 2:
            return Color.green
        default:
            return Color.gray
        }
    }
*/
