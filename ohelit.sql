Table: public.products

-- DROP TABLE IF EXISTS public.products;

CREATE TABLE IF NOT EXISTS public.products
(
    id integer NOT NULL,
    nombre_libro text COLLATE pg_catalog."default" NOT NULL,
    autor integer NOT NULL,
    genero integer NOT NULL,
    descripcion text COLLATE pg_catalog."default" NOT NULL,
    precio integer NOT NULL,
    fecha_publicacion date NOT NULL,
    cantidad integer NOT NULL,
    CONSTRAINT products_pkey PRIMARY KEY (id),
    CONSTRAINT autores_id FOREIGN KEY (autor)
        REFERENCES public.autores (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT genero_id FOREIGN KEY (genero)
        REFERENCES public."Generos" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.products
    OWNER to postgres;
-- Index: fki_autores_id

-- DROP INDEX IF EXISTS public.fki_autores_id;

-- Table: public.orders

-- DROP TABLE IF EXISTS public.orders;

CREATE TABLE IF NOT EXISTS public.orders
(
    id integer NOT NULL DEFAULT nextval('orders_id_seq'::regclass),
    user_id integer NOT NULL,
    CONSTRAINT orders_pkey PRIMARY KEY (id),
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES public.usuarios (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.orders
    OWNER to postgres;
-- Index: fki_user_id

-- DROP INDEX IF EXISTS public.fki_user_id;

CREATE INDEX IF NOT EXISTS fki_user_id
    ON public.orders USING btree
    (user_id ASC NULLS LAST)
    TABLESPACE pg_default;
    
    -- Table: public.Generos

-- DROP TABLE IF EXISTS public."Generos";

CREATE TABLE IF NOT EXISTS public."Generos"
(
    id bigint NOT NULL,
    name text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Generos_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Generos"
    OWNER to postgres;
    
    -- Table: public.autores

-- DROP TABLE IF EXISTS public.autores;

CREATE TABLE IF NOT EXISTS public.autores
(
    id bigint NOT NULL,
    nombre text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT autores_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.autores
    OWNER to postgres;

CREATE INDEX IF NOT EXISTS fki_autores_id
    ON public.products USING btree
    (autor ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_genero_id

-- DROP INDEX IF EXISTS public.fki_genero_id;

CREATE INDEX IF NOT EXISTS fki_genero_id
    ON public.products USING btree
    (genero ASC NULLS LAST)
    TABLESPACE pg_default;
    
    -- Table: public.order_details

-- DROP TABLE IF EXISTS public.order_details;

CREATE TABLE IF NOT EXISTS public.order_details
(
    id integer NOT NULL,
    orders_id integer NOT NULL,
    products_id integer NOT NULL,
    CONSTRAINT order_details_pkey PRIMARY KEY (id),
    CONSTRAINT orders_id FOREIGN KEY (orders_id)
        REFERENCES public.orders (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT products_id FOREIGN KEY (products_id)
        REFERENCES public.products (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.order_details
    OWNER to postgres;
-- Index: fki_orders_id

-- DROP INDEX IF EXISTS public.fki_orders_id;

CREATE INDEX IF NOT EXISTS fki_orders_id
    ON public.order_details USING btree
    (orders_id ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_products_id

-- DROP INDEX IF EXISTS public.fki_products_id;

CREATE INDEX IF NOT EXISTS fki_products_id
    ON public.order_details USING btree
    (products_id ASC NULLS LAST)
    TABLESPACE pg_default;
    
    -- Table: public.usuarios

-- DROP TABLE IF EXISTS public.usuarios;

CREATE TABLE IF NOT EXISTS public.usuarios
(
    id bigint NOT NULL,
    username text COLLATE pg_catalog."default" NOT NULL,
    email text COLLATE pg_catalog."default" NOT NULL,
    password bigint NOT NULL,
    direccion text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT usuarios_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.usuarios
    OWNER to postgres;
    
    -- Agregar datos a tabla Generos
    INSERT INTO public."Generos"(
	id, name)
	VALUES (1, 'Aventura'), (2,'Drama'), (3, 'Manga'), (4, 'Ciencia')
	;
  -- Agregar datos a tabla autores
  	INSERT INTO public."autores"(
	id, nombre)
	VALUES (1, 'Ana Bernal'), (2,'Mario Mendoza'), (3, 'Akira Toriyama'), (4, 'Alvaro Chaos Cador')
	;
  --Insertar datos tabla usuarios
  INSERT INTO public."usuarios"(id,username,email,password,direccion)
VALUES (1, 'SCA09','sebastianaldana@gmail.com',123455,'Cra 9 Bis # 49G - 40 SUR'),
(2, 'SCA092003','aldana@hotmail.com',12345155,'Cra 11 # 50G - 12 SUR'),
(3, 'Danipunko','danipunko11@gmail.com',048222222,'Cll 12 # 49G - 40 SUR'),
(4, 'Jenisebas','jenisebas23@gmail.com',1025,'Trv 9 Bis # 49H - 32 SUR');

-- Insertar datos en products 
INSERT INTO public.products(
	id, nombre_libro, autor, genero, descripcion, precio, fecha_publicacion, cantidad)
	VALUES (1, 'Maze Runner', 1, 1,'Libro de suspenso, drama y aventura en un mundo post apocaliptico', 22500, '01-02-2003', 10);
INSERT INTO public.products(
	id, nombre_libro, autor, genero, descripcion, precio, fecha_publicacion, cantidad)
	VALUES (2, 'Maze Runner2', 1, 1,'Libro de suspenso, drama y aventura en un mundo post apocaliptico', 32500, '01-02-2006', 25);
INSERT INTO public.products(
	id, nombre_libro, autor, genero, descripcion, precio, fecha_publicacion, cantidad)
	VALUES 	(3, 'Mensajero de Agartha', 1, 2,'Libro de suspenso, drama y aventura en un mundo donde un niño debe enseñar la importancia de la lectura', 45750, '11-05-2003', 14);
INSERT INTO public.products(
	id, nombre_libro, autor, genero, descripcion, precio, fecha_publicacion, cantidad)
	VALUES 		(4, 'Mensajero de Agartha: El placio de los sarcofagos', 1, 2,'Nuestro joven amigo dle primer librop debe encaminarse en una nueva aventura en el palacio de los sarcofagos', 55500, '21-11-2008', 100);
-- Insertar valores en orders
INSERT INTO public.orders(
	id, user_id)
	VALUES (1, 2), (2,3), (3,2),(4,1),(5,1),(6,4);
-- Insertar datos en order_details
INSERT INTO public.order_details(
	id, orders_id, products_id)
	VALUES (1, 1, 3),(2,2,4),(3,3,1),(4,4,1);
 -- Consulta de libros agrupados por la cnatidad que mas sea vendido de cada libro

  	SELECT count(ord.products_id),pr.nombre_libro FROM order_details ord LEFT JOIN products pr ON pr.id = ord.products_id GROUP BY pr.nombre_libro;
-- Consulta promedio valores de los libros de la tienda
	SELECT avg(precio) FROM products; 
    