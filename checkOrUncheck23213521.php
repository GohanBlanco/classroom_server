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
	
	$db_con = getDbConnection();
	$sql = "SELECT * FROM friend where id=$id";
	$result = mysqli_query($db_con, $sql);
	
	if($row = mysqli_fetch_assoc($result)){
				
		if($row['is_present'] == 1){
			$is_present = 0;
			$msg = "unchecked";
			$key = "null";
		}
		else{
			$is_present = 1;
			$msg = "checked";
			$key = "'" . $server_key ."'";
		}
			
		$sql = "UPDATE friend SET is_present=$is_present, `key`=$key WHERE  id= $id";
		if(mysqli_query($db_con,$sql) == true){
			// echo '{"info" : "ID='.$id.' is now ' . $msg . '", "key" : "'.$server_key.'"}';
			http_response_code(200);
		}
		// else{
			// echo '{"error" : "ID='.$id.' cannot be ' . $msg . ' !!!"}';
			// http_response_code(500);
		// }
		
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
?>