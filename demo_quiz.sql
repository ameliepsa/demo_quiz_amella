-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 23. Apr 2024 um 16:43
-- Server-Version: 10.4.32-MariaDB
-- PHP-Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `demo_quiz`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `a_answers`
--

CREATE TABLE `a_answers` (
  `a_id` int(11) NOT NULL,
  `a_correct` bit(1) DEFAULT NULL,
  `a_text` varchar(255) DEFAULT NULL,
  `a_question_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `a_answers`
--

INSERT INTO `a_answers` (`a_id`, `a_correct`, `a_text`, `a_question_id`) VALUES
(1, b'0', 'Berlin', NULL),
(2, b'0', 'Madrid', NULL),
(3, b'1', 'Paris', NULL),
(4, b'0', 'Rome', NULL),
(5, b'0', 'Venus', 2),
(6, b'1', 'Mars', 2),
(7, b'0', 'Jupiter', 2),
(8, b'0', 'Saturn', 2),
(9, b'1', '1492', 3),
(10, b'0', '1588', 3),
(11, b'0', '1620', 3),
(12, b'0', '1776', 3),
(13, b'0', 'Elephant', 4),
(14, b'1', 'Blue Whale', 4),
(15, b'0', 'Giraffe', 4),
(16, b'0', 'Gorilla', 4),
(17, b'0', 'Charles Dickens', 5),
(18, b'1', 'William Shakespeare', 5),
(19, b'0', 'Jane Austen', 5),
(20, b'0', 'Mark Twain', 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `q_questions`
--

CREATE TABLE `q_questions` (
  `q_id` int(11) NOT NULL,
  `q_text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `q_questions`
--

INSERT INTO `q_questions` (`q_id`, `q_text`) VALUES
(1, 'Was ist die Hauptstadt von Wien?'),
(2, 'Which planet is known as the \"Red Planet\"?'),
(3, 'In which year did Christopher Columbus first reach the Americas?'),
(4, 'What is the largest mammal on Earth?'),
(5, 'Who wrote the play \"Romeo and Juliet\"?');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `a_answers`
--
ALTER TABLE `a_answers`
  ADD PRIMARY KEY (`a_id`),
  ADD KEY `FK_answers_to_questions` (`a_question_id`);

--
-- Indizes für die Tabelle `q_questions`
--
ALTER TABLE `q_questions`
  ADD PRIMARY KEY (`q_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `a_answers`
--
ALTER TABLE `a_answers`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT für Tabelle `q_questions`
--
ALTER TABLE `q_questions`
  MODIFY `q_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `a_answers`
--
ALTER TABLE `a_answers`
  ADD CONSTRAINT `FK_answers_to_questions` FOREIGN KEY (`a_question_id`) REFERENCES `q_questions` (`q_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
