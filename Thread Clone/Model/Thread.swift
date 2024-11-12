//
//  Thread.swift
//  Thread Clone
//
//  Created by Howard Wu on 11/7/24.
//

import Firebase
import FirebaseFirestore

struct Thread: Identifiable, Codable {
    @DocumentID var threadID: String?
    
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    var id: String{
        return threadID ?? NSUUID().uuidString
    }
    
    var user: User?
}
