# DigitalLibrary Smart Contract

This project is a simple smart contract, build in `Solidity programming language` which allows to manage a digital library system on the Ethereum blockchain. It allows a designated librarian to add books to the library, and for users to borrow and return books. The contract also allows for updating the maximum capacity of the library.. This program also handles errors while handling the library using ```require(), assert() and revert()``` keywords.

## Description

The `DigitalLibrary` project is designed to handle works like adding books, finding maximum number of books and updating maximum number of books. It uses `require` to check inputs, `assert` to ensure the contract works correctly, and `revert` to cancel actions when needed. This contract is great for learning basic smart contract development.

## Getting Started

### Installing

To run this program, you must have the Solidity compiler installed in your system. Or you can use Remix, an online Solidity IDE. Remix website:- https://remix.ethereum.org/.

### Executing program

On reaching Remix website, you have to create a new file by "+" sign in the left-hand sidebar and save the file with .sol extension. Now, copy and paste the code into file: 

```solidity
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
```

To compile the code, you have to click on the "Solidity Compiler" tab in the left-hand sidebar. Before clicking on compile button, check if the compiler version is set to same as pragma in the code and then click on "DigitalLibrary.sol" icon.

When the code will compile, you will have to deploy the contract by putting a value in "uint256_maxBooks", just beside "value" and then, clicking on "Deploy" tab in the left-hand sidebar.

Select the "DigitalLibrary" contract from the dropdown menu.

<ol>
<li>At first, you can add the books in the library by entering the name of the book in "addBook" function.
<li>You can borrow the books by putting the book address which you want to borrow in "borrowBook" function.
<li>You can return the books which you borrowed earlier by putting the address of the book in "returnBook" function.
<li>At last, you can update maximum number of books that the library can hold by calling "updateMaxBook"function.
</ol>

## Help

For any issues or common problems related to this contract, refer Solidity documentation on internet.

## Authors

Shreyanshu Pandey <br> [@shreyanshupandey](pandeyrishi562@gmail.com)

## License

This project is licensed under the MIT License.
