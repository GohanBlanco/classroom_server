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
		
	$db_con = getDbConnection();
	if(isset($_GET['id']) && !empty($_GET['id'])){
		getQuestionById($_GET['id']);
	} else{
		getAllQuestions();
	}
	mysqli_close($db_con);

	function getAllQuestions(){
		$db_con = getDbConnection();
		$sql = "SELECT * FROM question";
		$result = mysqli_query($db_con, $sql);
		$output = null;
		while($row = mysqli_fetch_assoc($result)){
			$row['answers'] = getAnswersByQuestionId($row['id']);
			$output[]=$row;
		}	
			
		if($output == null){
			echo '{"info": "Empty list of questions !!!"}';
			http_response_code(204);
		}
		else{
			print(json_encode($output));
			http_response_code(200);
		}
		
		
		mysqli_close($db_con);
	}
	
	function getQuestionById($id){
		$sql = "SELECT * FROM question where id=$id";
		$db_con = getDbConnection();
		$result = mysqli_query($db_con,$sql);
		$output = null;
		
		if($row = mysqli_fetch_assoc($result)){
			$row['answers'] = getAnswersByQuestionId($row['id']);
			$output=$row;
		}	
		
		if($output == null){
			echo '{"error" : "Question not found !!!"}';
			http_response_code(400);
		}
		else{
			print(json_encode($output));
			http_response_code(200);
		}
		mysqli_close($db_con);
	}
	
	function getAnswersByQuestionId($id){

	$db_con = getDbConnection();
	$sql = "SELECT * FROM answer where id_question = $id";
	$result = mysqli_query($db_con,$sql);
	while($row=mysqli_fetch_assoc($result)){
		unset($row['id_question']);
		$output[] = $row;
	}
	mysqli_close($db_con);
	return $output;	
}
?>