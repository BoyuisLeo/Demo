SELECT DISTINCT Hospitaltatus 
FROM [Hospital] WHERE Hospitaltatus IS NOT NULL ORDER BY Hospitaltatus

CREATE TABLE [HospitalType] 
(Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
StatusType varchar(25))
GO

SET IDENTITY_INSERT [HospitalType]  ON;
INSERT INTO HospitaltatusType
(Id, StatusType)
VALUES
(1, 'ACTIVE'),
(2, 'INACTIVE'),
(3, 'PROSPECTIVE');
GO
SET IDENTITY_INSERT [HospitalType]  OFF;


ALTER TABLE [Hospital]
ADD HospitaltatusTypeId INT
GO

ALTER TABLE [Hospital]
ADD CONSTRAINT FK_ClinicStatusTypeId_Id
FOREIGN KEY (HospitaltatusTypeId) REFERENCES HospitaltatusType(Id)
ON DELETE CASCADE ON UPDATE CASCADE
GO

UPDATE [Hospital] 
SET Hospital.HospitaltatusTypeId = HospitaltatusType.Id
FROM HospitaltatusType
WHERE Hospital.Hospitaltatus = HospitaltatusType.StatusType


