<?php require_once "connection.php";?>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title> table join </title>
</head>
<body>
<table border ="1" cellspacing="10px" cellpadding="0" > 
	<thead>
	<tr>
	<th>LOANID</th>
	<th>PAYMENTDATE</th>
	<th>PAYMENTAMOUNT</th>
	<th>TRANSACTIONID</th>
	<th>TRANSACTIONTYPE</th>
	<th>TRANSACTIONAMOUNT</th>
	</tr>
	</thead>
	<tbody>
	<?php
	$query= "Select * FROM loanpayment_payments INNER JOIN transactions ON loanpayment_payments.loanID= transactions.transactionID";
	$fire= mysqli_query($conn,$query) or die('query failed' .mysqli_error($conn));
	if(mysqli_num_rows($fire)>0)
	{
		while($result=mysqli_fetch_assoc($fire))
		{
			echo "<tr>";
			echo "<td>" .$result['loanID']. "</td>";
			echo "<td>" .$result['paymentDate']. "</td>";
			echo "<td>" .$result['paymentAmount']. "</td>";
			echo "<td>" .$result['transactionID']. "</td>";
			echo "<td>" .$result['transactionType']. "</td>";
			echo "<td>" .$result['transactionAmount']. "</td>";
			
		}
	}
	?>
	</tbody>
</table>

</body>