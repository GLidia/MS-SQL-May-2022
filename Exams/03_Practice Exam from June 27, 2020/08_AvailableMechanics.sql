SELECT CONCAT(m.FirstName, ' ', m.LastName) AS Available
FROM Mechanics AS m
WHERE m.MechanicId NOT IN (SELECT j.MechanicId FROM Jobs AS j WHERE j.[Status] IN ('Pending', 'In Progress'))
ORDER BY m.MechanicId