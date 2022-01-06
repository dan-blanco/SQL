


--
-- DELETE TABLES IF THEY EXIST
DROP TABLE IF EXISTS film CASCADE;
DROP TABLE IF EXISTS inventory CASCADE;
DROP TABLE IF EXISTS payment CASCADE;
DROP TABLE IF EXISTS customer CASCADE;
DROP TABLE IF EXISTS staff CASCADE;
DROP TABLE IF EXISTS rental CASCADE;
DROP TABLE IF EXISTS store CASCADE;


--
--
-- CREATE THE TABLES
CREATE TABLE film (
  film_id integer PRIMARY KEY NOT NULL,
  title character varying(255) NOT NULL,
  description text,
  release_year integer,
  language_id smallint NOT NULL,
  original_language_id smallint,
  rating integer
);


CREATE TABLE store (
  store_id integer PRIMARY KEY NOT NULL,
  address varchar(64) NOT NULL,
  city varchar(64) NOT NULL,
  state varchar(64) NOT NULL
); 


CREATE TABLE inventory (
  inventory_id SERIAL PRIMARY KEY NOT NULL,
  film_id smallint  NOT NULL,
  FOREIGN KEY(film_id) REFERENCES film(film_id),
  store_id smallint NOT NULL,
  FOREIGN KEY (store_id) REFERENCES store(store_id),
  last_update timestamp without time zone DEFAULT now() NOT NULL
);

CREATE TABLE customer (
  customer_id integer PRIMARY KEY NOT NULL,
  store_id smallint NOT NULL,
  FOREIGN KEY (store_id) REFERENCES store(store_id),
  first_name character varying(45) NOT NULL,
  last_name character varying(45) NOT NULL,
  email character varying(50),
  address_id smallint NOT NULL,
  activebool boolean DEFAULT true NOT NULL,
  create_date date DEFAULT ('now'::text)::date NOT NULL,
  last_update timestamp without time zone DEFAULT now(),
  active integer
);


CREATE TABLE rental (
  rental_id SERIAL PRIMARY KEY NOT NULL,
  rental_date timestamp without time zone NOT NULL,
  inventory_id integer NOT NULL,
  FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id),
  customer_id smallint NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  return_date timestamp without time zone,
  store_id smallint NOT NULL,
  FOREIGN KEY (store_id) REFERENCES store(store_id),
  last_update timestamp without time zone DEFAULT now() NOT NULL
);

CREATE TABLE payment (
  payment_id SERIAL PRIMARY KEY NOT NULL,
  customer_id smallint NOT NULL,
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
  rental_id integer NOT NULL,
  FOREIGN KEY(rental_id) REFERENCES rental(rental_id),
  amount numeric(5,2) NOT NULL,
  payment_date timestamp without time zone DEFAULT now() NOT NULL
);
--
--
--
-- END CREATE TABLE














TRUNCATE store CASCADE;
TRUNCATE customer CASCADE;
TRUNCATE film CASCADE;
TRUNCATE inventory CASCADE;
TRUNCATE rental CASCADE;
TRUNCATE payment CASCADE;


--
-- INSERT STORES
INSERT INTO store(
	store_id, address, city, state)
	VALUES (1, '162 rush st', 'San Jose', 'CA');
	
INSERT INTO store(
	store_id, address, city, state)
	VALUES (2, '89 Lexington way', 'Montgomery', 'GA');
	
	INSERT INTO store(
	store_id, address, city, state)
	VALUES (3, '88 bill rd', 'Salt Lake City', 'UT');
	
	
INSERT INTO store(
	store_id, address, city, state)
	VALUES (4, '7799 Richard st', 'Jersey', 'NJ');
	
INSERT INTO store(
	store_id, address, city, state)
	VALUES (5, '3612 sandstone crt', 'Houstin', 'TX');
	
INSERT INTO store(
	store_id, address, city, state)
	VALUES (6, '562 blue st', 'Chicago', 'IL');
	
INSERT INTO store(
	store_id, address, city, state)
	VALUES (7, '2144 Mississippi blvd', 'Kindal', 'FL');
	
INSERT INTO store(
	store_id, address, city, state)
	VALUES (8, '78 unit b beachview st', 'Orange County', 'CA');
	

--
--INSERT CUSTOMERS
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('1','5','MARY','SMITH','MARY.SMITH@sakilacustomer.org','5','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('2','4','PATRICIA','JOHNSON','PATRICIA.JOHNSON@sakilacustomer.org','6','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('3','1','LINDA','WILLIAMS','LINDA.WILLIAMS@sakilacustomer.org','7','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('4','2','BARBARA','JONES','BARBARA.JONES@sakilacustomer.org','8','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('5','6','ELIZABETH','BROWN','ELIZABETH.BROWN@sakilacustomer.org','9','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('6','1','JENNIFER','DAVIS','JENNIFER.DAVIS@sakilacustomer.org','10','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('7','1','MARIA','MILLER','MARIA.MILLER@sakilacustomer.org','11','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('8','2','SUSAN','WILSON','SUSAN.WILSON@sakilacustomer.org','12','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('9','2','MARGARET','MOORE','MARGARET.MOORE@sakilacustomer.org','13','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('10','1','DOROTHY','TAYLOR','DOROTHY.TAYLOR@sakilacustomer.org','14','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('11','4','LISA','ANDERSON','LISA.ANDERSON@sakilacustomer.org','15','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('12','1','NANCY','THOMAS','NANCY.THOMAS@sakilacustomer.org','16','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('13','4','KAREN','JACKSON','KAREN.JACKSON@sakilacustomer.org','17','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('14','2','BETTY','WHITE','BETTY.WHITE@sakilacustomer.org','18','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('15','8','HELEN','HARRIS','HELEN.HARRIS@sakilacustomer.org','19','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('16','8','SANDRA','MARTIN','SANDRA.MARTIN@sakilacustomer.org','20','0','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('17','7','DONNA','THOMPSON','DONNA.THOMPSON@sakilacustomer.org','21','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('18','7','CAROL','GARCIA','CAROL.GARCIA@sakilacustomer.org','22','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('19','6','RUTH','MARTINEZ','RUTH.MARTINEZ@sakilacustomer.org','23','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('20','5','SHARON','ROBINSON','SHARON.ROBINSON@sakilacustomer.org','24','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('21','5','MICHELLE','CLARK','MICHELLE.CLARK@sakilacustomer.org','25','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('22','5','LAURA','RODRIGUEZ','LAURA.RODRIGUEZ@sakilacustomer.org','26','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('23','4','SARAH','LEWIS','SARAH.LEWIS@sakilacustomer.org','27','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('24','4','KIMBERLY','LEE','KIMBERLY.LEE@sakilacustomer.org','28','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('25','1','DEBORAH','WALKER','DEBORAH.WALKER@sakilacustomer.org','29','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('26','3','JESSICA','HALL','JESSICA.HALL@sakilacustomer.org','30','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('27','2','SHIRLEY','ALLEN','SHIRLEY.ALLEN@sakilacustomer.org','31','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('28','1','CYNTHIA','YOUNG','CYNTHIA.YOUNG@sakilacustomer.org','32','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('29','2','ANGELA','HERNANDEZ','ANGELA.HERNANDEZ@sakilacustomer.org','33','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('30','1','MELISSA','KING','MELISSA.KING@sakilacustomer.org','34','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('31','3','BRENDA','WRIGHT','BRENDA.WRIGHT@sakilacustomer.org','35','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('32','1','AMY','LOPEZ','AMY.LOPEZ@sakilacustomer.org','36','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('33','2','ANNA','HILL','ANNA.HILL@sakilacustomer.org','37','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('34','8','REBECCA','SCOTT','REBECCA.SCOTT@sakilacustomer.org','38','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('35','2','VIRGINIA','GREEN','VIRGINIA.GREEN@sakilacustomer.org','39','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('36','8','KATHLEEN','ADAMS','KATHLEEN.ADAMS@sakilacustomer.org','40','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('37','1','PAMELA','BAKER','PAMELA.BAKER@sakilacustomer.org','41','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('38','1','MARTHA','GONZALEZ','MARTHA.GONZALEZ@sakilacustomer.org','42','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('39','7','DEBRA','NELSON','DEBRA.NELSON@sakilacustomer.org','43','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('40','8','AMANDA','CARTER','AMANDA.CARTER@sakilacustomer.org','44','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('41','8','STEPHANIE','MITCHELL','STEPHANIE.MITCHELL@sakilacustomer.org','45','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('42','2','CAROLYN','PEREZ','CAROLYN.PEREZ@sakilacustomer.org','46','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('43','6','CHRISTINE','ROBERTS','CHRISTINE.ROBERTS@sakilacustomer.org','47','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('44','3','MARIE','TURNER','MARIE.TURNER@sakilacustomer.org','48','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('45','1','JANET','PHILLIPS','JANET.PHILLIPS@sakilacustomer.org','49','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('46','2','CATHERINE','CAMPBELL','CATHERINE.CAMPBELL@sakilacustomer.org','50','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('47','1','FRANCES','PARKER','FRANCES.PARKER@sakilacustomer.org','51','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('48','1','ANN','EVANS','ANN.EVANS@sakilacustomer.org','52','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('49','8','JOYCE','EDWARDS','JOYCE.EDWARDS@sakilacustomer.org','53','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('50','8','DIANE','COLLINS','DIANE.COLLINS@sakilacustomer.org','54','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('51','8','ALICE','STEWART','ALICE.STEWART@sakilacustomer.org','55','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('52','1','JULIE','SANCHEZ','JULIE.SANCHEZ@sakilacustomer.org','56','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('53','1','HEATHER','MORRIS','HEATHER.MORRIS@sakilacustomer.org','57','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('54','1','TERESA','ROGERS','TERESA.ROGERS@sakilacustomer.org','58','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('55','5','DORIS','REED','DORIS.REED@sakilacustomer.org','59','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('56','2','GLORIA','COOK','GLORIA.COOK@sakilacustomer.org','60','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('57','3','EVELYN','MORGAN','EVELYN.MORGAN@sakilacustomer.org','61','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('58','1','JEAN','BELL','JEAN.BELL@sakilacustomer.org','62','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('59','3','CHERYL','MURPHY','CHERYL.MURPHY@sakilacustomer.org','63','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('60','1','MILDRED','BAILEY','MILDRED.BAILEY@sakilacustomer.org','64','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('61','3','KATHERINE','RIVERA','KATHERINE.RIVERA@sakilacustomer.org','65','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('62','1','JOAN','COOPER','JOAN.COOPER@sakilacustomer.org','66','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('63','4','ASHLEY','RICHARDSON','ASHLEY.RICHARDSON@sakilacustomer.org','67','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('64','2','JUDITH','COX','JUDITH.COX@sakilacustomer.org','68','0','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('65','7','ROSE','HOWARD','ROSE.HOWARD@sakilacustomer.org','69','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('66','2','JANICE','WARD','JANICE.WARD@sakilacustomer.org','70','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('67','5','KELLY','TORRES','KELLY.TORRES@sakilacustomer.org','71','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('68','1','NICOLE','PETERSON','NICOLE.PETERSON@sakilacustomer.org','72','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('69','2','JUDY','GRAY','JUDY.GRAY@sakilacustomer.org','73','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('70','2','CHRISTINA','RAMIREZ','CHRISTINA.RAMIREZ@sakilacustomer.org','74','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('71','1','KATHY','JAMES','KATHY.JAMES@sakilacustomer.org','75','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('72','2','THERESA','WATSON','THERESA.WATSON@sakilacustomer.org','76','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('73','2','BEVERLY','BROOKS','BEVERLY.BROOKS@sakilacustomer.org','77','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('74','1','DENISE','KELLY','DENISE.KELLY@sakilacustomer.org','78','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('75','2','TAMMY','SANDERS','TAMMY.SANDERS@sakilacustomer.org','79','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('76','2','IRENE','PRICE','IRENE.PRICE@sakilacustomer.org','80','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('77','2','JANE','BENNETT','JANE.BENNETT@sakilacustomer.org','81','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('78','1','LORI','WOOD','LORI.WOOD@sakilacustomer.org','82','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('79','1','RACHEL','BARNES','RACHEL.BARNES@sakilacustomer.org','83','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('80','1','MARILYN','ROSS','MARILYN.ROSS@sakilacustomer.org','84','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('81','1','ANDREA','HENDERSON','ANDREA.HENDERSON@sakilacustomer.org','85','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('82','1','KATHRYN','COLEMAN','KATHRYN.COLEMAN@sakilacustomer.org','86','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('83','1','LOUISE','JENKINS','LOUISE.JENKINS@sakilacustomer.org','87','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('84','2','SARA','PERRY','SARA.PERRY@sakilacustomer.org','88','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('85','2','ANNE','POWELL','ANNE.POWELL@sakilacustomer.org','89','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('86','2','JACQUELINE','LONG','JACQUELINE.LONG@sakilacustomer.org','90','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('87','1','WANDA','PATTERSON','WANDA.PATTERSON@sakilacustomer.org','91','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('88','2','BONNIE','HUGHES','BONNIE.HUGHES@sakilacustomer.org','92','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('89','1','JULIA','FLORES','JULIA.FLORES@sakilacustomer.org','93','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('90','2','RUBY','WASHINGTON','RUBY.WASHINGTON@sakilacustomer.org','94','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('91','2','LOIS','BUTLER','LOIS.BUTLER@sakilacustomer.org','95','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('92','2','TINA','SIMMONS','TINA.SIMMONS@sakilacustomer.org','96','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('93','1','PHYLLIS','FOSTER','PHYLLIS.FOSTER@sakilacustomer.org','97','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('94','1','NORMA','GONZALES','NORMA.GONZALES@sakilacustomer.org','98','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('95','2','PAULA','BRYANT','PAULA.BRYANT@sakilacustomer.org','99','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('96','1','DIANA','ALEXANDER','DIANA.ALEXANDER@sakilacustomer.org','100','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('97','2','ANNIE','RUSSELL','ANNIE.RUSSELL@sakilacustomer.org','101','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('98','1','LILLIAN','GRIFFIN','LILLIAN.GRIFFIN@sakilacustomer.org','102','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('99','2','EMILY','DIAZ','EMILY.DIAZ@sakilacustomer.org','103','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('100','1','ROBIN','HAYES','ROBIN.HAYES@sakilacustomer.org','104','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('101','1','PEGGY','MYERS','PEGGY.MYERS@sakilacustomer.org','105','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('102','1','CRYSTAL','FORD','CRYSTAL.FORD@sakilacustomer.org','106','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('103','1','GLADYS','HAMILTON','GLADYS.HAMILTON@sakilacustomer.org','107','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('104','1','RITA','GRAHAM','RITA.GRAHAM@sakilacustomer.org','108','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('105','1','DAWN','SULLIVAN','DAWN.SULLIVAN@sakilacustomer.org','109','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('106','1','CONNIE','WALLACE','CONNIE.WALLACE@sakilacustomer.org','110','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('107','1','FLORENCE','WOODS','FLORENCE.WOODS@sakilacustomer.org','111','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('108','1','TRACY','COLE','TRACY.COLE@sakilacustomer.org','112','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('109','2','EDNA','WEST','EDNA.WEST@sakilacustomer.org','113','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('110','2','TIFFANY','JORDAN','TIFFANY.JORDAN@sakilacustomer.org','114','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('111','1','CARMEN','OWENS','CARMEN.OWENS@sakilacustomer.org','115','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('112','2','ROSA','REYNOLDS','ROSA.REYNOLDS@sakilacustomer.org','116','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('113','2','CINDY','FISHER','CINDY.FISHER@sakilacustomer.org','117','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('114','2','GRACE','ELLIS','GRACE.ELLIS@sakilacustomer.org','118','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('115','1','WENDY','HARRISON','WENDY.HARRISON@sakilacustomer.org','119','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('116','1','VICTORIA','GIBSON','VICTORIA.GIBSON@sakilacustomer.org','120','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('117','1','EDITH','MCDONALD','EDITH.MCDONALD@sakilacustomer.org','121','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('118','5','KIM','CRUZ','KIM.CRUZ@sakilacustomer.org','122','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('119','5','SHERRY','MARSHALL','SHERRY.MARSHALL@sakilacustomer.org','123','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('120','6','SYLVIA','ORTIZ','SYLVIA.ORTIZ@sakilacustomer.org','124','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('121','7','JOSEPHINE','GOMEZ','JOSEPHINE.GOMEZ@sakilacustomer.org','125','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('122','8','THELMA','MURRAY','THELMA.MURRAY@sakilacustomer.org','126','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('123','3','SHANNON','FREEMAN','SHANNON.FREEMAN@sakilacustomer.org','127','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('124','4','SHEILA','WELLS','SHEILA.WELLS@sakilacustomer.org','128','0','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('125','7','ETHEL','WEBB','ETHEL.WEBB@sakilacustomer.org','129','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('126','8','ELLEN','SIMPSON','ELLEN.SIMPSON@sakilacustomer.org','130','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('127','8','ELAINE','STEVENS','ELAINE.STEVENS@sakilacustomer.org','131','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('128','6','MARJORIE','TUCKER','MARJORIE.TUCKER@sakilacustomer.org','132','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('129','7','CARRIE','PORTER','CARRIE.PORTER@sakilacustomer.org','133','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('130','7','CHARLOTTE','HUNTER','CHARLOTTE.HUNTER@sakilacustomer.org','134','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('131','2','MONICA','HICKS','MONICA.HICKS@sakilacustomer.org','135','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('132','4','ESTHER','CRAWFORD','ESTHER.CRAWFORD@sakilacustomer.org','136','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('133','4','PAULINE','HENRY','PAULINE.HENRY@sakilacustomer.org','137','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('134','4','EMMA','BOYD','EMMA.BOYD@sakilacustomer.org','138','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('135','4','JUANITA','MASON','JUANITA.MASON@sakilacustomer.org','139','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('136','4','ANITA','MORALES','ANITA.MORALES@sakilacustomer.org','140','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('137','4','RHONDA','KENNEDY','RHONDA.KENNEDY@sakilacustomer.org','141','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('138','1','HAZEL','WARREN','HAZEL.WARREN@sakilacustomer.org','142','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('139','1','AMBER','DIXON','AMBER.DIXON@sakilacustomer.org','143','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('140','1','EVA','RAMOS','EVA.RAMOS@sakilacustomer.org','144','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('141','1','DEBBIE','REYES','DEBBIE.REYES@sakilacustomer.org','145','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('142','1','APRIL','BURNS','APRIL.BURNS@sakilacustomer.org','146','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('143','1','LESLIE','GORDON','LESLIE.GORDON@sakilacustomer.org','147','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('144','1','CLARA','SHAW','CLARA.SHAW@sakilacustomer.org','148','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('145','1','LUCILLE','HOLMES','LUCILLE.HOLMES@sakilacustomer.org','149','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('146','1','JAMIE','RICE','JAMIE.RICE@sakilacustomer.org','150','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('147','2','JOANNE','ROBERTSON','JOANNE.ROBERTSON@sakilacustomer.org','151','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('148','1','ELEANOR','HUNT','ELEANOR.HUNT@sakilacustomer.org','152','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('149','1','VALERIE','BLACK','VALERIE.BLACK@sakilacustomer.org','153','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;
Insert into customer
 (customer_id,store_id,first_name,last_name,email,address_id,active,create_date,last_update)
Values
('150','2','DANIELLE','DANIELS','DANIELLE.DANIELS@sakilacustomer.org','154','1','2006-02-14 22:04:36.000','2006-02-15 04:57:20.000')
;

--
-- INSERT FILMS
INSERT INTO public.film(
	film_id, title, description, release_year, language_id, original_language_id,  rating)
	VALUES (1, 'Delivery Man', 'A movie about ...', '1996', '1', '1', 3);
	
	INSERT INTO public.film(
	film_id, title, description, release_year, language_id, original_language_id,  rating)
	VALUES (2, 'Lost in America', 'A movie about ...', '2003', '1', '1', 3);
	
	INSERT INTO public.film(
	film_id, title, description, release_year, language_id, original_language_id,  rating)
	VALUES (3, 'A Chairy Tale', 'A movie about ...', '2018', '1', '1', 4);
	
	INSERT INTO public.film(
	film_id, title, description, release_year, language_id, original_language_id,  rating)
	VALUES (4, 'Cold Mountain', 'A movie about ...', '1996', '1', '1', 3);
	
	INSERT INTO public.film(
	film_id, title, description, release_year, language_id, original_language_id,  rating)
	VALUES (5, 'Camille', 'A movie about ...', '1996', '1', '1', 3);
	
	INSERT INTO public.film(
	film_id, title, description, release_year, language_id, original_language_id,  rating)
	VALUES (6, 'East of Eden', 'A movie about ...', '1996', '1', '1', 3);
	
	INSERT INTO public.film(
	film_id, title, description, release_year, language_id, original_language_id,  rating)
	VALUES (7, 'The Fugitive', 'A movie about ...', '1996', '1', '1', 3);
	
	INSERT INTO public.film(
	film_id, title, description, release_year, language_id, original_language_id,  rating)
	VALUES (8, 'The Alamo', 'A movie about ...', '1996', '1', '1', 3);
	
	INSERT INTO public.film(
	film_id, title, description, release_year, language_id, original_language_id,  rating)
	VALUES (9, 'Short Cuts', 'A movie about ...', '1996', '1', '1', 5);
	
	INSERT INTO public.film(
	film_id, title, description, release_year, language_id, original_language_id,  rating)
	VALUES (10, 'Stuart Little', 'A movie about ...', '1996', '1', '1', 3);
	
	INSERT INTO public.film(
	film_id, title, description, release_year, language_id, original_language_id,  rating)
	VALUES (11, 'Baby Doll', 'A movie about ...', '1996', '1', '1', 3);
	
	INSERT INTO public.film(
	film_id, title, description, release_year, language_id, original_language_id,  rating)
	VALUES (12, 'A serious man', 'A movie about ...', '1996', '1', '1', 3);
	
	INSERT INTO public.film(
	film_id, title, description, release_year, language_id, original_language_id,  rating)
	VALUES (13, 'On the waterfront', 'A movie about ...', '1996', '1', '1', 3);
	
	INSERT INTO public.film(
	film_id, title, description, release_year, language_id, original_language_id,  rating)
	VALUES (14, 'X-Men: First Class', 'A movie about ...', '1996', '1', '1', 5);
	
	INSERT INTO public.film(
	film_id, title, description, release_year, language_id, original_language_id,  rating)
	VALUES (15, 'The Fighter', 'A movie about ...', '1996', '1', '1', 5);
	
	INSERT INTO public.film(
	film_id, title, description, release_year, language_id, original_language_id,  rating)
	VALUES (16, 'Royal Wedding', 'A movie about ...', '1996', '1', '1', 3);
	
	INSERT INTO public.film(
	film_id, title, description, release_year, language_id, original_language_id,  rating)
	VALUES (17, 'The Glenn Miller Story', 'A movie about ...', '1996', '1', '1', 3);
	
	INSERT INTO public.film(
	film_id, title, description, release_year, language_id, original_language_id,  rating)
	VALUES (18, 'Black Fury', 'A movie about ...', '1996', '1', '1', 5);
	
	INSERT INTO public.film(
	film_id, title, description, release_year, language_id, original_language_id,  rating)
	VALUES (19, 'Babes in Arms', 'A movie about ...', '1996', '1', '1', 3);
	
	INSERT INTO public.film(
	film_id, title, description, release_year, language_id, original_language_id,  rating)
	VALUES (20, 'Strange Invaders', 'A movie about ...', '1996', '1', '1', 5);
	
--
-- INSERT INVENTORY
INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 1);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 2);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 3);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 3);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 3);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 7);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 7);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 8);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 6);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 2);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 3);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 2);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 2);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 3);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (2, 1);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (2, 1);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (2, 2);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (2, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (2, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (2, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (2, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (2, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (2, 6);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (2, 7);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (2, 7);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (2, 8);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (2, 8);
	
		INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (3, 1);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (3, 1);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (3, 2);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (3, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (3, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (3, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (3, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (3, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (3, 6);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (3, 7);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (3, 7);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (3, 8);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (3, 8);

	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (4, 1);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (4, 1);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (4, 2);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (4, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (4, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (4, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (4, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (4, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (4, 6);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (4, 7);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (4, 7);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (4, 8);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (4, 8);
	
		INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (5, 1);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (5, 1);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (5, 2);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (5, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (5, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (5, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (5, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (5, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (5, 6);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (5, 7);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (5, 7);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (5, 8);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (5, 8);
		INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (6, 1);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (6, 1);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (6, 2);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (6, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (6, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (6, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (6, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (6, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (6, 6);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (6, 7);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (6, 7);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (6, 8);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (6, 8);
	
		INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (7, 1);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (7, 1);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (7, 2);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (7, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (7, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (7, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (7, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (7, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (7, 6);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (7, 7);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (7, 7);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (7, 8);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (7, 8);
	
		INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (8, 1);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (8, 1);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (8, 2);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (8, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (8, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (8, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (8, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (8, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (8, 6);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (8, 7);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (8, 7);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (8, 8);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (8, 8);
	
		INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (9, 1);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (9, 1);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (9, 2);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (9, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (9, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (9, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (9, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (9, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (9, 6);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (9, 7);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (9, 7);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (9, 8);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (9, 8);
	
		INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (10, 1);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (10, 1);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (10, 2);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (10, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (10, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (10, 4);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (10, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (10, 5);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (10, 6);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (10, 7);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (10, 7);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (10, 8);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (10, 8);
	
		INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (10, 8);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 3);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 3);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 3);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 3);
	
	INSERT INTO public.inventory(
	 film_id, store_id)
	VALUES (1, 3);
	
	
--
-- INSERT RENTALS

INSERT INTO public.rental VALUES (1, '2021-01-04 00:00:00', 1, 131, '2021-02-04 00:00:00', 2, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (2, '2021-01-04 00:00:00', 41, 40, '2021-02-01 00:00:00', 1, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (3, '2021-01-01 00:00:00', 1, 45, '2021-02-03 00:00:00', 5, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (4, '2021-01-02 00:00:00', 54, 33, '2021-02-03 00:00:00', 1, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (5, '2021-01-02 00:00:00', 45, 119, '2021-02-01 00:00:00', 7, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (6, '2021-01-03 00:00:00', 97, 34, '2021-02-04 00:00:00', 6, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (7, '2021-01-04 00:00:00', 52, 86, '2021-02-03 00:00:00', 5, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (8, '2021-01-02 00:00:00', 71, 34, '2021-02-02 00:00:00', 1, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (9, '2021-01-03 00:00:00', 75, 53, '2021-02-04 00:00:00', 3, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (10, '2021-01-04 00:00:00', 33, 4, '2021-02-04 00:00:00', 1, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (11, '2021-01-03 00:00:00', 9, 52, '2021-02-01 00:00:00', 2, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (12, '2021-01-03 00:00:00', 74, 4, '2021-02-04 00:00:00', 3, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (13, '2021-01-02 00:00:00', 91, 103, '2021-02-04 00:00:00', 2, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (14, '2021-01-03 00:00:00', 127, 62, '2021-02-02 00:00:00', 4, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (15, '2021-01-02 00:00:00', 114, 27, '2021-02-02 00:00:00', 2, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (16, '2021-01-03 00:00:00', 39, 61, '2021-02-04 00:00:00', 7, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (17, '2021-01-03 00:00:00', 93, 109, '2021-02-02 00:00:00', 6, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (18, '2021-01-02 00:00:00', 82, 121, '2021-02-03 00:00:00', 5, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (19, '2021-01-02 00:00:00', 110, 78, '2021-02-01 00:00:00', 2, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (20, '2021-01-02 00:00:00', 106, 75, '2021-02-04 00:00:00', 5, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (21, '2021-01-03 00:00:00', 49, 45, '2021-02-03 00:00:00', 1, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (22, '2021-01-03 00:00:00', 128, 44, '2021-02-01 00:00:00', 1, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (23, '2021-01-03 00:00:00', 64, 25, '2021-02-04 00:00:00', 5, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (24, '2021-01-04 00:00:00', 86, 97, '2021-02-03 00:00:00', 7, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (25, '2021-01-04 00:00:00', 18, 57, '2021-02-04 00:00:00', 4, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (26, '2021-01-02 00:00:00', 92, 78, '2021-02-04 00:00:00', 5, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (27, '2021-01-03 00:00:00', 46, 103, '2021-02-02 00:00:00', 4, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (28, '2021-01-02 00:00:00', 58, 106, '2021-02-02 00:00:00', 3, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (29, '2021-01-01 00:00:00', 72, 106, '2021-02-04 00:00:00', 4, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (30, '2021-01-02 00:00:00', 22, 47, '2021-02-04 00:00:00', 6, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (31, '2021-01-01 00:00:00', 30, 55, '2021-02-01 00:00:00', 4, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (32, '2021-01-01 00:00:00', 29, 144, '2021-02-04 00:00:00', 6, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (33, '2021-01-03 00:00:00', 42, 149, '2021-02-03 00:00:00', 3, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (34, '2021-01-02 00:00:00', 100, 47, '2021-02-03 00:00:00', 1, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (35, '2021-01-02 00:00:00', 117, 24, '2021-02-02 00:00:00', 7, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (36, '2021-01-04 00:00:00', 68, 10, '2021-02-02 00:00:00', 1, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (37, '2021-01-03 00:00:00', 60, 53, '2021-02-02 00:00:00', 7, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (38, '2021-01-02 00:00:00', 5, 37, '2021-02-04 00:00:00', 1, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (39, '2021-01-04 00:00:00', 111, 45, '2021-02-04 00:00:00', 7, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (40, '2021-01-01 00:00:00', 56, 33, '2021-02-03 00:00:00', 1, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (41, '2021-01-01 00:00:00', 95, 117, '2021-02-04 00:00:00', 2, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (42, '2021-01-04 00:00:00', 130, 101, '2021-02-01 00:00:00', 5, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (43, '2021-01-04 00:00:00', 96, 25, '2021-02-03 00:00:00', 2, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (44, '2021-01-01 00:00:00', 90, 38, '2021-02-03 00:00:00', 6, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (45, '2021-01-02 00:00:00', 2, 145, '2021-02-03 00:00:00', 7, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (46, '2021-01-01 00:00:00', 77, 132, '2021-02-01 00:00:00', 3, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (47, '2021-01-01 00:00:00', 55, 46, '2021-02-04 00:00:00', 7, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (48, '2021-01-04 00:00:00', 61, 2, '2021-02-01 00:00:00', 7, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (49, '2021-01-01 00:00:00', 53, 60, '2021-02-03 00:00:00', 1, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (50, '2021-01-03 00:00:00', 80, 14, '2021-02-04 00:00:00', 1, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (51, '2021-01-03 00:00:00', 70, 135, '2021-02-04 00:00:00', 3, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (52, '2021-01-01 00:00:00', 40, 16, '2021-02-01 00:00:00', 3, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (53, '2021-01-01 00:00:00', 76, 120, '2021-02-03 00:00:00', 3, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (54, '2021-01-02 00:00:00', 125, 12, '2021-02-04 00:00:00', 5, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (55, '2021-01-04 00:00:00', 10, 142, '2021-02-03 00:00:00', 3, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (56, '2021-01-03 00:00:00', 25, 15, '2021-02-01 00:00:00', 6, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (57, '2021-01-01 00:00:00', 122, 53, '2021-02-03 00:00:00', 6, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (58, '2021-01-03 00:00:00', 14, 35, '2021-02-03 00:00:00', 3, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (59, '2021-01-03 00:00:00', 107, 91, '2021-02-04 00:00:00', 1, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (60, '2021-01-01 00:00:00', 104, 132, '2021-02-03 00:00:00', 6, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (61, '2021-01-04 00:00:00', 12, 8, '2021-02-02 00:00:00', 3, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (62, '2021-01-01 00:00:00', 35, 53, '2021-02-04 00:00:00', 5, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (63, '2021-01-02 00:00:00', 120, 113, '2021-02-02 00:00:00', 7, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (64, '2021-01-04 00:00:00', 119, 49, '2021-02-01 00:00:00', 2, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (65, '2021-01-03 00:00:00', 116, 93, '2021-02-01 00:00:00', 2, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (66, '2021-01-02 00:00:00', 16, 39, '2021-02-04 00:00:00', 6, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (67, '2021-01-03 00:00:00', 4, 53, '2021-02-01 00:00:00', 1, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (68, '2021-01-01 00:00:00', 115, 1, '2021-02-04 00:00:00', 3, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (69, '2021-01-02 00:00:00', 57, 68, '2021-02-01 00:00:00', 2, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (70, '2021-01-03 00:00:00', 48, 79, '2021-02-04 00:00:00', 6, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (71, '2021-01-01 00:00:00', 102, 98, '2021-02-02 00:00:00', 7, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (72, '2021-01-02 00:00:00', 23, 100, '2021-02-03 00:00:00', 7, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (73, '2021-01-04 00:00:00', 121, 73, '2021-02-01 00:00:00', 4, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (74, '2021-01-03 00:00:00', 94, 64, '2021-02-01 00:00:00', 3, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (75, '2021-01-04 00:00:00', 103, 43, '2021-02-02 00:00:00', 4, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (76, '2021-01-04 00:00:00', 43, 32, '2021-02-04 00:00:00', 4, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (77, '2021-01-03 00:00:00', 108, 73, '2021-02-01 00:00:00', 2, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (78, '2021-01-02 00:00:00', 99, 23, '2021-02-03 00:00:00', 1, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (79, '2021-01-02 00:00:00', 113, 60, '2021-02-02 00:00:00', 1, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (80, '2021-01-02 00:00:00', 13, 76, '2021-02-03 00:00:00', 3, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (81, '2021-01-01 00:00:00', 109, 13, '2021-02-02 00:00:00', 4, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (82, '2021-01-02 00:00:00', 7, 90, '2021-02-03 00:00:00', 3, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (83, '2021-01-03 00:00:00', 98, 44, '2021-02-01 00:00:00', 3, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (84, '2021-01-02 00:00:00', 79, 75, '2021-02-03 00:00:00', 5, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (85, '2021-01-03 00:00:00', 27, 138, '2021-02-02 00:00:00', 7, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (86, '2021-01-01 00:00:00', 132, 60, '2021-02-04 00:00:00', 2, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (87, '2021-01-01 00:00:00', 133, 69, '2021-02-01 00:00:00', 4, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (88, '2021-01-02 00:00:00', 131, 130, '2021-02-01 00:00:00', 5, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (89, '2021-01-01 00:00:00', 65, 7, '2021-02-03 00:00:00', 6, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (90, '2021-01-04 00:00:00', 28, 144, '2021-02-01 00:00:00', 1, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (91, '2021-01-02 00:00:00', 15, 111, '2021-02-02 00:00:00', 7, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (92, '2021-01-04 00:00:00', 31, 116, '2021-02-01 00:00:00', 3, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (93, '2021-01-04 00:00:00', 88, 86, '2021-02-03 00:00:00', 4, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (94, '2021-01-03 00:00:00', 123, 135, '2021-02-01 00:00:00', 5, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (95, '2021-01-02 00:00:00', 8, 55, '2021-02-03 00:00:00', 4, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (96, '2021-01-04 00:00:00', 89, 4, '2021-02-02 00:00:00', 7, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (97, '2021-01-04 00:00:00', 112, 128, '2021-02-03 00:00:00', 2, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (98, '2021-01-02 00:00:00', 51, 139, '2021-02-04 00:00:00', 7, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (99, '2021-01-02 00:00:00', 84, 112, '2021-02-01 00:00:00', 1, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (100, '2021-01-01 00:00:00', 37, 145, '2021-02-01 00:00:00', 3, '2021-08-28 05:36:22.115351');
INSERT INTO public.rental VALUES (101, '2021-01-02 00:00:00', 100, 55, '2021-02-02 00:00:00', 6, '2021-08-28 05:36:22.115351');



--
-- INSERT PAYMENTS

INSERT INTO public.payment VALUES (1, 59, 6, 16.91, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (2, 102, 43, 25.75, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (3, 48, 17, 25.35, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (4, 78, 34, 13.75, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (5, 70, 23, 14.36, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (6, 122, 60, 24.77, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (7, 80, 22, 23.41, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (8, 78, 15, 18.96, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (9, 118, 63, 23.15, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (10, 44, 33, 9.51, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (11, 49, 95, 14.08, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (12, 95, 32, 23.92, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (13, 126, 21, 17.23, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (14, 64, 47, 20.16, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (15, 71, 82, 18.01, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (16, 125, 36, 9.18, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (17, 33, 45, 14.06, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (18, 113, 58, 24.47, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (19, 94, 67, 26.73, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (20, 2, 9, 17.17, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (21, 5, 69, 21.85, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (22, 87, 51, 25.60, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (23, 36, 41, 15.10, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (24, 112, 93, 20.47, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (25, 118, 68, 8.66, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (26, 78, 54, 14.61, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (27, 93, 11, 13.30, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (28, 120, 74, 9.13, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (29, 96, 99, 20.75, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (30, 122, 5, 21.62, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (31, 65, 87, 16.00, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (32, 98, 97, 20.97, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (33, 146, 61, 23.82, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (34, 42, 18, 9.68, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (35, 114, 1, 25.82, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (36, 71, 96, 14.12, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (37, 138, 27, 22.55, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (38, 42, 81, 20.46, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (39, 61, 8, 8.58, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (40, 115, 19, 16.58, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (41, 97, 55, 25.41, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (42, 91, 12, 13.35, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (43, 117, 26, 24.29, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (44, 33, 13, 14.47, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (45, 10, 49, 15.40, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (46, 77, 64, 24.59, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (47, 108, 10, 14.06, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (48, 126, 25, 21.42, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (49, 135, 42, 9.11, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (50, 99, 80, 14.11, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (51, 87, 59, 14.75, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (52, 106, 28, 10.20, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (53, 67, 38, 22.49, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (54, 57, 91, 24.07, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (55, 48, 66, 8.53, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (56, 44, 75, 21.88, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (57, 126, 72, 13.15, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (58, 119, 30, 17.95, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (59, 52, 46, 8.30, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (60, 98, 76, 26.73, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (61, 62, 31, 23.95, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (62, 64, 24, 24.09, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (63, 125, 14, 11.05, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (64, 13, 37, 10.17, '2021-08-28 05:36:24.192848');
INSERT INTO public.payment VALUES (65, 3, 70, 19.30, '2021-08-28 05:36:24.192848');
