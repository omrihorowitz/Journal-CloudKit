//
//  Entry.swift
//  CloudKitJournal
//
//  Created by Omri Horowitz on 2/1/21.
//  Copyright © 2021 Zebadiah Watson. All rights reserved.
//

import CloudKit

struct EntryConstants{
    static let recordType = "Entry"
    fileprivate static let titleKey = "title"
    fileprivate static let bodyKey = "body"
    fileprivate static let timestampKey = "timestamp"
    }

class Entry {
    var title: String
    var body: String
    let timestamp: Date
    let ckRecordID: CKRecord.ID
    
    init(title: String, body: String, timestamp: Date = Date(), ckRecordID: CKRecord.ID = CKRecord.ID(recordName: UUID().uuidString)) {
        self.title = title
        self.body = body
        self.timestamp = timestamp
        self.ckRecordID = ckRecordID
    }
}

extension CKRecord{
  convenience init(entry: Entry){
    self.init(recordType: EntryConstants.recordType, recordID: entry.ckRecordID)
    self.setValue(entry.title, forKey: EntryConstants.titleKey)
    self.setValue(entry.body, forKey: EntryConstants.bodyKey)
    self.setValue(entry.timestamp, forKey: EntryConstants.timestampKey)
  }
}

extension Entry {
    
    convenience init?(ckRecord: CKRecord) {
        guard let title = ckRecord[EntryConstants.titleKey] as? String,
              let body = ckRecord[EntryConstants.bodyKey] as? String,
              let timestamp = ckRecord[EntryConstants.timestampKey] as? Date else { return nil }
        
        self.init(title: title, body: body, timestamp: timestamp)
    }
}
