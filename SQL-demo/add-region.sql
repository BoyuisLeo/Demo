--ADD NEW COLUMNS TO tbl_employees_stores (REGION_ID, AREA_ID, DISTRICT_ID) AS FOREIGN KEYS
ALTER TABLE tbl_employees_stores
  ADD COLUMN region_id integer,
  ADD COLUMN area_id integer,
  ADD COLUMN district_id integer;


ALTER TABLE tbl_employees_stores
  ADD FOREIGN KEY (region_id)
  REFERENCES tbl_regions
  ON DELETE CASCADE;

ALTER TABLE tbl_employees_stores
  ADD FOREIGN KEY (area_id)
  REFERENCES tbl_areas
  ON DELETE CASCADE;

ALTER TABLE tbl_employees_stores
  ADD FOREIGN KEY (district_id)
  REFERENCES tbl_districts
  ON DELETE CASCADE;


--GET THE AREA OF EMPLOYEE (FROM home_center) AND ADD RECORDS ON tbl_employees_stores
INSERT INTO tbl_employees_stores (employees_id, area_id)
  SELECT e.id, s.area_id
    FROM tbl_employees e
    LEFT JOIN tbl_stores s
    ON e.home_center=s.id
  WHERE s.area_id IS NOT NULL and e.enabled = true;

--DELETE ALL THE DATA ON THE TBL_EMPLOYEES_STORES EXLUDING RECORDS THAT ARE NOT IN IT'S AREA
CREATE OR REPLACE FUNCTION deleteExtraEmployeesStores() RETURNS integer AS $$
DECLARE
  employee RECORD;
BEGIN
  FOR employee IN (SELECT e.id, e.enabled, s.area_id FROM tbl_employees e
  LEFT JOIN tbl_stores s
  ON e.store_id=s.id) LOOP
      DELETE FROM tbl_employees_stores
      WHERE area_id IS NULL
      AND employees_id=employee.id
	  AND employee.enabled = true
      AND stores_id in (SELECT id FROM tbl_stores WHERE area_id=employee.area_id);
  END LOOP;
  RETURN 1;
END;
$$ LANGUAGE plpgsql;

SELECT deleteExtraEmployeesStores();
