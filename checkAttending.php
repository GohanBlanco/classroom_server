<?php
	session_start();
	
	header('Content-Type: application/json');
	
	include('lib.php');
	
	$server_key = getServerKey();
	//echo 'test ' +  getServerKey();
	if(!isset($server_key) || empty($server_key)){
		echo '{"error" : "Server key not defined yet !!!"}';
		http_response_code(404);
		return;
	}
	
	if(!isset($_GET['key']) || empty($_GET['key'])){
		echo '{"error": "Key is required !!!"}';
		http_response_code(403);
		return;
	}
	$key = $_GET['key'];
		
	if(!isset($_GET['id']) || empty($_GET['id'])){
		echo '{"error": "Your ID is required !!!"}';
		http_response_code(404);
		return;
	}
	$id = $_GET['id'];
	
	checkAttendingById($id, $key, $server_key);
	
	function checkAttendingById($id, $key, $server_key){
		
		$db_con = getDbConnection();
		$sql = "SELECT * FROM friend where id = $id";
		$result = mysqli_query($db_con,$sql);
		$friend = null;
		
		if($row = mysqli_fetch_assoc($result))
			$friend = $row;
		
		if($friend == null){
			echo '{"error" : "You are not found !!!"}';
			http_response_code(400);
			return;
		}
		// if ($friend['is_present'] == true){
			// echo '{"error" : "You are already checked !!!", "old key" : "'.$friend['key'].'"}';
			// http_response_code(409);
			// return;
		// }
		
		if($key != $server_key){
			echo '{"error" : "Wrong key !!!"}';
			http_response_code(403);
			return;
		}
		
		$sql = "UPDATE friend SET is_present=1, `key`='$key' WHERE  id= $id";
		
		if(mysqli_query($db_con,$sql) == true){
			echo '{"info" : "You are now checked.", "key" : "'.$key.'"}';
			http_response_code(200);
		}
		else{
			echo '{"error" : "You cannot be checked !!!"}';
			http_response_code(500);
		}
		mysqli_close($db_con);
	}
?>