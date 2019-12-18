DELETE FROM tbl_publisher WHERE publisherId > 0;

INSERT into tbl_publisher
    (publisherId, publisherName)
VALUES
    (1, "Picador USA");

DELETE FROM tbl_author WHERE authorId > 0;

INSERT INTO tbl_author
    (authorId, authorName)
VALUES
    (1, "Mark Lee");

DELETE FROM tbl_book WHERE bookId > 0;

INSERT INTO tbl_book
    (bookId, title, pubId)
VALUES
    (1, "The Lost Tribe", 1);

DELETE FROM tbl_library_branch WHERE branchId > 0;

INSERT INTO tbl_library_branch
    (branchId, branchName)
VALUES
    (1, "Sharptown");

INSERT INTO tbl_book_copies
    (bookId, branchId, noOfCopies)
VALUES
    (1, 1, 5);

SELECT
    noOfCopies
FROM
    tbl_book_copies
WHERE
    branchId = (
        SELECT
        branchId
    FROM
        tbl_library_branch
    WHERE
            branchName = "Sharptown")
    AND bookId = (
        SELECT bookId
    FROM tbl_book
    WHERE title = "The Lost Tribe"
    );

