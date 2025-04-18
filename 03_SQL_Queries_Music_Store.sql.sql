
--Question Set 1 - Easy--

--1. Who is the senior most employee based on job title? 

SELECT TOP 1 * FROM employee
ORDER BY levels DESC;


--2. Which countries have the most Invoices? 

SELECT COUNT(*) AS [count],billing_country 
FROM invoice
GROUP BY billing_country
ORDER BY [count] DESC;



--3. What are top 3 values of total invoice? 

SELECT TOP 3 invoice_id,total FROM invoice
ORDER BY total DESC;



--4. Which city has the best customers? We would like to throw a promotional Music 
--Festival in the city we made the most money. Write a query that returns one city that 
--has the highest sum of invoice totals. Return both the city name & sum of all invoice 
--totals

SELECT billing_city,SUM(total) AS invoice_total
FROM invoice
GROUP BY billing_city
ORDER BY invoice_total DESC;



--5. Who is the best customer? The customer who has spent the most money will be 
--declared the best customer. Write a query that returns the person who has spent the 
--most money 

SELECT TOP 1 customer.first_name,customer.last_name,SUM(invoice.total) AS total
FROM customer
INNER JOIN invoice ON customer.customer_id=invoice.customer_id
GROUP BY customer.first_name,customer.last_name
ORDER BY total DESC;


--Question Set 2 – Moderate--


--1. Write query to return the email, first name, last name, & Genre of all Rock Music 
--listeners. Return your list ordered alphabetically by email starting with A

SELECT DISTINCT first_name,last_name,email
FROM customer
INNER JOIN invoice ON customer.customer_id=invoice.customer_id
INNER JOIN invoice_line ON invoice.invoice_id=invoice_line.invoice_id
WHERE track_id IN(
     SELECT track_id FROM track
	 INNER JOIN genre ON track.genre_id=genre.genre_id
	 WHERE genre.name LIKE 'Rock'
)
ORDER BY email;



--2. Let's invite the artists who have written the most rock music in our dataset. Write a 
--query that returns the Artist name and total track count of the top 10 rock bands 

SELECT TOP 5  artist.artist_id,artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track
INNER JOIN album ON album.album_id=track.album_id
INNER JOIN artist ON artist.artist_id=album.artist_id
INNER JOIN genre ON genre.genre_id=track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id,artist.name
ORDER BY number_of_songs DESC;


--3. Return all the track names that have a song length longer than the average song length. 
--Return the Name and Milliseconds for each track. Order by the song length with the 
--longest songs listed first 
--Q

SELECT name,milliseconds
FROM track
WHERE milliseconds>(
      SELECT AVG(milliseconds) AS avg_track_length
	  FROM track)
ORDER BY milliseconds DESC;


--Question Set 3 – Advance--


--1. Find how much amount spent by each customer on artists? Write a query to return 
--customer name, artist name and total spent 

WITH best_selling_artist AS (
    SELECT TOP 1 artist.artist_id,artist.name AS artist_name,
	SUM(invoice_line.unit_price*invoice_line.quantity) AS total_sales
    FROM invoice_line
    INNER JOIN track ON track.track_id = invoice_line.track_id
    INNER JOIN album ON album.album_id = track.album_id
    INNER JOIN artist ON artist.artist_id = album.artist_id
    GROUP BY artist.artist_id, artist.name
    ORDER BY total_sales DESC
)
SELECT c.customer_id,c.first_name,c.last_name,bsa.artist_name, 
SUM(il.unit_price*il.quantity) AS amount_spent
FROM invoice i
INNER JOIN customer c ON c.customer_id = i.customer_id
INNER JOIN invoice_line il ON il.invoice_id = i.invoice_id
INNER JOIN track t ON t.track_id = il.track_id
INNER JOIN album alb ON alb.album_id = t.album_id
INNER JOIN best_selling_artist bsa ON bsa.artist_id = alb.artist_id
GROUP BY c.customer_id,c.first_name,c.last_name, 
bsa.artist_name
ORDER BY amount_spent DESC;



--2. We want to find out the most popular music Genre for each country. We determine the 
--most popular genre as the genre with the highest amount of purchases. Write a query 
--that returns each country along with the top Genre. For countries where the maximum 
--number of purchases is shared return all Genres

WITH popular_genre AS (
    SELECT COUNT(invoice_line.quantity) AS purchases,customer.country,genre.name AS genre_name,genre.genre_id,
    ROW_NUMBER() OVER (PARTITION BY customer.country ORDER BY COUNT(invoice_line.quantity) DESC) AS RowNo
    FROM invoice_line
    JOIN invoice  ON invoice.invoice_id=invoice_line.invoice_id
    JOIN customer ON customer.customer_id=invoice.customer_id
    JOIN track    ON track.track_id=invoice_line.track_id
    JOIN genre    ON genre.genre_id=track.genre_id
    GROUP BY customer.country, genre.name, genre.genre_id
)
SELECT * FROM popular_genre
WHERE RowNo <= 1  
ORDER BY country ASC, purchases DESC;



--3. Write a query that determines the customer that has spent the most on music for each 
--country. Write a query that returns the country along with the top customer and how 
--much they spent. For countries where the top amount spent is shared, provide all 
--customers who spent this amount

WITH customer_with_country AS (
         SELECT customer.customer_id,first_name,last_name,billing_country,SUM(total) AS total_spending,
		 ROW_NUMBER() OVER(PARTITION BY billing_country ORDER BY SUM(total) DESC) AS RowNo
		 FROM invoice
		 INNER JOIN customer ON customer.customer_id=invoice.customer_id
		 GROUP BY customer.customer_id,first_name,last_name,billing_country)
SELECT * FROM customer_with_country 
WHERE RowNo<=1
ORDER BY billing_country ASC,total_spending DESC;


