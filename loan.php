<?php
$serverName = "localhost";
$userName = "root";
$passwordDB = "";
$dbName = "bankbcnf";
// Check if the form was submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	// Get form data and validate input
	$loan_amount = filter_var($_POST['amount'], FILTER_SANITIZE_NUMBER_FLOAT);
	$months = filter_var($_POST['months'], FILTER_SANITIZE_NUMBER_INT);
    $loantype = filter_var($_POST['loantype'], FILTER_SANITIZE_STRING);
    $rate = filter_var($_POST['rate'], FILTER_SANITIZE_NUMBER_FLOAT);
    $lid = filter_var($_POST['loan_id'], FILTER_SANITIZE_NUMBER_INT);

	if (!is_numeric($loan_amount) || !is_numeric($months) || !is_numeric($rate) || !is_numeric($lid)) {
		die("Invalid input");
	}

	// (B) CONNECT TO DATABASE
	try{
	    // Connect To MySQL Database
	    $con = new PDO("mysql:host=$serverName;dbname=$dbName", $userName, $passwordDB);

	    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	    // Use prepared statement to avoid SQL injection
	    $stmt = $con->prepare("INSERT INTO loans (loanID, loanAmount, loanType, interestRate, loanTerm) VALUES (:LID, :amount, :ltype, :rate, :term)");
	    $stmt->bindParam(':term', $months);
	    $stmt->bindParam(':rate', $rate);
	    $stmt->bindParam(':amount', $loan_amount);
	    $stmt->bindParam(':LID', $lid);
	    $stmt->bindParam(':ltype', $loantype);
	    $stmt->execute();

	    echo "Loan Application successful!";
	    // Redirect to success page
	    header('Location: homepage.php');
	    exit;
	} catch (PDOException $ex) {
	    echo 'Loan application failed: '.$ex->getMessage();
	}	
}
?>
