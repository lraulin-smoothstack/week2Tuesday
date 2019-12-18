INSERT INTO tbl_borrower (cardno, NAME, address, phone)
    VALUES (1, "Bob theBorrower", "5320 Mulberry Lane", "555-2056") ON DUPLICATE KEY UPDATE NAME = NAME;

INSERT INTO tbl_borrower (cardno, NAME, address, phone)
    VALUES (2, "Anne the Dyslexic", "2457 Cormorant Drive", "555-2576") ON DUPLICATE KEY UPDATE NAME = NAME;

INSERT INTO tbl_book_loans (bookid, branchid, cardno, dateout, duedate, datein)
    VALUES (1, 1, 1, Curdate (), Curdate () + 7, NULL);

INSERT INTO tbl_book_loans (bookid, branchid, cardno, dateout, duedate, datein)
    VALUES (1, 2, 2, Curdate () - 7, Curdate (), Curdate () - 1);

SELECT
    *
FROM
    tbl_borrower
WHERE
    cardno NOT IN (
        SELECT
            cardno
        FROM
            tbl_book_loans
        WHERE
            datein IS NULL);

