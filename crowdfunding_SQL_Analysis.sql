-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

SELECT cf_id, backers_count ,outcomes
FROM campaign
WHERE outcomes='live'
ORDER BY backers_count DESC ;

select * from campaign
-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
select cf_id, count(backer_id)
from backer
group by (cf_id)


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
select co.first_name,co.last_name,co.email,c.goal-c.pledge as remaining_goal_amount
into email_contacts_remaining_goal_amount
from campaign as c
inner join contacts as co
on co.contact_id=c.contact_id
where outcomes='live' 
order by remaining_goal_amount DESC

-- Check the table
select *from email_contacts_remaining_goal_amount


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
select b.email,b.first_name,b.last_name,
c.cf_id,c.company_name,c.description,c.end_date,c.goal-c.pledge as left_of_goal
into email_backers_remaining_goal_amount
from campaign as c
left join backer as b
on c.cf_id= b.cf_id
where outcomes='live'
GROUP BY b.email,b.first_name,b.last_name,c.cf_id,c.company_name,c.description,c.end_date,left_of_goal
order by b.email DESC

-- Check the table
select * from email_backers_remaining_goal_amount


-- the email_backers_goal desc by last_name 
select b.email,b.first_name,b.last_name,
c.cf_id,c.company_name,c.description,c.end_date,c.goal-c.pledge as left_of_goal
into email_backers_remaining_goal_amount2
from campaign as c
left join backer as b
on c.cf_id= b.cf_id
where outcomes='live'
GROUP BY b.email,b.first_name,b.last_name,c.cf_id,c.company_name,c.description,c.end_date,left_of_goal
order by b.last_name DESC

-- Check the table
select * from email_backers_remaining_goal_amount2
