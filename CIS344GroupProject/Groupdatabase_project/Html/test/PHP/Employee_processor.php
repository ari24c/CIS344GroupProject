<?php
//Employee variables
$Name = $_POST['name'];
$SSn = $_POST['SSN'];
$Position = $_POST['Position'];
$Address = $_POST['Addy'];
$Birthday = $_POST['BirthDay'];



echo "Data Submitted";

echo "<p>
Name:.$Name 
<br>
SSN:.$SSn
<br>
Position:.$Position
<br>
Address:.$Address
<br>

BirthDay: . $Birthday

</p>

";