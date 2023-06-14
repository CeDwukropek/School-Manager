<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>App</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <form action="plan.php" method="get" id="home">
        <table>
            <tr>
                <th>klasa</th>
            </tr>
            <?php
                $conn = mysqli_connect('localhost', 'root', '', 'szkola');
                $q = "SELECT * FROM klasy";
                $res = mysqli_query($conn, $q);
                
                while($row = mysqli_fetch_array($res))
                {
                echo "<tr>";
                    echo '<td data-click="clickable" data-empty="1" data-teacher="0" data-id="'.$row['nazwa'].'">';
                    echo $row['nazwa'];
                    /* ciasteczko ma wysyłać a nie input */
                    echo "</td>";
                echo "</tr>";
                }
                
                mysqli_close($conn);
            ?>
            <tr>
                <td>
                    <input type="submit" value="Przejdź">
                </td>
            </tr>
        </table>
    </form>
</body>
<script src="script.js"></script>
</html>