INSERT INTO tbl_library_branch (branchId, branchName)
    VALUES (2, "Shady Grove") ON DUPLICATE KEY branchName = branchName;

INSERT INTO tbl_library_branch (branchId, branchName)
    VALUES (3, "Foggy Bottom") ON DUPLICATE KEY branchName = branchName;

INSERT INTO tbl_book_copies (bookId, branchId, noOfCopies)
    VALUES (1, 2, 2);

INSERT INTO tbl_book_copies (bookId, branchId, noOfCopies)
    VALUES (1, 3, 4);

SELECT
    tbl_library_branch.branchname,
    tbl_book_copies.noofcopies
FROM
    tbl_library_branch
    JOIN tbl_book_copies ON tbl_library_branch.branchid = tbl_book_copies.branchid
WHERE
    tbl_book_copies.bookid = (
        SELECT
            bookid
        FROM
            tbl_book
        WHERE
            title = "The lost tribe");

