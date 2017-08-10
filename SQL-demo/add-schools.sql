--rename school_id
ALTER TABLE tbl_students DROP CONSTRAINT tbl_students_school_id_schools_id_fkey;
ALTER TABLE tbl_students RENAME COLUMN school_id TO old_school_id;

--rename tbl_schools
ALTER TABLE tbl_schools RENAME TO tbl_old_schools;
--rename pkey
ALTER TABLE tbl_old_schools DROP CONSTRAINT tbl_schools_id_pkey;
ALTER TABLE tbl_old_schools
  ADD CONSTRAINT tbl_old_schools_id_pkey PRIMARY KEY(school_id);

--rename fkey
ALTER TABLE tbl_old_schools DROP CONSTRAINT tbl_schools_religious_id_religious_id_fkey;
ALTER TABLE tbl_old_schools
  ADD CONSTRAINT tbl_old_schools_religious_id_religious_id_fkey FOREIGN KEY (religious_id)
      REFERENCES tbl_religious (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE tbl_old_schools DROP CONSTRAINT tbl_schools_state_id_states_id_fkey;
ALTER TABLE tbl_old_schools
  ADD CONSTRAINT tbl_old_schools_state_id_states_id_fkey FOREIGN KEY (state_id)
      REFERENCES tbl_states (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
             
ALTER TABLE tbl_students
  ADD CONSTRAINT tbl_students_old_school_id_schools_id_fkey FOREIGN KEY (old_school_id)
      REFERENCES tbl_old_schools (school_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;



  
-- Table: tbl_mch_schools

-- DROP TABLE tbl_mch_schools;

CREATE TABLE tbl_schools
(
  id integer NOT NULL,
  name character varying(255) NOT NULL,
  state_id integer,
  line_id integer,
  county_code character varying(6),
  county_id integer,
  county_name text,
  address text,
  city text,
  state text,
  zip text,
  zip4 text,
  zip_code text,
  phone character varying(16),
  township text,
  CONSTRAINT tbl_schools_id_pkey PRIMARY KEY (id),
  CONSTRAINT tbl_schools_state_id_states_id_fkey FOREIGN KEY (state_id)
      REFERENCES tbl_states (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT tbl_schools_line_id_school_lines_id_fkey FOREIGN KEY (line_id)
      REFERENCES tbl_school_lines (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT tbl_schools_county_id_counties_id_fkey FOREIGN KEY (county_id)
      REFERENCES tbl_counties (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tbl_schools
  OWNER TO postgres;
