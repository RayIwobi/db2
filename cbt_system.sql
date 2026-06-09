CREATE DATABASE IF NOT EXISTS cbt_system;
USE cbt_system;

-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2026 at 01:48 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cbt_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `fullname` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'admin',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `fullname`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2b$10$SYLo65f5Gk/o.cd2vqwcdeetMajSG.CdbP5F.eq2hk5b7qLjYDH1C', 'admin', '2026-05-27 09:30:53');

-- --------------------------------------------------------

--
-- Table structure for table `arms`
--

CREATE TABLE `arms` (
  `id` int(11) NOT NULL,
  `arm_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `arms`
--

INSERT INTO `arms` (`id`, `arm_name`, `class_id`) VALUES
(1, 'ARM A', 3),
(2, 'ARM B', 2),
(3, 'ARM C JSS', 6),
(4, 'ARM C JSS', 5),
(5, 'ARM C JSS', 4),
(6, 'ARM SS3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `class_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `class_name`, `created_at`) VALUES
(1, 'SS3', '2026-05-27 21:03:56'),
(2, 'SS2', '2026-05-27 21:04:05'),
(3, 'SS1', '2026-05-27 21:04:12'),
(4, 'JSS1', '2026-05-31 06:27:15'),
(5, 'JSS2', '2026-05-31 06:27:26'),
(6, 'JSS3', '2026-05-31 06:27:32');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `exam_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `total_questions` int(11) DEFAULT NULL,
  `shuffle_questions` tinyint(1) DEFAULT '1',
  `shuffle_options` tinyint(1) DEFAULT '1',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `show_result_immediately` tinyint(1) DEFAULT '1',
  `subject_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `exam_title`, `class_id`, `duration`, `total_questions`, `shuffle_questions`, `shuffle_options`, `start_time`, `end_time`, `status`, `created_at`, `show_result_immediately`, `subject_id`) VALUES
(4, 'Mock Exam', 3, 45, 20, 1, 1, '2026-05-29 02:20:00', '2026-05-30 02:21:00', 'active', '2026-05-28 13:21:39', 1, 1),
(5, 'Mid Term Exam', 3, 70, 50, 1, 1, '2026-05-30 06:36:00', '2026-06-01 06:36:00', 'active', '2026-05-30 05:37:02', 1, NULL),
(6, 'Mid Term Exam', 2, 60, 20, 1, 1, '2026-06-01 22:10:00', '2026-06-03 22:10:00', 'active', '2026-06-01 21:10:42', 1, NULL),
(9, 'Mid Term Exam', 1, 60, 20, 1, 1, '2026-06-01 23:31:00', '2026-06-04 23:31:00', 'active', '2026-06-01 22:31:53', 0, NULL),
(10, 'Third Term Exam', 4, 10, 10, 1, 1, '2026-06-02 13:13:00', '2026-06-04 13:13:00', 'active', '2026-06-02 12:13:38', 1, NULL),
(11, 'Second Term Exam', 1, 60, 20, 1, 1, '2026-06-08 20:31:00', '2026-06-30 20:31:00', 'active', '2026-06-08 19:32:06', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_attempts`
--

CREATE TABLE `exam_attempts` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `started_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `submitted_at` datetime DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'in_progress'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_subjects`
--

CREATE TABLE `exam_subjects` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correct_option` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `explanation` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `option_a` text COLLATE utf8mb4_unicode_ci,
  `option_b` text COLLATE utf8mb4_unicode_ci,
  `option_c` text COLLATE utf8mb4_unicode_ci,
  `option_d` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `subject_id`, `class_id`, `question`, `image`, `correct_option`, `explanation`, `created_at`, `option_a`, `option_b`, `option_c`, `option_d`) VALUES
(5, 1, 3, 'who is a gamer', '1780062688519-ideavault.png', 'B', 'a gamer', '2026-05-29 13:51:28', 'arachnida', 'spider', 'simp', 'bobby'),
(6, 1, 3, 'who is a man', '1780091464010-a2.jpg', 'C', 'a man', '2026-05-29 21:51:04', '', 'spider', 'simp', 'bobby'),
(7, 1, 3, 'bla', '1780093961243-Cover-community-forum-examples@2x.png', 'B', 'blah', '2026-05-29 22:32:41', 'arachnida', 'spider', 'simp', 'bobby'),
(8, 1, 1, 'what is the name of a baby goat', '1780388085888-bgoat.jpg', 'A', 'the baby goat is kid', '2026-05-29 23:28:05', 'kid', 'goat', 'ewe', 'gin'),
(12, 1, 2, 'Which disease is transmitted through contaminated water?', NULL, 'C', NULL, '2026-06-01 21:48:49', 'tetanus', 'tuberculosis', 'cholera', 'rabies'),
(13, 1, 2, 'Which of these is an asexual method of reproduction?', NULL, 'A', NULL, '2026-06-01 21:48:49', 'fertilization', 'conjugation', 'copulation', 'binary fusion'),
(14, 1, 2, 'Which hormone promotes fruit ripening?', NULL, 'A', NULL, '2026-06-01 21:48:49', 'auxin', 'giberrelin', 'ethylene', 'cykotin'),
(15, 1, 1, 'Which disease is transmitted through contaminated water?', NULL, 'C', NULL, '2026-06-01 22:17:54', 'tetanus', 'tuberculosis', 'cholera', 'rabies'),
(16, 1, 1, 'Which of these is an asexual method of reproduction?', NULL, 'A', NULL, '2026-06-01 22:17:54', 'fertilization', 'conjugation', 'copulation', 'binary fusion'),
(17, 1, 1, 'Which hormone promotes fruit ripening?', NULL, 'A', NULL, '2026-06-01 22:17:54', 'auxin', 'giberrelin', 'ethylene', 'cykotin'),
(18, 1, 1, 'Study the diagram of the mouse below with parts labeled I, II, III, and IV.Which of the following correctly matches the labeled parts with their names?', '1780385039749-BIO_DIAG_401.jpg', 'A', 'null', '2026-06-02 07:21:04', 'I � Whiskers, II � Ear, III � Hind limb, IV � Forelimb', 'I � Tail, II � Eye, III � Forelimb, IV � Hind limb', 'I � Snout, II � Eye, III � Hind limb, IV � Tail', 'I � Whiskers, II � Nose, III � Forelimb, IV � Hind limb'),
(19, 1, 1, 'In the diagram of the grasshopper, the part labeled II is identified as:', '1780385019601-image017.jpg', 'B', 'null', '2026-06-02 07:21:04', 'Eye', 'Antennae', 'Wing', 'Arm'),
(20, 1, 1, 'In mammals, the structure responsible for detecting smell is the:', NULL, 'A', NULL, '2026-06-02 07:21:04', 'Olfactory bulb', 'Optic nerve', 'Auditory nerve', 'Cerebellum'),
(21, 1, 1, 'The grasshopper uses its hind legs primarily for:', NULL, 'A', NULL, '2026-06-02 07:21:04', 'Jumping', 'Walking', 'Flying', 'Digging'),
(22, 1, 1, 'Which of the following is NOT a function of the mammalian skin?', NULL, 'C', NULL, '2026-06-02 07:21:04', 'Temperature regulation', 'Excretion', 'Photosynthesis', 'Protection'),
(23, 1, 1, 'Insects breathe through:', NULL, 'D', NULL, '2026-06-02 07:21:04', 'Gills', 'Lungs', 'Skin', 'Spiracles'),
(24, 1, 1, 'The main function of the mammalian whiskers is:', NULL, 'C', NULL, '2026-06-02 07:21:04', 'Feeding', 'Breathing', 'Sensory detection', 'Balance'),
(25, 1, 1, 'The wings of a grasshopper are adapted for:', NULL, 'B', NULL, '2026-06-02 07:21:04', 'Jumping', 'Flying', 'Swimming', 'Digging'),
(26, 1, 1, 'Which of the following organs is involved in excretion in mammals?', NULL, 'D', NULL, '2026-06-02 07:21:04', 'Heart', 'Liver', 'Spleen', 'Kidney'),
(27, 1, 1, 'The antennae of insects function mainly in:', NULL, 'A', NULL, '2026-06-02 07:21:04', 'Smell and touch', 'Flight', 'Digestion', 'Excretion'),
(28, 1, 1, 'Which of the following is a characteristic of mammals?', NULL, 'B', NULL, '2026-06-02 07:21:04', 'Exoskeleton', 'Hair or fur', 'Compound eyes', 'Spiracles'),
(29, 1, 1, 'The forelimbs of a mouse are mainly used for:', NULL, 'B', NULL, '2026-06-02 07:21:04', 'Flying', 'Grasping and support', 'Swimming', 'Digging'),
(30, 1, 1, 'In the diagram of the shoulder joint, the structure labeled as the head of the humerus fits into which part of the joint?', '1780384964911-BIO_DIAG_172.jpg', 'B', 'null', '2026-06-02 07:21:04', 'Acromion', 'Glenoid cavity', 'Joint capsule', 'Clavicle'),
(31, 1, 1, 'In the diagram of the female reproductive system, the part labeled Z is identified as:', '1780384945854-BIO_AI_104.png', 'A', 'null', '2026-06-02 07:21:04', 'Fallopian tube', 'Ovary', 'Cervix', 'Vagina'),
(32, 1, 1, 'In the diagram of the flower, the structure labeled as the stamen represents which of the following?', '1780384917270-BIO_DIAG_153.jpg', 'A', 'null', '2026-06-02 07:21:04', 'Male reproductive organ', 'Female reproductive organ', 'Protective covering', 'Attracting structure'),
(33, 4, 4, 'Study the diagram of the mouse below with parts labeled I, II, III, and IV.Which of the following correctly matches the labeled parts with their names?', NULL, 'A', NULL, '2026-06-02 12:21:38', 'I � Whiskers, II � Ear, III � Hind limb, IV � Forelimb', 'I � Tail, II � Eye, III � Forelimb, IV � Hind limb', 'I � Snout, II � Eye, III � Hind limb, IV � Tail', 'I � Whiskers, II � Nose, III � Forelimb, IV � Hind limb'),
(34, 4, 4, 'In the diagram of the grasshopper, the part labeled II is identified as:', NULL, 'B', NULL, '2026-06-02 12:21:38', 'Eye', 'Antennae', 'Wing', 'Foreleg'),
(35, 4, 4, 'In mammals, the structure responsible for detecting smell is the:', NULL, 'A', NULL, '2026-06-02 12:21:38', 'Olfactory bulb', 'Optic nerve', 'Auditory nerve', 'Cerebellum'),
(36, 4, 4, 'The grasshopper uses its hind legs primarily for:', NULL, 'A', NULL, '2026-06-02 12:21:38', 'Jumping', 'Walking', 'Flying', 'Digging');

-- --------------------------------------------------------

--
-- Table structure for table `question_options`
--

CREATE TABLE `question_options` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `option_label` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_text` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  `grade` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_questions` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `student_id`, `exam_id`, `score`, `percentage`, `grade`, `total_questions`, `created_at`) VALUES
(2, 1, 5, 1, 33.3333, 'F', 3, '2026-05-30 09:07:49'),
(3, 1, 5, 0, 0, 'F', 3, '2026-05-30 15:27:18'),
(4, 1, 5, 0, 0, 'F', 3, '2026-05-31 06:38:01'),
(5, 7, 6, 0, 0, 'F', 3, '2026-06-01 21:14:46'),
(6, 7, 6, 0, 0, 'F', 3, '2026-06-01 21:16:45'),
(7, 7, 6, 3, 100, 'A', 3, '2026-06-01 21:45:08'),
(8, 7, 6, 3, 100, 'A', 3, '2026-06-01 21:49:35'),
(10, 16, 9, 4, 100, 'A', 4, '2026-06-01 22:32:26'),
(11, 16, 9, 0, 0, 'F', 19, '2026-06-02 08:11:22'),
(12, 16, 9, 1, 5.26316, 'F', 19, '2026-06-02 12:10:37'),
(13, 19, 10, 0, 0, 'F', 4, '2026-06-02 12:23:19');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `fullname` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `arm_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `fullname`, `reg_number`, `password`, `class_id`, `arm_id`) VALUES
(1, 'james ross', '01/223/40', '$2b$10$ZaIe1xuEwqlOM6kf6MZ1Eevj5LzBhzfy8ToxkiPL1ciHuTRajphJS', 3, 1),
(4, 'john mah', '01/223/4wxx', '$2b$10$4QMouaQd1oKRBQ1lER0tyOM0nPG9KL6QOohzlnAA.3FEKl8x5AyDO', 1, 2),
(5, 'abijam kali badu', '01/223/40zzet', '$2b$10$XJC2LlVqKojtBIbkR42MaOz56A8.bjm8G7XgiacxcWMnPJFmeNk4q', 2, 2),
(6, 'kudi machel', '01/Rosvin4x/40', '$2b$10$5QYydM1jEsAHbYGrD.RxJe4uk.hD4ymVDeW4jAk39Izk0i7NjWdES', 3, 1),
(7, 'michael james', 'Rosvin/2026/34b', '$2b$10$mXX28sa8W53wHDCYW3zm5OYGyuzJmMbNjnlqQcddgSq0QRkLN1ggm', 2, 1),
(9, 'benjamin franklin', 'Rosvin/2026/50b', '$2b$10$vzq7eq4tfAAYgZEZsiMHf.cS15uRy0G0CSzgSbhz41cvGWcesKcQm', 5, 1),
(16, 'chinedu michael', 'Rosvin/2026/15', '$2b$10$ZOUWJwACzpa6//JGh8hfx.VE.F4xjUzZzyZODT4ZgqjVMobCWfCoS', 1, 6),
(17, 'Amaka odili', 'Rosvin/2026/12', '$2b$10$5WcLjxIScmGUc3rLZCQ1dOsKj/JaOXjgYKv/ztYlMZAbQOMkPXfgO', 1, 6),
(18, 'Peter saint', 'Rosvin/2026/41', '$2b$10$lac55Y7s//7pM7nJefGT1OaeWoQKuIHqjbLBRk8CxWLvz/7lNUHEi', 1, 6),
(19, 'Godswil apabio', 'Rosvin/111', '$2b$10$7MZUnp8/JMgH8v79ZYjOK.ouEBWCZzkE1VALME2s9CR82uveRpIzC', 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `student_answers`
--

CREATE TABLE `student_answers` (
  `id` int(11) NOT NULL,
  `attempt_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `selected_option` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject_name`, `class_id`) VALUES
(1, 'Biology', 3),
(4, 'Physics', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `arms`
--
ALTER TABLE `arms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `exam_attempts`
--
ALTER TABLE `exam_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Indexes for table `exam_subjects`
--
ALTER TABLE `exam_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_id` (`exam_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `question_options`
--
ALTER TABLE `question_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reg_number` (`reg_number`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `arm_id` (`arm_id`);

--
-- Indexes for table `student_answers`
--
ALTER TABLE `student_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attempt_id` (`attempt_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `arms`
--
ALTER TABLE `arms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `exam_attempts`
--
ALTER TABLE `exam_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_subjects`
--
ALTER TABLE `exam_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `question_options`
--
ALTER TABLE `question_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `student_answers`
--
ALTER TABLE `student_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arms`
--
ALTER TABLE `arms`
  ADD CONSTRAINT `arms_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_attempts`
--
ALTER TABLE `exam_attempts`
  ADD CONSTRAINT `exam_attempts_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_attempts_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_subjects`
--
ALTER TABLE `exam_subjects`
  ADD CONSTRAINT `exam_subjects_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_subjects_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_options`
--
ALTER TABLE `question_options`
  ADD CONSTRAINT `question_options_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`arm_id`) REFERENCES `arms` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `student_answers`
--
ALTER TABLE `student_answers`
  ADD CONSTRAINT `student_answers_ibfk_1` FOREIGN KEY (`attempt_id`) REFERENCES `exam_attempts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
