CREATE TABLE ptExamen (
  idExamen INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nombreExamen VARCHAR(100)  NOT NULL    ,
PRIMARY KEY(idExamen));



CREATE TABLE ptPreguntas (
  idPreguntas INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  ptExamen_idExamen INTEGER UNSIGNED  NOT NULL  ,
  preguntasT LONGTEXT  NOT NULL    ,
PRIMARY KEY(idPreguntas, ptExamen_idExamen)  ,
INDEX ptPreguntas_FKIndex1(ptExamen_idExamen),
  FOREIGN KEY(ptExamen_idExamen)
    REFERENCES ptExamen(idExamen)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE ptEstudiante (
  idEstudiante INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  ptExamen_idExamen INTEGER UNSIGNED  NOT NULL  ,
  nombre VARCHAR(100)  NULL  ,
  apellidoPaterno VARCHAR(100))  NULL  ,
  apellidoMaterno VARCHAR(100)  NULL  ,
  edad INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(idEstudiante)  ,
INDEX ptEstudiante_FKIndex1(ptExamen_idExamen),
  FOREIGN KEY(ptExamen_idExamen)
    REFERENCES ptExamen(idExamen)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE ptAplicaExamen (
  idptAplicaExamen INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  ptEstudiante_idEstudiante INTEGER UNSIGNED  NOT NULL  ,
  fechaHora TIMESTAMP  NULL    ,
PRIMARY KEY(idptAplicaExamen)  ,
INDEX ptAplicaExamen_FKIndex1(ptEstudiante_idEstudiante),
  FOREIGN KEY(ptEstudiante_idEstudiante)
    REFERENCES ptEstudiante(idEstudiante)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE ptRespuestas (
  idRespuestas INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  ptPreguntas_ptExamen_idExamen INTEGER UNSIGNED  NOT NULL  ,
  ptPreguntas_idPreguntas INTEGER UNSIGNED  NOT NULL  ,
  respuestasT CHAR  NULL  ,
  respuestaLarga LONGTEXT  NULL  ,
  respuestaCorrecta CHAR  NULL    ,
PRIMARY KEY(idRespuestas)  ,
INDEX ptRespuestas_FKIndex1(ptPreguntas_idPreguntas, ptPreguntas_ptExamen_idExamen),
  FOREIGN KEY(ptPreguntas_idPreguntas, ptPreguntas_ptExamen_idExamen)
    REFERENCES ptPreguntas(idPreguntas, ptExamen_idExamen)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE ptRespuestasExamen (
  idRespuestasExamen INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  ptAplicaExamen_idptAplicaExamen INTEGER UNSIGNED  NOT NULL  ,
  pregunta1 CHAR  NOT NULL  ,
  pregunta2 CHAR  NOT NULL  ,
  pregunta3 CHAR  NOT NULL  ,
  pregunta4 CHAR  NOT NULL    ,
PRIMARY KEY(idRespuestasExamen)  ,
INDEX ptRespuestasExamen_FKIndex1(ptAplicaExamen_idptAplicaExamen),
  FOREIGN KEY(ptAplicaExamen_idptAplicaExamen)
    REFERENCES ptAplicaExamen(idptAplicaExamen)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




