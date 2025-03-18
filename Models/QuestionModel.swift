import Foundation

// Model for UserDetails
struct UserDetail: Identifiable, Codable {
    let id: Int
    let name: String
    let email: String
    let image: String
    let phone_number: String
    let fiqa: String
    let mufti_status: Int
    let user_type: String
    let device_id: String
    let a_code: String
    let g_code: String
    let email_code: Int
    let created_at: String
    let updated_at: String
    let interests: [String]
}

// Model for Query
struct Query: Identifiable, Codable {
    let id: Int
    let query_id: Int
    let user_id: Int
    let mufti_id: Int
    let question: String
    let status: Int
    let created_at: String
    let updated_at: String
    let fiqa: String
    let user_detail: UserDetail
}



// Model for the API Response containing an array of queries
struct QueriesResponse: Codable {
    let status: Bool
    let message: String
    let totalpages: Int
    let data: [Query]
}

