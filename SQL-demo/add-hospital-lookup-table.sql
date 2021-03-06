
SELECT  DISTINCT (RecruitStatus)
  FROM [Hospital] WHERE RecruitStatus IS NOT NULL ORDER BY RecruitStatus

 SELECT DISTINCT Status 
  FROM [Hospital] WHERE Status IS NOT NULL ORDER BY Status


   
 SELECT DISTINCT Specialty1
 FROM Clinics WHERE Specialty1 IS NOT NULL ORDER BY Specialty1

 SELECT DISTINCT Specialty2
 FROM [Hospital] WHERE Specialty2 IS NOT NULL ORDER BY Specialty2
  
 SELECT DISTINCT FollowUpBy
 FROM [Hospital] WHERE FollowUpBy IS NOT NULL ORDER BY FollowUpBy

 CREATE TABLE [RespFollowUpType] 
(Id int NOT NULL IDENTITY PRIMARY KEY,
    FollowUpNameType varchar(25))
GO

INSERT INTO RespFollowUpType(FollowUpNameType) 
	SELECT  DISTINCT FollowUpBy
	FROM [Hospital]
	WHERE FollowUpBy IS NOT NULL
	ORDER BY FollowUpBy
GO 

ALTER TABLE Hospital
ADD FollowUpNameId int
GO

ALTER TABLE Hospital
ADD FOREIGN KEY (FollowUpNameId) REFERENCES RespFollowUpType(Id);
GO

ALTER TABLE Hospital
DROP Constraint FK__FollowUpName__Id
GO

ALTER TABLE Hospital
ADD CONSTRAINT FK__FollowUpName__Id
FOREIGN KEY (FollowUpNameId) REFERENCES RespFollowUpType(Id)
ON DELETE CASCADE ON UPDATE CASCADE
GO

UPDATE Hospital
SET Hospital.FollowUpNameId = RespFollowUpType.Id
FROM RespFollowUpType
WHERE Hospital.FollowUpBy = RespFollowUpType.FollowUpNameType
GO

UPDATE Hospital
SET Status = 'ACTIVE'
Where Hospital.Status = 'active'

UPDATE Hospital
SET Hospital.Status = NULL
Where Hospital.Status = ''
