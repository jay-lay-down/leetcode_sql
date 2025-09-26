
SELECT p.lastName, p.firstName, a.city, a.state
FROM Person as p
LEFT JOIN Address as a
 ON p.personId=a.personId;
