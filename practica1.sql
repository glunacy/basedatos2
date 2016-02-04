--CREAREMOS UNA TABLA SIMPLE PARA PROBAR EL PODER DE SQL

CREATE TABLE DANCE(ID_DANCE INTEGER, NOMBRE VARCHAR2(40), EDAD INTEGER);
--PRENDEMOS EL SERVIDOR EN MODO DE DESARROLLADOR

SET SERVEROUTPUT ON;

--VAMOS A EMPEZAR CON UN BLOQUE PL SQL

DECLARE

--AQUI SE DECLARAN LAS VARIABLES A USARSE

EDAD INTEGER;
YEARS INTEGER;
BEGIN

--AQUI VA LA LOGICA DEL PROGRAMA
YEARS:=26;
EDAD:=YEARS*365;

DBMS_OUTPUT.PUT_LINE('TU EDAD EN DIAS ES '||EDAD);

END;
/

--CREAR UN BLOQUE PL SQL QUE GENERE 20000 REGISTROS DE SECUENCIA EN LA TABLE DANCE
 BEGIN
 
  FOR I IN 1..200000 LOOP
    INSERT INTO DANCE VALUES(I,'GABY',26);
    
    END LOOP;
    END;
    /
    
    -- HACEMOS UN SELECT PARA VER QUE HACE
    
     SELECT * FROM DANCE;
      
  -- SISTEMA DE PELICULAS
  
  CREATE TABLE PELICULA (ID_PELICULA INTEGER,
                        TITULO VARCHAR2(120), 
                        SINOPSIS VARCHAR2(500),
                        CLASIFICACION VARCHAR2(5),
                        CONSTRAINT PK_ID_PELICULA PRIMARY KEY(ID_PELICULA)
                        );
                        
-- VEMOS LA TABLA CON DESCRIBE PELICULA

                        DESCRIBE PELICULA;
                        
  CREATE TABLE HORARIO (ID_HORARIO INTEGER,
                        ID_PELICULA INTEGER,
                        HORARIO VARCHAR2(8),
                        CONSTRAINT PK_HORARIO PRIMARY KEY(ID_HORARIO),
                        CONSTRAINT FK1_ID_PELICULA FOREIGN KEY (ID_PELICULA) REFERENCES PELICULA (ID_PELICULA)
                        );
                        
   CREATE TABLE SALA (ID_SALA INTEGER,
                        ID_PELICULA INTEGER,
                        NUM_SALA INTEGER,
                        CONSTRAINT PK_ID_SALA PRIMARY KEY(ID_SALA),
                        CONSTRAINT FK2_ID_PELICULA FOREIGN KEY (ID_PELICULA) REFERENCES PELICULA (ID_PELICULA)
                        );
 --CREAR LA SECUENCIA

  CREATE SEQUENCE SEC_PELICULA
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE;
  /
  
  
  --30/01/16 
  
  SET SERVEROUTPUT ON;
  --PROCEDIMIENTO DE ENTRADA VARIABLE IN
  CREATE OR REPLACE PROCEDURE HOLA_MUNDO(NOMBRE IN VARCHAR2)
  AS 
  -- AQUI SE PONDRAN LAS VARIABLES LOCALES
  BEGIN
  -- AQUI VA LA LOGICA
  DBMS_OUTPUT.PUT_LINE('HOLA COMO ESTAS'||NOMBRE);
  END;
  /
  
  BEGIN
  HOLA_MUNDO(' GABY');
  END;
  /
  
  DECLARE
  VALOR NUMBER;
  BEGIN
  SUMA(12,8,VALOR);
  DBMS_OUTPUT.PUT_LINE(' LA SUME ES = '||VALOR);
  END;
  /
  
  -- PROCEDIMIENTOS ALMACENADOS:::::::::::::::::::::::::::::::::::::::::::::::::::
  
  -- PROCEDIMIENTO GUARDAR PELICULA
  CREATE OR REPLACE PROCEDURE GUARDAR_PELICULA 
(
  MY_ID_PELICULA OUT NUMBER  
, MY_TITULO IN VARCHAR2  
, MY_SINOPSIS IN VARCHAR2  
, MY_CLASIFICACION IN VARCHAR2  
) AS 
BEGIN
 SELECT SEC_PELICULA.NEXTVAL INTO MY_ID_PELICULA FROM DUAL;
 INSERT INTO PELICULA VALUES(MY_ID_PELICULA,MY_TITULO,MY_SINOPSIS,MY_CLASIFICACION);
END GUARDAR_PELICULA;

--PROCEDIMIENTO SUMA
CREATE OR REPLACE PROCEDURE SUMA 
(
  PRIMERO IN NUMBER  
, SEGUNDO IN NUMBER  
, RESULTADO OUT NUMBER  
) AS 
BEGIN
  RESULTADO:=PRIMERO+SEGUNDO;
END SUMA;

--PROCEDIMIENTO HOLA MUNDO
create or replace 
PROCEDURE HOLA_MUNDO(NOMBRE IN VARCHAR2)
  AS 
  BEGIN
  -- AQUI VA LA LOGICA
  DBMS_OUTPUT.PUT_LINE('HOLA COMO ESTAS'||NOMBRE);
  END;
  
  --EJECUTAR PROCEDIMIENTO ALMACENADO
  
  DECLARE
 VALOR INTEGER;
  BEGIN
GUARDAR_PELICULA(VALOR,'EL RENACIDO','ESTA MAS O MENOS','B15');
END;
/
SELECT 
  
