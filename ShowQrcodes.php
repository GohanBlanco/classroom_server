<?php 
	session_start();
	// $_SESSION['code'] = '12345';
	include('phpqrcode/qrlib.php'); 
    include('lib.php');
    if(!isset($_GET['key']) || empty($_GET['key']) || $_GET['key'] != 'dfsklfjqslfdjqslfjqsmlf6546sdfs54dsf64dkjmfljsdfsklfjqslfdjqslfjqsmlf6546sdfs54dsf64dkjmfljs'){
		echo 'Ooops c\est corrigé';
		//echo '</br> test ' + getServerKey();
		return;
	}

 ?>
<!doctype html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>application classroom showQrcodes</title>
	<script src="jquery-3.3.1.js"></script>
	<script src="script.js"></script>
</head>
<body>
 <?php	
	
	$server_key = getServerKey();
	if(!isset($server_key) || empty($server_key)){
		echo '{"error" : "Server key not defined yet !!!"}';
		http_response_code(404);
		return;
	}
	// QRcode::png('12345');
	 
    // we need to generate filename somehow,  
    // with md5 or with database ID used to obtains $codeContents... 
    $dir = "./qr/"; 
    $fileName = 'qrcode.png'; 
     
    $pngAbsoluteFilePath = $dir.$fileName; 
    $urlRelativeFilePath = $dir.$fileName; 
     
    QRcode::png($server_key, $pngAbsoluteFilePath, QR_ECLEVEL_L, 15); 

    // displaying 
    
	
	echo '<table style="width:100%"><tr>';
	echo '<td style="width:60%">';
		echo '<div style="text-align: center;">';
		echo '<h1 >QR code :</h1>';
		echo '<img src="'.$urlRelativeFilePath.'" style="width: 600px; display: block; margin: 0 auto;"/>'; 
		echo '</div>';
	echo '</td>';
	
	echo '<td style="width:40%">';
	echo '<div>';
		echo '<table id="students" style="width:100%">';
		
		$green_color = "#0f0";
		$red_color = "#ffa98f";
		foreach(getAllFriends() as $f){
			if(($f['is_present'])==1){ 
				$color = $green_color;
				$text = 'Présent';
			}
			else {
				$color = $red_color;
				$text = 'Absent';
			}
			
			echo '<tr class="student" id="'.$f['id'].'" style="background-color:'.$color.'; cursor: pointer;">';
			echo '<td style="width:5%;">'.$f['id'].'</td>';
			echo '<td style="width:75%;">';
			echo ucfirst(strtolower($f['first_name'])). ' ' . strtoupper($f['last_name']);
			echo '</td>';
			echo '<td style="width: 20%">'.$text.'</td>';
			echo '<tr>';
		}
		echo '<table>';
	
	echo '</div>';
	echo '</td>';
	echo '<tr><table>';
	
	
	
	function getAllFriends(){
		$db_con = getDbConnection();
		$sql = "SELECT * FROM friend";
		$result = mysqli_query($db_con,$sql);
		$output = null;
		while($row = mysqli_fetch_assoc($result)){
			unset($row['key']);
			$output[]=$row;
		}	
		mysqli_close($db_con);
		return $output;
	}
	?>
	</body>
	</html>