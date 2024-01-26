1934. Confirmation Rate

Table: Signups

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| user_id        | int      |
| time_stamp     | datetime |
+----------------+----------+
user_id is the column of unique values for this table.
Each row contains information about the signup time for the user with ID user_id.
 

Table: Confirmations

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| user_id        | int      |
| time_stamp     | datetime |
| action         | ENUM     |
+----------------+----------+
(user_id, time_stamp) is the primary key (combination of columns with unique values) for this table.
user_id is a foreign key (reference column) to the Signups table.
action is an ENUM (category) of the type ('confirmed', 'timeout')
Each row of this table indicates that the user with ID user_id requested a confirmation message at time_stamp and that confirmation message was either confirmed ('confirmed') or expired without confirming ('timeout').
 

The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. The confirmation rate of a user that did not request any confirmation messages is 0. Round the confirmation rate to two decimal places.

Write a solution to find the confirmation rate of each user.

Return the result table in any order.

The result format is in the following example.





# Write your MySQL query statement below
# Approach 1:
SELECT user_id, round(coalesce(confirmed/(timeout+confirmed),0),2) AS confirmation_rate FROM
(
SELECT s.user_id, SUM(CASE WHEN c.action = 'timeout' THEN 1 ELSE 0 END) AS timeout,
                 SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) AS confirmed
                 FROM Signups s LEFT JOIN Confirmations c ON s.user_id = c.user_id
                                                GROUP BY s.user_id
)temp;

# Approach 2:
# Write your MySQL query statement below


SELECT s.user_id, COALESCE(ROUND(AVG(case when c.action = 'confirmed' then 1 else 0 end),2),0) as confirmation_rate FROM
                                                                                            Signups s LEFT JOIN confirmations c
                                                                                            ON s.user_id = c.user_id 
                                                                                            GROUP BY s.user_id
