USE everyloop

SELECT TOP (1000) [Id]
            ,[ShipCity]
  FROM [everyloop].[company].[orders]

--*******************************************************************************
-- Övning 1 del 1
 --Företagets totala produktkatalog består av 77 unika produkter.
 --Om vi kollar bland våra ordrar,
 --hur stor andel av dessa produkter har vi någon gång leverarat till London?
 --*******************************************************************************

 SELECT COUNT(Distinct [ShipCountry]) AS NumberOfRows FROM company.orders -- 21 diffrent countres 

 SELECT COUNT([ShipCountry]) AS NumberOfRows FROM company.orders -- 482 rows with countries 

 SELECT COUNT(CASE WHEN [ShipCity] LIKE 'London' THEN [ShipCity] END) AS NumberOfRows FROM company.orders -- 20 ORDERS TO LONDON 
 
 SELECT COUNT(Distinct [ShipCity]) AS Countries FROM company.orders -- 69 distinct cities 

 --*******************************************************************************
 --Till vilken stad har vi levererat flest unika produkter?
 --*******************************************************************************

 SELECT  -- GERMANY with 80 orders
 [ShipCountry],
 COUNT([ShipCountry]) AS NumberOfRows
 FROM company.orders 
 GROUP BY [ShipCountry]
 
 --*******************************************************************************
 -- Av de produkter som inte längre finns I vårat sortiment, hur mycket har vi sålt för totalt till Tyskland?
 --*******************************************************************************

 --*******************************************************************************
 --För vilken produktkategori har vi högst lagervärde?
 --*******************************************************************************

-- SELECT [UnitPrice]
--      ,[UnitsInStock]
--	  ,[CategoryId]
--FROM company.products

--SELECT DISTINCT [CategoryId],
--				MAX([UnitPrice] * [UnitsInStock]) AS Suma
--FROM company.products p
--JOIN company.categories c
--ON c.Id = p.CategoryId
--GROUP BY  [CategoryId] 
--Order By Suma


SELECT c.CategoryName, Sum([UnitPrice] * [UnitsInStock]) AS Suma  -- Seafood
FROM company.products p
JOIN company.categories c
ON c.Id = p.CategoryId
GROUP BY c.CategoryName
Order By Suma

--SELECT c.CategoryName, p.UnitPrice, p.UnitsInStock
--FROM company.products p
--JOIN company.categories c
--ON c.Id = p.CategoryId

 --*******************************************************************************
 --Från vilken leverantör har vi sålt flest produkter totalt under sommaren 2013?
 --*******************************************************************************

 SELECT [OrderDate], YEAR(orders.OrderDate) AS Year,
 [ShipName]
 FROM company.orders
 WHERE YEAR(orders.OrderDate) = 2013

 SELECT TOP (1000) [Id]
      ,[OrderId]
      ,[ProductId]
      ,[Quantity]
  FROM [everyloop].[company].[order_details]

 SELECT DISTINCT [ShipName],COUNT(od.Quantity) AS soldProd  -- Save-a-lot MArkets
 FROM company.orders o
 JOIN company.order_details od
 On od.OrderId = o.Id
WHERE YEAR(o.OrderDate) = 2013
GROUP BY [ShipName]
Order by soldProd


 --*******************************************************************************
 --Från vilken leverantör har vi sålt flest produkter totalt under sommaren 2013?
 --*******************************************************************************
 
 declare @playlist varchar(max) = 'Heavy Metal Classic';

 USE everyloop

 SELECT --pt.[PlaylistId]
      --,pt.[TrackId],
	  --p.[Name] as 'PlaylistName',
	  t.[Name] as 'TrackName',
	  g.[Name] as 'Genre',
	  a.Title,
	  ar.[Name] AS 'ArtistName',
	  t.Milliseconds,
	  t.Bytes,
	  t.Composer
 FROM music.playlist_track AS pt
 INNER JOIN music.playlists AS p
 ON pt.PlaylistId = p.PlaylistId
 INNER JOIN music.tracks AS t
 ON pt.TrackId = t.TrackId
 INNER JOIN music.genres AS g
 ON t.GenreId = g.GenreId
 INNER JOIN music.albums AS a
 ON t.AlbumId = a.AlbumId
 INNER JOIN music.artists AS ar
 ON a.ArtistId = ar.ArtistId
 WHERE p.[Name] LIKE @playlist;

 SELECT SUM(t.Milliseconds) AS 'TotalMillisecounds',   -- Lost 238 278 582
 ar.[Name] AS 'ArtistName' 
 FROM music.tracks AS t
INNER JOIN music.albums AS a
 ON t.AlbumId = a.AlbumId
 INNER JOIN music.artists AS ar
 ON a.ArtistId = ar.ArtistId
 GROUP BY ar.[Name]
 ORDER BY TotalMillisecounds   

 SELECT AVG(t.Milliseconds) AS 'TotalMillisecounds',   -- 2589984
 FROM music.tracks AS t
INNER JOIN music.albums AS a
 ON t.AlbumId = a.AlbumId
 INNER JOIN music.artists AS ar
 ON a.ArtistId = ar.ArtistId
WHERE ar.[Name] LIKE 'Lost'
 GROUP BY ar.[Name]

SELECT Sum(t.Bytes/1000) as 'kB' -- 89985550
FROM music.tracks  as t
INNER JOIN music.media_types AS mt
ON t.MediaTypeId = mt.MediaTypeId
WHERE t.MediaTypeId = 3


SELECT p.[Name] As 'PlaylistName', -- Music with 198
COUNT(DISTINCT ar.[Name]) AS 'NumArtist'
 FROM music.playlist_track AS pt
 INNER JOIN music.playlists AS p
 ON pt.PlaylistId = p.PlaylistId
 INNER JOIN music.tracks AS t
 ON pt.TrackId = t.TrackId
 INNER JOIN music.genres AS g
 ON t.GenreId = g.GenreId
 INNER JOIN music.albums AS a
 ON t.AlbumId = a.AlbumId
 INNER JOIN music.artists AS ar
 ON a.ArtistId = ar.ArtistId
GROUP BY p.[Name]


SELECT --p.[Name] As 'PlaylistName', -- 
AVG(DISTINCT ar.[Name]) AS 'NumArtist'
 FROM (
		SELECT p.[Name],
		COUNT(DISTINCT ar.[Name]) AS 'NumArtist'
		FROM music.playlist_track AS pt
		INNER JOIN music.playlists AS p
 ON pt.PlaylistId = p.PlaylistId
 INNER JOIN music.tracks AS t
 ON pt.TrackId = t.TrackId
 INNER JOIN music.genres AS g
 ON t.GenreId = g.GenreId
 INNER JOIN music.albums AS a
 ON t.AlbumId = a.AlbumId
 INNER JOIN music.artists AS ar
 ON a.ArtistId = ar.ArtistId
 GROUP BY p.[Name])




 
--GROUP BY p.[Name]

SELECT AVG(num_artists) AS avg_artists
FROM (
  SELECT p.playlist_id, COUNT(DISTINCT t.artists) AS num_artists
  FROM playlists p
  JOIN tracks t ON p.track_id = t.track_id
  GROUP BY p.playlist_id
) AS subquery;