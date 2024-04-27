//
//  DatabaseConnection.swift
//  ToDoList
//
//  Created by Suad Demiri on 27.04.24.
//

import Foundation
import SQLite3



class DatabaseConnection {
    let dbPath: String
    var db: OpaquePointer?
    
    init() {
        // Setze den Pfad zur SQLite-Datenbankdatei
        dbPath =  "/Users/suad/IdeaProjects/Playground/database.db"
        
        // Öffnen der SQLite-Datenbankverbindung
        if sqlite3_open(dbPath, &db) == SQLITE_OK {
            print("Erfolgreich zur SQLite-Datenbank verbunden.")
            createTable()
        } else {
            print("Fehler beim Öffnen der SQLite-Datenbank.")
        }
    }
    
    // Erstellen der Benutzer-Tabelle
    func createTable() {
        let createTableString = """
            CREATE TABLE IF NOT EXISTS Users(
                Id INTEGER PRIMARY KEY AUTOINCREMENT,
                Name TEXT,
                Email TEXT UNIQUE,
                Password TEXT
            );
        """
        
        var createTableStatement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Benutzertabelle erfolgreich erstellt.")
            } else {
                print("Fehler beim Erstellen der Benutzertabelle.")
            }
        } else {
            print("Fehler beim Vorbereiten der Anweisung zum Erstellen der Benutzertabelle.")
        }
        
        sqlite3_finalize(createTableStatement)
    }
    
    // Weitere Methoden für Registrierung und Login
    
    // Simulierte Registrierungsfunktion
    func register(email: String, password: String, name: String) {
        let insertStatementString = "INSERT INTO Users (Name, Email, Password) VALUES (?, ?, ?);"
        var insertStatement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (password as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Benutzer erfolgreich registriert.")
            } else {
                print("Fehler beim Einfügen des Benutzers.")
            }
        } else {
            print("Fehler beim Vorbereiten der Anweisung zum Einfügen des Benutzers.")
        }
        
        sqlite3_finalize(insertStatement)
        
    }
    
    // Simulierte Login-Funktion
    func login(email: String, password: String) -> Bool {
        let queryStatementString = "SELECT * FROM Users WHERE Email = ? AND Password = ?;"
        var queryStatement: OpaquePointer?
        var loggedIn = false
        
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(queryStatement, 1, (email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(queryStatement, 2, (password as NSString).utf8String, -1, nil)
            
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                print("Erfolgreich eingeloggt.")
                loggedIn = true
            } else {
                print("Fehler beim Einloggen.")
            }
        } else {
            print("Fehler beim Vorbereiten der Anweisung zum Einloggen.")
        }
        
        sqlite3_finalize(queryStatement)
        
        return loggedIn
    }
    
}




