SELECT *
FROM hikingtrails.hikingtrails_thegorge

## Rename all columns for easy retrieve 
ALTER TABLE hikingtrails.hikingtrails_thegorge CHANGE `Trail Name` trail_name VARCHAR(100) NOT NULL;
ALTER TABLE hikingtrails.hikingtrails_thegorge CHANGE `Trail Type` trail_type VARCHAR(100) NOT NULL;
ALTER TABLE hikingtrails.hikingtrails_thegorge CHANGE `High Point` high_point VARCHAR(100) NOT NULL;
ALTER TABLE hikingtrails.hikingtrails_thegorge CHANGE `Elevation Gain` elevation_gain VARCHAR(100) NOT NULL;
ALTER TABLE hikingtrails.hikingtrails_thegorge CHANGE `Family Friendly` family_friendly VARCHAR(100) NOT NULL;

## Catgorized trail type into 7 types 


SELECT *
FROM hikingtrails.hikingtrails_thegorge

ALTER TABLE hikingtrails.hikingtrails_thegorge
ADD modified_trail_type VARCHAR(50);

UPDATE  hikingtrails.hikingtrails_thegorge
SET modified_trail_type = 
CASE 
	WHEN LOWER(trail_type) LIKE '%dogbone%' THEN 'Dogbone' 
	WHEN LOWER(trail_type) LIKE '%out%' THEN 'Out and Back'
    WHEN LOWER(trail_type) LIKE '%back%' THEN 'Out and Back'
	WHEN LOWER(trail_type) LIKE '%oop%'  THEN 'Loop'
    WHEN LOWER(trail_type) LIKE '%lollipop%' THEN 'Loop'
    WHEN LOWER(trail_type) LIKE '%log%' THEN 'Trail Log'
    WHEN LOWER(trail_type) LIKE '%traverse%' THEN 'Traverse'
    WHEN LOWER(trail_type) LIKE '%point%' THEN 'Point to Point'
    ELSE 'N/A'
    END; 

## Catgorized difficulty type into 3 levels: easy, moderaye and difficult 

ALTER TABLE hikingtrails.hikingtrails_thegorge
ADD difficulty_level VARCHAR(50)

UPDATE  hikingtrails.hikingtrails_thegorge
SET difficulty_level = 
CASE 
	WHEN Difficulty LIKE '%Easy%' THEN 'Easy' 
	WHEN Difficulty LIKE '%Moderate%' THEN 'Moderate'
    WHEN Difficulty LIKE '%Difficult%' THEN 'Difficult'
    ELSE 'N/A'
    END; 

## Extract Hiking Distance using LEFT function and change data type to decimal

ALTER TABLE hikingtrails.hikingtrails_thegorge
ADD new_distance VARCHAR(10);

UPDATE  hikingtrails.hikingtrails_thegorge
SET new_distance = LEFT(Distance,POSITION(" " IN Distance))

ALTER TABLE hikingtrails.hikingtrails_thegorge
MODIFY new_distance DECIMAL 

## Extract High Point using LEFT function and change data type to decimal

ALTER TABLE hikingtrails.hikingtrails_thegorge
ADD new_high_point VARCHAR(10);

UPDATE  hikingtrails.hikingtrails_thegorge
SET new_high_point = LEFT(high_point,POSITION(" " IN high_point))

## Extract Elevation Gain using LEFT function and change data type to decimal

ALTER TABLE hikingtrails.hikingtrails_thegorge
ADD new_elevation_gain VARCHAR(10);

UPDATE  hikingtrails.hikingtrails_thegorge
SET new_elevation_gain = LEFT(elevation_gain,POSITION(" " IN elevation_gain))

## Change null value to no records in new_high_point and new_elevation_gain column

UPDATE  hikingtrails.hikingtrails_thegorge
SET new_high_point = 'No records'
WHERE LENGTH(new_high_point) <1

UPDATE  hikingtrails.hikingtrails_thegorge
SET new_elevation_gain = 'No records'
WHERE LENGTH(new_elevation_gain) <1

## Restructure family_friendly column into yes and no options. Change cells with null data to 'No records'
ALTER TABLE hikingtrails.hikingtrails_thegorge
ADD new_family_friendly VARCHAR(10);

UPDATE  hikingtrails.hikingtrails_thegorge
SET new_family_friendly = CASE 
							WHEN family_friendly LIKE 'Yes%' THEN 'Yes'
							WHEN family_friendly LIKE 'No%' THEN 'No'
							ELSE 'No'
							END 
WHERE LENGTH(family_friendly) >1;


UPDATE  hikingtrails.hikingtrails_thegorge
SET new_family_friendly = 'No records'
WHERE LENGTH(family_friendly) <1

SELECT *
FROM hikingtrails.hikingtrails_thegorge

## Restructure Backpackable column into yes and no options. Change cells with null data to 'No records'
ALTER TABLE hikingtrails.hikingtrails_thegorge
ADD new_backpackable VARCHAR(10);

UPDATE  hikingtrails.hikingtrails_thegorge
SET new_backpackable = CASE 
							WHEN Backpackable LIKE 'Yes%' THEN 'Yes'
							WHEN Backpackable LIKE 'No%' THEN 'No'
							ELSE 'No'
							END 
WHERE LENGTH(Backpackable) >=1;


UPDATE  hikingtrails.hikingtrails_thegorge
SET new_backpackable = 'No records'
WHERE LENGTH(Backpackable) <1

## Restructure Crowded column into yes and no options. Change cells with null data to 'No records'
ALTER TABLE hikingtrails.hikingtrails_thegorge
ADD new_crowded VARCHAR(10);

UPDATE  hikingtrails.hikingtrails_thegorge
SET new_crowded = CASE 
							WHEN Crowded LIKE 'Yes%' THEN 'Yes'
							WHEN Crowded LIKE 'No%' THEN 'No'
							ELSE 'Yes'
							END 
WHERE LENGTH(Crowded) >=1;

UPDATE  hikingtrails.hikingtrails_thegorge
SET new_crowded = 'No records'
WHERE LENGTH(Crowded) <1

SELECT *
FROM hikingtrails.hikingtrails_thegorge

		






		




