CREATE TABLE IF NOT EXISTS public."PRUEBA"
(
    "ID_EMPLEADO" integer NOT NULL DEFAULT nextval('"PRUEBA_ID_EMPLEADO_seq"'::regclass),
    "NOMBRE" text COLLATE pg_catalog."default" NOT NULL,
    "APELLIDOS" text COLLATE pg_catalog."default" NOT NULL,
    "F_NACIMIENTO" date NOT NULL,
    "SEXO" "char" NOT NULL,
    "CARGO" text COLLATE pg_catalog."default" NOT NULL,
    "SALARIO" bigint NOT NULL,
    CONSTRAINT "PRUEBA_pkey" PRIMARY KEY ("ID_EMPLEADO")
)

INSERT INTO public."PRUEBA"(
	 "NOMBRE", "APELLIDOS", "F_NACIMIENTO", "SEXO", "CARGO", "SALARIO")
	VALUES ('Carlos', 'Jiménez Clarín', '1985-05-03', 'H', 'Mozo', 1500),
	('Elene', 'Rubio Cuestas', '1978-09-25', 'M', 'Secretaria', 1300),
	('José', 'Calvo Sisman', '1990-11-12', 'H', 'Mozo', 1400),
	('Margarita', 'Rodríguez Garcés', '1992-05-16', 'M', 'Secretaria', 1325);
	
SELECT * FROM "PRUEBA"

SELECT COUNT("ID_EMPLEADO") AS EMPLEADOS,"SEXO" FROM "PRUEBA" GROUP BY "SEXO"

create extension tablefunc

CREATE TABLE tbl (
   section   text
 , status    text
 , ct        integer  -- "count" is a reserved word in standard SQL
);

INSERT INTO tbl VALUES 
  ('A', 'Active', 1), ('A', 'Inactive', 2)
, ('B', 'Active', 4), ('B', 'Inactive', 5)
                    , ('C', 'Inactive', 7);
					
SELECT * FROM tbl

SELECT *
FROM   crosstab(
   'SELECT section, status, ct
    FROM   tbl
    ORDER  BY 1,2'  -- needs to be "ORDER BY 1,2" here
   ) AS ct ("Section" text, "Active" int, "Inactive" int);
