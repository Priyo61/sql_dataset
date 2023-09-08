/*Write a SQL query to count the number of characters except for the spaces for each actor. 
Return the first 10 actors' name lengths along with their names.
List all Oscar awardees(Actors who received the Oscar award) with their full names and the length of their names.
Find the actors who have acted in the film ‘Frost Head.’
Pull all the films acted by the actor ‘Will Wilson.’
Pull all the films which were rented and return them in the month of May.
Pull all the films with ‘Comedy’ category.*/

/*--- task1

Write a SQL query to count the number of characters except for the spaces for each actor. 
Return the first 10 actors' name lengths along with their names.                        */


use mavenmovies;
select * from actor;

select concat(first_name,last_name)as fullname,length(concat(first_name,last_name)) as Len from actor
where actor_id limit 10;

/*--- task2  List all Oscar awardees(Actors who received the Oscar award) with their full names and the length of their names.*/

select * from actor_award;
select * from actor_award
where awards='oscar';
select concat(first_name,' ',last_name) as Fullname,
length(concat(first_name,' ',last_name)) as Len,awards from actor_award 
where awards='oscar';

/* task3
Find the actors who have acted in the film ‘Frost Head.’*/

select * from actor;
select * from film;
select * from film_actor;

select  first_name,last_name ,title as film_name from actor inner join film_actor on actor.actor_id=film_actor.actor_id
inner join film on film_actor.film_id=film.film_id
where title='Frost Head' ;

/*--- task4
Pull all the films acted by the actor ‘Will Wilson.’  */

select * from film;
select * from actor;
select * from film_actor;

select  first_name,last_name ,title as film_name from actor inner join film_actor on actor.actor_id=film_actor.actor_id
inner join film on film_actor.film_id=film.film_id
where first_name='will' and last_name='wilson';


--- task5
/*  Pull all the films which were rented and return them in the month of May.*/

select * from film;
select * from rental;
select * from inventory;

select title as film,return_date   from film inner join inventory on film.film_id=inventory.film_id
inner join rental on inventory.inventory_id=rental.inventory_id
where return_date like '2%%%-05-%';

/*  task-6
     Pull all the films with ‘Comedy’ category.     */
     
     use mavenmovies;
     select * from film;
     select * from category;
     select * from film_category;
     select title as Film_name,name from film inner join film_category on film.film_id=film_category.film_id
     inner join category on film_category.category_id=category.category_id
     where name='comedy' ;






