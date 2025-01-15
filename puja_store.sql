-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 31, 2024 at 11:53 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `puja_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` char(36) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
('00eec244-f90c-4e52-89f5-6545c3b4eaed', 'vidyasagar.vi@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` varchar(36) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `created_at`, `status`) VALUES
('2d90117a-295c-496c-977c-4097adff3604', '2024-06-15 16:12:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` int(11) NOT NULL,
  `category_id` varchar(36) DEFAULT NULL,
  `language_code` varchar(2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `category_id`, `language_code`, `name`, `description`) VALUES
(39, '2d90117a-295c-496c-977c-4097adff3604', 'en', 'Divine Worship Material', 'Divine Worship Material'),
(40, '2d90117a-295c-496c-977c-4097adff3604', 'hi', 'दिव्य पूजन सामग्री', 'दिव्य पूजन सामग्री');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` char(36) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `created_at`, `updated_at`, `status`) VALUES
('0d70a2e3-c2c2-40f1-a69c-9050f42d4dce', '2024-07-11 15:44:58', '2024-07-11 15:44:58', 1),
('3c568d45-7fd4-4a27-8ff8-3b8f9282eeaf', '2024-07-11 15:48:23', '2024-07-11 15:48:23', 1),
('860bfa89-f908-45fd-9d6a-92a5cfe33af4', '2024-07-11 15:46:32', '2024-07-11 15:46:32', 1),
('e7085c05-4833-4ff8-b555-5e21451a896c', '2024-07-11 15:47:32', '2024-07-11 15:51:15', 1),
('eb1b2cdd-98f2-4079-9161-fbbb19eeae99', '2024-08-10 16:58:17', '2024-08-10 16:58:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `faq_translations`
--

CREATE TABLE `faq_translations` (
  `id` char(36) NOT NULL,
  `faq_id` char(36) DEFAULT NULL,
  `language_code` varchar(10) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faq_translations`
--

INSERT INTO `faq_translations` (`id`, `faq_id`, `language_code`, `question`, `answer`, `created_at`, `updated_at`) VALUES
('01855f10-3f9d-11ef-8e5b-acbc329ab9e7', '3c568d45-7fd4-4a27-8ff8-3b8f9282eeaf', 'en', 'Will I get a recording of this delivery?', 'Yes, devotees will get a recorded video of the distribution.', '2024-07-11 15:48:23', '2024-07-11 15:48:23'),
('0185ee08-3f9d-11ef-8e5b-acbc329ab9e7', '3c568d45-7fd4-4a27-8ff8-3b8f9282eeaf', 'hi', 'क्या मुझे इस डिलीवरी की रिकॉर्डिंग मिलेगी?', 'हां, भक्तों को वितरण का एक रिकॉर्डेड वीडियो मिलेगा।', '2024-07-11 15:48:23', '2024-07-11 15:48:23'),
('86cc344c-3f9c-11ef-8e5b-acbc329ab9e7', '0d70a2e3-c2c2-40f1-a69c-9050f42d4dce', 'en', 'Why should I choose online Bhandara?', 'In today\'s time, religion is decreasing, our effort is that the devotees who want to organize Bhandara or distribute Prasad at religious places, can do it sitting at home and get the blessings of God.', '2024-07-11 15:44:58', '2024-07-11 15:44:58'),
('86ccb5d4-3f9c-11ef-8e5b-acbc329ab9e7', '0d70a2e3-c2c2-40f1-a69c-9050f42d4dce', 'hi', 'मुझे ऑनलाइन भंडारा क्यों चुनना चाहिए?', 'आज के समय में धर्म कम होता जा रहा है हमारी कोसिस है की जिन धार्मिक  अस्थानो पर भक्तगण भंडारा करवाना या प्रसाद वितरण करवाना चाहते हैं वे घर बैठे करवा सकते हैं और भगवन का आशीर्वाद प्राप्त कर सकते हैं', '2024-07-11 15:44:58', '2024-07-11 15:44:58'),
('bd67a068-5739-11ef-9834-acbc329ab9e7', 'eb1b2cdd-98f2-4079-9161-fbbb19eeae99', 'en', 'Will I get a recording of this delivery?', 'Yes, devotees will get a recorded video of the distribution.', '2024-08-10 16:58:17', '2024-08-10 16:58:17'),
('bd67cb1a-5739-11ef-9834-acbc329ab9e7', 'eb1b2cdd-98f2-4079-9161-fbbb19eeae99', 'hi', 'क्या मुझे इस डिलीवरी की रिकॉर्डिंग मिलेगी?', 'हां, भक्तों को वितरण का एक रिकॉर्डेड वीडियो मिलेगा।', '2024-08-10 16:58:17', '2024-08-10 16:58:17'),
('bef51938-3f9c-11ef-8e5b-acbc329ab9e7', '860bfa89-f908-45fd-9d6a-92a5cfe33af4', 'en', 'What is special about the Bhandara organized by Satim?', 'Satim ensures the best virtual experience for the devotees. The Bhandara organized by Satin is distributed among the needy and devotees at a place of their choice.', '2024-07-11 15:46:32', '2024-07-11 15:46:32'),
('bef52f90-3f9c-11ef-8e5b-acbc329ab9e7', '860bfa89-f908-45fd-9d6a-92a5cfe33af4', 'hi', 'सतिं द्वारा आयोजित भंडारे में क्या है खास?', 'सतिं भक्तों के लिए सर्वोत्तम आभासी अनुभव सुनिश्चित करता है। सैटिन द्वारा आयोजित भंडारा जरूरतमंदों और भक्तों के बीच उनकी पसंद के स्थान पर वितरित किया जाता है।', '2024-07-11 15:46:32', '2024-07-11 15:46:32'),
('e2bd0d30-3f9c-11ef-8e5b-acbc329ab9e7', 'e7085c05-4833-4ff8-b555-5e21451a896c', 'en', 'What happens after booking this delivery?', 'The Vaastu chosen by you will be delivered at the place chosen by you, video and certificate of which will be given to you.', '2024-07-11 15:47:32', '2024-07-11 15:47:32'),
('e2bdfc9a-3f9c-11ef-8e5b-acbc329ab9e7', 'e7085c05-4833-4ff8-b555-5e21451a896c', 'hi', 'इस डिलीवरी को बुक करने के बाद क्या होता है?', 'आपके द्वारा चुने गए वास्तु का वितरण आपके द्वारा चुने गए स्थान पर किया जाएगा, जिसका वीडियो एवं प्रमाण पत्र आपको दिया जाएगा।', '2024-07-11 15:47:32', '2024-07-11 15:47:32');

-- --------------------------------------------------------

--
-- Table structure for table `helps_needy_person`
--

CREATE TABLE `helps_needy_person` (
  `id` char(36) NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `contact_no` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `helps_needy_person`
--

INSERT INTO `helps_needy_person` (`id`, `images`, `contact_no`, `created_at`, `status`) VALUES
('17ace1c7-c4a1-4093-ae7b-5741fc1cdb6d', '[\"helpsneedy/1729526024024.png\"]', '9911030958', '2024-10-21 15:53:44', 1),
('4e67a362-7091-484b-9139-452a8bb9c0fd', '[\"helpsneedy/1729526022948.png\"]', '9911030958', '2024-10-21 15:53:42', 1),
('69620fd0-1795-4e9f-82f0-96548d828810', '[\"helpsneedy/1729525982972.png\"]', '9911030958', '2024-10-21 15:53:03', 1),
('6d9bc0d4-24b1-4392-8122-a43545ec3c61', '[\"helpsneedy/1729526025035.png\"]', '9911030958', '2024-10-21 15:53:45', 1),
('dbdce081-df5c-4a7c-b745-1a01ff449f77', '[\"helpsneedy/1729525999748.png\"]', '9911030958', '2024-10-21 15:53:19', 1),
('dcb35aeb-09f3-474c-8664-cd64fde802cd', '[\"helpsneedy/1729525998334.png\"]', '9911030958', '2024-10-21 15:53:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `helps_needy_person_translations`
--

CREATE TABLE `helps_needy_person_translations` (
  `id` char(36) NOT NULL,
  `helps_needy_person_id` char(36) DEFAULT NULL,
  `language_code` varchar(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `title` varchar(225) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `helps_needy_person_translations`
--

INSERT INTO `helps_needy_person_translations` (`id`, `helps_needy_person_id`, `language_code`, `name`, `place`, `address`, `title`, `description`, `created_at`) VALUES
('8e01e662-8fc4-11ef-a37a-acbc329ab9e7', '69620fd0-1795-4e9f-82f0-96548d828810', 'en', 'Praveen Kumar', 'Delhi', 'Gali no 15 House no 362 DDA Flats Madan Gir New Delhi 110062', 'Help My Mother To Undergo Liver Transplantation asap.', '<p>My name is Saurabh Kumar and I am here to raise funds for my mother Neelu Devi who is 50 years old. Neelu Devi lives in Faridabad, Haryana with us.</p><p>Neelu Devi is suffering from Acute-on-chronic Liver Failure from the few days. She was previously admitted and receiving ICU Care from last 20 Days in Sarvodaya Hospital, Faridabad, Haryana. Now we have shifted to ICU of Amrita Hospital, Faridabad under Dr. Rohit Mehtani (one of the best known surgeon of Liver Transplant).</p>', '2024-10-21 15:53:03'),
('8e02104c-8fc4-11ef-a37a-acbc329ab9e7', '69620fd0-1795-4e9f-82f0-96548d828810', 'hi', 'अनुज', 'दिल्ली', 'गली नंबर 15 मकान नंबर 362 डीडीए फ्लैट मदन गिर नई दिल्ली 110062', 'मेरी माँ को लिवर प्रत्यारोपण कराने में मदद करें।', '<p>मेरा नाम सौरभ कुमार है और मैं यहां अपनी मां नीलू देवी, जो 50 वर्ष की हैं, के लिए धन जुटाने के लिए आया हूं। नीलू देवी हमारे साथ हरियाणा के फ़रीदाबाद में रहती हैं।</p>', '2024-10-21 15:53:03'),
('971f4e38-8fc4-11ef-a37a-acbc329ab9e7', 'dcb35aeb-09f3-474c-8664-cd64fde802cd', 'en', 'Praveen Kumar', 'Delhi', 'Gali no 15 House no 362 DDA Flats Madan Gir New Delhi 110062', 'Help My Mother To Undergo Liver Transplantation asap.', '<p>My name is Saurabh Kumar and I am here to raise funds for my mother Neelu Devi who is 50 years old. Neelu Devi lives in Faridabad, Haryana with us.</p><p>Neelu Devi is suffering from Acute-on-chronic Liver Failure from the few days. She was previously admitted and receiving ICU Care from last 20 Days in Sarvodaya Hospital, Faridabad, Haryana. Now we have shifted to ICU of Amrita Hospital, Faridabad under Dr. Rohit Mehtani (one of the best known surgeon of Liver Transplant).</p>', '2024-10-21 15:53:18'),
('971f6756-8fc4-11ef-a37a-acbc329ab9e7', 'dcb35aeb-09f3-474c-8664-cd64fde802cd', 'hi', 'अनुज', 'दिल्ली', 'गली नंबर 15 मकान नंबर 362 डीडीए फ्लैट मदन गिर नई दिल्ली 110062', 'मेरी माँ को लिवर प्रत्यारोपण कराने में मदद करें।', '<p>मेरा नाम सौरभ कुमार है और मैं यहां अपनी मां नीलू देवी, जो 50 वर्ष की हैं, के लिए धन जुटाने के लिए आया हूं। नीलू देवी हमारे साथ हरियाणा के फ़रीदाबाद में रहती हैं।</p>', '2024-10-21 15:53:18'),
('97f52d32-8fc4-11ef-a37a-acbc329ab9e7', 'dbdce081-df5c-4a7c-b745-1a01ff449f77', 'en', 'Praveen Kumar', 'Delhi', 'Gali no 15 House no 362 DDA Flats Madan Gir New Delhi 110062', 'Help My Mother To Undergo Liver Transplantation asap.', '<p>My name is Saurabh Kumar and I am here to raise funds for my mother Neelu Devi who is 50 years old. Neelu Devi lives in Faridabad, Haryana with us.</p><p>Neelu Devi is suffering from Acute-on-chronic Liver Failure from the few days. She was previously admitted and receiving ICU Care from last 20 Days in Sarvodaya Hospital, Faridabad, Haryana. Now we have shifted to ICU of Amrita Hospital, Faridabad under Dr. Rohit Mehtani (one of the best known surgeon of Liver Transplant).</p>', '2024-10-21 15:53:19'),
('97f543d0-8fc4-11ef-a37a-acbc329ab9e7', 'dbdce081-df5c-4a7c-b745-1a01ff449f77', 'hi', 'अनुज', 'दिल्ली', 'गली नंबर 15 मकान नंबर 362 डीडीए फ्लैट मदन गिर नई दिल्ली 110062', 'मेरी माँ को लिवर प्रत्यारोपण कराने में मदद करें।', '<p>मेरा नाम सौरभ कुमार है और मैं यहां अपनी मां नीलू देवी, जो 50 वर्ष की हैं, के लिए धन जुटाने के लिए आया हूं। नीलू देवी हमारे साथ हरियाणा के फ़रीदाबाद में रहती हैं।</p>', '2024-10-21 15:53:19'),
('a5cb2aec-8fc4-11ef-a37a-acbc329ab9e7', '4e67a362-7091-484b-9139-452a8bb9c0fd', 'en', 'Praveen Kumar', 'Delhi', 'Gali no 15 House no 362 DDA Flats Madan Gir New Delhi 110062', 'Help My Mother To Undergo Liver Transplantation asap.', '<p>My name is Saurabh Kumar and I am here to raise funds for my mother Neelu Devi who is 50 years old. Neelu Devi lives in Faridabad, Haryana with us.</p><p>Neelu Devi is suffering from Acute-on-chronic Liver Failure from the few days. She was previously admitted and receiving ICU Care from last 20 Days in Sarvodaya Hospital, Faridabad, Haryana. Now we have shifted to ICU of Amrita Hospital, Faridabad under Dr. Rohit Mehtani (one of the best known surgeon of Liver Transplant).</p>', '2024-10-21 15:53:42'),
('a5ccf34a-8fc4-11ef-a37a-acbc329ab9e7', '4e67a362-7091-484b-9139-452a8bb9c0fd', 'hi', 'अनुज', 'दिल्ली', 'गली नंबर 15 मकान नंबर 362 डीडीए फ्लैट मदन गिर नई दिल्ली 110062', 'मेरी माँ को लिवर प्रत्यारोपण कराने में मदद करें।', '<p>मेरा नाम सौरभ कुमार है और मैं यहां अपनी मां नीलू देवी, जो 50 वर्ष की हैं, के लिए धन जुटाने के लिए आया हूं। नीलू देवी हमारे साथ हरियाणा के फ़रीदाबाद में रहती हैं।</p>', '2024-10-21 15:53:42'),
('a66db03c-8fc4-11ef-a37a-acbc329ab9e7', '17ace1c7-c4a1-4093-ae7b-5741fc1cdb6d', 'en', 'Praveen Kumar', 'Delhi', 'Gali no 15 House no 362 DDA Flats Madan Gir New Delhi 110062', 'Help My Mother To Undergo Liver Transplantation asap.', '<p>My name is Saurabh Kumar and I am here to raise funds for my mother Neelu Devi who is 50 years old. Neelu Devi lives in Faridabad, Haryana with us.</p><p>Neelu Devi is suffering from Acute-on-chronic Liver Failure from the few days. She was previously admitted and receiving ICU Care from last 20 Days in Sarvodaya Hospital, Faridabad, Haryana. Now we have shifted to ICU of Amrita Hospital, Faridabad under Dr. Rohit Mehtani (one of the best known surgeon of Liver Transplant).</p>', '2024-10-21 15:53:44'),
('a66dc36a-8fc4-11ef-a37a-acbc329ab9e7', '17ace1c7-c4a1-4093-ae7b-5741fc1cdb6d', 'hi', 'अनुज', 'दिल्ली', 'गली नंबर 15 मकान नंबर 362 डीडीए फ्लैट मदन गिर नई दिल्ली 110062', 'मेरी माँ को लिवर प्रत्यारोपण कराने में मदद करें।', '<p>मेरा नाम सौरभ कुमार है और मैं यहां अपनी मां नीलू देवी, जो 50 वर्ष की हैं, के लिए धन जुटाने के लिए आया हूं। नीलू देवी हमारे साथ हरियाणा के फ़रीदाबाद में रहती हैं।</p>', '2024-10-21 15:53:44'),
('a70923d2-8fc4-11ef-a37a-acbc329ab9e7', '6d9bc0d4-24b1-4392-8122-a43545ec3c61', 'en', 'Praveen Kumar', 'Delhi', 'Gali no 15 House no 362 DDA Flats Madan Gir New Delhi 110062', 'Help My Mother To Undergo Liver Transplantation asap.', '<p>My name is Saurabh Kumar and I am here to raise funds for my mother Neelu Devi who is 50 years old. Neelu Devi lives in Faridabad, Haryana with us.</p><p>Neelu Devi is suffering from Acute-on-chronic Liver Failure from the few days. She was previously admitted and receiving ICU Care from last 20 Days in Sarvodaya Hospital, Faridabad, Haryana. Now we have shifted to ICU of Amrita Hospital, Faridabad under Dr. Rohit Mehtani (one of the best known surgeon of Liver Transplant).</p>', '2024-10-21 15:53:45'),
('a70a636e-8fc4-11ef-a37a-acbc329ab9e7', '6d9bc0d4-24b1-4392-8122-a43545ec3c61', 'hi', 'अनुज', 'दिल्ली', 'गली नंबर 15 मकान नंबर 362 डीडीए फ्लैट मदन गिर नई दिल्ली 110062', 'मेरी माँ को लिवर प्रत्यारोपण कराने में मदद करें।', '<p>मेरा नाम सौरभ कुमार है और मैं यहां अपनी मां नीलू देवी, जो 50 वर्ष की हैं, के लिए धन जुटाने के लिए आया हूं। नीलू देवी हमारे साथ हरियाणा के फ़रीदाबाद में रहती हैं।</p>', '2024-10-21 15:53:45');

-- --------------------------------------------------------

--
-- Table structure for table `helps_products`
--

CREATE TABLE `helps_products` (
  `id` char(36) NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `helps_products`
--

INSERT INTO `helps_products` (`id`, `images`, `price`, `created_at`, `status`) VALUES
('8739f904-76cc-4974-9842-9312379c42c2', '[\"helpsproduct/1724256529728.jpeg\"]', 100.00, '2024-08-21 16:08:49', 1),
('bc2b741a-6b5d-4be6-a427-10ad591a5e3c', '[\"helpsproduct/1724256516671.jpeg\"]', 100.00, '2024-08-21 16:08:36', 1),
('cb75afcd-c256-45ff-90e9-dd35ee2788af', '[\"helpsproduct/1724256530909.jpeg\"]', 100.00, '2024-08-21 16:08:50', 1),
('d59aaa3f-245d-45cf-b213-5db15ca2ff1d', '[\"helpsproduct/1724256528739.jpeg\"]', 100.00, '2024-08-21 16:08:48', 1);

-- --------------------------------------------------------

--
-- Table structure for table `helps_products_translations`
--

CREATE TABLE `helps_products_translations` (
  `id` char(36) NOT NULL,
  `helps_id` char(36) DEFAULT NULL,
  `language_code` varchar(5) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `helps_products_translations`
--

INSERT INTO `helps_products_translations` (`id`, `helps_id`, `language_code`, `title`, `description`) VALUES
('9f49e400-5fd7-11ef-9834-acbc329ab9e7', 'bc2b741a-6b5d-4be6-a427-10ad591a5e3c', 'en', 'Donate fruits in secret to have a child', 'Donating fruits secretly are also considered good. Without making it public, you can donate seasonal fruits to the poor and needy. Keep in mind that whole fruits should always be donated. Childless couples can make a secret donation of fruits to have a child'),
('9f4a0cc8-5fd7-11ef-9834-acbc329ab9e7', 'bc2b741a-6b5d-4be6-a427-10ad591a5e3c', 'hi', 'संतान प्राप्ति के लिए फल का गुप्त दान करें', 'फलों का गुप्त दान करना भी अच्छा माना जाता है। जगजाहिर किए बिना आप मौसमी फलों का दान गरीब और जरूरतमंदों को कर सकते हैं। ध्यान रहे कि हमेशा साबुत फल का ही दान करना चाहिए। निसंतान दंपत्ति संतान प्राप्ति के लिए फल का गुप्त दान कर सकते हैं।'),
('a67ac280-5fd7-11ef-9834-acbc329ab9e7', 'd59aaa3f-245d-45cf-b213-5db15ca2ff1d', 'en', 'Donate fruits in secret to have a child', 'Donating fruits secretly are also considered good. Without making it public, you can donate seasonal fruits to the poor and needy. Keep in mind that whole fruits should always be donated. Childless couples can make a secret donation of fruits to have a child'),
('a67af2aa-5fd7-11ef-9834-acbc329ab9e7', 'd59aaa3f-245d-45cf-b213-5db15ca2ff1d', 'hi', 'संतान प्राप्ति के लिए फल का गुप्त दान करें', 'फलों का गुप्त दान करना भी अच्छा माना जाता है। जगजाहिर किए बिना आप मौसमी फलों का दान गरीब और जरूरतमंदों को कर सकते हैं। ध्यान रहे कि हमेशा साबुत फल का ही दान करना चाहिए। निसंतान दंपत्ति संतान प्राप्ति के लिए फल का गुप्त दान कर सकते हैं।'),
('a7117900-5fd7-11ef-9834-acbc329ab9e7', '8739f904-76cc-4974-9842-9312379c42c2', 'en', 'Donate fruits in secret to have a child', 'Donating fruits secretly are also considered good. Without making it public, you can donate seasonal fruits to the poor and needy. Keep in mind that whole fruits should always be donated. Childless couples can make a secret donation of fruits to have a child'),
('a7119a2a-5fd7-11ef-9834-acbc329ab9e7', '8739f904-76cc-4974-9842-9312379c42c2', 'hi', 'संतान प्राप्ति के लिए फल का गुप्त दान करें', 'फलों का गुप्त दान करना भी अच्छा माना जाता है। जगजाहिर किए बिना आप मौसमी फलों का दान गरीब और जरूरतमंदों को कर सकते हैं। ध्यान रहे कि हमेशा साबुत फल का ही दान करना चाहिए। निसंतान दंपत्ति संतान प्राप्ति के लिए फल का गुप्त दान कर सकते हैं।'),
('a7c5a45c-5fd7-11ef-9834-acbc329ab9e7', 'cb75afcd-c256-45ff-90e9-dd35ee2788af', 'en', 'Donate fruits in secret to have a child', 'Donating fruits secretly are also considered good. Without making it public, you can donate seasonal fruits to the poor and needy. Keep in mind that whole fruits should always be donated. Childless couples can make a secret donation of fruits to have a child'),
('a7c5b820-5fd7-11ef-9834-acbc329ab9e7', 'cb75afcd-c256-45ff-90e9-dd35ee2788af', 'hi', 'संतान प्राप्ति के लिए फल का गुप्त दान करें', 'फलों का गुप्त दान करना भी अच्छा माना जाता है। जगजाहिर किए बिना आप मौसमी फलों का दान गरीब और जरूरतमंदों को कर सकते हैं। ध्यान रहे कि हमेशा साबुत फल का ही दान करना चाहिए। निसंतान दंपत्ति संतान प्राप्ति के लिए फल का गुप्त दान कर सकते हैं।');

-- --------------------------------------------------------

--
-- Table structure for table `mandir`
--

CREATE TABLE `mandir` (
  `id` char(36) NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mandir`
--

INSERT INTO `mandir` (`id`, `images`, `created_at`, `status`) VALUES
('06ca67e6-ec66-404d-8b04-b85ffe5bb376', '[\"mandir/1729251315292.jpg\",\"mandir/1729251315294.jpg\"]', '2024-10-18 11:35:15', 1),
('1b354b07-2385-473b-837c-4cbd67927e64', '[\"mandir/1729165017657.webp\",\"mandir/1729165017657.webp\"]', '2024-10-17 11:36:57', 1),
('2ee6b602-cd16-4d38-8270-7527647d95ca', '[\"mandir/1729253447676.jpg\",\"mandir/1729253447677.jpg\"]', '2024-10-18 12:10:47', 1),
('4da51663-03d0-4066-a075-f0fd5f51d311', '[\"mandir/1729166098742.jpg\",\"mandir/1729166098742.jpg\"]', '2024-10-17 11:54:58', 1),
('62ec47f2-3316-4115-bad0-a5fb8285ac7d', '[\"mandir/1729250670870.jpg\",\"mandir/1729250670872.jpg\"]', '2024-10-18 11:24:30', 1),
('724fdf58-70c4-4e5d-8d3f-4083123c03e0', '[\"mandir/1729252766697.jpg\",\"mandir/1729252766705.jpg\"]', '2024-10-18 11:59:26', 1),
('a94fd480-d005-4c0a-b9b2-6ae1aeb5abec', '[\"mandir/1729250142280.jpg\",\"mandir/1729250142285.jpg\"]', '2024-10-18 11:15:42', 1),
('c269adf0-e54b-4f76-8262-6c5b337932fb', '[\"mandir/1729252194959.jpg\",\"mandir/1729252194962.jpg\"]', '2024-10-18 11:49:54', 1),
('d2ae1f3f-1084-47b2-865c-51ae4d9918ef', '[\"mandir/1729253014822.jpg\",\"mandir/1729253014822.jpg\"]', '2024-10-18 12:03:34', 1),
('d9e9fd49-c07a-499e-857f-3ade72e7fc48', '[\"mandir/1729166596804.jpg\",\"mandir/1729166596804.jpg\"]', '2024-10-17 12:03:16', 1),
('f1e7d30e-5581-4ab3-8fb1-e208d19e7b06', '[\"mandir/1729173688187.jpg\",\"mandir/1729173688196.jpg\"]', '2024-10-17 14:01:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mandir_benefits`
--

CREATE TABLE `mandir_benefits` (
  `id` char(36) NOT NULL,
  `mandir_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mandir_benefits`
--

INSERT INTO `mandir_benefits` (`id`, `mandir_id`) VALUES
('0f6776c2-13a5-4476-be57-3d183e920a13', '06ca67e6-ec66-404d-8b04-b85ffe5bb376'),
('45b0815a-e897-466b-a218-ae865d9e8d64', '06ca67e6-ec66-404d-8b04-b85ffe5bb376'),
('635bb530-b18e-4c11-adb4-54a629647b3e', '06ca67e6-ec66-404d-8b04-b85ffe5bb376'),
('7bbff22b-6863-4cb7-b764-7eea74444f75', '06ca67e6-ec66-404d-8b04-b85ffe5bb376'),
('985c75fc-0703-419a-b152-d557fc27cb00', '06ca67e6-ec66-404d-8b04-b85ffe5bb376'),
('039c5287-e136-499e-a889-fc1a75807fbb', '1b354b07-2385-473b-837c-4cbd67927e64'),
('3bff009e-00b1-4506-a787-a6141e86e23d', '1b354b07-2385-473b-837c-4cbd67927e64'),
('515bd373-8b9b-4ad8-b4cf-be0842b227bb', '1b354b07-2385-473b-837c-4cbd67927e64'),
('863c34be-7f36-4010-bd08-a8bdf098bd06', '1b354b07-2385-473b-837c-4cbd67927e64'),
('99c9a9b1-8c20-46e0-8b26-f9b71c7d40c3', '1b354b07-2385-473b-837c-4cbd67927e64'),
('7092cfeb-89b9-4af0-b400-46b129e9b1e2', '2ee6b602-cd16-4d38-8270-7527647d95ca'),
('9d0b3d58-9097-4f07-881e-73e094c794ad', '2ee6b602-cd16-4d38-8270-7527647d95ca'),
('9e66d13b-6b45-43c4-be60-1fdd1acb95c3', '2ee6b602-cd16-4d38-8270-7527647d95ca'),
('f7e3af92-4404-4920-a838-80c5a9db53d7', '2ee6b602-cd16-4d38-8270-7527647d95ca'),
('1628a012-40a5-4f99-9fc4-2c22c24850ac', '4da51663-03d0-4066-a075-f0fd5f51d311'),
('2575ba4a-049d-45f5-b7f0-16ddcf1e7e38', '4da51663-03d0-4066-a075-f0fd5f51d311'),
('bb4a627c-abcc-4f01-a474-ca02599ec758', '4da51663-03d0-4066-a075-f0fd5f51d311'),
('cc8f419c-38d7-42b3-a921-c27674332aa2', '4da51663-03d0-4066-a075-f0fd5f51d311'),
('eb5d3205-5203-48d7-be17-df42db108988', '4da51663-03d0-4066-a075-f0fd5f51d311'),
('5cd2582d-710f-4ba7-b6bf-5cb5e0bfef2b', '62ec47f2-3316-4115-bad0-a5fb8285ac7d'),
('71c03fc4-2ed4-4f3f-b8e3-aa0f9cad01a5', '62ec47f2-3316-4115-bad0-a5fb8285ac7d'),
('ab51bcd6-d070-4643-81d0-38585d28245a', '62ec47f2-3316-4115-bad0-a5fb8285ac7d'),
('c03ba347-8d59-4ba0-9eec-a673d19797f2', '62ec47f2-3316-4115-bad0-a5fb8285ac7d'),
('440b2d2a-8d85-4b04-b5f9-9ce7b01c2e0a', '724fdf58-70c4-4e5d-8d3f-4083123c03e0'),
('4da1dd26-163a-44f5-a85d-bb9b11e91436', '724fdf58-70c4-4e5d-8d3f-4083123c03e0'),
('9e001841-010b-4e28-9e8d-5434eb736156', '724fdf58-70c4-4e5d-8d3f-4083123c03e0'),
('c38b82ad-8326-4ace-8ee9-d6deab0f9143', '724fdf58-70c4-4e5d-8d3f-4083123c03e0'),
('108f233c-d791-4ec3-a931-4d6b1452011b', 'a94fd480-d005-4c0a-b9b2-6ae1aeb5abec'),
('4a392781-0f95-419c-b106-b9fe1e7ca8aa', 'a94fd480-d005-4c0a-b9b2-6ae1aeb5abec'),
('5d44db69-1146-4424-81a7-052ec88b7cc6', 'a94fd480-d005-4c0a-b9b2-6ae1aeb5abec'),
('b004a882-ae38-46eb-8ba9-31b8dd5766f1', 'a94fd480-d005-4c0a-b9b2-6ae1aeb5abec'),
('ebc52bc8-0146-4ad3-93fa-96cdcfbd0693', 'a94fd480-d005-4c0a-b9b2-6ae1aeb5abec'),
('2f2bcfa5-9166-43cc-aeab-2687c596165f', 'c269adf0-e54b-4f76-8262-6c5b337932fb'),
('67501ade-fca7-41e0-a9c6-04e40e97487e', 'c269adf0-e54b-4f76-8262-6c5b337932fb'),
('6e35f49d-125c-4ffa-89b7-caf8d1e15881', 'c269adf0-e54b-4f76-8262-6c5b337932fb'),
('912d7c7f-5443-4c16-8e25-b9d6072572b1', 'c269adf0-e54b-4f76-8262-6c5b337932fb'),
('28cb06d3-c346-4927-9935-145771c85c68', 'd2ae1f3f-1084-47b2-865c-51ae4d9918ef'),
('4c1d4577-9549-4bc5-9c30-3f450b70b1ae', 'd2ae1f3f-1084-47b2-865c-51ae4d9918ef'),
('57f310b0-11c8-444b-9463-1a9a818a49b8', 'd2ae1f3f-1084-47b2-865c-51ae4d9918ef'),
('cffec475-d89c-405c-90f4-56d1fd9b43cc', 'd2ae1f3f-1084-47b2-865c-51ae4d9918ef'),
('069b1d30-42df-454d-9324-99fcdc025172', 'd9e9fd49-c07a-499e-857f-3ade72e7fc48'),
('6e784430-085d-499c-b7ca-7dd0fa869220', 'd9e9fd49-c07a-499e-857f-3ade72e7fc48'),
('88ee23a4-8b02-4351-a400-5c73a80dd4f2', 'd9e9fd49-c07a-499e-857f-3ade72e7fc48'),
('c8c47979-4429-4aca-b69f-fe3a55e27499', 'd9e9fd49-c07a-499e-857f-3ade72e7fc48'),
('e588b07d-297f-417e-ac54-0a9d0e03462b', 'd9e9fd49-c07a-499e-857f-3ade72e7fc48'),
('33bd8422-aad4-4d2f-ae44-b54aa75f2137', 'f1e7d30e-5581-4ab3-8fb1-e208d19e7b06'),
('352480c7-0695-4a01-a12c-735ac359631b', 'f1e7d30e-5581-4ab3-8fb1-e208d19e7b06'),
('700ba90d-790c-431d-80b9-0c0a2fa17360', 'f1e7d30e-5581-4ab3-8fb1-e208d19e7b06'),
('8bd9d950-cd64-40d3-abc3-b18f2f636425', 'f1e7d30e-5581-4ab3-8fb1-e208d19e7b06'),
('8da0fb20-ebc1-4dea-8f77-ba18e36dfe82', 'f1e7d30e-5581-4ab3-8fb1-e208d19e7b06');

-- --------------------------------------------------------

--
-- Table structure for table `mandir_benefits_translations`
--

CREATE TABLE `mandir_benefits_translations` (
  `id` char(36) NOT NULL,
  `benefit_id` char(36) DEFAULT NULL,
  `language_code` varchar(10) DEFAULT NULL,
  `benefit_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mandir_benefits_translations`
--

INSERT INTO `mandir_benefits_translations` (`id`, `benefit_id`, `language_code`, `benefit_description`) VALUES
('0044187c-8d49-11ef-a37a-acbc329ab9e7', '57f310b0-11c8-444b-9463-1a9a818a49b8', 'en', 'Achievement of goals'),
('00442830-8d49-11ef-a37a-acbc329ab9e7', '57f310b0-11c8-444b-9463-1a9a818a49b8', 'hi', 'लक्ष्यों की प्राप्ति'),
('00443708-8d49-11ef-a37a-acbc329ab9e7', 'cffec475-d89c-405c-90f4-56d1fd9b43cc', 'en', 'To conquer the enemy'),
('00444630-8d49-11ef-a37a-acbc329ab9e7', 'cffec475-d89c-405c-90f4-56d1fd9b43cc', 'hi', 'शत्रु पर विजय प्राप्ति के लिए'),
('00445b3e-8d49-11ef-a37a-acbc329ab9e7', '4c1d4577-9549-4bc5-9c30-3f450b70b1ae', 'en', 'Victory in court'),
('0044abb6-8d49-11ef-a37a-acbc329ab9e7', '4c1d4577-9549-4bc5-9c30-3f450b70b1ae', 'hi', 'कोर्ट-कचहरी में विजय'),
('0044bd2c-8d49-11ef-a37a-acbc329ab9e7', '28cb06d3-c346-4927-9935-145771c85c68', 'en', 'Protection from negative forces'),
('0044d168-8d49-11ef-a37a-acbc329ab9e7', '28cb06d3-c346-4927-9935-145771c85c68', 'hi', 'नकारात्मक शक्तियों से सुरक्षा'),
('02446464-8d4a-11ef-a37a-acbc329ab9e7', '7092cfeb-89b9-4af0-b400-46b129e9b1e2', 'en', 'Blessing of economic prosperity'),
('0244759e-8d4a-11ef-a37a-acbc329ab9e7', '7092cfeb-89b9-4af0-b400-46b129e9b1e2', 'hi', 'आर्थिक समृद्धि का आशीष'),
('02448598-8d4a-11ef-a37a-acbc329ab9e7', '9e66d13b-6b45-43c4-be60-1fdd1acb95c3', 'en', 'Attainment of material happiness'),
('02449736-8d4a-11ef-a37a-acbc329ab9e7', '9e66d13b-6b45-43c4-be60-1fdd1acb95c3', 'hi', 'भौतिक सुख की प्राप्ति'),
('0244a686-8d4a-11ef-a37a-acbc329ab9e7', '9d0b3d58-9097-4f07-881e-73e094c794ad', 'en', 'Success at work'),
('0244bc48-8d4a-11ef-a37a-acbc329ab9e7', '9d0b3d58-9097-4f07-881e-73e094c794ad', 'hi', 'कार्य में सफलता'),
('0244cdc8-8d4a-11ef-a37a-acbc329ab9e7', 'f7e3af92-4404-4920-a838-80c5a9db53d7', 'en', 'Happy family life'),
('0244e286-8d4a-11ef-a37a-acbc329ab9e7', 'f7e3af92-4404-4920-a838-80c5a9db53d7', 'hi', 'सुखी पारिवारिक जीवन'),
('0b4717e6-8d45-11ef-a37a-acbc329ab9e7', '985c75fc-0703-419a-b152-d557fc27cb00', 'en', 'All sins are destroyed'),
('0b48265e-8d45-11ef-a37a-acbc329ab9e7', '985c75fc-0703-419a-b152-d557fc27cb00', 'hi', 'समस्त पापों का नाश हो जाता है'),
('0b485e62-8d45-11ef-a37a-acbc329ab9e7', '635bb530-b18e-4c11-adb4-54a629647b3e', 'en', 'Attain salvation and well-being'),
('0b487672-8d45-11ef-a37a-acbc329ab9e7', '635bb530-b18e-4c11-adb4-54a629647b3e', 'hi', 'मोक्ष और कल्याण की प्राप्ति हो जाती है'),
('0b48f1ce-8d45-11ef-a37a-acbc329ab9e7', '45b0815a-e897-466b-a218-ae865d9e8d64', 'en', 'Purification of conscience'),
('0b49072c-8d45-11ef-a37a-acbc329ab9e7', '45b0815a-e897-466b-a218-ae865d9e8d64', 'hi', 'अन्तः करण की शुद्धि'),
('0b4924b4-8d45-11ef-a37a-acbc329ab9e7', '7bbff22b-6863-4cb7-b764-7eea74444f75', 'en', 'All wishes come true'),
('0b4950ce-8d45-11ef-a37a-acbc329ab9e7', '7bbff22b-6863-4cb7-b764-7eea74444f75', 'hi', 'सरी मनोकामना पूरी होती है'),
('0b498422-8d45-11ef-a37a-acbc329ab9e7', '0f6776c2-13a5-4476-be57-3d183e920a13', 'en', 'It brings good health and freedom from various serious and chronic diseases'),
('0b499b42-8d45-11ef-a37a-acbc329ab9e7', '0f6776c2-13a5-4476-be57-3d183e920a13', 'hi', 'यह अच्छा स्वास्थ्य और विभिन्न गंभीर और पुरानी बीमारियों से मुक्ति दिलाता है'),
('179b54a6-8d47-11ef-a37a-acbc329ab9e7', '6e35f49d-125c-4ffa-89b7-caf8d1e15881', 'en', 'Achievement of goals'),
('179b89b2-8d47-11ef-a37a-acbc329ab9e7', '6e35f49d-125c-4ffa-89b7-caf8d1e15881', 'hi', 'लक्ष्यों की प्राप्ति'),
('179d1cfa-8d47-11ef-a37a-acbc329ab9e7', '67501ade-fca7-41e0-a9c6-04e40e97487e', 'en', 'To conquer the enemy'),
('179d4310-8d47-11ef-a37a-acbc329ab9e7', '67501ade-fca7-41e0-a9c6-04e40e97487e', 'hi', 'शत्रु पर विजय प्राप्ति के लिए'),
('179d7e52-8d47-11ef-a37a-acbc329ab9e7', '912d7c7f-5443-4c16-8e25-b9d6072572b1', 'en', 'Victory in court'),
('179dc2ea-8d47-11ef-a37a-acbc329ab9e7', '912d7c7f-5443-4c16-8e25-b9d6072572b1', 'hi', 'कोर्ट-कचहरी में विजय'),
('179e40b2-8d47-11ef-a37a-acbc329ab9e7', '2f2bcfa5-9166-43cc-aeab-2687c596165f', 'en', 'Protection from negative forces'),
('179e6678-8d47-11ef-a37a-acbc329ab9e7', '2f2bcfa5-9166-43cc-aeab-2687c596165f', 'hi', 'नकारात्मक शक्तियों से सुरक्षा'),
('1de309f6-8c7c-11ef-a37a-acbc329ab9e7', '039c5287-e136-499e-a889-fc1a75807fbb', 'en', 'Ganapati is the giver of happiness and prosperity. Lord Ganesha is considered the mine of virtues.'),
('1de32a94-8c7c-11ef-a37a-acbc329ab9e7', '039c5287-e136-499e-a889-fc1a75807fbb', 'hi', 'सुख-समृद्धि के दाता हैं गणपति भगवान गणेश को गुणों की खान माना गया है'),
('1de33f48-8c7c-11ef-a37a-acbc329ab9e7', '3bff009e-00b1-4506-a787-a6141e86e23d', 'en', 'All work is completed without any hindrance'),
('1de352c6-8c7c-11ef-a37a-acbc329ab9e7', '3bff009e-00b1-4506-a787-a6141e86e23d', 'hi', 'बगैर बाधा पूरे होते हैं सारे काम'),
('1de3648c-8c7c-11ef-a37a-acbc329ab9e7', '99c9a9b1-8c20-46e0-8b26-f9b71c7d40c3', 'en', 'Siddhivinayak gives desired results'),
('1de3776a-8c7c-11ef-a37a-acbc329ab9e7', '99c9a9b1-8c20-46e0-8b26-f9b71c7d40c3', 'hi', 'मनचाहा फल देते हैं सिद्धिविनायक'),
('1de389ee-8c7c-11ef-a37a-acbc329ab9e7', '863c34be-7f36-4010-bd08-a8bdf098bd06', 'en', 'Ganpati destroys ego'),
('1de39b5a-8c7c-11ef-a37a-acbc329ab9e7', '863c34be-7f36-4010-bd08-a8bdf098bd06', 'hi', 'गणपति अहंकार का नाश करते हैं'),
('1de3b202-8c7c-11ef-a37a-acbc329ab9e7', '515bd373-8b9b-4ad8-b4cf-be0842b227bb', 'en', 'Ganesh puja will remove all troubles'),
('1de3d8e0-8c7c-11ef-a37a-acbc329ab9e7', '515bd373-8b9b-4ad8-b4cf-be0842b227bb', 'hi', 'गणेश पूजा से दूर होंगे सारे कष्ट'),
('4deb519e-8c90-11ef-a37a-acbc329ab9e7', '352480c7-0695-4a01-a12c-735ac359631b', 'en', 'By donating, the calamity is averted'),
('4deb76c4-8c90-11ef-a37a-acbc329ab9e7', '352480c7-0695-4a01-a12c-735ac359631b', 'hi', 'दान करने से आई हुई विपत्ति टल जाती है'),
('4deb9550-8c90-11ef-a37a-acbc329ab9e7', '8da0fb20-ebc1-4dea-8f77-ba18e36dfe82', 'en', 'Security against crisis'),
('4debadc4-8c90-11ef-a37a-acbc329ab9e7', '8da0fb20-ebc1-4dea-8f77-ba18e36dfe82', 'hi', 'संकट के प्रति सुरक्षा'),
('4debc840-8c90-11ef-a37a-acbc329ab9e7', '33bd8422-aad4-4d2f-ae44-b54aa75f2137', 'en', 'Increase in happiness, peace and prosperity in your life.'),
('4debe474-8c90-11ef-a37a-acbc329ab9e7', '33bd8422-aad4-4d2f-ae44-b54aa75f2137', 'hi', 'आपके जीवन में सुख, शांति, समृद्धि में बृद्धि.'),
('4debf9f0-8c90-11ef-a37a-acbc329ab9e7', '8bd9d950-cd64-40d3-abc3-b18f2f636425', 'en', 'Success rains'),
('4dec0ecc-8c90-11ef-a37a-acbc329ab9e7', '8bd9d950-cd64-40d3-abc3-b18f2f636425', 'hi', 'सफलता की बारिश होती है'),
('4dec29d4-8c90-11ef-a37a-acbc329ab9e7', '700ba90d-790c-431d-80b9-0c0a2fa17360', 'en', 'The wish is fulfilled.'),
('4dec4522-8c90-11ef-a37a-acbc329ab9e7', '700ba90d-790c-431d-80b9-0c0a2fa17360', 'hi', 'मनोकामना पूरी होती है।'),
('501f08ae-8d42-11ef-a37a-acbc329ab9e7', '5d44db69-1146-4424-81a7-052ec88b7cc6', 'en', 'By donating, the calamity is averted'),
('501f1ccc-8d42-11ef-a37a-acbc329ab9e7', '5d44db69-1146-4424-81a7-052ec88b7cc6', 'hi', 'दान करने से आई हुई विपत्ति टल जाती है'),
('501f2d84-8d42-11ef-a37a-acbc329ab9e7', '4a392781-0f95-419c-b106-b9fe1e7ca8aa', 'en', 'Security against crisis'),
('501f3dba-8d42-11ef-a37a-acbc329ab9e7', '4a392781-0f95-419c-b106-b9fe1e7ca8aa', 'hi', 'संकट के प्रति सुरक्षा'),
('501f4d46-8d42-11ef-a37a-acbc329ab9e7', 'ebc52bc8-0146-4ad3-93fa-96cdcfbd0693', 'en', 'Increase in happiness, peace and prosperity in your life.'),
('501f5c28-8d42-11ef-a37a-acbc329ab9e7', 'ebc52bc8-0146-4ad3-93fa-96cdcfbd0693', 'hi', 'आपके जीवन में सुख, शांति, समृद्धि में बृद्धि.'),
('501f6c40-8d42-11ef-a37a-acbc329ab9e7', '108f233c-d791-4ec3-a931-4d6b1452011b', 'en', 'Success rains'),
('501fd932-8d42-11ef-a37a-acbc329ab9e7', '108f233c-d791-4ec3-a931-4d6b1452011b', 'hi', 'सफलता की बारिश होती है'),
('501fead0-8d42-11ef-a37a-acbc329ab9e7', 'b004a882-ae38-46eb-8ba9-31b8dd5766f1', 'en', 'The wish is fulfilled.'),
('501ffa52-8d42-11ef-a37a-acbc329ab9e7', 'b004a882-ae38-46eb-8ba9-31b8dd5766f1', 'hi', 'मनोकामना पूरी होती है।'),
('6c629840-8d48-11ef-a37a-acbc329ab9e7', 'c38b82ad-8326-4ace-8ee9-d6deab0f9143', 'en', 'Achievement of goals'),
('6c62c8ce-8d48-11ef-a37a-acbc329ab9e7', 'c38b82ad-8326-4ace-8ee9-d6deab0f9143', 'hi', 'लक्ष्यों की प्राप्ति'),
('6c6330de-8d48-11ef-a37a-acbc329ab9e7', '9e001841-010b-4e28-9e8d-5434eb736156', 'en', 'To conquer the enemy'),
('6c6387aa-8d48-11ef-a37a-acbc329ab9e7', '9e001841-010b-4e28-9e8d-5434eb736156', 'hi', 'शत्रु पर विजय प्राप्ति के लिए'),
('6c639b3c-8d48-11ef-a37a-acbc329ab9e7', '440b2d2a-8d85-4b04-b5f9-9ce7b01c2e0a', 'en', 'Victory in court'),
('6c63b090-8d48-11ef-a37a-acbc329ab9e7', '440b2d2a-8d85-4b04-b5f9-9ce7b01c2e0a', 'hi', 'कोर्ट-कचहरी में विजय'),
('6c63f370-8d48-11ef-a37a-acbc329ab9e7', '4da1dd26-163a-44f5-a85d-bb9b11e91436', 'en', 'Protection from negative forces'),
('6c64069e-8d48-11ef-a37a-acbc329ab9e7', '4da1dd26-163a-44f5-a85d-bb9b11e91436', 'hi', 'नकारात्मक शक्तियों से सुरक्षा'),
('8b2e852c-8d43-11ef-a37a-acbc329ab9e7', '5cd2582d-710f-4ba7-b6bf-5cb5e0bfef2b', 'en', 'Happiness and prosperity come to the house.'),
('8b2e9d64-8d43-11ef-a37a-acbc329ab9e7', '5cd2582d-710f-4ba7-b6bf-5cb5e0bfef2b', 'hi', 'घर में सुख-समृद्धि का आगमन होता है।'),
('8b2eb0e2-8d43-11ef-a37a-acbc329ab9e7', 'c03ba347-8d59-4ba0-9eec-a673d19797f2', 'en', 'The grain stores are always full'),
('8b2ec988-8d43-11ef-a37a-acbc329ab9e7', 'c03ba347-8d59-4ba0-9eec-a673d19797f2', 'hi', 'हमेशा अन्न के भंडार भरे रहते हैं।'),
('8b2f40fc-8d43-11ef-a37a-acbc329ab9e7', '71c03fc4-2ed4-4f3f-b8e3-aa0f9cad01a5', 'en', 'By donating to the devotees of Mother Annapurna, one gets relief from diseases.'),
('8b2f5592-8d43-11ef-a37a-acbc329ab9e7', '71c03fc4-2ed4-4f3f-b8e3-aa0f9cad01a5', 'hi', 'मां अन्नपूर्णा के भक्तो को दान  करने से  बीमारियों से छुटकारा मिलता है'),
('8b2f7dd8-8d43-11ef-a37a-acbc329ab9e7', 'ab51bcd6-d070-4643-81d0-38585d28245a', 'en', 'One gets peace in life.'),
('8b2f92f0-8d43-11ef-a37a-acbc329ab9e7', 'ab51bcd6-d070-4643-81d0-38585d28245a', 'hi', 'जीवन में शांति मिलती है।'),
('a2415b42-8c7e-11ef-a37a-acbc329ab9e7', 'cc8f419c-38d7-42b3-a921-c27674332aa2', 'en', 'Increase in wealth and property'),
('a241706e-8c7e-11ef-a37a-acbc329ab9e7', 'cc8f419c-38d7-42b3-a921-c27674332aa2', 'hi', 'धन और संपत्ति में  बृद्धि'),
('a24181c6-8c7e-11ef-a37a-acbc329ab9e7', 'eb5d3205-5203-48d7-be17-df42db108988', 'en', 'There is never poverty in life'),
('a24195da-8c7e-11ef-a37a-acbc329ab9e7', 'eb5d3205-5203-48d7-be17-df42db108988', 'hi', 'जीवन में कभी दरिद्रता नहीं आती है'),
('a241a85e-8c7e-11ef-a37a-acbc329ab9e7', 'bb4a627c-abcc-4f01-a474-ca02599ec758', 'en', 'All wishes are fulfilled.'),
('a241b86c-8c7e-11ef-a37a-acbc329ab9e7', 'bb4a627c-abcc-4f01-a474-ca02599ec758', 'hi', 'सभी इच्छाएं पूरी हो जाती  हैं.'),
('a241c8ca-8c7e-11ef-a37a-acbc329ab9e7', '1628a012-40a5-4f99-9fc4-2c22c24850ac', 'en', 'Every kind of happiness remains in the house'),
('a241dc0c-8c7e-11ef-a37a-acbc329ab9e7', '1628a012-40a5-4f99-9fc4-2c22c24850ac', 'hi', 'घर में हर प्रकार का सुख बना रहता है'),
('a241ed28-8c7e-11ef-a37a-acbc329ab9e7', '2575ba4a-049d-45f5-b7f0-16ddcf1e7e38', 'en', 'Poverty goes away'),
('a241fd7c-8c7e-11ef-a37a-acbc329ab9e7', '2575ba4a-049d-45f5-b7f0-16ddcf1e7e38', 'hi', 'गरीबी दूर हो जाती है'),
('cb1e03ac-8c7f-11ef-a37a-acbc329ab9e7', 'c8c47979-4429-4aca-b69f-fe3a55e27499', 'en', 'By donating, the calamity is averted.'),
('cb1e1932-8c7f-11ef-a37a-acbc329ab9e7', 'c8c47979-4429-4aca-b69f-fe3a55e27499', 'hi', 'दान करने से आई हुई विपत्ति टल जाती है'),
('cb1e295e-8c7f-11ef-a37a-acbc329ab9e7', '6e784430-085d-499c-b7ca-7dd0fa869220', 'en', 'Security against crisis'),
('cb1e3c1e-8c7f-11ef-a37a-acbc329ab9e7', '6e784430-085d-499c-b7ca-7dd0fa869220', 'hi', 'संकट के प्रति सुरक्षा'),
('cb1e4d3a-8c7f-11ef-a37a-acbc329ab9e7', '88ee23a4-8b02-4351-a400-5c73a80dd4f2', 'en', 'Increase in happiness, peace and prosperity in your life.'),
('cb1eab86-8c7f-11ef-a37a-acbc329ab9e7', '88ee23a4-8b02-4351-a400-5c73a80dd4f2', 'hi', 'आपके जीवन में सुख, शांति, समृद्धि में बृद्धि.'),
('cb1ec0da-8c7f-11ef-a37a-acbc329ab9e7', '069b1d30-42df-454d-9324-99fcdc025172', 'en', 'Success rains'),
('cb1ed552-8c7f-11ef-a37a-acbc329ab9e7', '069b1d30-42df-454d-9324-99fcdc025172', 'hi', 'सफलता की बारिश होती है'),
('cb1ee7ae-8c7f-11ef-a37a-acbc329ab9e7', 'e588b07d-297f-417e-ac54-0a9d0e03462b', 'en', 'The wish is fulfilled.'),
('cb1efb72-8c7f-11ef-a37a-acbc329ab9e7', 'e588b07d-297f-417e-ac54-0a9d0e03462b', 'hi', 'मनोकामना पूरी होती है।');

-- --------------------------------------------------------

--
-- Table structure for table `mandir_products`
--

CREATE TABLE `mandir_products` (
  `id` char(36) NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `price` decimal(10,2) NOT NULL,
  `price_description` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mandir_products`
--

INSERT INTO `mandir_products` (`id`, `images`, `price`, `price_description`, `created_at`, `status`) VALUES
('3207aec6-5be0-4f00-89c4-b0f2414a1161', '[\"mandirproduct/1729352572950.jpg\"]', 150.00, '', '2024-10-19 15:42:52', 1),
('4b3dfd96-b149-419f-a1e0-1d46d74294d6', '[\"mandirproduct/1729351832139.jpeg\"]', 250.00, 'for 4 people', '2024-10-19 15:30:32', 1),
('55c6313a-9c9e-4a70-80e5-f9939382cd17', '[\"mandirproduct/1729353998069.jpg\"]', 45.00, 'per person', '2024-10-19 16:06:38', 1),
('5c652b69-ef32-447f-bfa9-3718dc028722', '[\"mandirproduct/1729353044270.jpg\"]', 10.00, 'per person', '2024-10-19 15:50:44', 1),
('60976769-23e9-431d-aa10-dda42229c2b0', '[\"mandirproduct/1729342835850.jpg\"]', 10.00, 'per person', '2024-10-19 13:00:35', 1),
('79dc2fc4-8145-4faf-a6f8-5c0e10d86f07', '[\"mandirproduct/1729354265607.jpg\"]', 35.00, 'per person', '2024-10-19 16:11:05', 1),
('7acdc208-4366-4867-b86c-670e6a4016ec', '[\"mandirproduct/1729342525190.webp\"]', 10.00, 'per person', '2024-10-19 12:55:25', 1),
('82c5d433-3d34-4b00-a5d4-7b65c0ab7e14', '[\"mandirproduct/1729354711774.jpeg\"]', 15.00, 'per person', '2024-10-19 16:18:31', 1),
('9aa1583e-c557-4615-bfdb-d0b7b1d1b0f3', '[\"mandirproduct/1729354479814.jpg\"]', 200.00, 'for 4 person', '2024-10-19 16:14:39', 1),
('dba72c31-6dcd-4e3f-b266-c1516550c9a2', '[\"mandirproduct/1729342651564.webp\"]', 20.00, 'per person', '2024-10-19 12:57:31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mandir_products_translations`
--

CREATE TABLE `mandir_products_translations` (
  `id` char(36) NOT NULL,
  `product_id` char(36) DEFAULT NULL,
  `language_code` varchar(5) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mandir_products_translations`
--

INSERT INTO `mandir_products_translations` (`id`, `product_id`, `language_code`, `title`, `description`) VALUES
('13fa016a-8e2f-11ef-a37a-acbc329ab9e7', '4b3dfd96-b149-419f-a1e0-1d46d74294d6', 'en', 'Donate modak for sweetness in relationships', '<p>Modak is very dear to Lord Ganesha. Donating Modaks brings sweetness in family relationships.<p>'),
('13fc4394-8e2f-11ef-a37a-acbc329ab9e7', '4b3dfd96-b149-419f-a1e0-1d46d74294d6', 'hi', 'रिश्तों में मधुरता  के लिए मोदक दान करे', '<p>गणेश जी को मोदक अति प्रिय हैं। मोदकों के दान से पारिवारिक रिश्तों में मधुरता आती है।<p>'),
('1ef7ee88-8e34-11ef-a37a-acbc329ab9e7', '55c6313a-9c9e-4a70-80e5-f9939382cd17', 'en', 'Organize Bhandara for the good health of the family ', '<p>By organizing Bhandara, your family receives blessings from people, the health, happiness and prosperity of the family increases. An ancient story related to Bhandara is also popular. According to the Srishti section of Padma Purana, once when King Swet of Vidarbha reached the afterlife after death, he felt hungry and when he asked for food, he was not given food. Then he asked Lord Brahma the reason behind this. Then Brahma ji said that you never fed food to any needy person in your life, so from where will you get food. For this reason Bhandara started being organised. Everyone takes food from the stores and contributes as per their devotion. That is why donating food is considered the best.<p>'),
('1ef7fec8-8e34-11ef-a37a-acbc329ab9e7', '55c6313a-9c9e-4a70-80e5-f9939382cd17', 'hi', 'परिवार के अच्छे स्वास्थ्य के लिए भंडारा करवाएं', '<p>भंडारा करवाने से आप के परिवार को लोगो का  आशीर्वाद प्राप्त होता है परिवार के स्वस्थ सुख संमृद्धि में बढोतरी होती है  भंडारे से जुड़ी एक प्राचीन कथा भी प्रचलित है. पदम पुराण के सृष्टि खंड के अनुसार, एक बार विदर्भ के राजा स्वेत मरने के उपरांत जब परलोक पहुंचे, तो उन्हें भूख लगी और उन्होंने भोजन मांगा तो उन्हें भोजन नहीं दिया गया. तब उन्होंने ब्रह्मा जी से इसके पीछे की वजह पूछी. तब ब्रह्मा जी ने कहा कि तुमने अपने जीवन में कभी भी किसी जरूरतमंद को भोजन नहीं खिलाया, इसलिए तुम्हें अन्न कहां से प्राप्त होगा. इस कारण से भंडारे का आयोजन किया जाने लगा. भंडारों में सभी लोग खाना लेते हैं और अपनी श्रद्धा अनुसार योगदान देते हैं. इसलिए अन्न दान को सबसे ज्यादा उत्तम माना गया है.<p>'),
('21c6df3a-8e1a-11ef-a37a-acbc329ab9e7', '60976769-23e9-431d-aa10-dda42229c2b0', 'en', 'Donate banana for peace of mind', '<p>Lord Ganesha likes banana very much as a fruit. Therefore, distribute bananas to the needy during this time.<p>'),
('21c6f02e-8e1a-11ef-a37a-acbc329ab9e7', '60976769-23e9-431d-aa10-dda42229c2b0', 'hi', 'मन की सन्ति के लिए  केले का दान करे', '<p>गणेश जी को फल में केला बहुत पसंद है। इसलिए इस दौरान जरूरतमंदों को केला बाटें।।<p>'),
('3e1cb27a-8e35-11ef-a37a-acbc329ab9e7', '9aa1583e-c557-4615-bfdb-d0b7b1d1b0f3', 'en', 'Distribute Penda for sweetness in relationships', '<p>Lord Shri Krishna also likes Penda very much. If you want to bring sweetness in relationships then distribute Penda, God will definitely fulfill all your wishes.<p>'),
('3e1cd5a2-8e35-11ef-a37a-acbc329ab9e7', '9aa1583e-c557-4615-bfdb-d0b7b1d1b0f3', 'hi', 'रिश्तों में मिठास के लिए पेंडा वितरित करें', '<p>भगवन श्री कृष्णा की पेंडे भी अत्यधिक पसंद हैं यदि आप रिश्तों में मिठास लाना चाहते हैं तो पेंडा वितरित करें आप की हर मनोकामना भगवन अवश्य पूरी करेंगे<p>'),
('689b3f6a-8e19-11ef-a37a-acbc329ab9e7', '7acdc208-4366-4867-b86c-670e6a4016ec', 'en', 'Provide water to attain salvation', '<p>Our sages have given the rule that by donating water one gets a lot of virtue and attains salvation. Construction of ponds and wells is considered very auspicious for travelers. Making arrangements to provide water to travelers and constructing wells in residential areas is considered very fruitful. Just as there is no era like Satyayuga, there is no scripture like the Vedas, there is no pilgrimage like the Ganga, similarly there is no charity like donating water.<p>'),
('689b9582-8e19-11ef-a37a-acbc329ab9e7', '7acdc208-4366-4867-b86c-670e6a4016ec', 'hi', 'मोक्ष की प्राप्ति के लिए जल  प्रदान करें  ', '<p>हमारे ऋषियों ने यह व्यवस्था दी है कि जल दान करने से बहुत पुण्य मिलता है और मोक्ष की प्राप्ति होती है। यात्रियों के लिए  प्याऊ और कुओं का निर्माण अत्यन्त शुभ माना जाता है। यात्रियों को जल पिलाने की व्यवस्था करना तथा आवासीय क्षेत्र में कुओं का निर्माण करना अति फलदायक माना गया है। जिस भांति सत्य युग के समान कोई युग नहीं, वेदों के समान कोई शास्त्र नहीं, गंगा के समान कोई तीर्थ नहीं, उसी भांति जल दान  के समान कोई दान नहीं है।<p>'),
('b3ed6164-8e19-11ef-a37a-acbc329ab9e7', 'dba72c31-6dcd-4e3f-b266-c1516550c9a2', 'en', 'Donate fruits in secret to have a child', '<p>Donating fruits secretly are also considered good. Without making it public, you can donate seasonal fruits to the poor and needy. Keep in mind that whole fruits should always be donated. Childless couples can make a secret donation of fruits to have a child<p>'),
('b3ede2f6-8e19-11ef-a37a-acbc329ab9e7', 'dba72c31-6dcd-4e3f-b266-c1516550c9a2', 'hi', 'संतान प्राप्ति के लिए फल का गुप्त दान करें', '<p>फलों का गुप्त दान करना भी अच्छा माना जाता है। जगजाहिर किए बिना आप मौसमी फलों का दान गरीब और जरूरतमंदों को कर सकते हैं। ध्यान रहे कि हमेशा साबुत फल का ही दान करना चाहिए। निसंतान दंपत्ति संतान प्राप्ति के लिए फल का गुप्त दान कर सकते हैं।<p>'),
('be6eb334-8e34-11ef-a37a-acbc329ab9e7', '79dc2fc4-8145-4faf-a6f8-5c0e10d86f07', 'en', 'Distribute Panjiri Prasad for disease relief', '<p>By donating Panjiri Prasad, Lord Shri Krishna gets pleased very easily because it is very dear to him i.e. if a devotee donates it then he gets cured from the disease.<p>'),
('be6f0e38-8e34-11ef-a37a-acbc329ab9e7', '79dc2fc4-8145-4faf-a6f8-5c0e10d86f07', 'hi', 'रोग मुक्ति के लिए पंजीरी प्रसाद वितरित करें', '<p>पंजीरी प्रसाद दान करने से भगवान श्री कृष्ण बहुत आसानी से प्रसन्न हो जाते हैं क्योकि यह उनको अत्यधिक प्रिय है याकि कोई भक्त इसका दान करता है तो वह रोग मुक़्त हो जाता है<p>'),
('c85e60f0-8e35-11ef-a37a-acbc329ab9e7', '82c5d433-3d34-4b00-a5d4-7b65c0ab7e14', 'en', 'Distribute barfi for sweetness in relationships', '<p>While worshiping Lord Ram, you can also offer him khoya sweets like Kesar Bhaat, Kalakand, Barfi, Gulab Jamun etc. Lord Ram is pleased by doing this.<p>'),
('c85e9390-8e35-11ef-a37a-acbc329ab9e7', '82c5d433-3d34-4b00-a5d4-7b65c0ab7e14', 'hi', 'रिश्तों में मिठास के लिए बर्फी वितरित करें', '<p>भगवान राम की पूजा करते समय आप उन्हें खोए की मिठाइयां जैसे केसर भात, कलाकंद, बर्फी, गुलाब जामुन आदि का भोग भी लगा सकते हैं। ऐसा करने से भगवान राम प्रसन्न होते हैं।<p>'),
('cd88be4a-8e30-11ef-a37a-acbc329ab9e7', '3207aec6-5be0-4f00-89c4-b0f2414a1161', 'en', 'Feed jaggery to cow for wealth growth', '<p>According to the belief, the person who regularly feeds a cow with jaggery in bread gets progress in every field. He continues to get promotion. If you also want to achieve progress then feed roti with jaggery to the cow regularly.<p>'),
('cd88f888-8e30-11ef-a37a-acbc329ab9e7', '3207aec6-5be0-4f00-89c4-b0f2414a1161', 'hi', 'धन उन्नति के लिए गाय  को गुड़  खिलाए', '<p>मान्यता के अनुसार जो व्यक्ति नियमित रूप से गाय को रोटी में गुड़ रख कर खिलाता है उसकी हर क्षेत्र में उन्नति होती है. लगातार उसे तरक्की मिलती जाती है. अगर आप भी तरक्की पाना चाहते हैं तो नियमित रूप से गाय को गुड़ के साथ रोटी खिलाएं.<p>'),
('e6764f02-8e31-11ef-a37a-acbc329ab9e7', '5c652b69-ef32-447f-bfa9-3718dc028722', 'en', 'Organize a store of sherbet for progress in business.', '<p> If you are a businessman then you should organize a bhandara, this helps in progress in your business, by organizing bhandaras people provide food to the poor and needy. Eating food gives satisfaction to both body and soul. According to mythological scriptures, whatever we donate, we get the same things in the next world, hence we should donate as much as possible.<p>'),
('e6773a0c-8e31-11ef-a37a-acbc329ab9e7', '5c652b69-ef32-447f-bfa9-3718dc028722', 'hi', 'व्यापर में उन्नति के लिए शरबत का भंडारा करवाएं', '<p>यदि आप एक व्यापारी हैं तो आप को भंडारा करवाना चाहिए इससे आप के व्यापर में उन्नति होती है ,भंडारे लगाकर लोग  गरीब और जरूरतमंदों को भोजन कराते हैं. भोजन कराने से शरीर और आत्मा दोनों को संतुष्टि मिलती है. पौराणिक शास्त्रों के अनुसार, हम जिस चीज का दान करते हैं, परलोक में हमें वही वस्तुएं मिलती हैं, इसलिए हमें अधिक से अधिक दान करना चाहिए.<p>');

-- --------------------------------------------------------

--
-- Table structure for table `mandir_translations`
--

CREATE TABLE `mandir_translations` (
  `id` char(36) NOT NULL,
  `mandir_id` char(36) DEFAULT NULL,
  `language_code` varchar(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mandir_translations`
--

INSERT INTO `mandir_translations` (`id`, `mandir_id`, `language_code`, `name`, `place`, `description`) VALUES
('0042b982-8d49-11ef-a37a-acbc329ab9e7', 'd2ae1f3f-1084-47b2-865c-51ae4d9918ef', 'en', 'Prem Mandir, Vrindavan', 'Sri Kripalu Maharaj Ji Marg, Raman Reiti, Vrindavan, Rajpur Khadar, Uttar Pradesh', '<p>Prem Mandir is located in Vrindavan near Mathura district of Uttar Pradesh state in India. It was constructed by Jagadguru Kripalu Maharaj as a temple of Lord Krishna and Radha. Prem Mandir was inaugurated on 17 February. It took 11 years time and an amount of approximately Rs 100 crore to build this temple. Italian Carrara marble has been used in it and it has been prepared by a thousand craftsmen from Rajasthan and Uttar Pradesh. The foundation stone of this temple was laid by Kripaluji Maharaj on 14 January 2001. This grand love temple, completed after eleven years, is carved from white Italian Carrara marble.</p>'),
('0042d250-8d49-11ef-a37a-acbc329ab9e7', 'd2ae1f3f-1084-47b2-865c-51ae4d9918ef', 'hi', 'प्रेम मंदिर वृन्दावन', 'श्री कृपालु महाराज जी मार्ग, रमण रेती, वृन्दावन, राजपुर खादर, उत्तर प्रदेश', '<p>प्रेम मंदिर भारत में उत्तर प्रदेश राज्य के मथुरा जिले के समीप वृंदावन में स्थित है। इसका निर्माण जगद्गुरु कृपालु महाराज द्वारा भगवान कृष्ण और राधा के मन्दिर के रूप में करवाया गया है। प्रेम मन्दिर का लोकार्पण १७ फरवरी को किया गया था। इस मन्दिर के निर्माण में ११ वर्ष का समय और लगभग १०० करोड़ रुपए की धन राशि लगी है। इसमें इटैलियन करारा संगमरमर का प्रयोग किया गया है और इसे राजस्थान और उत्तरप्रदेश के एक हजार शिल्पकारों ने तैयार किया है। इस मन्दिर का शिलान्यास १४ जनवरी २००१ को कृपालुजी महाराज द्वारा किया गया था।ग्यारह वर्ष के बाद तैयार हुआ यह भव्य प्रेम मन्दिर सफेद इटालियन करारा संगमरमर से तराशा गया है </p>'),
('02434430-8d4a-11ef-a37a-acbc329ab9e7', '2ee6b602-cd16-4d38-8270-7527647d95ca', 'en', 'Shree Ram Ram Mandir, Ayodhya', 'Shri Ram Janmbhoomi Teerth Kshetra in Sai Nagar,Ayodhya Utter Pradesh', '<p>According to the Ramayana, Rama was born to Kausalya and Dasharatha in Ayodhya, the capital of the Kingdom of Kosala. His siblings included Lakshmana, Bharata, and Shatrughna. He married Sita. Born in a royal family, Rama\'s life is described in the Hindu texts as one challenged by unexpected changes, such as an exile into impoverished and difficult circumstances, and challenges of ethical questions and moral dilemmas. Of all his travails, the most notable is the kidnapping of Sita by demon-king Ravana, followed by the determined and epic efforts of Rama and Lakshmana to gain her freedom and destroy the evil Ravana against great odds.</p>'),
('0243f308-8d4a-11ef-a37a-acbc329ab9e7', '2ee6b602-cd16-4d38-8270-7527647d95ca', 'hi', 'श्री राम जन्मभूमि मंदिर, अयोध्या', 'श्री राम जन्मभूमि तीर्थ क्षेत्र, साईं नगर, अयोध्या', '<p>रामायण के अनुसार, राम का जन्म कौशल्या और दशरथ के यहां कोसल राज्य की राजधानी अयोध्या में हुआ था। उनके भाई-बहनों में लक्ष्मण, भरत और शत्रुघ्न शामिल थे। उन्होंने सीता से विवाह किया। एक शाही परिवार में जन्मे, राम के जीवन का वर्णन हिंदू ग्रंथों में अप्रत्याशित परिवर्तनों, जैसे कि गरीब और कठिन परिस्थितियों में निर्वासन, और नैतिक प्रश्नों और नैतिक दुविधाओं की चुनौतियों के रूप में किया गया है। उनके सभी कष्टों में से, सबसे उल्लेखनीय राक्षस-राजा रावण द्वारा सीता का अपहरण है, जिसके बाद राम और लक्ष्मण द्वारा उनकी स्वतंत्रता हासिल करने और बड़ी बाधाओं के बावजूद दुष्ट रावण को नष्ट करने के दृढ़ और महाकाव्य प्रयास किए गए। </p>'),
('0b45ce0e-8d45-11ef-a37a-acbc329ab9e7', '06ca67e6-ec66-404d-8b04-b85ffe5bb376', 'en', 'Dwarkadhish Temple, Mathura', 'Sri Rajendra Pathak, Pathak Gali, Vishram Ghat, Vishram Bazar, Mathura, Uttar Pradesh', '<p>It is Mathura\'s most beautiful temple known throughout the country for its ornate construction and murals. Lord Dwarkadheesh, a form of Lord Krishna known as Dwarkanath, sits like a black marble idol in the shrine.</p><p>There are a plethora of stunning ceiling paintings depicting various elements of the Lord\'s life. In addition, the beautiful Rajasthani architectural patterns and craftsmanship make the complex appear even more majestic. The Dwarkadhish temple offers you several exciting activities that increase during the Shravan month when Lord Krishna cradles inside a Hindola </p>'),
('0b46043c-8d45-11ef-a37a-acbc329ab9e7', '06ca67e6-ec66-404d-8b04-b85ffe5bb376', 'hi', 'द्वारकाधीश मंदिर मथुरा', 'श्री राजेंद्र पाठक, पाठक गली, विश्राम घाट, विश्राम बाजार, मथुरा, उत्तर प्रदेश ', '<p>यह मथुरा का सबसे खूबसूरत मंदिर है जो अपने अलंकृत निर्माण और भित्तिचित्रों के लिए पूरे देश में जाना जाता है। भगवान द्वारकाधीश, भगवान कृष्ण का एक रूप जिन्हें द्वारकानाथ के नाम से जाना जाता है, मंदिर में एक काले संगमरमर की मूर्ति की तरह विराजमान हैं।</p> <p> यहां भगवान के जीवन के विभिन्न तत्वों को दर्शाने वाली आश्चर्यजनक छत पेंटिंग्स की भरमार है। इसके अलावा, सुंदर राजस्थानी वास्तुशिल्प पैटर्न और शिल्प कौशल इस परिसर को और भी अधिक भव्य बनाते हैं। द्वारकाधीश मंदिर आपको कई रोमांचक गतिविधियाँ प्रदान करता है जो श्रावण माह के दौरान बढ़ जाती हैं जब भगवान कृष्ण हिंडोला में विराजमान होते हैं</p>'),
('17987c68-8d47-11ef-a37a-acbc329ab9e7', 'c269adf0-e54b-4f76-8262-6c5b337932fb', 'en', 'Shree Krishna Janmabhoomi Temple', 'Janam bhoomi Marg, Janam Bhumi, Mathura, Uttar Pradesh ', '<p>Mathura is well-known as Lord Krishna\'s abode, where he spent his childhood, adolescence, and parts of his adulthood. Mathura, also known as Brij Bhoomi, is one of the holiest locations in India, with a large number of Hindu temples. It is well-known for its history, archaeology, religious history, art, and sculpture. It stands on the banks of the Yamuna river.</p>'),
('17995d86-8d47-11ef-a37a-acbc329ab9e7', 'c269adf0-e54b-4f76-8262-6c5b337932fb', 'hi', 'श्री कृष्ण जन्मभूमि मंदिर मथुरा', 'जन्म भूमि मार्ग, जन्म भूमि, मथुरा, उत्तर प्रदेश 281001', '<p>मथुरा भगवान कृष्ण के निवास स्थान के रूप में प्रसिद्ध है, जहां उन्होंने अपना बचपन, किशोरावस्था और वयस्कता के कुछ हिस्से बिताए थे। मथुरा, जिसे बृजभूमि के नाम से भी जाना जाता है, भारत के सबसे पवित्र स्थानों में से एक है, जहां बड़ी संख्या में हिंदू मंदिर हैं। यह अपने इतिहास, पुरातत्व, धार्मिक इतिहास, कला और मूर्तिकला के लिए प्रसिद्ध है। यह यमुना नदी के तट पर स्थित है।</p>'),
('1de0b0fc-8c7c-11ef-a37a-acbc329ab9e7', '1b354b07-2385-473b-837c-4cbd67927e64', 'en', 'Shri Ganesh Mandir Connaught place', 'J6J8+57Q, Baba Kharak Singh Rd, Hanuman Road Area, Connaught Place, New Delhi', '<p>Lord Ganesha is the Hindu God (Deity) who is believed to be the Lord of new beginnings therefore, he is worshipped at the start of all Hindu religious ceremonies. He is the Lord of letters and is associated with intellectualism. Hence, he is the patron of authors, bankers, scholars and the like. He is also called ‘Vighnaharta’ ie. the remover of obstacles</p> <p> Whereas, deep research of holy Vedas and pious Bhagavad Gita and other scriptures provides evidence that the whole universe is created by Aadi Ganesha who is immortal? He is the destroyer of sins. (Yajurved Adhyay 8 Mantra 13) He is the remover of obstacles. He is the supreme Lord who is worthy to be worshipped. </p>'),
('1de0f6b6-8c7c-11ef-a37a-acbc329ab9e7', '1b354b07-2385-473b-837c-4cbd67927e64', 'hi', 'श्री गणेश मंदिर कनॉट प्लेस', 'J6J8+57Q, बाबा खड़क सिंह रोड, हनुमान रोड एरिया, कनॉट प्लेस, नई दिल्ली, दिल्ली 110001', '<p> भगवान गणेश हिंदू भगवान (देवता) हैं जिन्हें नई शुरुआत का भगवान माना जाता है, इसलिए सभी हिंदू धार्मिक समारोहों की शुरुआत में उनकी पूजा की जाती है। वह अक्षरों के स्वामी हैं और बौद्धिकता से जुड़े हैं। इसलिए, वह लेखकों, बैंकरों, विद्वानों आदि का संरक्षक है। उन्हें \'विघ्नहर्ता\' यानी \'विघ्नहर्ता\' भी कहा जाता है। बाधाओं को दूर करने वाला </p> <p> जबकि, पवित्र वेदों और पवित्र भगवद गीता और अन्य ग्रंथों का गहन शोध इस बात का प्रमाण देता है कि संपूर्ण ब्रह्मांड आदि गणेश द्वारा बनाया गया है जो अमर हैं? वह पापों का नाश करने वाला है। (यजुर्वेद अध्याय 8 मन्त्र 13) वह विघ्नहर्ता है। वह सर्वोच्च भगवान हैं जो पूजा के योग्य हैं। </p>'),
('4de9296e-8c90-11ef-a37a-acbc329ab9e7', 'f1e7d30e-5581-4ab3-8fb1-e208d19e7b06', 'en', 'Shri Mankameshwar Mahadev Temple', 'CVJ8+7FP, Fort road, Kydganj, Prayagraj, Uttar Pradesh ', '<p>A wonderful Shivling of Loan Mukteshwar and Siddheshwar Mahadev is established in the premises of Mankameshwar temple. Here Hanuman Ji Maharaj is seated facing south. Thousands of devotees throng here every day during the holy month of Sawan. Especially on Monday Pradosh and special days of worship of Lord Shiva and Parvati, huge crowd gathers here. Mankameshwar Temple conducts its programs under the supervision of Shankaracharya Swami Swaroopananda Saraswati. </p> <p> The administrator of the temple, Dhananand Brahmachari, says that Lord Shiva himself established himself here after burning Kama. Kameshwar Peeth is mentioned in Skanda Purana and Padma Purana, this is the same Kameshwar Dham. He told that in Treta, when Lord Ram went into exile, Lord Ram rested under Akshayavat from Ayodhya along with Mata Janaki and Lakhan Lal. Before leaving from here, he had done Sadhana and Abhishekam here and prayed to Lord Shiva to get relief from all the troubles coming in his way. </p> <p>Loan Mukteshwar Lord Shiva is installed in the premises of the temple. Padma Purana mentions the establishment of Loan Mukteshwar Shiva here. He told that by visiting Mankameshwar and Loan Mukteshwar Mahadev on 51 Mondays, one gets freedom from all kinds of obstacles. All wishes are fulfilled. The Mahant of the temple says that this has happened many times, when no one has been in the temple premises and the atmosphere has been absolutely calm. Despite that, chants of Lord Shiva have been heard. He said that when Mankameshwar is in a state of trance after the aarti of Lord Mankameshwar, the surrounding divine powers guard it. This is a wonderful retreat which can be felt when you come here. </p>'),
('4de9aa56-8c90-11ef-a37a-acbc329ab9e7', 'f1e7d30e-5581-4ab3-8fb1-e208d19e7b06', 'hi', 'श्री मनकामेश्वर महादेव मंदिर प्रयागराज', 'CVJ8+7FP, फोर्ट रोड, कीडगंज, प्रयागराज, उत्तर प्रदेश', '<p> मनकामेश्वर मंदिर के परिसर में ऋण मुक्तेश्वर और सिद्धेश्वर महादेव का अद्भुत शिवलिंग स्थापित है।यहां हनुमान जी महाराज दक्षिणमुखी होकर विराजमान है। सावन के पवित्र माह में यहां हर दिन हजारों श्रद्धालुओं का ताता होता है। विशेषकर सोमवार प्रदोष और भगवान शिव पार्वती की आराधना वाले विशेष दिनों पर यहां भारी भीड़ उमड़ती है। मनकामेश्वर मंदिर शंकराचार्य स्वामी स्वरूपानंद सरस्वती की देखरेख में अपने कार्यक्रम करता है। मंदिर के व्यवस्थापक धनानंद ब्रह्मचारी कहते हैं कि भगवान शिव ने काम को भस्म करके स्वयं यहां पर स्थापित हुए स्कंद पुराण और पदम पुराण में कामेश्वर पीठ जिक्र होता है,यह वही कामेश्वर धाम है । उन्होंने बताया कि त्रेता में जब भगवान राम को वनवास मिला तो अयोध्या से भगवान राम माता जानकी और लखन लाल के साथ अक्षयवट के नीचे विश्राम किया । यहां से प्रस्थान से पहले उन्होंने यहीं पर साधना और अभिषेक कर भगवान शिव से मार्ग में आने वाले तमाम संकटों से मुक्ति पाने की कामना की थी।</p> <p> वहीं मंदिर में परिसर में ऋण मुक्तेश्वर भगवान शिव स्थापित है। पदम पुराण में ऋण मुक्तेश्वर शिव के यहां पर स्थापित होने का व्याख्यान है।उन्होंने बताया कि 51 सोमवार मनकामेश्वर और ऋण मुक्तेश्वर महादेव के दर्शन करने से सभी प्रकार की बाधाओं से मुक्ति मिलती है। सभी मनोकामनाएं पूरी होती है। मंदिर के महंत बताते हैं कि ऐसा कई बार हुआ है, जब मंदिर परिसर में कोई नहीं रहा है वातावरण बिल्कुल शांत रहा है।उसके बावजूद भी भगवान शिव के जयकारे सुने गए हैं। उन्होंने कहा कि जब मनकामेश्वर भगवान की आरती के बाद सयन की अवस्था में होते हैं ।यहां आस.पास के दिव्य शक्तियां पहरा देती है। यह एक अद्भुत पीठ है यहां आने पर इसको महसूस किया जा सकता है। </p>'),
('501b52e0-8d42-11ef-a37a-acbc329ab9e7', 'a94fd480-d005-4c0a-b9b2-6ae1aeb5abec', 'en', 'Shri Kashi Vishwanath Varanasi', 'Lahori Tola, Varanasi, Domari, Uttar Pradesh 221001', '<p>Kashi Vishvanath Temple is one of the most famous Hindu temples dedicated to Lord Shiva. It is located in Varanasi, Uttar Pradesh, India. The temple stands on the western bank of the holy river Ganga, and is one of the twelve Jyotirlingas, the holiest of Shivatemples. The main deity is known by the name Vishvanatha or Vishveshvara meaning Ruler of The Universe. Varanasi city is also called Kashi, and hence the temple is popularly called Kashi Vishvanath Temple.</p>'),
('501b97e6-8d42-11ef-a37a-acbc329ab9e7', 'a94fd480-d005-4c0a-b9b2-6ae1aeb5abec', 'hi', 'श्री काशी विश्वनाथ वाराणसी', 'लाहौरी टोला, वाराणसी, डोमरी, उत्तर प्रदेश 221001', '<p> काशी विश्वनाथ मंदिर भगवान शिव को समर्पित सबसे प्रसिद्ध हिंदू मंदिरों में से एक है। यह वाराणसी, उत्तर प्रदेश, भारत में स्थित है। यह मंदिर पवित्र नदी गंगा के पश्चिमी तट पर स्थित है, और बारह ज्योतिर्लिंगों में से एक है, जो सबसे पवित्र शिवमंदिर हैं। मुख्य देवता को विश्वनाथ या विश्वेश्वर के नाम से जाना जाता है जिसका अर्थ है ब्रह्मांड का शासक। वाराणसी शहर को काशी भी कहा जाता है, और इसलिए इस मंदिर को लोकप्रिय रूप से काशी विश्वनाथ मंदिर कहा जाता है</p>'),
('6c60b0fc-8d48-11ef-a37a-acbc329ab9e7', '724fdf58-70c4-4e5d-8d3f-4083123c03e0', 'en', 'Shri Banke Bihari Temple, Vrindavan', 'Near Banke Bihari temple, Bankebihari Colony, Vrindavan, Uttar Pradesh 281121', '<p>Banke Bihari Temple is a Hindu temple situated in the town of Vrindavan, Mathura district of Uttar Pradesh, India. The temple is dedicated to Banke Bihari who is believed to be the combined form of Radha and Krishna. Banke Bihari was originally worshipped at Nidhivan, Vrindavan. Later, when Banke Bihari temple was constructed around 1864, the icon of Banke Bihari was moved to its present temple.</p> <p>In Banke Bihari temple, the icon of Radha Krishna\'s united form stands in the Tribhanga posture. Swami Haridas originally worshipped this murti under the name of Kunj Bihari which means the one who enjoys in the groves or Kunj of Vrindavan </p>'),
('6c60da8c-8d48-11ef-a37a-acbc329ab9e7', '724fdf58-70c4-4e5d-8d3f-4083123c03e0', 'hi', 'श्री बांकेबिहारी मंदिर, वृन्दावन', 'बांकेबिहारी मंदिर के पास, बांकेबिहारी कॉलोनी, वृन्दावन, उत्तर प्रदेश 281121', '<p>बांके बिहारी मंदिर भारत के उत्तर प्रदेश के मथुरा जिले के वृन्दावन शहर में स्थित एक हिंदू मंदिर है। यह मंदिर बांके बिहारी को समर्पित है जिन्हें राधा और कृष्ण का संयुक्त रूप माना जाता है। बांके बिहारी की पूजा मूल रूप से निधिवन, वृन्दावन में की गई थी। बाद में, जब 1864 के आसपास बांके बिहारी मंदिर का निर्माण किया गया, तो बांके बिहारी की प्रतिमा को उसके वर्तमान मंदिर में ले जाया गया।</p><p>बांके बिहारी मंदिर में, राधा कृष्ण के एकजुट रूप का प्रतीक त्रिभंग मुद्रा में खड़ा है। स्वामी हरिदास ने मूल रूप से इस मूर्ति की पूजा कुंजबिहारी के नाम से की थी, जिसका अर्थ है वृन्दावन के उपवनों या कुंज में आनंद लेने वाला। </p>'),
('8b2af114-8d43-11ef-a37a-acbc329ab9e7', '62ec47f2-3316-4115-bad0-a5fb8285ac7d', 'en', 'Maa Annapurna Tample Varanasi', 'D 9, Annapurna Math Mandir, 1, Vishwanath Galli, Godowlia, Varanasi, Uttar Pradesh 221001', '<p>Varanasi, also known as Kashi, is one of the most sacred cities in Hinduism. It is believed that the temple was built in the 1700s by Peshwa Baji Rao and houses a golden idol of Maa Annapurna. The darshan of the golden idol is open only once a year during the Annakoot Mahotsav. However, the temple is open daily for devotees to have darshan of the second idol of Maa Annapurna.</p>'),
('8b2b2544-8d43-11ef-a37a-acbc329ab9e7', '62ec47f2-3316-4115-bad0-a5fb8285ac7d', 'hi', 'माँ अन्नपूर्णा मंदिर वाराणसी\r\n', 'डी 9, अन्नपूर्णा मठ मंदिर, 1, विश्वनाथ गली, गोदौलिया, वाराणसी, उत्तर प्रदेश 221001', '<p> वाराणसी, जिसे काशी के नाम से भी जाना जाता है, हिंदू धर्म के सबसे पवित्र शहरों में से एक है। ऐसा माना जाता है कि यह मंदिर 1700 के दशक में पेशवा बाजीराव द्वारा बनवाया गया था और इसमें मां अन्नपूर्णा की एक सुनहरी मूर्ति है। स्वर्ण प्रतिमा के दर्शन वर्ष में केवल एक बार अन्नकूट महोत्सव के दौरान होते हैं। हालाँकि, माँ अन्नपूर्णा की दूसरी मूर्ति के दर्शन के लिए मंदिर प्रतिदिन भक्तों के लिए खुला रहता है।</p>'),
('a23f192c-8c7e-11ef-a37a-acbc329ab9e7', '4da51663-03d0-4066-a075-f0fd5f51d311', 'en', 'Lakshmi temple Varanasi', 'Lakshmi Temple, D52/68, Laxmi Kund Rd, Sidhgiribagh, Varanasi', '<p>Mahalakshmi is the giver of living culture and splendor. She is the mistress of wealth, fortune and property. By his grace a person gets all this easily. Mahalakshmi enhances values. Nurtures traditions. Our religious texts are scripts of knowledge, science and traditions.</p> <p> These should be donated to please Goddess Lakshmi. Lord Ganesha is also pleased by donating scriptures. They shower the blessings of Riddhi Siddhi on us. The blessings of the trinity of Goddess Lakshmi, Vagdevi Saraswati and Shri Ganesh are showered from great books like religious scriptures, Vedas, Puranas, Geeta-Bhagwat etc. </p>'),
('a23f692c-8c7e-11ef-a37a-acbc329ab9e7', '4da51663-03d0-4066-a075-f0fd5f51d311', 'hi', 'लक्ष्मी जी का मंदिर वाराणसी', 'लक्ष्मी मंदिर, डी52/68, लक्ष्मी कुंड रोड, सिद्धगिरिबाग, वाराणसी', '<p> महालक्ष्मी रहन सहन संस्कार और वैभव की दात्री हैं. धन भाग्य संपदा की स्वामिनी हैं. उनकी कृपा से यह सब व्यक्ति को सहज ही प्राप्त हो जाता है. महालक्ष्मी संस्कारों को बढ़ाती हैं. परंपराओं को पोषित करती हैं. हमारे धर्म ग्रंथ ज्ञान विज्ञान और परिपाटियों की लिपियां हैं.</p> <p> लक्ष्मी जी को प्रसन्न करने के लिए इन्हें दान करना चाहिए. ग्रंथों को दान करने से भगवान गणेश भी प्रसन्न होते हैं. वे हम पर रिद्धि सिद्धी की कृपा बरसाते हैं. धर्मग्रंथ, वेद-पुराण, गीता-भागवत आदि महान पुस्तकों से लक्ष्मी माता, वाग्देवी सरस्वती और श्रीगणेश की त्रयी की कृपा बरसती है.</p>'),
('cb1cac82-8c7f-11ef-a37a-acbc329ab9e7', 'd9e9fd49-c07a-499e-857f-3ade72e7fc48', 'en', 'Shri Bade Hanuman Ji Mandir Prayagraj', 'Allahabad fort, Prayagraj, Uttar Pradesh 211005', '<p>At a distance of 1 km from Triveni Sangam, and 7 km from Prayagraj Railway Station, Bade Hanuman Temple is a well-known temple located in Prayagraj, Uttar Pradesh. Situated near Prayagraj Fort, it is one of the popular religious places in Prayagraj.</p> <p> Popularly known as Lette Hanuman Mandir, Bade Hanuman Temple is dedicated to Hanuman, the monkey god. This temple is an underground pit that houses a huge lying idol of Hanumanji, which is six to seven feet below the ground. This is the only Lord Hanuman temple in the world where the idol is in a reclining position. As per the mythology, Hanuman rested here after burning Lanka. Another interesting thing to know about this temple is that one side of Lord Hanuman\'s statue is half immersed in the water of the River Ganges. In the monsoon season when the water level rises, it is believed that the water of the river rises to touch the feet of the deity. During this time, a lot of devotees come to visit this sacred sight. </p>'),
('cb1cd1da-8c7f-11ef-a37a-acbc329ab9e7', 'd9e9fd49-c07a-499e-857f-3ade72e7fc48', 'hi', 'श्री बड़े हनुमान जी मंदिर प्रयागराज', 'इलाहाबाद किला, प्रयागराज, उत्तर प्रदेश 211005', '<p> त्रिवेणी संगम से 1 किमी की दूरी पर और प्रयागराज रेलवे स्टेशन से 7 किमी की दूरी पर, बड़े हनुमान मंदिर उत्तर प्रदेश के प्रयागराज में स्थित एक प्रसिद्ध मंदिर है। प्रयागराज किले के पास स्थित, यह प्रयागराज के लोकप्रिय धार्मिक स्थानों में से एक है।लेटे हनुमान मंदिर के नाम से लोकप्रिय बड़े हनुमान मंदिर वानर देवता हनुमान को समर्पित है। यह मंदिर एक भूमिगत गड्ढा है जिसमें हनुमानजी की एक विशाल लेटी हुई मूर्ति है, जो जमीन से छह से सात फीट नीचे है। यह दुनिया का एकमात्र भगवान हनुमान मंदिर है जहां मूर्ति लेटी हुई स्थिति में है। </p> <p> पौराणिक कथाओं के अनुसार लंका जलाने के बाद हनुमान ने यहीं विश्राम किया था। इस मंदिर के बारे में जानने योग्य एक और दिलचस्प बात यह है कि भगवान हनुमान की मूर्ति का एक किनारा गंगा नदी के पानी में आधा डूबा हुआ है। मानसून के मौसम में जब जल स्तर बढ़ता है, तो ऐसा माना जाता है कि नदी का पानी देवता के चरणों को छूने के लिए बढ़ता है। इस दौरान बड़ी संख्या में श्रद्धालु इस पवित्र दृश्य के दर्शन के लिए आते हैं। </p>');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` char(36) NOT NULL,
  `product_id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `product_title` varchar(200) NOT NULL,
  `quantity` int(5) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `product_id`, `parent_id`, `product_title`, `quantity`, `price`) VALUES
('51691789', '3207aec6-5be0-4f00-89c4-b0f2414a1161', '2ee6b602-cd16-4d38-8270-7527647d95ca', 'Feed jaggery to cow for wealth growth', 1, 150.00),
('51691789', '4b3dfd96-b149-419f-a1e0-1d46d74294d6', '2ee6b602-cd16-4d38-8270-7527647d95ca', 'Donate modak for sweetness in relationships', 1, 250.00);

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` char(36) NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `otp_code` varchar(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `otps`
--

INSERT INTO `otps` (`id`, `user_id`, `otp_code`, `created_at`, `expires_at`) VALUES
('be098eb4-0673-4035-985b-f944e7a21fb8', '8f9ebc31-3ac6-489f-9c2a-11a35470ef8f', '29644', '2024-12-09 08:00:25', '2024-12-09 08:10:25');

-- --------------------------------------------------------

--
-- Table structure for table `our_services`
--

CREATE TABLE `our_services` (
  `id` char(36) NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `our_services`
--

INSERT INTO `our_services` (`id`, `images`) VALUES
('5dcbbb3d-a8f1-43c7-af79-f2f7307a2c03', '[\"ourservices/1729426919173.png\"]'),
('943fc86d-2cf7-43e4-9876-f9074beafb3f', '[\"ourservices/1729425214981.png\"]'),
('a4f08de4-36cc-4f1f-b425-9a3f867938f6', '[\"ourservices/1729425656398.png\"]'),
('ca1a6c73-5ecc-4319-9ce7-49627404b997', '[\"ourservices/1729427837777.png\"]'),
('e9748ee1-6b00-48cc-9801-19432386dd10', '[\"ourservices/1729426412111.png\"]'),
('eb1345ea-8750-475d-a738-f9ede9fcc464', '[\"ourservices/1729424109025.png\"]');

-- --------------------------------------------------------

--
-- Table structure for table `pujastore`
--

CREATE TABLE `pujastore` (
  `id` char(36) NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `price` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `category_id` char(36) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pujastore`
--

INSERT INTO `pujastore` (`id`, `images`, `price`, `discount`, `category_id`, `status`, `created_at`) VALUES
('493e1fc2-7f52-4b42-9cd9-d9a92d4e934e', '[\"pujastore/1731170701242.jpg\"]', 150.00, 0.00, '2d90117a-295c-496c-977c-4097adff3604', 1, '2024-11-09 16:45:01'),
('753aae0f-2578-4b9f-aefd-881f97efcf94', '[\"pujastore/1731172883543.jpeg\"]', 1100.00, 0.00, '2d90117a-295c-496c-977c-4097adff3604', 1, '2024-11-09 17:21:23'),
('9301ac12-a00d-4a75-886f-76666fa2533a', '[\"pujastore/1731171178618.jpeg\"]', 100.00, 0.00, '2d90117a-295c-496c-977c-4097adff3604', 1, '2024-11-09 16:52:58'),
('d34c8d9a-362e-4d4a-bc6e-ca11a1f0a89c', '[\"pujastore/1731171895478.jpeg\"]', 100.00, 0.00, '2d90117a-295c-496c-977c-4097adff3604', 1, '2024-11-09 17:04:55');

-- --------------------------------------------------------

--
-- Table structure for table `pujastore_translations`
--

CREATE TABLE `pujastore_translations` (
  `id` int(11) NOT NULL,
  `pujastore_id` char(36) DEFAULT NULL,
  `language_code` varchar(2) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pujastore_translations`
--

INSERT INTO `pujastore_translations` (`id`, `pujastore_id`, `language_code`, `title`, `description`) VALUES
(119, '493e1fc2-7f52-4b42-9cd9-d9a92d4e934e', 'en', 'Heavenly Scents Agar Batti Scents B Sateem: Ambrose Divine Fragrance, Naturally', '<p>At SATIM, we bring you Heavenly Scents Agarbatti, a divine collection of premium, natural incense sticks crafted to fill your space with the essence of peace and purity. Made with carefully selected herbs, flowers, and essential oils, our agarbatti blends traditional craftsmanship with a touch of spirituality. Each stick is designed to elevate your senses, creating an atmosphere of tranquility and spiritual connection.</p><p><strong>Why Choose Heavenly Scents agarbati?</strong></p><p><strong>100% Natural Ingredients</strong>: Pure botanicals and essential oils, free from harmful chemicals.</p><p><strong>Long-Lasting Fragrance:</strong> Crafted for a balanced, soothing aroma that lingers.</p><p><strong>Handcrafted with Care: </strong>Each stick is rolled by hand to maintain the highest quality.</p><p><strong>Inspired by Nature and Tradition: </strong>A modern take on ancient spiritual practices, perfect for meditation, prayer, or relaxation.Discover the soul-soothing power of Heavenly Scents Agarbatti by SATIM and bring the divine essence of nature into your life.</p>'),
(120, '493e1fc2-7f52-4b42-9cd9-d9a92d4e934e', 'hi', 'स्वर्गीय सुगंध अगर बत्ती सुगंध बी सतीम: एम्ब्रोज़ दिव्य सुगंध, स्वाभाविक रूप से', '<p>SATIM में, हम आपके लिए हेवनली सेंट्स अगरबत्ती लाते हैं, जो आपके स्थान को शांति और पवित्रता के सार से भरने के लिए तैयार की गई प्रीमियम, प्राकृतिक अगरबत्तियों का एक दिव्य संग्रह है। सावधानीपूर्वक चयनित जड़ी-बूटियों, फूलों और आवश्यक तेलों से निर्मित, हमारी अगरबत्ती पारंपरिक शिल्प कौशल को आध्यात्मिकता के स्पर्श के साथ मिश्रित करती है। प्रत्येक छड़ी को आपकी इंद्रियों को उन्नत करने, शांति और आध्यात्मिक संबंध का माहौल बनाने के लिए डिज़ाइन किया गया है।</p><p><strong>स्वर्गीय सुगंध वाली अगरबती क्यों चुनें?</strong></p><p><strong>100% प्राकृतिक सामग्री: </strong>शुद्ध वनस्पति और आवश्यक तेल, हानिकारक रसायनों से मुक्त।</p><p><strong>लंबे समय तक चलने वाली खुशबू: </strong>एक संतुलित, सुखदायक सुगंध के लिए तैयार की गई जो लंबे समय तक बनी रहती है।</p><p><strong>देखभाल के साथ हस्तनिर्मित:</strong> उच्चतम गुणवत्ता बनाए रखने के लिए प्रत्येक छड़ी को हाथ से रोल किया जाता है। प्रकृति और परंपरा से प्रेरित: प्राचीन आध्यात्मिक प्रथाओं पर एक आधुनिक दृष्टिकोण, ध्यान, प्रार्थना या विश्राम के लिए उपयुक्त। SATIM द्वारा स्वर्गीय सुगंध अगरबत्ती की आत्मा-सुखदायक शक्ति की खोज करें और प्रकृति के दिव्य सार को अपने जीवन में लाएं।</p>'),
(121, '9301ac12-a00d-4a75-886f-76666fa2533a', 'en', 'SATIM Divine Dhoop Batti : Pure Essence, Spiritual Bliss SATIM Divine Dhoop Batti: Ignite the Spirit of Tranquility', '<p>Experience the pure essence of traditional spirituality with <strong>SATIM Divine Dhoop</strong> , crafted to bring peace, positivity, and a divine atmosphere into your space. Made from 100% natural ingredients, our dhoopbatti is free from chemicals and designed to elevate your surroundings with its rich, earthy aroma. Each stick is handcrafted to help you reconnect with your inner self and enhance meditation, prayer, or any moment of calm.</p><p><strong>Why Choose SATIM Divine Dhoop BAtti?</strong></p><p><strong>Natural, Handpicked Ingredients:</strong> Crafted from pure herbs, resins, and essential oils.</p><p><strong>Authentic, Long-Lasting Fragrance:</strong> Fills the room with a warm, grounding aroma that lingers.Perfect for Any Sacred Space: Ideal for home altars, temples, meditation, and relaxation. With SATIM Divine Dhoop, bring a serene and sacred ambiance into your home and experience the power of authentic, spiritual fragrance.</p>'),
(122, '9301ac12-a00d-4a75-886f-76666fa2533a', 'hi', 'सैटिम दिव्य धूप बत्ती: शुद्ध सार, आध्यात्मिक आनंद सैटिम दिव्य धूप बत्ती: शांति की भावना को प्रज्वलित करें', '<p><strong>SATIM दिव्य धूप </strong>के साथ पारंपरिक आध्यात्मिकता के शुद्ध सार का अनुभव करें, जो आपके स्थान में शांति, सकारात्मकता और एक दिव्य वातावरण लाने के लिए तैयार किया गया है। 100% प्राकृतिक सामग्रियों से निर्मित, हमारी धूपबत्ती रसायनों से मुक्त है और इसकी समृद्ध, मिट्टी की सुगंध के साथ आपके परिवेश को बेहतर बनाने के लिए डिज़ाइन की गई है। प्रत्येक छड़ी को आपके आंतरिक स्व के साथ फिर से जुड़ने और ध्यान, प्रार्थना या शांति के किसी भी क्षण को बढ़ाने में मदद करने के लिए हस्तनिर्मित किया गया है।</p><p><strong>सतीम दिव्य धूपबत्ती क्यों चुनें?</strong></p><p><strong>प्राकृतिक, हाथ से चुनी गई सामग्री: </strong>शुद्ध जड़ी-बूटियों, रेजिन और आवश्यक तेलों से तैयार की गई।</p><p><strong>प्रामाणिक, लंबे समय तक चलने वाली खुशबू: </strong>कमरे को गर्म, मधुर सुगंध से भर देती है जो लंबे समय तक बनी रहती है।</p><p><strong>Perfect for Any Sacred Space:</strong> Ideal for home altars, temples, meditation, and relaxation.With SATIM Divine Dhoop, bring a serene and sacred ambiance into your home and experience the power of authentic, spiritual fragrance.</p>'),
(123, 'd34c8d9a-362e-4d4a-bc6e-ca11a1f0a89c', 'en', 'SATIM Sacred Pooja Kit: Complete Ritual Essentials for Divine Worship', '<p>The SATIM Sacred Pooja Kit is thoughtfully curated to provide everything you need for a pure, meaningful, and complete worship experience. This all-in-one kit includes carefully selected items essential for any pooja or spiritual ceremony, helping you connect deeply with the divine. Each item is crafted or chosen for its high quality, purity, and spiritual significance, making it ideal for daily rituals, special occasions, or gifting.<br>&nbsp;</p><p><strong>What’s Inside the SATIM Sacred Pooja Kit?</strong></p><p><strong>Divine Incense:</strong> Handcrafted incense sticks and dhoop for a calming, sacred ambiance.</p><p><strong>Pure Camphor &amp; Ghee Diyas:</strong> For pure and lasting light in your sacred space.</p><p><strong>Sacred Ash &amp; Kumkum:</strong> Essential for traditional rituals and blessings.</p><p><strong>Holy Water:</strong> Pure Ganga jal for cleansing and purification.<br><br><strong>Brass Bell &amp; Spoon Set: </strong>For invoking positivity and setting the spiritual tone.</p><p><strong>Benefits of the SATIM Sacred Pooja Kit:</strong></p><p><strong>A ll-in-One Convenience:</strong> Everything you need in one kit for ease of worship.</p><p><strong>Natural and Pure:</strong> High-quality, natural ingredients to maintain the sanctity of your rituals.</p><p><strong>Perfect for All Ceremonies:</strong> Ideal for personal devotion, home altars, or temple use.Bring home the SATIM Sacred Pooja Kit to elevate your spiritual practice with ease and devotion.</p>'),
(124, 'd34c8d9a-362e-4d4a-bc6e-ca11a1f0a89c', 'hi', 'SATIM पवित्र पूजा किट: दिव्य पूजा के लिए पूर्ण अनुष्ठान अनिवार्यताएँ', '<p>SATIM पवित्र पूजा किट आपको शुद्ध, सार्थक और संपूर्ण पूजा अनुभव के लिए आवश्यक सभी चीजें प्रदान करने के लिए सोच-समझकर बनाई गई है। इस ऑल-इन-वन किट में किसी भी पूजा या आध्यात्मिक समारोह के लिए आवश्यक सावधानीपूर्वक चुनी गई वस्तुएं शामिल हैं, जो आपको परमात्मा के साथ गहराई से जुड़ने में मदद करती हैं। प्रत्येक वस्तु को उसकी उच्च गुणवत्ता, शुद्धता और आध्यात्मिक महत्व के लिए तैयार किया जाता है या चुना जाता है, जो इसे दैनिक अनुष्ठानों, विशेष अवसरों या उपहार देने के लिए आदर्श बनाता है।</p><p><strong>SATIM पवित्र पूजा किट के अंदर क्या है?</strong></p><p><strong>दिव्य धूप: </strong>शांत, पवित्र माहौल के लिए हस्तनिर्मित अगरबत्ती और धूप।</p><p><strong>शुद्ध कपूर और घी के दीये:</strong> आपके पवित्र स्थान में शुद्ध और स्थायी प्रकाश के लिए।</p><p><strong>पवित्र राख और कुमकुम:</strong> पारंपरिक अनुष्ठानों और आशीर्वाद के लिए आवश्यक।</p><p><strong>पवित्र जल:</strong> सफाई और शुद्धिकरण के लिए शुद्ध गंगा जल।</p><p><strong>पीतल की घंटी और चम्मच सेट: </strong>सकारात्मकता का आह्वान करने और आध्यात्मिक स्वर स्थापित करने के लिए।</p><p><strong>SATIM पवित्र पूजा किट के लाभ:</strong></p><p><strong>एक ऑल-इन-वन सुविधा:</strong> पूजा में आसानी के लिए आपको जो कुछ भी चाहिए वह एक किट में।</p><p><strong>प्राकृतिक और शुद्ध: </strong>आपके अनुष्ठानों की पवित्रता बनाए रखने के लिए उच्च गुणवत्ता वाली, प्राकृतिक सामग्री।</p><p><strong>सभी समारोहों के लिए बिल्कुल सही:</strong> व्यक्तिगत भक्ति, घरेलू वेदियों या मंदिर के उपयोग के लिए आदर्श। आसानी और भक्ति के साथ अपनी आध्यात्मिक प्रैक्टिस को बढ़ाने के लिए SATIM पवित्र पूजा किट घर लाएं।</p>'),
(125, '753aae0f-2578-4b9f-aefd-881f97efcf94', 'en', 'SATIM Rudraabhishek Kit: Complete Essentials for Powerful Lord Shiva Worship   ', '<p>The SATIM Rudraabhishek Pooja Kit is crafted to support the sacred ritual of Rudraabhishek, a powerful and revered ceremony dedicated to Lord Shiva. This kit includes all the necessary items for performing an authentic and pure Rudraabhishek pooja, helping devotees seek blessings for peace, prosperity, and spiritual protection. Each item is selected to maintain the highest sanctity, ensuring that you have everything you need to honor Lord Shiva with devotion.</p><p><strong>What’s Inside the SATIM Rudraabhishek Pooja Kit?</strong></p><p><strong>Holy Water and Milk Powder: </strong>For abhishek (sacred bath) of the Shiva Lingam.</p><p><strong>Panchamrit Ingredients:</strong> Essentials for creating a purifying mixture of milk, curd, ghee, honey, and sugar.</p><p><strong>Bilva Leaves and Flowers: </strong>Sacred offerings for Lord Shiva.</p><p><strong>Pure Sandalwood Paste and Ash:</strong> For marking and sanctifying the Shiva Lingam.</p><p><strong>Fragrant Incense and Camphor:</strong> To create a divine ambiance and complete the ritual.</p><p><strong>Benefits of the SATIM Rudraabhishek Pooja Kit:</strong></p><p><strong>Complete, Ready-to-Use Kit : </strong>All essential items included for an authentic Rudraabhishek ceremony.</p><p><strong>Pure and Natural Ingredients: </strong>High-quality items to preserve the sanctity of your worship.</p><p><strong>Ideal for Devotees: </strong>Perfect for home or temple ceremonies, bringing divine blessings and positive energy.Bring home the SATIM Rudraabhishek Pooja Kit and honor Lord Shiva with every element needed for a powerful, fulfilling pooja experience.</p>'),
(126, '753aae0f-2578-4b9f-aefd-881f97efcf94', 'hi', 'सैटिम रुद्राभिषेक किट: शक्तिशाली भगवान शिव की पूजा के लिए संपूर्ण आवश्यक सामग्री', '<p>SATIM रुद्राभिषेक पूजा किट भगवान शिव को समर्पित एक शक्तिशाली और पूजनीय समारोह, रुद्राभिषेक के पवित्र अनुष्ठान का समर्थन करने के लिए तैयार की गई है। इस किट में प्रामाणिक और शुद्ध रुद्राभिषेक पूजा करने के लिए सभी आवश्यक वस्तुएं शामिल हैं, जिससे भक्तों को शांति, समृद्धि और आध्यात्मिक सुरक्षा का आशीर्वाद प्राप्त करने में मदद मिलती है। प्रत्येक वस्तु को उच्चतम पवित्रता बनाए रखने के लिए चुना जाता है, यह सुनिश्चित करते हुए कि आपके पास भक्ति के साथ भगवान शिव का सम्मान करने के लिए आवश्यक सभी चीजें हैं।</p><p><strong>SATIM रुद्राभिषेक पूजा किट के अंदर क्या है?</strong></p><p><strong>पवित्र जल और दूध पाउडर:</strong> शिव लिंगम के अभिषेक (पवित्र स्नान) के लिए।</p><p><strong>पंचामृत सामग्री:</strong> दूध, दही, घी, शहद और चीनी का शुद्धिकरण मिश्रण बनाने के लिए आवश्यक सामग्री।</p><p><strong>बिल्व पत्र और फूल: </strong>भगवान शिव के लिए पवित्र प्रसाद।</p><p><strong>शुद्ध चंदन का पेस्ट और राख: </strong>शिव लिंगम को चिह्नित करने और पवित्र करने के लिए।</p><p><strong>सुगंधित धूप और कपूर:</strong> दिव्य माहौल बनाने और अनुष्ठान को पूरा करने के लिए।</p><p><strong>सतीम रुद्राभिषेक पूजा किट के लाभ:</strong></p><p><strong>संपूर्ण, उपयोग के लिए तैयार किट:</strong> प्रामाणिक रुद्राभिषेक समारोह के लिए सभी आवश्यक वस्तुएं शामिल हैं।</p><p><strong>शुद्ध और प्राकृतिक सामग्री:</strong> आपकी पूजा की पवित्रता को बनाए रखने के लिए उच्च गुणवत्ता वाली वस्तुएं।</p><p><strong>भक्तों के लिए आदर्श:</strong> घर या मंदिर के समारोहों के लिए बिल्कुल सही, दिव्य आशीर्वाद और सकारात्मक ऊर्जा लाता है। SATIM रुद्राभिषेक पूजा किट घर लाएं और एक शक्तिशाली, पूर्ण पूजा अनुभव के लिए आवश्यक हर तत्व के साथ भगवान शिव का सम्मान करें।<br>&nbsp;</p>');

-- --------------------------------------------------------

--
-- Table structure for table `queries`
--

CREATE TABLE `queries` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `queries`
--

INSERT INTO `queries` (`id`, `name`, `email`, `mobile_no`, `message`, `created_at`) VALUES
('25e8814a-915a-4c51-acb8-a698fa5222be', 'Vidya Sagar', 'vidyasagar.vi@gmail.com', '9911030958', 'The create method of Object is used to create a new object by passing the specified prototype object and properties as arguments, i.e., this pattern is helpful to create new objects based on existing objects. The second argument is optional and it is used to create properties on a newly created object.', '2024-10-28 16:50:53'),
('2cb73040-99e0-4b05-a7d3-0ecfde3dbc68', 'Vidya Sagar', 'vidyasagar.vi@gmail.com', '9911030958', 'The create method of Object is used to create a new object by passing the specified prototype object and properties as arguments, i.e., this pattern is helpful to create new objects based on existing objects. The second argument is optional and it is used to create properties on a newly created object.', '2024-10-28 16:49:40'),
('94fcbd4c-9438-4b4f-bc57-eb5a8d50793f', 'Vidya Sagar', 'vidyasagar.vi@gmail.com', '9911030958', 'The create method of Object is used to create a new object by passing the specified prototype object and properties as arguments, i.e., this pattern is helpful to create new objects based on existing objects. The second argument is optional and it is used to create properties on a newly created object.', '2024-10-28 16:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `services_products`
--

CREATE TABLE `services_products` (
  `id` char(36) NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `price` decimal(10,2) NOT NULL,
  `price_description` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services_products`
--

INSERT INTO `services_products` (`id`, `images`, `price`, `price_description`, `created_at`, `status`) VALUES
('05b5f904-8ffc-49d2-a1fd-ed73a6bf7d34', '[\"servicesproduct/1729430484788.png\"]', 10.00, 'per person', '2024-10-20 13:21:24', 1),
('13d3b50a-fe46-4efe-ab86-e2817cf19625', '[\"servicesproduct/1729430577329.png\"]', 50.00, 'per plate', '2024-10-20 13:22:57', 1),
('28ecdf1d-daf8-4550-b160-514b81d60d02', '[\"servicesproduct/1729429865589.png\"]', 35.00, 'per person', '2024-10-20 13:11:05', 1),
('2a5e95e3-c4e7-4b32-a309-e3d8eeec78e4', '[\"servicesproduct/1729429591568.png\"]', 100.00, '', '2024-10-20 13:06:31', 1),
('2d987c30-df72-42e6-87c2-2d3dbb797615', '[\"servicesproduct/1729430094169.png\"]', 45.00, 'per person', '2024-10-20 13:14:54', 1),
('33f77117-01ca-43b3-a4ec-1962a247dedf', '[\"servicesproduct/1729428544967.png\"]', 10.00, 'per person', '2024-10-20 12:49:04', 1),
('34a4a825-3006-47c4-af02-db854fa9dc3c', '[\"servicesproduct/1729428776041.png\"]', 10.00, 'per person', '2024-10-20 12:52:56', 1),
('7ddf9fa4-e2af-4d7f-b4c0-977c403a566a', '[\"servicesproduct/1729429385057.png\"]', 50.00, 'per person (One box contains 4 pieces)', '2024-10-20 13:03:05', 1),
('8c2732cf-b0f6-4766-bad9-70db811d2e30', '[\"servicesproduct/1729429312342.png\"]', 20.00, 'per person', '2024-10-20 13:01:52', 1),
('cb8d5f0b-d0c9-455b-95ba-92ef0b9efd8f', '[\"servicesproduct/1729429488333.png\"]', 200.00, 'for 4 person', '2024-10-20 13:04:48', 1);

-- --------------------------------------------------------

--
-- Table structure for table `services_products_translations`
--

CREATE TABLE `services_products_translations` (
  `id` char(36) NOT NULL,
  `services_id` char(36) DEFAULT NULL,
  `language_code` varchar(5) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services_products_translations`
--

INSERT INTO `services_products_translations` (`id`, `services_id`, `language_code`, `title`, `description`) VALUES
('2037297a-8ee4-11ef-a37a-acbc329ab9e7', '2a5e95e3-c4e7-4b32-a309-e3d8eeec78e4', 'en', 'Get flour distributed to ants for ancestors', 'By distributing flour to the ants, the souls of your ancestors get peace. Get the flour distributed to the ants for the ancestors.'),
('2038120e-8ee4-11ef-a37a-acbc329ab9e7', '2a5e95e3-c4e7-4b32-a309-e3d8eeec78e4', 'hi', 'पितरों के लिए चींटियों को आटा वितरित करवाऐ  ', 'चींटी को आटा खिलने से आप से पूर्वजो की आत्मा को सन्ति मिलती है पितरों के लिए चींटियों को आटा वितरित करवाऐ |'),
('349acd5c-8ee6-11ef-a37a-acbc329ab9e7', '05b5f904-8ffc-49d2-a1fd-ed73a6bf7d34', 'en', 'Sarbat Vitrit Karwayen', 'Donating sherbet is considered a boon in summers. You can also give sherbet to the poor and passers-by sitting at home through us.'),
('349ae058-8ee6-11ef-a37a-acbc329ab9e7', '05b5f904-8ffc-49d2-a1fd-ed73a6bf7d34', 'hi', 'शरबत वितरित करवाएं', 'शरबत दान गर्मियों में वरदान माना जाता है शरबत आप भी गरीबों को और राहगीरों को हमारे माध्यम से घर बैठे शरबत पिलवा सकते हैं  '),
('3a1c7eaa-8ee2-11ef-a37a-acbc329ab9e7', '34a4a825-3006-47c4-af02-db854fa9dc3c', 'en', 'Get banana distributed', 'Fruits are loved by all Gods and Goddesses and banana is a very popular fruit. Therefore, distribute bananas to the needy during this time.'),
('3a1cfdee-8ee2-11ef-a37a-acbc329ab9e7', '34a4a825-3006-47c4-af02-db854fa9dc3c', 'hi', 'केले का वितरण कराएं', 'फल सभी देवी देवताओ को प्रिय होता है और फल में केला बहुत पसंद है। इसलिए इस दौरान जरूरतमंदों को केला बाटें'),
('4bc7974a-8ee5-11ef-a37a-acbc329ab9e7', '2d987c30-df72-42e6-87c2-2d3dbb797615', 'en', 'Get bhandara distributed', 'Providing food to people is considered very virtuous, you can also take advantage of it by doing Bhandara Seva.'),
('4bc7d34a-8ee5-11ef-a37a-acbc329ab9e7', '2d987c30-df72-42e6-87c2-2d3dbb797615', 'hi', 'भंडारा वितरण करवाएं', 'लोगो को भोजन करवाना बहुत हे पुण्य माना जाता है भंडारा सेवा कर के आप भी इसका लाभ ले सकते हैं'),
('6bc36bf4-8ee6-11ef-a37a-acbc329ab9e7', '13d3b50a-fe46-4efe-ab86-e2817cf19625', 'en', 'Get Halwa Puri delivered', 'By distributing Halwa Puri to the poor and passers-by You can take blessings of people and God and get Halwa Puri distributed.'),
('6bc381c0-8ee6-11ef-a37a-acbc329ab9e7', '13d3b50a-fe46-4efe-ab86-e2817cf19625', 'hi', 'हलवा पूरी वितरित करवाएं', 'गरीबों और राहगीरों को हलवा पूरी वितरित करवा के आप लोगो और भगवान का आशीर्वाद ले सकते हैं हलवा पूरी वितरित करवाएं '),
('79c7207c-8ee3-11ef-a37a-acbc329ab9e7', '8c2732cf-b0f6-4766-bad9-70db811d2e30', 'en', 'Get fruits distributed', 'Wishes are fulfilled by distributing different types of fruits.'),
('79c746ce-8ee3-11ef-a37a-acbc329ab9e7', '8c2732cf-b0f6-4766-bad9-70db811d2e30', 'hi', 'फल वितरित करवाएं', 'अलग - अलग तरह के फल वितरित करवाने से मनोकामना पूरी होती है'),
('a51d7320-8ee3-11ef-a37a-acbc329ab9e7', '7ddf9fa4-e2af-4d7f-b4c0-977c403a566a', 'en', 'Get laddus distributed', 'All gods and goddesses love laddus. Therefore, get laddus distributed among the.'),
('a51dc79e-8ee3-11ef-a37a-acbc329ab9e7', '7ddf9fa4-e2af-4d7f-b4c0-977c403a566a', 'hi', 'लड्डू वितरित करवाएं', 'करे सभी देवी देवताओ को लड्डू  प्रिय होता है। इसलिए जरूरतमंदों में  लड्डू  वितरित करवाएं ।'),
('b0622a5c-8ee1-11ef-a37a-acbc329ab9e7', '33f77117-01ca-43b3-a4ec-1962a247dedf', 'en', 'Get waters distributed', 'Donating water is a very noble religious act'),
('b0625298-8ee1-11ef-a37a-acbc329ab9e7', '33f77117-01ca-43b3-a4ec-1962a247dedf', 'hi', 'जल वितरण करायें', 'पानी दान करना एक बहुत हे नेक धार्मिक कार्य है'),
('c3893708-8ee4-11ef-a37a-acbc329ab9e7', '28ecdf1d-daf8-4550-b160-514b81d60d02', 'en', 'Get Panjiri Prasad distributed', 'Distribute Panjiri Prasad to please God'),
('c3897222-8ee4-11ef-a37a-acbc329ab9e7', '28ecdf1d-daf8-4550-b160-514b81d60d02', 'hi', 'पंजीरी प्रसाद वितरित करवाएं', 'भगवान को प्रसन्न करने के लिए पंजीरी प्रसाद वितरित करें'),
('e2ab66d4-8ee3-11ef-a37a-acbc329ab9e7', 'cb8d5f0b-d0c9-455b-95ba-92ef0b9efd8f', 'en', 'Get Pende Prasad distributed', 'Get Pende Prasad distributed for happiness and prosperity'),
('e2ab7bce-8ee3-11ef-a37a-acbc329ab9e7', 'cb8d5f0b-d0c9-455b-95ba-92ef0b9efd8f', 'hi', 'पेंडे का प्रसाद वितरित करवाएं', 'सुख समृदि के लिए पेंडे का प्रसाद वितरित करवाएं ।');

-- --------------------------------------------------------

--
-- Table structure for table `service_benefits`
--

CREATE TABLE `service_benefits` (
  `id` char(36) NOT NULL,
  `service_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_benefits`
--

INSERT INTO `service_benefits` (`id`, `service_id`) VALUES
('4da9b88d-ddcf-4440-9851-6fc5166b5120', '5dcbbb3d-a8f1-43c7-af79-f2f7307a2c03'),
('68148fca-97b9-4b0e-9b5f-439da1e505c2', '5dcbbb3d-a8f1-43c7-af79-f2f7307a2c03'),
('c3b84493-be44-46bf-babf-f887324b57ca', '5dcbbb3d-a8f1-43c7-af79-f2f7307a2c03'),
('cff22bfe-31e5-4492-9d68-7e8ccaf396ea', '5dcbbb3d-a8f1-43c7-af79-f2f7307a2c03'),
('191786d1-da38-480f-a35d-b29307799c53', '943fc86d-2cf7-43e4-9876-f9074beafb3f'),
('51fd7fd4-f6bd-4bac-86c9-c6f3bfc98086', '943fc86d-2cf7-43e4-9876-f9074beafb3f'),
('548aca40-dc4b-4afe-85c3-d6e63fdc0cd3', '943fc86d-2cf7-43e4-9876-f9074beafb3f'),
('7832e4ee-0db7-4bfe-92d0-03cf513988e1', '943fc86d-2cf7-43e4-9876-f9074beafb3f'),
('98223343-d569-4b04-9a27-a3c410aecd0c', '943fc86d-2cf7-43e4-9876-f9074beafb3f'),
('988d8ec5-8f33-41ec-b066-219cfbe38c3a', 'a4f08de4-36cc-4f1f-b425-9a3f867938f6'),
('e0f65d58-8281-4a36-ade6-8478b195d1ae', 'a4f08de4-36cc-4f1f-b425-9a3f867938f6'),
('e97ea6b6-3cd9-47e0-b770-27857522c7e6', 'a4f08de4-36cc-4f1f-b425-9a3f867938f6'),
('fc59da7d-c41f-454f-85ea-42c29f96bd08', 'a4f08de4-36cc-4f1f-b425-9a3f867938f6'),
('ff8cdad8-308c-4ff7-8eaa-7363cb26c34c', 'a4f08de4-36cc-4f1f-b425-9a3f867938f6'),
('0fda59d7-a029-4b9c-9e2c-114e69cbffc8', 'ca1a6c73-5ecc-4319-9ce7-49627404b997'),
('299b24e6-f89f-4b50-a758-cbfbed310f1c', 'ca1a6c73-5ecc-4319-9ce7-49627404b997'),
('696b01de-8b4b-42e1-bdb0-df56ef016bf9', 'ca1a6c73-5ecc-4319-9ce7-49627404b997'),
('8a186f61-aa33-49ff-a272-ab6456532025', 'ca1a6c73-5ecc-4319-9ce7-49627404b997'),
('b39ecfcf-9897-4634-b234-eb4d21926060', 'ca1a6c73-5ecc-4319-9ce7-49627404b997'),
('6c091315-2f87-4d95-ac9f-b02e2504d1be', 'e9748ee1-6b00-48cc-9801-19432386dd10'),
('896c0f1a-36cb-42e1-9bbc-9191f7f32eba', 'e9748ee1-6b00-48cc-9801-19432386dd10'),
('a25baebc-a6ac-4f2e-b780-1f872e902b93', 'e9748ee1-6b00-48cc-9801-19432386dd10'),
('ce524246-2668-43b5-b6b7-fc9d0816f063', 'e9748ee1-6b00-48cc-9801-19432386dd10'),
('ea216334-3177-4d7f-b523-f1e624c081f8', 'e9748ee1-6b00-48cc-9801-19432386dd10'),
('04543046-79ba-46e6-bd8b-282288897467', 'eb1345ea-8750-475d-a738-f9ede9fcc464'),
('29d47fd9-c116-49bd-94c6-fc0da3ddb3eb', 'eb1345ea-8750-475d-a738-f9ede9fcc464'),
('3376714c-1630-42f5-8e1a-3b4d809ae45c', 'eb1345ea-8750-475d-a738-f9ede9fcc464'),
('9d9c47b1-b054-4132-ad0f-eb6c7fe991ab', 'eb1345ea-8750-475d-a738-f9ede9fcc464'),
('ba797eb3-9b3d-479a-892a-1d79b600e84b', 'eb1345ea-8750-475d-a738-f9ede9fcc464');

-- --------------------------------------------------------

--
-- Table structure for table `service_benefits_translations`
--

CREATE TABLE `service_benefits_translations` (
  `id` char(36) NOT NULL,
  `benefit_id` char(36) DEFAULT NULL,
  `language_code` varchar(2) DEFAULT NULL,
  `benefit_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_benefits_translations`
--

INSERT INTO `service_benefits_translations` (`id`, `benefit_id`, `language_code`, `benefit_description`) VALUES
('0adea9da-8ee0-11ef-a37a-acbc329ab9e7', 'b39ecfcf-9897-4634-b234-eb4d21926060', 'en', 'Assurance of Love Marriage'),
('0adec082-8ee0-11ef-a37a-acbc329ab9e7', 'b39ecfcf-9897-4634-b234-eb4d21926060', 'hi', 'प्रेम विवाह का आश्वासन'),
('0aded464-8ee0-11ef-a37a-acbc329ab9e7', '696b01de-8b4b-42e1-bdb0-df56ef016bf9', 'en', 'Elimination of Marriage Delays'),
('0adee71a-8ee0-11ef-a37a-acbc329ab9e7', '696b01de-8b4b-42e1-bdb0-df56ef016bf9', 'hi', 'विवाह में देरी का निवारण'),
('0adefaf2-8ee0-11ef-a37a-acbc329ab9e7', '8a186f61-aa33-49ff-a272-ab6456532025', 'en', 'Love and Sweetness in Relationships'),
('0adf240a-8ee0-11ef-a37a-acbc329ab9e7', '8a186f61-aa33-49ff-a272-ab6456532025', 'hi', 'रिश्तों में प्यार और मिठास'),
('0adfabf0-8ee0-11ef-a37a-acbc329ab9e7', '0fda59d7-a029-4b9c-9e2c-114e69cbffc8', 'en', 'Attainment of a Blissful Married Life'),
('0adfc68a-8ee0-11ef-a37a-acbc329ab9e7', '0fda59d7-a029-4b9c-9e2c-114e69cbffc8', 'hi', 'आनंदमय वैवाहिक जीवन की प्राप्ति'),
('0adfd986-8ee0-11ef-a37a-acbc329ab9e7', '299b24e6-f89f-4b50-a758-cbfbed310f1c', 'en', 'The positive impact of this Puja eliminates marital conflicts, leading to a harmonious, joyful, and blissful married life.'),
('0adfeef8-8ee0-11ef-a37a-acbc329ab9e7', '299b24e6-f89f-4b50-a758-cbfbed310f1c', 'hi', 'इस पूजा के सकारात्मक प्रभाव से वैवाहिक कलह दूर हो जाते हैं, जिससे वैवाहिक जीवन सौहार्दपूर्ण, आनंदमय और खुशहाल होता है।'),
('5c62c3f8-8ed7-11ef-a37a-acbc329ab9e7', '3376714c-1630-42f5-8e1a-3b4d809ae45c', 'en', 'For attainment of compatible life partner'),
('5c632370-8ed7-11ef-a37a-acbc329ab9e7', '3376714c-1630-42f5-8e1a-3b4d809ae45c', 'hi', 'अनुकूल जीवन साथी की प्राप्ति के लिए'),
('5c63372a-8ed7-11ef-a37a-acbc329ab9e7', '9d9c47b1-b054-4132-ad0f-eb6c7fe991ab', 'en', 'Get ideal partner'),
('5c634b8e-8ed7-11ef-a37a-acbc329ab9e7', '9d9c47b1-b054-4132-ad0f-eb6c7fe991ab', 'hi', 'आदर्श साथी मिले'),
('5c635ed0-8ed7-11ef-a37a-acbc329ab9e7', '04543046-79ba-46e6-bd8b-282288897467', 'en', 'Harmony Married Life'),
('5c637c80-8ed7-11ef-a37a-acbc329ab9e7', '04543046-79ba-46e6-bd8b-282288897467', 'hi', 'सौहार्दपूर्ण वैवाहिक जीवन'),
('5c639db4-8ed7-11ef-a37a-acbc329ab9e7', '29d47fd9-c116-49bd-94c6-fc0da3ddb3eb', 'en', 'Attainment of Marital Happiness'),
('5c63b68c-8ed7-11ef-a37a-acbc329ab9e7', '29d47fd9-c116-49bd-94c6-fc0da3ddb3eb', 'hi', 'वैवाहिक सुख की प्राप्ति'),
('5c63cc9e-8ed7-11ef-a37a-acbc329ab9e7', 'ba797eb3-9b3d-479a-892a-1d79b600e84b', 'en', 'Sweetness In Relatinship'),
('5c63ea12-8ed7-11ef-a37a-acbc329ab9e7', 'ba797eb3-9b3d-479a-892a-1d79b600e84b', 'hi', 'रिश्ते में मिठास'),
('b91cc1e8-8edc-11ef-a37a-acbc329ab9e7', '896c0f1a-36cb-42e1-9bbc-9191f7f32eba', 'en', 'Relief in Business Losses'),
('b91cd408-8edc-11ef-a37a-acbc329ab9e7', '896c0f1a-36cb-42e1-9bbc-9191f7f32eba', 'hi', 'बिजनेस घाटे में राहत'),
('b91ce6fa-8edc-11ef-a37a-acbc329ab9e7', 'ce524246-2668-43b5-b6b7-fc9d0816f063', 'en', 'Profitable Start of Business'),
('b91d05f4-8edc-11ef-a37a-acbc329ab9e7', 'ce524246-2668-43b5-b6b7-fc9d0816f063', 'hi', 'व्यवसाय की लाभदायक शुरुआत'),
('b91d266a-8edc-11ef-a37a-acbc329ab9e7', 'a25baebc-a6ac-4f2e-b780-1f872e902b93', 'en', 'Freedom from Business Loans'),
('b91d4f6e-8edc-11ef-a37a-acbc329ab9e7', 'a25baebc-a6ac-4f2e-b780-1f872e902b93', 'hi', 'बिजनेस लोन से मुक्ति'),
('b91d677e-8edc-11ef-a37a-acbc329ab9e7', 'ea216334-3177-4d7f-b523-f1e624c081f8', 'en', 'Business fraud protection'),
('b91d7cdc-8edc-11ef-a37a-acbc329ab9e7', 'ea216334-3177-4d7f-b523-f1e624c081f8', 'hi', 'व्यापार धोखाधड़ी संरक्षण'),
('b91d9230-8edc-11ef-a37a-acbc329ab9e7', '6c091315-2f87-4d95-ac9f-b02e2504d1be', 'en', 'By participating in this you are protected from business frauds, conspiracies and losses'),
('b91dc250-8edc-11ef-a37a-acbc329ab9e7', '6c091315-2f87-4d95-ac9f-b02e2504d1be', 'hi', 'इसमें भाग लेने से आप व्यापारिक धोखाधड़ी, साजिशों और नुकसान से सुरक्षित रहते हैं|'),
('e7562c06-8edd-11ef-a37a-acbc329ab9e7', '68148fca-97b9-4b0e-9b5f-439da1e505c2', 'en', 'Overcoming Fear of Death'),
('e75667de-8edd-11ef-a37a-acbc329ab9e7', '68148fca-97b9-4b0e-9b5f-439da1e505c2', 'hi', 'मृत्यु के भय पर काबू पाना'),
('e7567b2a-8edd-11ef-a37a-acbc329ab9e7', 'c3b84493-be44-46bf-babf-f887324b57ca', 'en', 'For Mental stability'),
('e7568db8-8edd-11ef-a37a-acbc329ab9e7', 'c3b84493-be44-46bf-babf-f887324b57ca', 'hi', 'मानसिक स्थिरता के लिए'),
('e7569dee-8edd-11ef-a37a-acbc329ab9e7', 'cff22bfe-31e5-4492-9d68-7e8ccaf396ea', 'en', 'Mitigation of Malefic Effects of Rahu-Ketu'),
('e756ae38-8edd-11ef-a37a-acbc329ab9e7', 'cff22bfe-31e5-4492-9d68-7e8ccaf396ea', 'hi', 'राहु-केतु के अशुभ प्रभाव का शमन'),
('e756be0a-8edd-11ef-a37a-acbc329ab9e7', '4da9b88d-ddcf-4440-9851-6fc5166b5120', 'en', 'Overcoming Hindrances in Any Endeavour'),
('e756fff0-8edd-11ef-a37a-acbc329ab9e7', '4da9b88d-ddcf-4440-9851-6fc5166b5120', 'hi', 'किसी भी प्रयास में बाधाओं पर काबू पाना'),
('ef910642-8ed9-11ef-a37a-acbc329ab9e7', '51fd7fd4-f6bd-4bac-86c9-c6f3bfc98086', 'en', 'Get Freedom from financial debts'),
('ef9116aa-8ed9-11ef-a37a-acbc329ab9e7', '51fd7fd4-f6bd-4bac-86c9-c6f3bfc98086', 'hi', 'आर्थिक कर्ज से मुक्ति पाएं'),
('ef912668-8ed9-11ef-a37a-acbc329ab9e7', '191786d1-da38-480f-a35d-b29307799c53', 'en', 'Resolve Horoscope Defects'),
('ef913540-8ed9-11ef-a37a-acbc329ab9e7', '191786d1-da38-480f-a35d-b29307799c53', 'hi', 'कुंडली दोषों का निवारण करें'),
('ef914526-8ed9-11ef-a37a-acbc329ab9e7', '548aca40-dc4b-4afe-85c3-d6e63fdc0cd3', 'en', 'Freedom from debt of previous birth and ancestors'),
('ef91555c-8ed9-11ef-a37a-acbc329ab9e7', '548aca40-dc4b-4afe-85c3-d6e63fdc0cd3', 'hi', 'पूर्व जन्म और पूर्वजों के ऋण से मुक्ति'),
('ef9163b2-8ed9-11ef-a37a-acbc329ab9e7', '7832e4ee-0db7-4bfe-92d0-03cf513988e1', 'en', 'Get Rid Of Loans and E.M.I'),
('ef917118-8ed9-11ef-a37a-acbc329ab9e7', '7832e4ee-0db7-4bfe-92d0-03cf513988e1', 'hi', 'लोन और ईएमआई से छुटकारा पाएं'),
('ef917f3c-8ed9-11ef-a37a-acbc329ab9e7', '98223343-d569-4b04-9a27-a3c410aecd0c', 'en', 'As a result of Rin Mukti bhandara, the person associated with the business sector gets rid of the burden of loans and E.M.I s of houses, vehicles, electronic equipment, etc'),
('ef918cc0-8ed9-11ef-a37a-acbc329ab9e7', '98223343-d569-4b04-9a27-a3c410aecd0c', 'hi', 'ऋण मुक्ति भंडारे के फलस्वरूप व्यवसाय क्षेत्र से जुड़े व्यक्ति को मकान, वाहन, इलेक्ट्रॉनिक उपकरण आदि के ऋण तथा ई.एम.आई. के बोझ से छुटकारा मिल जाता है'),
('f6abc128-8eda-11ef-a37a-acbc329ab9e7', 'e0f65d58-8281-4a36-ade6-8478b195d1ae', 'en', 'Protection from enemies and negativity'),
('f6abd640-8eda-11ef-a37a-acbc329ab9e7', 'e0f65d58-8281-4a36-ade6-8478b195d1ae', 'hi', 'शत्रुओं और नकारात्मकता से सुरक्षा'),
('f6abe48c-8eda-11ef-a37a-acbc329ab9e7', 'fc59da7d-c41f-454f-85ea-42c29f96bd08', 'en', 'Joy of having a child'),
('f6abf206-8eda-11ef-a37a-acbc329ab9e7', 'fc59da7d-c41f-454f-85ea-42c29f96bd08', 'hi', 'बच्चा होने की ख़ुशी'),
('f6ac016a-8eda-11ef-a37a-acbc329ab9e7', 'ff8cdad8-308c-4ff7-8eaa-7363cb26c34c', 'en', 'Freedom from rebirth as an animal'),
('f6ac44d6-8eda-11ef-a37a-acbc329ab9e7', 'ff8cdad8-308c-4ff7-8eaa-7363cb26c34c', 'hi', 'पशु के रूप में पुनर्जन्म से मुक्ति'),
('f6ac52d2-8eda-11ef-a37a-acbc329ab9e7', 'e97ea6b6-3cd9-47e0-b770-27857522c7e6', 'en', 'Attaining peace from aggressive nature'),
('f6ac60ce-8eda-11ef-a37a-acbc329ab9e7', 'e97ea6b6-3cd9-47e0-b770-27857522c7e6', 'hi', 'आक्रामक स्वभाव से शांति की प्राप्ति'),
('f6ac73ac-8eda-11ef-a37a-acbc329ab9e7', '988d8ec5-8f33-41ec-b066-219cfbe38c3a', 'en', 'By organizing Bhandara in Lord Pawan Dham and participating in it, people with aggressive tendencies gain control over their uncontrolled aggression and experience peace in their nature.'),
('f6ac8a36-8eda-11ef-a37a-acbc329ab9e7', '988d8ec5-8f33-41ec-b066-219cfbe38c3a', 'hi', 'भगवान पवन धाम में भंडारे का आयोजन करने और उसमें भाग लेने से आक्रामक प्रवृत्ति वाले लोग अपनी अनियंत्रित आक्रामकता पर नियंत्रण पाते हैं और अपने स्वभाव में शांति का अनुभव करते हैं।');

-- --------------------------------------------------------

--
-- Table structure for table `service_translations`
--

CREATE TABLE `service_translations` (
  `id` char(36) NOT NULL,
  `service_id` char(36) DEFAULT NULL,
  `language_code` varchar(2) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_translations`
--

INSERT INTO `service_translations` (`id`, `service_id`, `language_code`, `title`, `description`) VALUES
('0add7b14-8ee0-11ef-a37a-acbc329ab9e7', 'ca1a6c73-5ecc-4319-9ce7-49627404b997', 'en', 'Get Prasad distributed to ensure love marriage', '<p><strong>To get married with desired life partner</strong>. Are you facing challenges in your love life? Are you tired of one-sided love? Is your relationship not working out even after marriage? Does your life feel incomplete without love? Are you facing losses in your business or job? If you are stressed due to not getting business clients on time, then attend the Prem Prapti and Sarva Vashikaran Mahatantrik Bhairav Bhandara organised by us at the temple. Sunday and Thursday are considered to be the most suitable days for the Lord\'s Bhandara. Lord Bhairav is also known as the God of attraction, control and stability. Bhairav Temple is a highly revered temple and is one of the temples of Ashta Bhairav. Due to its miracles, people come here to seek blessings for all their happiness.</p>'),
('0addc2e0-8ee0-11ef-a37a-acbc329ab9e7', 'ca1a6c73-5ecc-4319-9ce7-49627404b997', 'hi', 'प्रेम विवाह सुनिश्चित् के लिए प्रसाद वितरित करवाएं', '<p><strong>मनचाहे जीवनसाथी से शादी करने के लिए</strong> क्या आप अपने प्रेम जीवन में चुनौतियों का सामना कर रहे हैं? क्या आप एकतरफा प्यार से थक चुके हैं? क्या शादी के बाद भी आपके रिश्ते ठीक नहीं चल रहे हैं? क्या आपका जीवन प्रेम के बिना अधूरा लगता है? क्या आप अपने व्यापार या नौकरी में घाटे का सामना कर रहे हैं? अगर आप समय पर व्यापारिक ग्राहक न मिलने के कारण तनाव में हैं, तो हमारे द्वारा मंदिर, में आयोजित प्रेम प्राप्ति और सर्व वशीकरण महातांत्रिक भैरव भंडारा में भाग लें। रविवार और गुरुवार भगवान के भंडारा  के लिए सबसे उपयुक्त दिन माने जाते हैं। भगवान भैरव को आकर्षण, नियंत्रण और स्थिरता के देवता के रूप में भी जाना जाता है। भैरव मंदिर एक अत्यंत पूजनीय मंदिर है और अष्ट भैरव के मंदिरों में से एक है। इसके चमत्कारों के कारण, लोग अपनी सभी खुशियों के लिए यहाँ आशीर्वाद प्राप्त करने आते हैं। </p>'),
('5c604740-8ed7-11ef-a37a-acbc329ab9e7', 'eb1345ea-8750-475d-a738-f9ede9fcc464', 'en', 'Uttam vivaah yog ke liye prasaad batavaayen', '<p>Never worship Lord Shiva, Ram or Krishna alone for marriage yoga in the horoscope, it delays marriage. If you want a good marriage yoga, then distribute Prasad. To avoid delay in marriage, one should worship the couple idol of Shiva Parvati, Ram Sita or Krishna Radha. Boy or girl whose marriage is getting delayed, should go to the temple of Lord Shiva for early marriage and worship Shiva along with Goddess Parvati. </p>'),
('5c60979a-8ed7-11ef-a37a-acbc329ab9e7', 'eb1345ea-8750-475d-a738-f9ede9fcc464', 'hi', 'उत्तम विवाह योग के लिए प्रसाद बटवायें', '<p>कुंडली में विवाह योग के लिए कभी भी अकेले भगवान शिव, राम या कृष्ण की पूजा न करें, इससे विवाह में देरी होती है. यदि आप उत्तम विवाह योग चाहते हैं तो प्रसाद वितरित करवाएं  विवाह में देरी से बचने के लिए शिव पर्वती, राम सीता अथवा कृष्ण राधा की युगल प्रतिमा की पूजा करनी चाहिए. लड़का या लड़की जिसके भी विवाह में देरी हो रही है, उसे शीघ्र विवाह के लिए भगवान शिव के मंदिर में जाना चाहिए और माता पार्वती के साथ शिवजी की भी पूजा करनी चाहिए</p>'),
('b91aed96-8edc-11ef-a37a-acbc329ab9e7', 'e9748ee1-6b00-48cc-9801-19432386dd10', 'en', 'Organize Bhandara for business growth', '<p><strong>Stores should be made to increase business</strong>. Goddess Lakshmi, the goddess of wealth, removes poverty. Here the Sun God himself worships the goddess. Once Goddess Lakshmi, being angry with Lord Tirupati, left her home and came to live here in search of peace. Since then, the business of any devotee who distributes prasad grows.</p>'),
('b91b6456-8edc-11ef-a37a-acbc329ab9e7', 'e9748ee1-6b00-48cc-9801-19432386dd10', 'hi', 'व्यापार वृद्धि के लिए भंडारा करवायें', '<p><strong>ब्यापार में बृद्धि के लिए भंडार करवाना चाहिए|  </strong>धन की देवी लक्ष्मी दरिद्रता दूर करने वाली हैं। यहां सूर्य देव स्वयं माता की पूजा करते हैं। एक बार माता लक्ष्मी भगवान तिरुपति से नाराज होकर अपना घर छोड़कर शांति की तलाश में यहां रहने आ गईं। तब से लेकर जो भी भक्त प्रसाद वितरड़ करवाता  उसके व्यापर में वृद्धि होती है</p>'),
('e754e6f2-8edd-11ef-a37a-acbc329ab9e7', '5dcbbb3d-a8f1-43c7-af79-f2f7307a2c03', 'en', 'To appease Kaal Sarp Dosh, offer Prasad to the needy.', '<p><strong>For Eliminating the Fear of Death and Achieving Mental Stability</strong>. Nazar, or the attraction of negative energy, can happen to anyone at any time. It is not always intentional, but it can have a significant adverse effect on your life. Fortunately, there are many ways in our Vedas to remove any effects of Nazar Dosh and keep you safe for a happy and blessed life. You can get rid of Nazar Dosh by doing Prasad distribution or Bhandara by us.</p>'),
('e7552ae0-8edd-11ef-a37a-acbc329ab9e7', '5dcbbb3d-a8f1-43c7-af79-f2f7307a2c03', 'hi', 'काल सर्प दोष शांति के लिए जरुरत मंदों को प्रसाद भेंट करवाएं', '<p><strong>मृत्यु के भय को दूर करने और मानसिक स्थिरता प्राप्त करने के लिए</strong> नज़र, या नकारात्मक ऊर्जा का आकर्षण किसी को भी कभी भी हो सकता है। यह हमेशा जानबूझकर नहीं होता है, लेकिन आपके जीवन पर इसका महत्वपूर्ण प्रतिकूल प्रभाव पड़ सकता है। सौभाग्य से, हमारे वेदों में नज़र दोष के किसी भी प्रभाव को दूर करने और आपको एक खुशहाल और धन्य जीवन के लिए सुरक्षित रखने के कई तरीके हैं। हमारे द्वारा आप प्रसाद वितरण या भंडारा करवा के नजर दोष से मुक्ति पा सकते हैं| </p>'),
('ef8eaa00-8ed9-11ef-a37a-acbc329ab9e7', '943fc86d-2cf7-43e4-9876-f9074beafb3f', 'en', 'Rin mukti ke liye prasad vitrit karwayen', '<p>If you want to get rid of debt, then you can go to the ancient Rinmukteshwar Mahadev temple in Ujjain. Here a very wonderful and beneficial puja is performed to get rid of all debts. Yellow items are offered to Mahadev in this puja. According to history, in the Satyug period, King Harishchandra himself performed this ritual to get rid of his debt. With this devotion, a person is not only freed from financial responsibilities, but also from the debts of past births, ancestors, gurus and gods.  </p> <p>Rin Mukti Puja is especially beneficial for freedom from debt, obstacles in love marriage and freedom from the defects of the birth horoscope, getting it done promises a happy married life. If you also want freedom from all your debts and want to get immense wealth, then definitely join the Rin Mukti Prasad distribution organized by SATIM in Rinmukteshwar Mahadev Temple.</p>'),
('ef8f1ecc-8ed9-11ef-a37a-acbc329ab9e7', '943fc86d-2cf7-43e4-9876-f9074beafb3f', 'hi', 'ऋण मुक्ति पूजा कर्ज से छुटकारा पाने के लिए', '<p>अगर आप कर्ज से मुक्ति पाना चाहते हैं तो आप उज्जैन के प्राचीन ऋणमुक्तेश्वर महादेव मंदिर में जा सकते हैं। यहां सभी कर्जों से मुक्ति पाने के लिए बहुत ही अद्भुत और लाभकारी पूजा होती है। इस पूजा में महादेव को पीली वस्तुएं अर्पित की जाती हैं। इतिहास के अनुसार सतयुग काल में राजा हरिश्चंद्र ने स्वयं अपने कर्ज से मुक्ति पाने के लिए यह अनुष्ठान किया था। इस भक्ति से व्यक्ति न केवल आर्थिक जिम्मेदारियों से मुक्त होता है, बल्कि पिछले जन्मों, पूर्वजों, गुरुओं और देवताओं के ऋण से भी मुक्त होता है। </p> <p>कर्ज से मुक्ति, प्रेम विवाह में आने वाली रुकावटों और जन्म कुंडली के दोषों से मुक्ति के लिए ऋण मुक्ति पूजा विशेष लाभकारी है, इसे करवाने से सुखी वैवाहिक जीवन का वादा किया जाता है। अगर आप भी अपने सभी कर्जों से मुक्ति चाहते हैं और अपार धन-संपत्ति पाना चाहते हैं तो ऋणमुक्तेश्वर महादेव मंदिर में सतिं द्वारा  आयोजित ऋण मुक्ति प्रसाद वितरण में जरूर शामिल हों।</p>'),
('f6a9a50a-8eda-11ef-a37a-acbc329ab9e7', 'a4f08de4-36cc-4f1f-b425-9a3f867938f6', 'en', 'Get a Bhandara organized for the birth of a child.', '<p><strong>Childbirth and tranquility in fierce temperament.</strong>To get a child, all the devotees try to please God in different ways so that God fulfills their wish. If you organize a Bhandara for getting a child, then your wish is fulfilled soon. Bhandara is a festive occasion in Hinduism which involves community kitchen and is a way of thanking God and serving people. Some things should be kept in mind while organizing a Bhandara for the birth of a child.</p>'),
('f6a9ddf4-8eda-11ef-a37a-acbc329ab9e7', 'a4f08de4-36cc-4f1f-b425-9a3f867938f6', 'hi', 'संतान प्राप्ति के लिए भंडारा करवाएं', '<p><strong>उग्र स्वभाव में संतानोत्पत्ति और शांति</strong>. संतान प्राप्ति के लिए सभी भक्त भगवन को अलग अलग तरह से मानाने  कोसिस करते हैं ताकि भगवन उनकी मनोकामना पूर्ण कर दें यदि आप संतान प्राप्ति के लिए भंडारे का आयोजन करते हैं तो आप की मनोकामना शीघ्र पूर्ण होती है भंडारा हिंदू धर्म में एक उत्सव का अवसर है जिसमें सामुदायिक रसोई शामिल होती है और यह भगवान को धन्यवाद देने और लोगों की सेवा करने का एक तरीका है। बच्चे के जन्म के लिए भंडारा आयोजित करते समय कुछ बातों का ध्यान रखना चाहिए </p>');

-- --------------------------------------------------------

--
-- Table structure for table `store_orders`
--

CREATE TABLE `store_orders` (
  `id` char(36) NOT NULL,
  `order_id` char(36) NOT NULL,
  `payment_id` char(36) NOT NULL,
  `razorpay_signature` text NOT NULL,
  `user_id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `parent_name` varchar(39) NOT NULL,
  `gst_charge` decimal(10,2) NOT NULL,
  `shipping_charge` decimal(10,2) NOT NULL,
  `total_ammount` decimal(10,2) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `payment_method` varchar(10) NOT NULL,
  `card_id` varchar(200) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `pin_code` varchar(20) NOT NULL,
  `shipping_address` text NOT NULL,
  `order_status` char(15) NOT NULL,
  `order_message` text NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `payment_confirm_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_orders`
--

INSERT INTO `store_orders` (`id`, `order_id`, `payment_id`, `razorpay_signature`, `user_id`, `parent_id`, `parent_name`, `gst_charge`, `shipping_charge`, `total_ammount`, `currency`, `payment_method`, `card_id`, `user_name`, `user_email`, `user_phone`, `pin_code`, `shipping_address`, `order_status`, `order_message`, `order_date`, `payment_confirm_date`) VALUES
('51691789', 'order_PdSCELDzZUJTRX', '', '', '8f9ebc31-3ac6-489f-9c2a-11a35470ef8f', '2ee6b602-cd16-4d38-8270-7527647d95ca', 'mandir', 18.00, 10.00, 482.00, '', '', '', 'Vidya sagar Vishwakarma', 'vidyasagar.vi@gmail.com', '09911030958', '110062', 'Gali no 14 house no 361 2nd floor DDA flats madan gir', 'pending', '', '2024-12-30 16:28:47', '2024-12-30 16:28:47');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `v_variable` varchar(20) NOT NULL DEFAULT '',
  `v_value` varchar(100) NOT NULL DEFAULT '',
  `t_wef` int(5) NOT NULL DEFAULT 0,
  `v_module` varchar(2) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`v_variable`, `v_value`, `t_wef`, `v_module`) VALUES
('SGWebmasterEmail', 'vidyasagar.vi@gmail.com', 1375513370, 'SG'),
('SGEmailHelpDesk', 'vidyasagar.vi@gmail.com', 1375513370, 'SG'),
('SGPhoneHelpDesk', '234 816 856 8856', 1319446991, 'SG'),
('GST', '18', 1166315481, 'SG'),
('Shipping', '10', 1166315481, 'SG'),
('SGMailSenderName', 'Satim', 1373109472, 'SG'),
('SGMailSenderEmail', 'info@thesatim.com', 1375513370, 'SG'),
('MLReplyEmail', 'info@thesatim.com', 1200911843, 'ML'),
('SGSMSHelpDesk', '+91 58456584', 1350975409, 'SG');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `shipping_address` text DEFAULT NULL,
  `pincode` varchar(10) NOT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `mobile_no`, `email`, `password`, `name`, `shipping_address`, `pincode`, `is_verified`, `created_at`) VALUES
('8f9ebc31-3ac6-489f-9c2a-11a35470ef8f', '09911030958', 'vidyasagar.vi@gmail.com', '$2b$10$MCWAvIeIeJF4Z/SaKcSZUO80CErJAcrMOBzOmIoQ2G0zz9C1sS2uK', 'Vidya sagar Vishwakarma', 'Gali no 14 house no 361 2nd floor DDA flats madan gir', '110062', 1, '2024-12-09 08:00:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_translations`
--
ALTER TABLE `faq_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `faq_id` (`faq_id`,`language_code`);

--
-- Indexes for table `helps_needy_person`
--
ALTER TABLE `helps_needy_person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `helps_needy_person_translations`
--
ALTER TABLE `helps_needy_person_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `helps_needy_person_id` (`helps_needy_person_id`);

--
-- Indexes for table `helps_products`
--
ALTER TABLE `helps_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `helps_products_translations`
--
ALTER TABLE `helps_products_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `helps_id` (`helps_id`);

--
-- Indexes for table `mandir`
--
ALTER TABLE `mandir`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mandir_benefits`
--
ALTER TABLE `mandir_benefits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mandir_id` (`mandir_id`);

--
-- Indexes for table `mandir_benefits_translations`
--
ALTER TABLE `mandir_benefits_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `benefit_id` (`benefit_id`,`language_code`);

--
-- Indexes for table `mandir_products`
--
ALTER TABLE `mandir_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mandir_products_translations`
--
ALTER TABLE `mandir_products_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `mandir_translations`
--
ALTER TABLE `mandir_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mandir_id` (`mandir_id`,`language_code`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD KEY `order_id` (`id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `our_services`
--
ALTER TABLE `our_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pujastore`
--
ALTER TABLE `pujastore`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `pujastore_translations`
--
ALTER TABLE `pujastore_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pujastore_id` (`pujastore_id`);

--
-- Indexes for table `queries`
--
ALTER TABLE `queries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services_products`
--
ALTER TABLE `services_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services_products_translations`
--
ALTER TABLE `services_products_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_id` (`services_id`);

--
-- Indexes for table `service_benefits`
--
ALTER TABLE `service_benefits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `service_benefits_translations`
--
ALTER TABLE `service_benefits_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `benefit_id` (`benefit_id`,`language_code`);

--
-- Indexes for table `service_translations`
--
ALTER TABLE `service_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `service_id` (`service_id`,`language_code`);

--
-- Indexes for table `store_orders`
--
ALTER TABLE `store_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`v_variable`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile_no` (`mobile_no`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `pujastore_translations`
--
ALTER TABLE `pujastore_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faq_translations`
--
ALTER TABLE `faq_translations`
  ADD CONSTRAINT `faq_translations_ibfk_1` FOREIGN KEY (`faq_id`) REFERENCES `faqs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `helps_needy_person_translations`
--
ALTER TABLE `helps_needy_person_translations`
  ADD CONSTRAINT `helps_needy_person_translations_ibfk_1` FOREIGN KEY (`helps_needy_person_id`) REFERENCES `helps_needy_person` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `helps_products_translations`
--
ALTER TABLE `helps_products_translations`
  ADD CONSTRAINT `helps_products_translations_ibfk_1` FOREIGN KEY (`helps_id`) REFERENCES `helps_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mandir_benefits`
--
ALTER TABLE `mandir_benefits`
  ADD CONSTRAINT `mandir_benefits_ibfk_1` FOREIGN KEY (`mandir_id`) REFERENCES `mandir` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mandir_benefits_translations`
--
ALTER TABLE `mandir_benefits_translations`
  ADD CONSTRAINT `mandir_benefits_translations_ibfk_1` FOREIGN KEY (`benefit_id`) REFERENCES `mandir_benefits` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mandir_products_translations`
--
ALTER TABLE `mandir_products_translations`
  ADD CONSTRAINT `mandir_products_translations_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `mandir_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mandir_translations`
--
ALTER TABLE `mandir_translations`
  ADD CONSTRAINT `mandir_translations_ibfk_1` FOREIGN KEY (`mandir_id`) REFERENCES `mandir` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `store_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `otps`
--
ALTER TABLE `otps`
  ADD CONSTRAINT `otps_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pujastore`
--
ALTER TABLE `pujastore`
  ADD CONSTRAINT `pujastore_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `pujastore_translations`
--
ALTER TABLE `pujastore_translations`
  ADD CONSTRAINT `pujastore_translations_ibfk_1` FOREIGN KEY (`pujastore_id`) REFERENCES `pujastore` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services_products_translations`
--
ALTER TABLE `services_products_translations`
  ADD CONSTRAINT `services_products_translations_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_benefits`
--
ALTER TABLE `service_benefits`
  ADD CONSTRAINT `service_benefits_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `our_services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_benefits_translations`
--
ALTER TABLE `service_benefits_translations`
  ADD CONSTRAINT `service_benefits_translations_ibfk_1` FOREIGN KEY (`benefit_id`) REFERENCES `service_benefits` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_translations`
--
ALTER TABLE `service_translations`
  ADD CONSTRAINT `service_translations_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `our_services` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
