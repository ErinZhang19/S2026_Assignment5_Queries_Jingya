SELECT quantityOnHand
FROM item
WHERE itemDescription LIKE '%antibiotics%';

SELECT volunteerName
FROM volunteer
WHERE volunteerTelephone NOT LIKE '2%' AND volunteerName NOT LIKE '%Jones';

SELECT DISTINCT v.volunteerName
FROM volunteer AS v
JOIN assignment AS a
ON a.volunteerId = v.volunteerId
JOIN task AS t
ON t.taskCode = a.taskCode
WHERE t.taskTypeId = 3;

SELECT t.taskDescription
FROM task AS t
LEFT JOIN assignment AS a
  ON t.taskCode = a.taskCode
WHERE a.taskCode IS NULL;

SELECT pt.packageTypeName
FROM packageType AS pt
JOIN package AS p
ON p.packageTypeId = pt.packageTypeId
JOIN package_contents AS pc
ON p.packageId = pc.packageId
JOIN item
ON pc.itemId = item.itemId
WHERE item.itemDescription LIKE '%bottle%';

SELECT i.itemDescription
FROM item AS i
LEFT JOIN package_contents AS pc
  ON i.itemId = pc.itemId
WHERE pc.itemId IS NULL;

SELECT DISTINCT t.taskDescription
FROM task AS t
JOIN assignment AS a
  ON t.taskCode = a.taskCode
JOIN volunteer AS v
  ON a.volunteerId = v.volunteerId
WHERE v.volunteerAddress LIKE '%NJ%';

SELECT DISTINCT v.volunteerName
FROM volunteer AS v
JOIN assignment AS a
  ON v.volunteerId = a.volunteerId
WHERE a.startDateTime >= '2021-01-01'
  AND a.startDateTime < '2021-07-01';

SELECT DISTINCT v.volunteerName
FROM volunteer AS v
JOIN assignment AS a
  ON v.volunteerId = a.volunteerId
JOIN task AS t
  ON a.taskCode = t.taskCode
JOIN package AS p
  ON t.taskCode = p.taskCode
JOIN package_contents AS pc
  ON p.packageId = pc.packageId
JOIN item AS i
  ON pc.itemId = i.itemId
WHERE i.itemDescription LIKE '%spam%';

SELECT DISTINCT i.itemDescription
FROM item AS i
JOIN package_contents AS pc
  ON i.itemId = pc.itemId
WHERE i.itemValue * pc.itemQuantity = 100;

SELECT ts.taskStatusName, COUNT(a.volunteerId) AS numVolunteers
FROM task_status AS ts
JOIN task AS t
  ON ts.taskStatusId = t.taskStatusId
JOIN assignment AS a
  ON t.taskCode = a.taskCode
GROUP BY ts.taskStatusName
ORDER BY numVolunteers DESC;

SELECT p.taskCode, SUM(p.packageWeight) AS totalWeight
FROM package AS p
GROUP BY p.taskCode
ORDER BY totalWeight DESC
LIMIT 1;

SELECT COUNT(*) AS numTasks
FROM task
WHERE taskTypeId != 2;

SELECT i.itemDescription
FROM item AS i
JOIN package_contents AS pc
  ON i.itemId = pc.itemId
JOIN package AS p
  ON pc.packageId = p.packageId
JOIN task AS t
  ON p.taskCode = t.taskCode
JOIN assignment AS a
  ON t.taskCode = a.taskCode
GROUP BY i.itemId
HAVING COUNT(DISTINCT a.volunteerId) < 3;

SELECT pc.packageId, SUM(i.itemValue * pc.itemQuantity) AS totalValue
FROM package_contents AS pc
JOIN item AS i
  ON pc.itemId = i.itemId
GROUP BY pc.packageId
HAVING SUM(i.itemValue * pc.itemQuantity) > 100
ORDER BY totalValue ASC;











