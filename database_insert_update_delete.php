<?php

$dsn = 'mysql:host=localhost;dbname=bankdatabase';
$username = 'root';
$password = '';

try{
    // Connect To MySQL Database
    $con = new PDO($dsn,$username,$password);
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
} catch (Exception $ex) {
    
    echo 'Not Connected '.$ex->getMessage();
    
}

$AccountID = '';
$Balance = '';
$AccountDate = '';


function getPosts()
{
    $posts = array();
    
    $posts[0] = $_POST['AccountID'];
    $posts[1] = $_POST['Balance'];
    $posts[2] = $_POST['AccountDate'];
  
    
    return $posts;
}


// Insert Data

if(isset($_POST['insert']))
{
    $data = getPosts();
    if(empty($data[0]) || empty($data[1]) || empty($data[2]))
    {
        echo 'Enter The Account Data To Insert';
    }  else {
        
        $insertStmt = $con->prepare('INSERT INTO accounts(AccountID,Balance,AccountDate) VALUES(:AccountID,:Balance,:AccountDate)');
        $insertStmt->execute(array(
                    ':AccountID'=> $data[0],
                    ':Balance'=> $data[1],
                    ':AccountDate'  => $data[2],
        ));
        
        if($insertStmt)
        {
                echo 'Data Inserted';
        }
        
    }
}

//Update Data

if(isset($_POST['update']))
{
    $data = getPosts();
    if(empty($data[0]) || empty($data[1]) || empty($data[2]))
    {
        echo 'Enter The Account Data To Update';
    }  else {
        
        $updateStmt = $con->prepare('UPDATE accounts SET Balance = :Balance, AccountDate = :AccountDate WHERE AccountID = :AccountID');
        $updateStmt->execute(array(
                    ':AccountID'=> $data[0],
                    ':Balance'=> $data[1],
                    ':AccountDate'=> $data[2],
        ));
        
        if($updateStmt)
        {
                echo 'Data Updated';
        }
        
    }
}

// Delete Data

if(isset($_POST['delete']))
{
    $data = getPosts();
    if(empty($data[0]))
    {
        echo 'Enter The Account ID To Delete';
    }  else {
        
        $deleteStmt = $con->prepare('DELETE FROM accounts WHERE AccountID = :AccountID');
        $deleteStmt->execute(array(
                    ':AccountID'=> $data[0]
        ));
        
        if($deleteStmt)
        {
                echo 'Account Deleted';
        }
        
    }
}

?>

<!DOCTYPE html>
<html>
    <head>
        <title>PHP (MySQL PDO): Insert, Update, Delete, </title>  
    </head>
    <body>
        <form action="database_insert_update_delete.php" method="POST">

            <input type="text" name="AccountID" placeholder="AccountID" value="<?php echo $AccountID;?>"><br><br>
            <input type="text" name="Balance" placeholder="Account Balance" value="<?php echo $Balance;?>"><br><br>
            <input type="date" name="AccountDate" placeholder="Account Date" value="<?php echo $AccountDate; ?>"><br><br>
            
            <input type="submit" name="insert" value="Insert">
            <input type="submit" name="update" value="Update">
            <input type="submit" name="delete" value="Delete">

        </form>
        
    </body>    
</html>