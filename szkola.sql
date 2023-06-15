-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Cze 13, 2023 at 10:07 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `szkola`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dzien`
--

CREATE TABLE `dzien` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dzien`
--

INSERT INTO `dzien` (`id`, `nazwa`) VALUES
(1, 'poniedzialek'),
(2, 'wtorek'),
(3, 'sroda'),
(4, 'czwartek'),
(5, 'piatek');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dzien_pom`
--

CREATE TABLE `dzien_pom` (
  `lekcja_id` int(11) NOT NULL,
  `dzien_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `godziny`
--

CREATE TABLE `godziny` (
  `id` int(11) NOT NULL,
  `czas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `godziny`
--

INSERT INTO `godziny` (`id`, `czas`) VALUES
(1, '7:30 - 8:15'),
(2, '8:25 - 9:10'),
(3, '9:20 - 10:05'),
(4, '10:15 - 11:00'),
(5, '11:10 - 11:55'),
(6, '12:10 - 12:55'),
(7, '13:05 - 13:50'),
(8, '14:00 - 14:45'),
(9, '14:50 - 15:35');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klasy`
--

CREATE TABLE `klasy` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klasy`
--

INSERT INTO `klasy` (`id`, `nazwa`) VALUES
(1, '3b'),
(2, '1a'),
(3, '3a'),
(4, '4b'),
(5, '3c'),
(6, '1c'),
(7, '2a'),
(8, '1b'),
(9, '2c'),
(10, '1d'),
(11, '3d');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lekcje`
--

CREATE TABLE `lekcje` (
  `id` int(11) NOT NULL,
  `nauczyciel_id` int(11) NOT NULL,
  `przedmiot_id` int(11) NOT NULL,
  `klasa_id` int(11) NOT NULL,
  `godzina_id` int(11) NOT NULL,
  `sala_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nauczyciele`
--

CREATE TABLE `nauczyciele` (
  `id` int(11) NOT NULL,
  `imie` varchar(255) NOT NULL,
  `nazwisko` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nauczyciele`
--

INSERT INTO `nauczyciele` (`id`, `imie`, `nazwisko`) VALUES
(1, 'Anna', 'Nowak'),
(2, 'Samara', 'Drozd'),
(3, 'Wrocislawa', 'Wojciechowski'),
(4, 'Roksana', 'Lis'),
(5, 'Jasmina', 'Morawski'),
(6, 'Iga', 'Jarosz'),
(7, 'Delia', 'Matusiak'),
(8, 'Jaromira', 'Mroczek'),
(9, 'Kiliana', 'Rojek'),
(10, 'Zuzanna', 'Makowski'),
(11, 'Asteria', 'Tomczyk'),
(12, 'Berta', 'Stasiak'),
(13, 'Dajmira', 'Krupa'),
(14, 'Wladyslawa', 'Drozdowski'),
(15, 'Ciechoslawa', 'Dobrowolski'),
(16, 'Rebeka', 'Duda'),
(17, 'Zywia', 'Morawski'),
(18, 'Seweryna', 'Bednarczyk'),
(19, 'Alicja', 'Bielawski'),
(20, 'Mieczyslawa', 'Lisowski'),
(21, 'Sora', 'Makowski');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmioty`
--

CREATE TABLE `przedmioty` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `przedmioty`
--

INSERT INTO `przedmioty` (`id`, `nazwa`) VALUES
(1, 'Biologia'),
(2, 'Matematyka'),
(3, 'Geografia'),
(4, 'Informatyka'),
(5, 'Polski'),
(6, 'Angielski'),
(7, 'Niemiecki'),
(8, 'Wychowanie Fizyczne');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sala`
--

CREATE TABLE `sala` (
  `id` int(11) NOT NULL,
  `numer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sala`
--

INSERT INTO `sala` (`id`, `numer`) VALUES
(1, 12),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 5),
(7, 6),
(8, 7),
(9, 8),
(10, 9),
(11, 10),
(12, 11);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dzien`
--
ALTER TABLE `dzien`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `dzien_pom`
--
ALTER TABLE `dzien_pom`
  ADD KEY `lekcja_id` (`lekcja_id`),
  ADD KEY `dzien_id` (`dzien_id`);

--
-- Indeksy dla tabeli `godziny`
--
ALTER TABLE `godziny`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `klasy`
--
ALTER TABLE `klasy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `lekcje`
--
ALTER TABLE `lekcje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nauczyciel_id` (`nauczyciel_id`),
  ADD KEY `przedmiot_id` (`przedmiot_id`),
  ADD KEY `klasa_id` (`klasa_id`),
  ADD KEY `godzina_id` (`godzina_id`),
  ADD KEY `sala_id` (`sala_id`);

--
-- Indeksy dla tabeli `nauczyciele`
--
ALTER TABLE `nauczyciele`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `przedmioty`
--
ALTER TABLE `przedmioty`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dzien`
--
ALTER TABLE `dzien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `godziny`
--
ALTER TABLE `godziny`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `klasy`
--
ALTER TABLE `klasy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `lekcje`
--
ALTER TABLE `lekcje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nauczyciele`
--
ALTER TABLE `nauczyciele`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `przedmioty`
--
ALTER TABLE `przedmioty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sala`
--
ALTER TABLE `sala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dzien_pom`
--
ALTER TABLE `dzien_pom`
  ADD CONSTRAINT `dzien_pom_ibfk_1` FOREIGN KEY (`lekcja_id`) REFERENCES `lekcje` (`id`),
  ADD CONSTRAINT `dzien_pom_ibfk_2` FOREIGN KEY (`dzien_id`) REFERENCES `dzien` (`id`);

--
-- Constraints for table `lekcje`
--
ALTER TABLE `lekcje`
  ADD CONSTRAINT `lekcje_ibfk_2` FOREIGN KEY (`klasa_id`) REFERENCES `klasy` (`id`),
  ADD CONSTRAINT `lekcje_ibfk_3` FOREIGN KEY (`nauczyciel_id`) REFERENCES `nauczyciele` (`id`),
  ADD CONSTRAINT `lekcje_ibfk_4` FOREIGN KEY (`przedmiot_id`) REFERENCES `przedmioty` (`id`),
  ADD CONSTRAINT `lekcje_ibfk_5` FOREIGN KEY (`godzina_id`) REFERENCES `godziny` (`id`),
  ADD CONSTRAINT `lekcje_ibfk_6` FOREIGN KEY (`sala_id`) REFERENCES `sala` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
