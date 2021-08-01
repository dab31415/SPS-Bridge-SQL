-- SQL Bridge Week 2 Assignment
-- SQL One to Many Relationships
-- Donald Butler
-- 07/31/2021

-- 1. Create and Populate Videos table
USE video_review;
DROP TABLE IF EXISTS Videos;
CREATE TABLE Videos (
	VideoId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Title varchar(100) NOT NULL,
    Length INT,
    URL varchar(100) NOT NULL
);
INSERT INTO Videos (Title, Length, URL) VALUES
	('Databases - Episode 6 - Joining Tables',6,'https://youtu.be/79EBoVPUzkE'),
    ('OneToMany',5,'https://youtu.be/tX4_j-74lPQ'),
    ('Databases - Episode 5 - Aggregation',6,'https://youtu.be/ZjuL-pfkUOA');

SELECT * FROM Videos;

-- 2. Create and Populate Reviewers table

DROP TABLE IF EXISTS Reviewers;
CREATE TABLE Reviewers (
	Username varchar(50) NOT NULL,
    VideoId INT NOT NULL,
    Rating TINYINT,
    ShortReview varchar(100)
);
INSERT INTO Reviewers (Username, VideoId, Rating, ShortReview) VALUES
	('MaryJane', 3, 4, 'Really Helped!'),
    ('MaryJane', 1, NULL, 'Not enough time to watch'),
    ('Samantha', 2, 0, 'No Audio'),
    ('John', 2, 1, 'Sound Missing');
    
SELECT * FROM Reviewers;

-- 3. Video Reviewers Report

SELECT v.Title, v.Length, v.URL, r.Username, r.Rating, r.ShortReview
FROM Videos v
INNER JOIN Reviewers r ON v.VideoId = r.VideoId


