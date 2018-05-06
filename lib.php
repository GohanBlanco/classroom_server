<?php
	
	function getDbConnection(){
		$db_host = "localhost";
		$db_uid = "root"; // "misc_classroom_user";
		$db_pass = ""; //"classroom_user";
		$db_name = "classroom_db";
		$db_con = mysqli_connect($db_host,$db_uid,$db_pass,$db_name);
		mysqli_set_charset($db_con, 'utf8');
	
		return $db_con;	
	}
	
	function getServerKey(){
		
		$db_con = getDbConnection();
		$sql = "SELECT * FROM attending_info";
		$result = mysqli_query($db_con,$sql);
		
		if($row = mysqli_fetch_assoc($result)){
			mysqli_close($db_con);
			return $row['key'];
		}
	}
?>