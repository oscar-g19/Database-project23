<?php
// Define the database connection details
$servername = "localhost";
$username = "yourusername";
$password = "yourpassword";
$dbname = "yourdatabasename";

// Create a database connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check if the connection was successful
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Retrieve the locations and amount of money spent from the database
$sql = "SELECT * FROM locations";
$result = mysqli_query($conn, $sql);

// Define the Google Maps API key
$apiKey = "AIzaSyBDcDUoRlMQqyF3Qobuto6U14RKhRqaNRY";

// Initialize the Google Maps API URL
$apiUrl = "https://maps.googleapis.com/maps/api/staticmap?size=600x400&maptype=roadmap&key={$apiKey}";

// Loop through each location and add a marker to the Google Map
while ($row = mysqli_fetch_assoc($result)) {
    $latitude = $row['latitude'];
    $longitude = $row['longitude'];
    $amount = $row['amount'];
    
    // Add a marker to the Google Map
    $apiUrl .= "&markers=color:red%7Clabel:{$amount}%7C{$latitude},{$longitude}";
}

// Close the database connection
mysqli_close($conn);

// Display the Google Map with markers
echo "<img src='{$apiUrl}'>";
?>
