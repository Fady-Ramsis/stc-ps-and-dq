create DATABASE [stc-ps-assessment]

-- Create User Table
CREATE TABLE User_ (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL
);

-- Create Training_details Table
CREATE TABLE Training_details (
    user_training_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    training_id INT NOT NULL,
    training_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User_(user_id)
);

INSERT INTO User_ (user_id, username) VALUES
(1, 'John Doe'),
(2, 'Jane Don'),
(3, 'Alice Jones'),
(4, 'Lisa Romero');

INSERT INTO Training_details (user_training_id, user_id, training_id, training_date) VALUES
(1, 1, 1, '2015-08-02'),
(2, 2, 1, '2015-08-03'),
(3, 3, 2, '2015-08-02'),
(4, 4, 2, '2015-08-04'),
(5, 2, 2, '2015-08-03'),
(6, 1, 1, '2015-08-02'),
(7, 3, 2, '2015-08-04'),
(8, 4, 3, '2015-08-03'),
(9, 1, 4, '2015-08-03'),
(10, 3, 1, '2015-08-02'),
(11, 4, 2, '2015-08-04'),
(12, 3, 2, '2015-08-02'),
(13, 1, 1, '2015-08-02'),
(14, 4, 3, '2015-08-03');

-- Select Query Result
SELECT
    td.user_id,
    u.username,
    td.training_id,
    td.training_date,
    COUNT(*) AS training_count
FROM
    Training_details td
    JOIN
    User_ u ON td.user_id = u.user_id
GROUP BY
        td.user_id, u.username, td.training_id, td.training_date
HAVING
        COUNT(*) > 1
ORDER BY
     td.training_date DESC;



