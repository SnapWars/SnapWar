class SWSharePageViewManager {
    fileprivate var entries: [SWSharePageViewEntry]?

    init(entries: [SWSharePageViewEntry]) {
        self.entries = entries
    }
    
    func getEntryCount() -> Int {
        guard let entries = self.entries else {
            return 0
        }

        return entries.count
    }
    
    func getInitialEntry() -> SWSharePageViewEntry? {
        guard let entries = self.entries else {
            return nil
        }

        return entries[0]
    }
    
    func getPreviousEntry(index: Int) -> SWSharePageViewEntry? {
        guard let entries = self.entries else {
            return nil
        }

        var currentIndex = index
        currentIndex -= 1
        
        if currentIndex < 0 {
            return nil
        }

        return entries[currentIndex]
    }
    
    func getNextEntry(index: Int) -> SWSharePageViewEntry? {
        guard let entries = self.entries else {
            return nil
        }

        var currentIndex = index
        currentIndex += 1

        if currentIndex >= entries.count {
            return nil
        }

        return entries[currentIndex]
    }
}
