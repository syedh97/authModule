import Foundation

struct Appointments: Identifiable, Codable {
    let id: Int
    let duration: String
    let user_id: Int
    let mufti_id: Int
    let user_type: String // Added user_type
    let category: String
    let description: String
    let consultation_fee: String
    let date: String
    let status: Int
    let contact_number: String // Added contact_number
    let email: String // Added email
    let created_at: String // Added created_at
    let updated_at: String // Added updated_at
    let payment_id: String? // Added payment_id (optional)
    let payment_method: String? // Added payment_method (optional)
    let mufti_detail: MuftiDetail // Added mufti_detail to capture nested data
}



struct MuftiDetail: Codable {
    let id: Int
    let name: String
    let image: String
    let email: String
    let fiqa: String
    let phone_number: String
    let interests: [Interest]
}

struct Interest: Codable {
    let id: Int
    let user_id: Int
    let interest: String
}

struct ApptResponse: Codable {
    let status: Bool
    let message: String
    let totalpages: Int
    let data: [Appointments]
}

