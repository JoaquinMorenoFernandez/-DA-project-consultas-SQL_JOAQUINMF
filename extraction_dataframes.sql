SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    a.address,
    ci.city,
    co.country,
    r.rental_id,
    r.rental_date,
    r.return_date,
    p.payment_id,
    p.amount,
    p.payment_date
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN payment p ON r.rental_id = p.rental_id;

SELECT
    f.film_id,
    LOWER(TRIM(f.title)) AS title,
    LOWER(TRIM(f.description)) AS description,
    f.length,
    f.rating,
    LOWER(l.name) AS language,
    c.category_id,
    LOWER(c.name) AS category,
    i.inventory_id
FROM film f
JOIN language l ON f.language_id = l.language_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
LEFT JOIN inventory i ON f.film_id = i.film_id;

SELECT
    f.film_id,
    LOWER(f.title) AS film_title,
    a.actor_id,
    LOWER(a.first_name) AS first_name,
    LOWER(a.last_name) AS last_name,
    CONCAT(LOWER(a.first_name), ' ', LOWER(a.last_name)) AS actor_full_name
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id;
