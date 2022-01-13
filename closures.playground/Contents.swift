

struct Book {
    var title: String
    var pageCount: Int
    var rating: Int
}

let book1 = Book.init(title: "The Hobbit", pageCount: 300, rating: 2)
let book2 = Book.init(title: "The Little Prince", pageCount: 96, rating: 3)
let book3 = Book.init(title: "Harry Potter", pageCount: 350, rating: 8)

let allBooks = [book1, book2, book3]
print(allBooks)

func compareTwoBooks(firstBook: Book, secondBook: Book) -> Bool {
    if firstBook.pageCount <= secondBook.pageCount {
        return true
    } else {
        return false
    }
}


let pageSortedBooks = allBooks.sorted(by: compareTwoBooks)
pageSortedBooks
print(pageSortedBooks)

// Use closures

//this takes two book parameters and returns a bool
let ratingSortedBooks = allBooks.sorted { $0.rating >= $1.rating }
// can use $0 because it knows it is looking at property of allBooks

ratingSortedBooks
print(ratingSortedBooks)

//make it not case sensitive
let titleAsc = allBooks.sorted { $0.title.uppercased() <= $1.title.uppercased() }
print(titleAsc)

//filtering
let potterBooks = allBooks.filter { $0.title == "Harry Potter"}
print(potterBooks)



