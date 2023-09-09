-- joining all tables together to create one table 

SELECT 
 a.`ID`, a.`Incident Type` , a.`Incident year`, a.`Reported Month` , a.`Region of Origin`,
 b.`Region of Incident`, 
 c.`Minimum Estimated Number of Missing`, d.`number of males` , d.`number of children` , 
 c.`Number of Dead` , c.`Number of Females` , c.`Number of Survivors` , 
 c.`Total Number of Dead and Missing` , 
 d.`Cause of Death` ,
 e.`Migration route`

FROM
    `Global Missing Migrants`.`global missing migrants dataset 1` a
        LEFT JOIN 
    `Global Missing Migrants`.`global missing migrants dataset 2` b ON a.`id` = b.`id`
        LEFT JOIN
    `Global Missing Migrants`.`global missing migrants dataset 3` c ON a.`id` = c.`id`
        LEFT JOIN
    `Global Missing Migrants`.`global missing migrants dataset 4` d ON a.`id` = d.`id`
        LEFT JOIN
    `Global Missing Migrants`.`global missing migrants dataset 5` e ON a.`id` = e.`id`
    
    
    -- create a view for the new table named global missing migrants 
    
    create view `global missing migrants` as
    SELECT 
 a.`ID`, a.`Incident Type` , a.`Incident year`, a.`Reported Month` , a.`Region of Origin`,
 b.`Region of Incident`, 
 c.`Minimum Estimated Number of Missing`, d.`number of males` , d.`number of children` , 
 c.`Number of Dead` , c.`Number of Females` , c.`Number of Survivors` , 
 c.`Total Number of Dead and Missing` , 
 d.`Cause of Death` ,
 e.`Migration route`

FROM
    `Global Missing Migrants`.`global missing migrants dataset 1` a
        LEFT JOIN 
    `Global Missing Migrants`.`global missing migrants dataset 2` b ON a.`id` = b.`id`
        LEFT JOIN
    `Global Missing Migrants`.`global missing migrants dataset 3` c ON a.`id` = c.`id`
        LEFT JOIN
    `Global Missing Migrants`.`global missing migrants dataset 4` d ON a.`id` = d.`id`
        LEFT JOIN
    `Global Missing Migrants`.`global missing migrants dataset 5` e ON a.`id` = e.`id`
    
    
-- Calculated descriptive statistics such as counts ,averages, minimum, maximum

-- Total Number of Dead and Missing` over years 

SELECT 
    `Incident year`,
    SUM(`Total Number of Dead and Missing`) AS Total_dead_missing
FROM
    `global missing migrants`
GROUP BY `Incident year`
ORDER BY SUM(`Total Number of Dead and Missing`) DESC
    
-- total Missing , survivors , dead , females , males , children

SELECT 
    SUM(`Minimum Estimated Number of Missing`) AS Total_missing,
    SUM(`number of survivors`) AS Total_survivors,
    SUM(`number of dead`) AS Total_dead,
    SUM(`Number of Females`) AS Total_females,
    SUM(`number of children`) AS Total_children,
    SUM(`number of males`) AS Total_males
FROM
    `global missing migrants`
    
-- total Missing , survivors , dead , females , males , children over years 

SELECT 
    `Incident year`,
    SUM(`Minimum Estimated Number of Missing`) AS Total_missing,
    SUM(`number of survivors`) AS Total_survivors,
    SUM(`number of dead`) AS Total_dead,
    SUM(`Number of Females`) AS Total_females,
    SUM(`number of children`) AS Total_children,
    SUM(`number of males`) AS Total_males
FROM
    `global missing migrants`
GROUP BY `Incident year`
  
-- total Total_dead_missing  vs.  Total_survivors  vs.  total males_females_children

SELECT 
    SUM(`total number of dead and missing`) as Total_dead_missing ,
    SUM(`number of survivors`) AS Total_survivors,
    SUM(`Number of Females` + `number of children` + `number of males`) 
FROM
    `global missing migrants`

-- most common causes of death 

SELECT 
    `cause of death`,
    COUNT(`cause of death`) AS `cause of death count`
FROM
    `global missing migrants`
GROUP BY `cause of death`
ORDER BY COUNT(`cause of death`) DESC

-- causes of death distribution across different regions or migration routes

SELECT 
    `migration route`, `cause of death`,
    COUNT(`cause of death`) AS `cause of death count`
FROM
    `global missing migrants`

GROUP BY `migration route` ,`cause of death`

ORDER BY COUNT(`cause of death`) DESC 

-- monthly and yearly variations in missing migrant numbers  

SELECT 
    `Incident year` ,
    `Reported Month` ,
	sum(`Minimum Estimated Number of Missing`) AS `Missing migrants Count` 
    
FROM
    `global missing migrants` 
GROUP BY `Incident year`, `Reported Month` 
ORDER BY `Missing migrants Count` DESC

-- yearly variations in dead migrant numbers

SELECT 
    `Incident year` ,
	sum(`number of dead`)  AS `Dead migrants Count` 
    
FROM
    `global missing migrants` 
GROUP BY `Incident year`
ORDER BY `Dead migrants Count`  DESC

-- monthly variations in dead migrant numbers

SELECT 
    `Reported Month` ,
	sum(`number of dead`)  AS `Dead migrants Count` 
    
FROM
    `global missing migrants` 
GROUP BY  `Reported Month` 
ORDER BY `Dead migrants Count`  DESC


--   Analyzed the distribution of missing migrants across different 
--   demographic categories using SQL queries and grouping techniques

SELECT 
    sum(`Minimum Estimated Number of Missing`) AS `Missing migrants Count` 
    
FROM
    `global missing migrants` 
GROUP BY  `Number of Females` 
ORDER BY `Missing migrants Count`  DESC






