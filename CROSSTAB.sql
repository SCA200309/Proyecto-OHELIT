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
