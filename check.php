<?php
	session_start();
	
	header('Content-Type: application/json');
	
	include('lib.php');
	
	$server_key = getServerKey();
	if(!isset($server_key) || empty($server_key)){
		echo '{"error" : "Server key not defined yet !!!"}';
		http_response_code(404);
		return;
	}
	
	if(!isset($_GET['id']) || empty($_GET['id'])){
		echo '{"error": "ID is required !!!"}';
		http_response_code(403);
		return;
	}
	$id = $_GET['id'];
	
		$sql = "UPDATE friend SET is_present=1, `key`='$server_key' WHERE  id= $id";
		$db_con = getDbConnection();
		if(mysqli_query($db_con,$sql) == true){
			echo '{"info" : "ID='.$id.' is now checked.", "key" : "'.$server_key.'"}';
			http_response_code(200);
		}
		else{
			echo '{"error" : "ID='.$id.' cannot be checked !!!"}';
			http_response_code(500);
		}
		mysqli_close($db_con);
	
?>