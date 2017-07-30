

#1. Videos table. Create one table to keep track of the videos. This table should include a unique ID, the title of the
#video, the length in minutes, and the URL. Populate the table with at least three related videos from YouTube or
#other publicly available resources.
CREATE TABLE Videos(
video_id int PRIMARY KEY,
title varchar(30) NOT NULL,
length TIME NOT NULL,
URL varchar(512) NOT NULL
);

INSERT INTO Videos VALUES(1, 'Towers of Hanoi', 000345, 'https://www.youtube.com/watch?v=rVPuzFYlfYE');
INSERT INTO Videos VALUES(2, 'Recursive Function', 001140, 'https://www.youtube.com/watch?v=ozmE8G6YKww');
INSERT INTO Videos VALUES(3, 'Many_to_many', 001222, 'https://www.youtube.com/watch?v=uq_Wf4nuXqE&t=6s&list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p&index=82');

SELECT * FROM Videos;

#2. Create and populate Reviewers table. Create a second table that provides at least two user reviews for each of
#at least two of the videos. These should be imaginary reviews that include columns for the user’s name
#(“Asher”, “Cyd”, etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review
#(“Loved it!”). There should be a column that links back to the ID column in the table of videos.

CREATE TABLE Reviewers(
video_id INT NOT NULL REFERENCES Videos,
User_Name varchar(30) NOT NULL,
Rating INT CHECK(Rating BETWEEN 0 AND 5),
Review varchar(30) NOT NULL
);

#drop table reviewers;

INSERT INTO Reviewers VALUES(2, 'Clara', 4, 'Nice');
INSERT INTO Reviewers VALUES(2,'Sam', 2, 'Seen better');
INSERT INTO Reviewers VALUES(3,'Connie', NULL, 'Not bad');
INSERT INTO Reviewers VALUES(3, 'Deniz', 1, 'Awful');

SELECT * FROM REVIEWERS;

#3. Report on Video Reviews. Write a JOIN statement that shows information from both tables.
SELECT title, length, URL, User_Name, Rating, Review
FROM Videos v LEFT JOIN reviewers r ON v.video_id = r.video_id
ORDER BY title, Rating DESC;
