-- 1)Retrieve all stations in the "East" region?
SELECT StationName, Location FROM stations
WHERE Location = "East";

-- 2)List all shows hosted by "Vrajesh Hirjee"?
SELECT hosts.HostID, HostName, ShowName 
FROM hosts LEFT JOIN shows ON hosts.HostID = shows.HostID
WHERE hosts.HostName = "Vrajesh Hirjee";

-- 3)Count the number of awards each show has won?
SELECT S.ShowID, ShowName, COUNT(AwardID) AS TOTAL
FROM shows S JOIN awards A ON S.ShowID= A.ShowID GROUP BY ShowID;


-- 4)Find shows that have partnerships with "Spotify"?
SELECT ShowName, PartnerName, LaunchDate 
FROM shows S JOIN showpartnerships SP ON S.ShowID = SP.ShowID
JOIN partnerships P ON SP.PartnershipID = P.PartnershipID
WHERE PartnerName="Spotify";


-- 5)Retrieve hosts who joined before 2010?
SELECT * FROM HOSTS WHERE YEAR(JoinDate) < 2010 ;

-- 6)List the shows and their launch dates in descending order of launch date?
SELECT ShowName, LaunchDate FROM shows ORDER BY LaunchDate DESC;

-- 7)Find the total count of shows for each host?
SELECT HostName, SUM(HostID) FROM hosts GROUP BY HostName;

-- 8)Show the online presence platforms with their links?
SELECT PlatformName, Link FROM onlinepresence;

-- 9)Retrieve the stations in the "South" region launched after 2010?
SELECT StationName, Location, LaunchDate FROM stations WHERE Location = "South" AND YEAR(LaunchDate) > 2010;

-- 10)Rank hosts based on the number of shows they have hosted?
SELECT HostName, ShowCount, dense_rank() OVER(ORDER BY ShowCount DESC) AS Rank_Column FROM hosts;