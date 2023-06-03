//
//  DBHelper.swift
//  GPA Calculator
//
//  Created by Mahmudul Hasan on 3/6/23.
//

import Foundation
import SQLite3

class DBHelper {
    var db : OpaquePointer?
    var path : String = "myDb.sqlite"
    init() {
        self.db = createDB()
        self.createTable()
    }
    
    func createDB() -> OpaquePointer? {
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathExtension(path)
        
        var db : OpaquePointer? = nil
        
        if sqlite3_open(filePath.path, &db) != SQLITE_OK {
            print("There is error in creating DB")
            return nil
        } else {
            print("Database has been created with path \(path)")
            return db
        }
    }
    
    func createTable() {
        let query = "CREATE TABLE IF NOT EXISTS grade(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, result TEXT, avg INTEGER, list TEXT);"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1 , &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Table creation success")
            } else {
                print("Table creation fail")
            }
        }  else {
            print("Prepration fail")
        }
    }
    
    func insert(name: String, result : String, avg : Int, list: [Grade]) {
        let query = "INSERT INTO grade(id, name, result, avg, list) VALUES (?, ?, ? ,?)"
        
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_int(statement, 1, 1)
            sqlite3_bind_text(statement, 2, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 3, (result as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 4, Int32(avg))
            
            let data = try! JSONEncoder().encode(list)
            let listString = String(data: data, encoding: .utf8)
            
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Data insert successfully")
            } else {
                print("Error on inserting data")
            }
        } else {
            print("Query is not as per Requirement")
        }
        
        
    }
    
    

}

