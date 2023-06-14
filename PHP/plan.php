<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>App</title>
    <link rel="stylesheet" href="../CSS/style.css">
</head>
<?php
    $conn = mysqli_connect('localhost', 'root', '', 'szkola');
    $klasa = $_GET['klasa'];

    if($_SERVER['REQUEST_METHOD'] == "GET"){
        if(
            isset($_GET['nauczyciel']) && ($_GET['nauczyciel'] != null)
            &&
            isset($_GET['przedmiot']) && ($_GET['przedmiot'] != null)
            &&
            isset($_GET['lekcja']) && ($_GET['lekcja'] != null)
            &&
            isset($_GET['sala']) && ($_GET['sala'] != null)
        ){
            $nauczyciel = $_GET['nauczyciel'];
            $przedmiot = $_GET['przedmiot'];
            $godzina_id = $_GET['lekcja'][0];
            $dzien_id = $_GET['lekcja'][-1];
            $sala_id = $_GET['sala'];
            
            $insertQuery = "INSERT INTO `lekcje`(`nauczyciel_id`, `przedmiot_id`, `klasa_id`, `godzina_id`, `sala_id`) VALUES ($nauczyciel, $przedmiot, $klasa, $godzina_id, $sala_id)";
            $insertQueryRes = mysqli_query($conn, $insertQuery);
            
            $findNewestId = "SELECT id FROM lekcje ORDER BY id DESC LIMIT 1";
            $findNewestIdRes = mysqli_query($conn, $findNewestId);
            $latestId = mysqli_fetch_array($findNewestIdRes);
            
            echo 'nauczyciel: '.$nauczyciel;
            echo '<br>';
            echo 'przedmiot: '.$przedmiot;
            echo '<br>';
            echo 'godzina_id: '.$godzina_id;
            echo '<br>';
            echo 'dzien_id: '.$dzien_id;
            echo '<br>';
            echo 'latestId: '.$latestId[0];
            echo '<br>';

            echo 'insertQuery: '.$insertQuery;
            echo '<br>';
            
            $insertQuery = "INSERT INTO `dzien_pom`(`lekcja_id`, `dzien_id`) VALUES ($latestId[0],$dzien_id)";
            $insertQueryRes = mysqli_query($conn, $insertQuery);

            echo 'insertQuery: '.$insertQuery;
        }
    }
?>
<body>
    <header class="flexBlock">
        <a href="index.php">Powrót</a>
    </header>
    <form action="plan.php" method="GET">
        <table>
            <tr>
                <th>Godzina</th>
                <th>Pon</th>
                <th>Wt</th>
                <th>Śr</th>
                <th>Czw</th>
                <th>Pt</th>
            </tr>
            <?php
                $q = "SELECT czas FROM godziny";
                $res = mysqli_query($conn, $q);
                $i = 1;
                
                while($row = mysqli_fetch_array($res))
                {
                echo '<tr>';
                    echo '<td>';
                    echo $row['czas'];
                    echo '</td>';
                    for($j = 1; $j <= 5; $j++)
                    {
                        $lessonData = "SELECT n.imie as imie, n.nazwisko as nazwisko, p.nazwa as p_nazwa, k.nazwa as k_nazwa, l.godzina_id as godzina_id, dp.dzien_id as dzien_id, s.numer as s_numer
                        FROM lekcje as l
                        JOIN nauczyciele as n ON l.nauczyciel_id = n.id
                        JOIN przedmioty as p ON l.przedmiot_id = p.id
                        JOIN klasy as k ON l.klasa_id = k.id
                        JOIN dzien_pom as dp ON dp.lekcja_id = l.id
                        JOIN dzien as d ON dp.dzien_id = d.id
                        JOIN sala as s ON l.sala_id = s.id
                        WHERE dzien_id = $j AND godzina_id = $i AND k.nazwa = '$klasa'";
                        
                        $lessonDataRes = mysqli_query($conn, $lessonData);

                        if(!$lessonDataRes)
                        {
                            echo $lessonData;
                            echo '<br>';
                            echo mysqli_error($conn);
                        }

                        echo '<td data-click="clickable" data-empty="1" data-teacher="0" data-id="'.$i.'_'.$j.'">';

                        if(mysqli_num_rows($lessonDataRes) > 0)
                        {
                            $lessonDataRow = mysqli_fetch_array($lessonDataRes);
                            echo '<h4>';
                            echo $lessonDataRow['imie'].'&NonBreakingSpace;'.$lessonDataRow['nazwisko'];
                            echo '</h4>';
                            echo '<p>';
                            echo 'Lekcja:&NonBreakingSpace;'.$lessonDataRow['p_nazwa'];
                            echo '</p>';
                            echo '<p>';
                            echo 'Sala:&NonBreakingSpace;'.$lessonDataRow['s_numer'];
                            echo '</p>';
                        } else {
                            echo '<p>';
                            echo 'Brak lekcji';
                            echo '</p>';
                        }
                        echo '<input name="lekcja" type="checkbox" data-input-id="'.$i.'_'.$j.'" value="'.$i.'_'.$j.'"></td> ';
                    }
                echo '</tr>';
                $i++;
                }
            ?>
        </table>
        <div class="flexBlock column">
            <div class="flexBlock selects">
                <select name="nauczyciel" id="nauczyciel">
                    <?php
                        $q = "SELECT * FROM nauczyciele ORDER BY nazwisko ASC";
                        $res = mysqli_query($conn, $q);
        
                        while($row = mysqli_fetch_array($res))
                        {
                    ?>
                    <option value="<?php echo $row['id'] ?>"><?php echo $row['imie'].' '.$row['nazwisko'] ?></option>
                    <?php
                        }
                    ?>
                </select>
                <select name="przedmiot" id="przedmiot">
                    <?php
                        $q = "SELECT * FROM przedmioty ORDER BY nazwa ASC";
                        $res = mysqli_query($conn, $q);
        
                        while($row = mysqli_fetch_array($res))
                        {
                    ?>
                    <option value="<?php echo $row['id'] ?>"><?php echo $row['nazwa']?></option>
                    <?php
                        }
                    ?>
                </select>
                <select name="sala" id="sala">
                    <?php
                        $q = "SELECT * FROM sala ORDER BY numer ASC";
                        $res = mysqli_query($conn, $q);
        
                        while($row = mysqli_fetch_array($res))
                        {
                    ?>
                    <option value="<?php echo $row['id'] ?>"><?php echo $row['numer']?></option>
                    <?php
                        }
                    ?>
                </select>
            </div>
            <?php
                if($_SERVER['REQUEST_METHOD'] == "GET")
                {
                    echo '<p>';
                    echo '';
                    echo '</p>';
                }
            ?>
            <input type="submit" value="Dodaj">
        </div>
        <input type="checkbox" name="klasa" id="klasa" value="<?php ?>" checked>
    </form>
</body>
<?php mysqli_close($conn); ?>
<script src="../JS/script.js"></script>
</html>