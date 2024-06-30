// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract DigitalLibrary {
    address public librarian;
    uint public maxBooks;
    uint public totalBooks;

    struct Book {
        uint id;
        string title;
        bool available;
    }

    mapping(uint => Book) public books;

    constructor(uint _maxBooks) {
        librarian = msg.sender;
        maxBooks = _maxBooks;
        totalBooks = 0;
    }

    // Function to add a new book to the library
    function addBook(string memory _title) public {
        require(msg.sender == librarian, "Only the librarian can add books.");
        require(totalBooks < maxBooks, "Library capacity reached. Cannot add more books.");

        totalBooks++;
        books[totalBooks] = Book(totalBooks, _title, true);
        
    }

    // Function to borrow a book from the library
    function borrowBook(uint _bookId) public {
        require(_bookId > 0 && _bookId <= totalBooks, "Invalid book ID.");
        require(books[_bookId].available, "Book is not available for borrowing.");

        books[_bookId].available = false;
    }

    // Function to return a borrowed book to the library
    function returnBook(uint _bookId) public {

        // Use of revert to handle specific conditions
        if (books[_bookId].available) {
            revert("Book is already available in the library.");
        }

        books[_bookId].available = true;
    }

    // Function to update the maximum number of books allowed in the library
    function updateMaxBooks(uint _newMaxBooks) public {

        // Use of Assert keyword to ensure that the updated count of new max books must me greater than current count of max books
        assert(_newMaxBooks > maxBooks);

        maxBooks = _newMaxBooks;
    }
}
