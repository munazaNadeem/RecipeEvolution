use Messyvegetariancook; 
ALTER TABLE `VWR INTERNAL Messyvegancook recipe` ADD `idid` INT(9) NOT NULL AUTO_INCREMENT AFTER `url`, ADD UNIQUE `indexidid` (`idid`);
UPDATE `VWR INTERNAL Messyvegancook recipe` SET idid=idid+850000000;
CREATE TABLE `Messyvegetariancook`.`temp` ( `id` INT(9) NOT NULL , `url` TEXT NOT NULL ) ENGINE = InnoDB;
CREATE TABLE `Messyvegetariancook`.`temp2` ( `id` INT(9) NOT NULL , `url` TEXT NOT NULL ) ENGINE = InnoDB;
insert into temp (select min(idid),url  from `VWR INTERNAL Messyvegancook recipe` group by url having count(url) >1);
insert into temp2(select min(idid),url  from `VWR INTERNAL Messyvegancook recipe` group by url having count(url) =1);

insert into Group10.Recipes(id,name,url,image,recipeYield,datePublished,recipeCuisine,recipeCourse,commentCount)
(select idid,name,url,image,recipeYield,datePublished,recipeCuisine,recipeCourse,recipeComment
from `VWR INTERNAL Messyvegancook recipe` where idid in (select id from temp2))
UNION All
(select idid,name,url,image,recipeYield,datePublished,recipeCuisine,recipeCourse,recipeComment
from `VWR INTERNAL Messyvegancook recipe` where idid in (select id from temp));

Insert into Group10.Ingredients(id,source_ind,ingredient)(select r.idid, i.source_index,i.recipeIngedient
FROM Messyvegetariancook.`VWR INTERNAL Messyvegancook ingredients`  i  
inner join Messyvegetariancook.`VWR INTERNAL Messyvegancook recipe` r on i.parent_row_id = r.row_id);

Insert into Group10.Instructions(id,source_ind,instruction)(select r.idid, i.source_index,i.recipeInstruction
FROM  Messyvegetariancook.`VWR INTERNAL Messyvegancook howToStep` i  
inner join Messyvegetariancook.`VWR INTERNAL Messyvegancook recipe` r on i.parent_row_id = r.row_id);

