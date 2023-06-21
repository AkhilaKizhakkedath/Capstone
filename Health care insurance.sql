DELETE FROM hospitalization.`hospitalisation details` where 'State ID' = '?';
DELETE FROM hospitalization.`hospitalisation details` where 'City tier' = '?';

ALTER TABLE `hospitalization`.`hospitalisation details` 
	CHANGE COLUMN `Customer ID` `Customer ID` varchar(20),
	ADD PRIMARY KEY (`Customer ID`);
	
ALTER TABLE `hospitalization`.`medical examinations` 
	CHANGE COLUMN `Customer ID` `Customer ID` varchar(20),
	ADD PRIMARY KEY (`Customer ID`);

select * from  hospitalization.`hospitalisation details`  as h inner join hospitalization.`medical examinations` as m
	on h.`Customer ID` = m.`Customer ID`;
	
SELECT m.HBA1C, m.`Heart Issues`, AVG(h.children), AVG(m.BMI), AVG(h.charges)
FROM hospitalization.`medical examinations` AS m
INNER JOIN hospitalization.`hospitalisation details` AS h ON h.`Customer ID` = m.`Customer ID`
WHERE m.HBA1C > 6.5 AND m.`Heart Issues` = 'yes'
GROUP BY m.HBA1C, m.`Heart Issues`;

select `Hospital tier`, avg(charges) as avg_cost from hospitalization.`hospitalisation details`  group by `Hospital tier`;
select `City tier`, avg(charges) as avg_cost from hospitalization.`hospitalisation details`  group by `City tier`;

select count(`Customer ID`) from hospitalization.`medical examinations`where `Cancer history`='Yes' and NumberOfMajorSurgeries>0;
select `State ID`, count(`Hospital tier`) from hospitalization.`hospitalisation details`   where `Hospital tier`='tier - 1' group by `State ID`;
