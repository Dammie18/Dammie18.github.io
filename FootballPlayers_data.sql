USE [master]
GO

SELECT [Year]
      ,[Team]
      ,[NAME ]
      ,[No#]
      ,[Pos]
      ,[Ht]
      ,[Wt]
      ,[Age]
      ,[Exp]
      ,[College]
      ,[FirstName]
      ,[LastName]
      ,[Ft]
      ,[In]
      ,[Inches]
      ,[NumGrp]
  FROM [dbo].[Football Players]

GO

--QUESTION 1
SELECT *
FROM [Football Players]
WHERE Team = 'Arizona'

--QUESTION 2
SELECT *
FROM [Football Players]
WHERE Pos = 'WR'

--QUESTION 3
SELECT *
FROM [Football Players]
WHERE Inches > 74

--QUESTION 4
SELECT *
FROM [Football Players]
WHERE College = 'Washington'

--QUESTION 5
SELECT *
FROM [Football Players]
WHERE Age <= '25'

--QUESTION 6
SELECT *
FROM [Football Players]
WHERE Age = 'N/A'

--QUESTION 7
SELECT *
FROM [Football Players]
WHERE Exp = 'R'

--QUESTION 8
SELECT FirstName, LastName, Team, Inches
FROM [Football Players]
WHERE Team = 'New Orleans'
ORDER BY Inches DESC

--QUESTION 9
SELECT *
FROM [Football Players]
WHERE Wt > 250

--QUESTION 10
SELECT Pos, AVG (Inches) as AvgHeight
FROM [Football Players]
GROUP BY Pos

--QUESTION 11
SELECT Pos, FirstName, LastName, Wt
FROM [Football Players] p1
WHERE Wt = (
    SELECT MAX(Wt)
    FROM [Football Players] p2
    WHERE p2.Pos = p1.Pos
)

--QUESTION 12
SELECT Team, FirstName, LastName, Age, Wt,
       RANK() OVER (PARTITION BY Team 
	   ORDER BY Age DESC, Wt DESC) AS Age_Rank
FROM [Football Players]

--QUESTION 13-----------------------------------
SELECT AVG(Inches) AS Avg_Height
FROM [Football Players]
WHERE Age > 25
GROUP BY Inches


--QUESTION 14
WITH TeamAvgHeight AS (
    SELECT Team, AVG(Inches) AS Avg_Team_Height
    FROM [Football Players]
    GROUP BY Team
)
SELECT p.FirstName, p.LastName, p.Team, p.Inches, t.Avg_Team_Height
FROM [Football Players] p
JOIN TeamAvgHeight t
ON p.Team = t.Team
WHERE p.Inches > t.Avg_Team_Height

--QUESTION 15
SELECT LastName, COUNT(*) AS Player_Count
FROM [Football Players]
GROUP BY LastName
HAVING COUNT(*) > 1

--QUESTION 16
SELECT Pos, FirstName, LastName, Inches
FROM [Football Players] p1
WHERE Inches = (
    SELECT MIN(Inches)
    FROM [Football Players] p2
    WHERE p2.Pos = p1.Pos
)

--QUESTION 17
SELECT Team, Exp, COUNT(*) AS Player_Count
FROM [Football Players]
GROUP BY Team, Exp
ORDER BY Team, Exp

--QUESTION 18
WITH MaxMinHeights AS (
    SELECT College, 
           MAX(Inches) AS Max_Height, 
           MIN(Inches) AS Min_Height
    FROM [Football Players]
    GROUP BY College
)
SELECT p1.College, p1.FirstName AS Tallest_Player, p1.LastName AS Tallest_LastName, 
       p2.FirstName AS Shortest_Player, p2.LastName AS Shortest_LastName
FROM MaxMinHeights m
LEFT JOIN [Football Players] p1 ON p1.College = m.College AND p1.Inches = m.Max_Height
LEFT JOIN [Football Players] p2 ON p2.College = m.College AND p2.Inches = m.Min_Height

--QUESTION 19
WITH AvgWeightByPos AS (
    SELECT Pos, AVG(Wt) AS Avg_Wt
    FROM [Football Players]
    GROUP BY Pos
)
SELECT p.FirstName, p.LastName, p.Pos, p.Wt, a.Avg_Wt
FROM [Football Players] p
JOIN AvgWeightByPos a
ON p.Pos = a.Pos
WHERE p.Wt > a.Avg_Wt

--QUESTION 20
WITH TeamPosCounts AS (
    SELECT Team, Pos, COUNT(*) AS Pos_Count
    FROM [Football Players]
    GROUP BY Team, Pos
),
TeamTotalCounts AS (
    SELECT Team, COUNT(*) AS Total_Count
    FROM [Football Players]
    GROUP BY Team
)
SELECT p.Team, p.Pos, 
       (p.Pos_Count * 100.0 / t.Total_Count) AS Percentage
FROM TeamPosCounts p
JOIN TeamTotalCounts t
ON p.Team = t.Team
