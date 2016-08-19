<?php
	session_start();

	$errmsg_arr = array();

	$errflag = false;

	$link = mysql_connect('localhost','root','');
	if(!$link) {
		die('Fallo al conectarse al servidor: ' . mysql_error());
	}

	$db = mysql_select_db('dbgn', $link);
	if(!$db) {
		die("No se encontro la base");
	}

	function clean($str) {
		$str = @trim($str);
		if(get_magic_quotes_gpc()) {
			$str = stripslashes($str);
		}
		return mysql_real_escape_string($str);
	}

	$usuario = clean($_POST['usuario']);
	$contrasena = clean($_POST['contrasena']);

	if($usuario == '') {
		$errmsg_arr[] = 'Usuario en Blanco';
		$errflag = true;
	}
	if($contrasena == '') {
		$errmsg_arr[] = 'Contraseña en Blanco';
		$errflag = true;
	}

	if($errflag) {
		$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
		session_write_close();
		header("location: index.php");
		exit();
	}

	$qry="SELECT * FROM usuarios WHERE usuarios='$usuario' AND contrasena='$contrasena'";
	$result=mysql_query($qry);

	if($result) {
		if(mysql_num_rows($result) > 0) {

			session_regenerate_id();
			$member = mysql_fetch_assoc($result);
			$_SESSION['id'] = $member['id'];
			$_SESSION['usuario'] = $member['usuario'];
			$_SESSION['tipousuario'] = $member['tipousuario'];
			//$_SESSION['SESS_PRO_PIC'] = $member['profImage'];
			session_write_close();
			header("location: main/index.php");
			exit();
		}else {

			header("location: index.php");
			exit();
		}
	}else {
		die("Consulta Fallida");
	}
?>
