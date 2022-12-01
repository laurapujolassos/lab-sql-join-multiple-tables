#Lab | SQL Joins on multiple tables
# 1. Write a query to display for each store its store ID, city, and country.
select store_id, city,country
from sakila.store s
join sakila.address a
on s.address_id = a.address_id
join sakila.city c
on a.city_id = c.city_id
join sakila.country co
on c.country_id = co.country_id;

# 2. Write a query to display how much business, in dollars, each store brought in.
select * from sakila.staff;
select * from sakila.payment;
select store_id, sum(amount)
from sakila.staff s 
left join sakila.payment p on s.staff_id = p.staff_id
GROUP BY store_id;

# 3. What is the average running time of films by category?
select name, avg(length)
from sakila.category c
join sakila.film_category fc
on c.category_id = fc.category_id
join sakila.film f
on fc.film_id = f.film_id
GROUP BY name;

# 4. Which film categories are longest?
select name, avg(length)
from sakila.category c
join sakila.film_category fc
on c.category_id = fc.category_id
join sakila.film f
on fc.film_id = f.film_id
GROUP BY name
order by avg(length) desc;

# 5.Display the most frequently rented movies in descending order.
select title, count(rental_id)
from sakila.film f
join sakila.inventory i 
on f.film_id= i.film_id
join sakila.rental r
on i.inventory_id= r.inventory_id
group by title
order by count(rental_id) desc;

#6. List the top five genres in gross revenue in descending order.
select name, sum(amount)
from sakila.category c
join sakila.film_category fc on c.category_id= fc.category_id
join sakila.film f on fc.film_id = f.film_id
join sakila.inventory i on f.film_id= i.film_id
join sakila.rental r on i.inventory_id = r.inventory_id
join sakila.payment p on r.staff_id= p.staff_id
group by name
order by sum(amount) desc;

# 7. Is "Academy Dinosaur" available for rent from Store 1?
select title, store_id, rental_date, return_date
from sakila.film f 
join sakila.inventory i on f.film_id = i.film_id
join sakila.rental r on i.inventory_id = r.inventory_id
where title = "Academy Dinosaur"
having store_id = 1; # Yes, is available for rent


