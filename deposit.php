<?php
$serverName = "localhost";
$userName = "root";
$passwordDB = "";
$dbName = "bankbcnf";
// Check if the form was submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	// Get form data and validate input
	$usr_acct = filter_var($_POST['account_id'], FILTER_SANITIZE_NUMBER_INT);
	$deposit = filter_var($_POST['deposit'], FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
	if (!is_numeric($usr_acct) || !is_numeric($deposit)) {
		die("Invalid input");
	}

	// (B) CONNECT TO DATABASE
	try{
	    // Connect To MySQL Database
	    $con = new PDO("mysql:host=$serverName;dbname=$dbName", $userName, $passwordDB);

	    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	    // Use prepared statement to avoid SQL injection
	    $stmt = $con->prepare("UPDATE accounts SET Balance = Balance + :deposit, AccountDate = NOW() WHERE AccountID = :usr_acct");
	    $stmt->bindParam(':deposit', $deposit);
	    $stmt->bindParam(':usr_acct', $usr_acct);
	    $stmt->execute();

	    echo "Deposit successful!";
	    // Redirect to success page
	    header('Location: homepage.php');
	    exit;
	} catch (PDOException $ex) {
	    echo 'Deposit failed: '.$ex->getMessage();
	}	
}
?>
