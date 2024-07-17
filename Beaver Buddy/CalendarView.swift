import SwiftUI
import SQLite

struct CalendarView: SwiftUI.View {
    @State private var screentimeRecords: [ScreentimeRecord] = []
    private var db: Connection? = CalendarView.setupDatabase()

    init() {
        createTable()
    }

    var body: some SwiftUI.View {
        NavigationView {
            List(screentimeRecords) { record in
                VStack(alignment: .leading) {
                    Text("Date: \(record.date)")
                    Text("Screentime: \(record.screentime) mins")
                    Text("Goal: \(record.goal) mins")
                    Text("Beaver's Happiness: \(record.happiness)")
                }
            }
            .navigationTitle("Calendar")
            .onAppear(perform: loadRecords)
        }
    }

    private static func setupDatabase() -> Connection? {
        do {
            let dbPath = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("screentime.sqlite")
                .path
            return try Connection(dbPath)
        } catch {
            print("Error setting up database: \(error)")
            return nil
        }
    }

    private func createTable() {
        guard let db = db else { return }
        let screentimeTable = Table("screentime")
        let date = Expression<String>("date")
        let screentime = Expression<Int>("screentime")
        let goal = Expression<Int>("goal")
        let happiness = Expression<Int>("happiness")

        do {
            try db.run(screentimeTable.create(ifNotExists: true) { t in
                t.column(date, primaryKey: true)
                t.column(screentime)
                t.column(goal)
                t.column(happiness)
            })
        } catch {
            print("Error creating table: \(error)")
        }
    }

    private func loadRecords() {
        guard let db = db else { return }
        let screentimeTable = Table("screentime")
        let date = Expression<String>("date")
        let screentime = Expression<Int>("screentime")
        let goal = Expression<Int>("goal")
        let happiness = Expression<Int>("happiness")

        do {
            let records = try db.prepare(screentimeTable)
            screentimeRecords = records.map { row in
                ScreentimeRecord(
                    date: row[date],
                    screentime: row[screentime],
                    goal: row[goal],
                    happiness: row[happiness]
                )
            }
        } catch {
            print("Error loading records: \(error)")
        }
    }
}

struct ScreentimeRecord: Identifiable {
    let id = UUID()
    let date: String
    let screentime: Int
    let goal: Int
    let happiness: Int
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        CalendarView()
    }
}
