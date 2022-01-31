use Messyvegetariancook;
ALTER TABLE `VWR INTERNAL Messyvegancook ingredients` ADD `groupName` TEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `segment`;
Update Messyvegetariancook.`VWR INTERNAL Messyvegancook ingredients` t1
inner join Messyvegetariancook.`VWR INTERNAL Messyvegancook recipeIngredients` c
on c.row_id=t1.parent_row_id 
set t1.groupName=c.groupName;

Insert into Group10.Ingredients(id,source_ind,groupName,ingredient)(select s.idid, i.source_index,i.groupName,i.recipeIngedient
FROM Messyvegetariancook.`VWR INTERNAL Messyvegancook ingredients`  i  
inner join Messyvegetariancook.`VWR INTERNAL Messyvegancook recipeIngredients` r on i.parent_row_id = r.row_id
inner join Messyvegetariancook.`VWR INTERNAL Messyvegancook recipe` s on s.row_id=r.parent_row_id);


ALTER TABLE `VWR INTERNAL Messyvegancook howToStep` ADD `howToSection` TEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `segment`;
Update Messyvegetariancook.`VWR INTERNAL Messyvegancook howToStep` c
inner join Messyvegetariancook.`VWR INTERNAL Messyvegancook recipeInstructions` t1
on t1.row_id=c.parent_row_id 
set c.howToSection=t1.howToSection;

Insert into Group10.Instructions(id,source_ind,section,instruction)(select s.idid, i.source_index,i.howToSection,i.recipeInstruction
FROM Messyvegetariancook.`VWR INTERNAL Messyvegancook howToStep`  i  
inner join Messyvegetariancook.`VWR INTERNAL Messyvegancook recipeInstructions` r on i.parent_row_id = r.row_id
inner join Messyvegetariancook.`VWR INTERNAL Messyvegancook recipe` s on s.row_id=r.parent_row_id);
