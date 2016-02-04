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
/
