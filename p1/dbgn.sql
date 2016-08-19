/**
* @author kevinwebtarai of taraisoftware
* @brief Modelo de la base de datos
**/

/*create database dbgn;
use dbgn;*/


create table usuarios(
	id int(100) not null auto_increment primary key,
	nombre varchar(50),
	apellidos varchar(50),
  email varchar(255),
	usuario varchar(255),
	contrasena varchar(255),
	telefono int(100),
  celular int(100),
	direccion varchar(255),
	cargo varchar(255),
	rut varchar(255),
	seguridadsocial varchar(255),
  hojadevida varchar(255),
	identificacion int(100),
	tarjetaprofesional varchar(255),
	tipousuario varchar(255),
	activado int(60)
);

create table archivosusuarios(
	id int(100) not null auto_increment primary key,
	idusuarios int(100),
	archivo varchar(255),
  titulo varchar(255),
	descripcion varchar(255),
	foreign key(idusuarios) references usuarios(id)
);

create table contrato(
	id int(100) not null auto_increment primary key,
	idusuarios int(100),
	objetocontrato varchar(255),
	nocontrato varchar(255),
	ncontrato varchar(255),
	apodocontrato varchar(255),
  valorcontratol varchar(255),
	valorcontrato int(255),
	valoranticipol varchar(255),
	valoranticipo varchar(255),
	porcentajeanticipo int(100),
	formapago varchar(255),
	valoradicional int(255),
	valoranticipoadicional int(255),
	pendientepagar int(255),
	plazoinicial varchar(255),
  fechainiciacion varchar(255),
	fechafinalizacion varchar(255),
	fechasuspension varchar(255),
	fechareinicio varchar(255),
	adicciontiempo varchar(255),
  fechafinalizacionadiccion varchar(255),
	foreign key(idusuarios) references usuarios(id)
);

create table entidadescontratantes(
	id int(100) not null auto_increment primary key,
	idcontrato int(100),
	nombre varchar(255),
	telefono int(100),
	direccion int(255),
	ciudad varchar(255),
	departamento varchar(255),
	foreign key(idcontrato) references contrato(id)
);

create table contratista(
	id int(100) not null auto_increment primary key,
	idcontrato int(100),
	nombre varchar(255),
	nit int(255),
	direccion varchar(255),
	telefono varchar(255),
	ciudad varchar(255),
	departamento varchar(255),
	representantelegal varchar(255),
	identificacion int(100),
	foreign key(idcontrato) references contrato(id)
);

create table uniontemporal(
	id int(100) not null auto_increment primary key,
	idcontratista int(100),
	nombre varchar(255),
	nit varchar(255),
	porcentaje int(100),
	foreign key(idcontratista) references contratista(id)
);

create table tipocontrato(
	id int(100) not null auto_increment primary key,
	idcontrato int(100),
	nombre varchar(255),
	foreign key(idcontrato) references contrato(id)
);

create table subcontrato(
	id int(100) not null auto_increment primary key,
	idcontrato int(100),
	objetocontrato varchar(255),
	nocontrato varchar(255),
	ncontrato varchar(255),
	apodocontrato varchar(255),
  valorcontratol varchar(255),
	valorcontrato int(255),
	valoranticipol varchar(255),
	valoranticipo varchar(255),
	porcentajeanticipo int(100),
	formapago varchar(255),
	plazoinicial varchar(255),
  fechainiciacion varchar(255),
	fechafinalizacion varchar(255),
	fechasuspension varchar(255),
	fechareinicio varchar(255),
	adicciontiempo varchar(255),
  fechafinalizacionadiccion varchar(255),
	foreign key(idcontrato) references contrato(id)
);

create table balancefinanciero(
	id int(100) not null auto_increment primary key,
	idsubcontrato int(100),
	actaparcial int(255),
	pendientepagar int(255),
	foreign key(idsubcontrato) references subcontrato(id)
);

create table polizas(
	id int(100) not null auto_increment primary key,
	idsubcontrato int(100),
	fechaexpedicion varchar(255),
	tipopoliza varchar(255),
	npoliza varchar(255),
	tipocertificado varchar(255),
  observaciones varchar(255),
	foreign key(idsubcontrato) references subcontrato(id)
);

create table archivospolizas(
	id int(100) not null auto_increment primary key,
	idpolizas int(100),
	archivo varchar(255),
  titulo varchar(255),
	descripcion varchar(255),
	foreign key(idpolizas) references polizas(id)
);

create table estadopolizas(
	id int(100) not null auto_increment primary key,
	idpolizas int(100),
	amparo varchar(255),
	vigenciadesde varchar(255),
	vigenciahasta varchar(255),
	valorasegurado varchar(255),
  estado varchar(255),
	foreign key(idpolizas) references polizas(id)
);

create table actividadesseguimiento(
	id int(100) not null auto_increment primary key,
	idsubcontrato int(100),
	titulo varchar(255),
	contenido varchar(255),
	foreign key(idsubcontrato) references subcontrato(id)
);

create table estadotiempo(
	id int(100) not null auto_increment primary key,
	idsubcontrato int(100),
	titulo varchar(255),
	contenido varchar(255),
	foreign key(idsubcontrato) references subcontrato(id)
);

create table analizisretrasos(
	id int(100) not null auto_increment primary key,
	idsubcontrato int(100),
	titulo varchar(255),
	contenido varchar(255),
	foreign key(idsubcontrato) references subcontrato(id)
);

create table registrofotografico(
	id int(100) not null auto_increment primary key,
	idsubcontrato int(100),
	titulo varchar(255),
	descripcion varchar(255),
	fecha varchar(255),
	foreign key(idsubcontrato) references subcontrato(id)
);

create table archivosregistrofotografico(
	id int(100) not null auto_increment primary key,
	idregistrofotografico int(100),
	archivo varchar(255),
  titulo varchar(255),
	descripcion varchar(255),
	foreign key(idregistrofotografico) references registrofotografico(id)
);

create table ejecucionfisicofinanciera(
	id int(100) not null auto_increment primary key,
	idsubcontrato int(100),
	titulo varchar(255),
	descripcion varchar(255),
	foreign key(idsubcontrato) references subcontrato(id)
);

create table archivosejecucionfisicofinanciera(
	id int(100) not null auto_increment primary key,
	idejecucionfisicofinanciera int(100),
	archivo varchar(255),
  titulo varchar(255),
	descripcion varchar(255),
	foreign key(idejecucionfisicofinanciera) references ejecucionfisicofinanciera(id)
);

create table controlequipos(
	id int(100) not null auto_increment primary key,
	idsubcontrato int(100),
	titulo varchar(255),
	descripcion varchar(255),
	fecha varchar(255),
	foreign key(idsubcontrato) references subcontrato(id)
);

create table archivoscontrolequipos(
	id int(100) not null auto_increment primary key,
	idcontrolequipos int(100),
	archivo varchar(255),
  titulo varchar(255),
	descripcion varchar(255),
	foreign key(idcontrolequipos) references controlequipos(id)
);

create table controlseguridad(
	id int(100) not null auto_increment primary key,
	idsubcontrato int(100),
	titulo varchar(255),
	descripcion varchar(255),
	fecha varchar(255),
	foreign key(idsubcontrato) references subcontrato(id)
);

create table archivoscontrolseguridad(
	id int(100) not null auto_increment primary key,
	idcontrolseguridad int(100),
	archivo varchar(255),
  titulo varchar(255),
	descripcion varchar(255),
	foreign key(idcontrolseguridad) references controlseguridad(id)
);

create table registros(
	id int(100) not null auto_increment primary key,
	utc int(100),
	anio int(4),
  mes int(2),
	dia int(2),
	hora int(2),
  minuto int(2),
  ip varchar(255),
  navegador varchar(255),
  pagina varchar(255)
);
