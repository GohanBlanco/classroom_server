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

	if($key != $server_key){
		echo '{"error" : "Wrong key !!!"}';
		http_response_code(403);
		return;
	}
	
	if(	isset($_GET['id']) && !empty($_GET['id'])){
		getFriendById($_GET['id']);
	} else{
		getAllFriends();
	}
	
	function getAllFriends(){
		$db_con = getDbConnection();
		$sql = "SELECT * FROM friend";
		$result = mysqli_query($db_con,$sql);
		$output = null;
		while($row = mysqli_fetch_assoc($result)){
			unset($row['key']);
			$output[]=$row;
		}	
			
		if($output == null){
			echo '{"info": "Empty list of friends !!!"}';
			http_response_code(204);
		}
		else{
			print(json_encode($output));
			http_response_code(200);
		}
		mysqli_close($db_con);
	}
	
	
	
	function getFriendById($id){
		$db_con = getDbConnection();
		$sql = "SELECT * FROM friend where id=$id";
		$result = mysqli_query($db_con,$sql);
		$output = null;
		
		if($row = mysqli_fetch_assoc($result)){
			unset($row['key']);
			$output=$row;
		}	
			
		if($output == null){
			echo '{"info" : "Friend not found !!!"}';
			http_response_code(400);
		}
		else{
			print(json_encode($output));
			http_response_code(200);
		}
		mysqli_close($db_con);
	}
?>