-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 
-- Версия на сървъра: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `worldpedia`
--

-- --------------------------------------------------------

--
-- Структура на таблица `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `text` text,
  `landmark_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Схема на данните от таблица `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `text`, `landmark_id`) VALUES
(1, 2, 'test comment', 42),
(2, 3, 'testcomment 2', 42),
(3, 5, NULL, 42),
(4, 5, NULL, 42),
(5, 5, 'дасдасдттт', 42),
(6, 5, 'dasdadasd', 42),
(7, 5, 'dasdasd', 42),
(8, 5, 'dasddasd12434', 42),
(9, 5, 'dasdas55555', 42),
(10, 5, 'ddddddd', 42),
(11, 5, 'ddddddd1', 42),
(12, 5, 'saddasd', 42),
(13, 5, '123333333', 42),
(14, 5, '123333333', 42),
(15, 5, 'ддд', 42),
(16, 5, 'дасда', 2),
(17, 5, 'ффф', 2),
(18, 5, 'сдасдас', 2),
(19, 1, 'admin comment', 42),
(20, 5, 'dasda', 42),
(21, 5, 'ddd', 2),
(22, 5, 'dasd', 61),
(23, 5, 'ddd', 1),
(24, 5, 'das', 61),
(25, 5, 'dasd', 61),
(26, 5, 'античен театър', 64),
(27, 1, 'шипка', 61),
(28, 5, '', 42),
(29, 5, 'дасдас', 42);

-- --------------------------------------------------------

--
-- Структура на таблица `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Схема на данните от таблица `country`
--

INSERT INTO `country` (`country_id`, `country`, `last_update`) VALUES
(1, 'Afghanistan', '2006-02-15 00:44:00'),
(2, 'Algeria', '2006-02-15 00:44:00'),
(3, 'American Samoa', '2006-02-15 00:44:00'),
(4, 'Angola', '2006-02-15 00:44:00'),
(5, 'Anguilla', '2006-02-15 00:44:00'),
(6, 'Argentina', '2006-02-15 00:44:00'),
(7, 'Armenia', '2006-02-15 00:44:00'),
(8, 'Australia', '2006-02-15 00:44:00'),
(9, 'Austria', '2006-02-15 00:44:00'),
(10, 'Azerbaijan', '2006-02-15 00:44:00'),
(11, 'Bahrain', '2006-02-15 00:44:00'),
(12, 'Bangladesh', '2006-02-15 00:44:00'),
(13, 'Belarus', '2006-02-15 00:44:00'),
(14, 'Bolivia', '2006-02-15 00:44:00'),
(15, 'Brazil', '2006-02-15 00:44:00'),
(16, 'Brunei', '2006-02-15 00:44:00'),
(17, 'Bulgaria', '2006-02-15 00:44:00'),
(18, 'Cambodia', '2006-02-15 00:44:00'),
(19, 'Cameroon', '2006-02-15 00:44:00'),
(20, 'Canada', '2006-02-15 00:44:00'),
(21, 'Chad', '2006-02-15 00:44:00'),
(22, 'Chile', '2006-02-15 00:44:00'),
(23, 'China', '2006-02-15 00:44:00'),
(24, 'Colombia', '2006-02-15 00:44:00'),
(25, 'Congo, The Democratic Republic of the', '2006-02-15 00:44:00'),
(26, 'Czech Republic', '2006-02-15 00:44:00'),
(27, 'Dominican Republic', '2006-02-15 00:44:00'),
(28, 'Ecuador', '2006-02-15 00:44:00'),
(29, 'Egypt', '2006-02-15 00:44:00'),
(30, 'Estonia', '2006-02-15 00:44:00'),
(31, 'Ethiopia', '2006-02-15 00:44:00'),
(32, 'Faroe Islands', '2006-02-15 00:44:00'),
(33, 'Finland', '2006-02-15 00:44:00'),
(34, 'France', '2006-02-15 00:44:00'),
(35, 'French Guiana', '2006-02-15 00:44:00'),
(36, 'French Polynesia', '2006-02-15 00:44:00'),
(37, 'Gambia', '2006-02-15 00:44:00'),
(38, 'Germany', '2006-02-15 00:44:00'),
(39, 'Greece', '2006-02-15 00:44:00'),
(40, 'Greenland', '2006-02-15 00:44:00'),
(41, 'Holy See (Vatican City State)', '2006-02-15 00:44:00'),
(42, 'Hong Kong', '2006-02-15 00:44:00'),
(43, 'Hungary', '2006-02-15 00:44:00'),
(44, 'India', '2006-02-15 00:44:00'),
(45, 'Indonesia', '2006-02-15 00:44:00'),
(46, 'Iran', '2006-02-15 00:44:00'),
(47, 'Iraq', '2006-02-15 00:44:00'),
(48, 'Israel', '2006-02-15 00:44:00'),
(49, 'Italy', '2006-02-15 00:44:00'),
(50, 'Japan', '2006-02-15 00:44:00'),
(51, 'Kazakstan', '2006-02-15 00:44:00'),
(52, 'Kenya', '2006-02-15 00:44:00'),
(53, 'Kuwait', '2006-02-15 00:44:00'),
(54, 'Latvia', '2006-02-15 00:44:00'),
(55, 'Liechtenstein', '2006-02-15 00:44:00'),
(56, 'Lithuania', '2006-02-15 00:44:00'),
(57, 'Madagascar', '2006-02-15 00:44:00'),
(58, 'Malawi', '2006-02-15 00:44:00'),
(59, 'Malaysia', '2006-02-15 00:44:00'),
(60, 'Mexico', '2006-02-15 00:44:00'),
(61, 'Moldova', '2006-02-15 00:44:00'),
(62, 'Morocco', '2006-02-15 00:44:00'),
(63, 'Mozambique', '2006-02-15 00:44:00'),
(64, 'Myanmar', '2006-02-15 00:44:00'),
(65, 'Nauru', '2006-02-15 00:44:00'),
(66, 'Nepal', '2006-02-15 00:44:00'),
(67, 'Netherlands', '2006-02-15 00:44:00'),
(68, 'New Zealand', '2006-02-15 00:44:00'),
(69, 'Nigeria', '2006-02-15 00:44:00'),
(70, 'North Korea', '2006-02-15 00:44:00'),
(71, 'Oman', '2006-02-15 00:44:00'),
(72, 'Pakistan', '2006-02-15 00:44:00'),
(73, 'Paraguay', '2006-02-15 00:44:00'),
(74, 'Peru', '2006-02-15 00:44:00'),
(75, 'Philippines', '2006-02-15 00:44:00'),
(76, 'Poland', '2006-02-15 00:44:00'),
(77, 'Puerto Rico', '2006-02-15 00:44:00'),
(78, 'Romania', '2006-02-15 00:44:00'),
(79, 'Runion', '2006-02-15 00:44:00'),
(80, 'Russian Federation', '2006-02-15 00:44:00'),
(81, 'Saint Vincent and the Grenadines', '2006-02-15 00:44:00'),
(82, 'Saudi Arabia', '2006-02-15 00:44:00'),
(83, 'Senegal', '2006-02-15 00:44:00'),
(84, 'Slovakia', '2006-02-15 00:44:00'),
(85, 'South Africa', '2006-02-15 00:44:00'),
(86, 'South Korea', '2006-02-15 00:44:00'),
(87, 'Spain', '2006-02-15 00:44:00'),
(88, 'Sri Lanka', '2006-02-15 00:44:00'),
(89, 'Sudan', '2006-02-15 00:44:00'),
(90, 'Sweden', '2006-02-15 00:44:00'),
(91, 'Switzerland', '2006-02-15 00:44:00'),
(92, 'Taiwan', '2006-02-15 00:44:00'),
(93, 'Tanzania', '2006-02-15 00:44:00'),
(94, 'Thailand', '2006-02-15 00:44:00'),
(95, 'Tonga', '2006-02-15 00:44:00'),
(96, 'Tunisia', '2006-02-15 00:44:00'),
(97, 'Turkey', '2006-02-15 00:44:00'),
(98, 'Turkmenistan', '2006-02-15 00:44:00'),
(99, 'Tuvalu', '2006-02-15 00:44:00'),
(100, 'Ukraine', '2006-02-15 00:44:00'),
(101, 'United Arab Emirates', '2006-02-15 00:44:00'),
(102, 'United Kingdom', '2006-02-15 00:44:00'),
(103, 'United States', '2006-02-15 00:44:00'),
(104, 'Venezuela', '2006-02-15 00:44:00'),
(105, 'Vietnam', '2006-02-15 00:44:00'),
(106, 'Virgin Islands, U.S.', '2006-02-15 00:44:00'),
(107, 'Yemen', '2006-02-15 00:44:00'),
(108, 'Yugoslavia', '2006-02-15 00:44:00'),
(109, 'Zambia', '2006-02-15 00:44:00');

-- --------------------------------------------------------

--
-- Структура на таблица `landmarks`
--

CREATE TABLE `landmarks` (
  `id` int(11) NOT NULL,
  `name` text,
  `description` text,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Схема на данните от таблица `landmarks`
--

INSERT INTO `landmarks` (`id`, `name`, `description`, `country_id`) VALUES
(1, 'Мадарски конник ', '<p><span style=\"color: #222222; font-family: sans-serif;\">Мадарският конник се намира на 20 km от&nbsp;</span><a style=\"text-decoration-line: none; color: #0b0080; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif;\" title=\"Шумен\" href=\"https://bg.wikipedia.org/wiki/%D0%A8%D1%83%D0%BC%D0%B5%D0%BD\">Шумен</a><span style=\"color: #222222; font-family: sans-serif;\">, като основен знаков символ на Националния историко-археологически резерват &bdquo;Мадара&ldquo;, близо до едноименното село. В по-голямата си част резерватът се разполага на територията на Община Каспичан. Мадарският конник представлява скален релеф (</span><a class=\"mw-redirect\" style=\"text-decoration-line: none; color: #0b0080; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif;\" title=\"Барелеф\" href=\"https://bg.wikipedia.org/wiki/%D0%91%D0%B0%D1%80%D0%B5%D0%BB%D0%B5%D1%84\">барелеф</a><span style=\"color: #222222; font-family: sans-serif;\">), изсечен през VІІІ в. сл. Хр. върху отвесна скала на 23 m височина. Размерите на изображението са 2,6 m височина и 3,1 m основа (ширина). Изобразява конник, лъв, куче и надписи на гръцки език.</span></p>', 17),
(2, 'Great Wall of China', 'The Great Wall of China is a series of fortifications made of stone, brick, tamped earth, wood, and other materials, generally built along an east-to-west line across the historical northern borders of China to protect the Chinese states and empires against the raids and invasions of the various nomadic groups of the Eurasian Steppe. Several walls were being built as early as the 7th century BC;[2] these, later joined together and made bigger and stronger, are now collectively referred to as the Great Wall.[3] Especially famous is the wall built 220–206 BC by Qin Shi Huang, the first Emperor of China. Little of that wall remains. Since then, the Great Wall has on and off been rebuilt, maintained, and enhanced; the majority of the existing wall is from the Ming Dynasty (1368–1644).', 23),
(42, 'Grand Canyon', '<p style=\"margin: 0.5em 0px; line-height: inherit; color: #252525; font-family: sans-serif;\">&nbsp;</p>\r\n<p style=\"margin: 0.5em 0px; line-height: inherit; color: #252525; font-family: sans-serif;\"><span style=\"color: #252525; font-family: sans-serif;\"><strong>The Grand Canyon</strong><em> (Hopi: Ongtupqa; Yavapai: Wi:ka?i:la, Navajo: Ts&eacute;kooh Hatsoh, Spanish: Gran Ca&ntilde;&oacute;n) is a steep-sided canyon carved by the Colorado River in the state of Arizona in the United States. It is contained within and managed by Grand Canyon National Park, the Kaibab National Forest, Grand Canyon-Parashant National Monument, the Hualapai Tribal Nation, the Havasupai people and the Navajo Nation. President Theodore Roosevelt was a major proponent of preservation of the Grand Canyon area, and visited it on numerous occasions to hunt and enjoy the scenery.</em></span></p>\r\n<p style=\"margin: 0.5em 0px; line-height: inherit; color: #252525; font-family: sans-serif;\"><span style=\"color: #252525; font-family: sans-serif;\">&nbsp;</span></p>\r\n<p style=\"margin: 0.5em 0px; line-height: inherit; color: #252525; font-family: sans-serif;\"><span style=\"color: #252525; font-family: sans-serif;\"><strong>The Grand Canyon is</strong> 277 miles (446 km) long, up to 18 miles (29 km) wide and attains a depth of over a mile (6,093 feet or 1,857 meters).[3] Nearly two billion years of Earth\'s geological history have been exposed as the Colorado River and its tributaries cut their channels through layer after layer of rock while the Colorado Plateau was uplifted.[4] While some aspects about the history of incision of the canyon are debated by geologists,[5] several recent studies support the hypothesis that the Colorado River established its course through the area about 5 to 6 million years ago. Since that time, the Colorado River has driven the down-cutting of the tributaries and retreat of the cliffs, simultaneously deepening and widening the canyon.</span></p>', 103),
(43, 'Mount Everest', '<p><strong>Mount Everest</strong>, also known in Nepal as Sagarm&#257;th&#257; and in China as Chomolungma/<strong>&#29664;&#31302;&#26391;&#29595;&#23792;</strong>, is Earth\'s highest mountain. Its peak is 8,848 metres (29,029 ft) above sea level. Mount Everest is in the Mahalangur Range. The international border between China (Tibet Autonomous Region) and Nepal runs across Everest\'s summit point. Its massif includes neighbouring peaks Lhotse, 8,516 m (27,940 ft); Nuptse, 7,855 m (25,771 ft), and Changtse, 7,580 m (24,870 ft).</p>\r\n<p>In 1856, the Great Trigonometrical Survey of India established the first published height of Everest, then known as Peak XV, at 8,840 m (29,002 ft). The current official height of 8,848 m (29,029 ft) as recognised by China and Nepal was established by a 1955 Indian survey and subsequently confirmed by a Chinese survey in 1975. In 2005, China remeasured the height of the mountain and got a result of 8844.43 m. An argument regarding the height between China and Nepal lasted five years from 2005 to 2010. China argued it should be measured by its rock height which is 8,844 m but Nepal said it should be measured by its snow height 8,848 m. In 2010, an agreement was finally reached by both sides that the height of Everest is 8,848 m and Nepal recognises China\'s claim that the rock height of Everest is 8,844 m</p>', 66),
(44, 'Niagara Falls ', '<p><strong>Niagara Falls</strong> is the collective name for three waterfalls that straddle the international border between Canada and the United States; more specifically, between the province of Ontario and the state of New York. They form the southern end of the Niagara Gorge.</p>\r\n<p>From largest to smallest, the three waterfalls are the Horseshoe Falls, the American Falls and the Bridal Veil Falls. The Horseshoe Falls lies on the border of the United States and Canada with the American Falls entirely on the American side, separated by Goat Island. The smaller Bridal Veil Falls are also on the American side, separated from the other waterfalls by Luna Island. The international boundary line was originally drawn through Horseshoe Falls in 1819, but the boundary has long been in dispute due to natural erosion and construction</p>', 103),
(61, 'Шипка', '<p><em><strong>Шипка е връх в Стара планина с надморска височина 1326 метра, разположен на изток от Шипченския проход. До 23 ноември 1951 г. върхът носи името Свети Никола, а след това до 7 октомври 1977 г. &ndash; връх Столетов Върхът символизира героизма и самопожертвувателните усилия за освобождението на България от Османско робство.</strong></em></p>\r\n<p><em><strong>&nbsp;</strong></em></p>\r\n<p>През 1934 г. на върха е построен Паметникът на свободата, до който водят автомобилен път и каменно стълбище. Паметникът е част от Парк-музей &bdquo;Шипка&ldquo;. Шипка се нарича и върхът (с височина 1232 м), разположен на север от главното било и на запад от Шипченския проход.</p>\r\n<p>&nbsp;</p>\r\n<p>По време на Руско-турската война (1877-1878) в началото на август 1877 г. генерал Николай Столетов организира отбраната на Шипченския проход, като разполага Шипченския отряд (в който влизат и 1, 2, 3, 4 и 5 дружина на Българското опълчение) на връх Св. Никола, връх Орлово гнездо и връх Шипка. Решителните сражения се водят от 21 до 26 август 1877 г. Защитниците показват изключителен героизъм и въпреки численото превъзходство на противника, атаките са отблъснати.</p>\r\n<p>&nbsp;</p>\r\n<p>Паметникът на свободата на връх Шипка е сред 100 национални туристически обекта на БТС под номер 93. Печат има на касата.</p>', 17),
(62, 'hfjb', '<p>plovdiv <em><strong>place</strong></em></p>', 1),
(63, 'Eiffel Tower', '<p style=\"margin: 0.5em 0px; line-height: inherit; color: #252525; font-family: sans-serif;\">The&nbsp;<strong>Eiffel Tower</strong>&nbsp;(<span class=\"nowrap\" style=\"white-space: nowrap;\"><span class=\"IPA nopopups\"><a style=\"text-decoration: none !important; color: #0b0080; background: none;\" title=\"Help:IPA for English\" href=\"https://en.wikipedia.org/wiki/Help:IPA_for_English\">/<span style=\"border-bottom: 1px dotted;\"><span title=\"/ˈ/ primary stress follows\">ˈ</span><span title=\"/aɪ/ long \'i\' in \'tide\'\">aɪ</span><span title=\"\'f\' in \'find\'\">f</span><span title=\"/ə/ \'a\' in \'about\'\">ə</span><span title=\"\'l\' in \'lie\'\">l</span></span>&nbsp;<span style=\"border-bottom: 1px dotted;\"><span title=\"/ˈ/ primary stress follows\">ˈ</span><span title=\"\'t\' in \'tie\'\">t</span><span title=\"/aʊər/ \'our\' in \'hour\'\">aʊər</span></span>/</a></span></span>&nbsp;<span title=\"English pronunciation respelling\"><a style=\"text-decoration: none; color: #0b0080; background: none;\" title=\"Help:Pronunciation respelling key\" href=\"https://en.wikipedia.org/wiki/Help:Pronunciation_respelling_key\"><em><strong><span class=\"smallcaps\"><span style=\"font-variant-numeric: normal; font-variant-caps: small-caps; text-transform: lowercase;\">eye</span></span></strong>-fəl</em></a></span>&nbsp;<span title=\"English pronunciation respelling\"><a style=\"text-decoration: none; color: #0b0080; background: none;\" title=\"Help:Pronunciation respelling key\" href=\"https://en.wikipedia.org/wiki/Help:Pronunciation_respelling_key\"><em><strong><span class=\"smallcaps\"><span style=\"font-variant-numeric: normal; font-variant-caps: small-caps; text-transform: lowercase;\">towr</span></span></strong></em></a></span>;&nbsp;<a style=\"text-decoration: none; color: #0b0080; background: none;\" title=\"French language\" href=\"https://en.wikipedia.org/wiki/French_language\">French</a>:&nbsp;<span lang=\"fr\"><em>tour Eiffel</em></span>,&nbsp;<small style=\"font-size: 11.9px;\">pronounced:&nbsp;</small><span class=\"IPA\" title=\"Representation in the International Phonetic Alphabet (IPA)\"><a style=\"text-decoration: none !important; color: #0b0080; background: none;\" title=\"Help:IPA for French\" href=\"https://en.wikipedia.org/wiki/Help:IPA_for_French\">[tuʁ‿ɛfɛl]</a></span>&nbsp;<span class=\"unicode haudio\"><span class=\"fn\"><span style=\"white-space: nowrap;\"><a style=\"text-decoration: none; color: #0b0080; background: none;\" title=\"About this sound\" href=\"https://en.wikipedia.org/wiki/File:Tour_Eiffel_Pronunciation.ogg\"><img style=\"border: 0px; vertical-align: middle; margin: 0px;\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Loudspeaker.svg/11px-Loudspeaker.svg.png\" srcset=\"//upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Loudspeaker.svg/17px-Loudspeaker.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Loudspeaker.svg/22px-Loudspeaker.svg.png 2x\" alt=\"About this sound\" width=\"11\" height=\"11\" data-file-width=\"20\" data-file-height=\"20\" /></a>&nbsp;</span><a class=\"internal\" style=\"text-decoration: none; color: #0b0080; background: none;\" title=\"Tour Eiffel Pronunciation.ogg\" href=\"https://upload.wikimedia.org/wikipedia/commons/e/eb/Tour_Eiffel_Pronunciation.ogg\">listen</a></span></span>) is a&nbsp;<a style=\"text-decoration: none; color: #0b0080; background: none;\" title=\"Wrought iron\" href=\"https://en.wikipedia.org/wiki/Wrought_iron\">wrought iron</a>&nbsp;<a style=\"text-decoration: none; color: #0b0080; background: none;\" title=\"Lattice tower\" href=\"https://en.wikipedia.org/wiki/Lattice_tower\">lattice tower</a>&nbsp;on the&nbsp;<a style=\"color: #0b0080; background: none;\" title=\"Champ de Mars\" href=\"https://en.wikipedia.org/wiki/Champ_de_Mars\">Champ de Mars</a>&nbsp;in&nbsp;<a style=\"text-decoration: none; color: #0b0080; background: none;\" title=\"Paris\" href=\"https://en.wikipedia.org/wiki/Paris\">Paris</a>,&nbsp;<a style=\"text-decoration: none; color: #0b0080; background: none;\" title=\"France\" href=\"https://en.wikipedia.org/wiki/France\">France</a>. It is named after the engineer&nbsp;<a style=\"text-decoration: none; color: #0b0080; background: none;\" title=\"Gustave Eiffel\" href=\"https://en.wikipedia.org/wiki/Gustave_Eiffel\">Gustave Eiffel</a>, whose company designed and built the tower.</p>\r\n<p style=\"margin: 0.5em 0px; line-height: inherit; color: #252525; font-family: sans-serif;\">Constructed from 1887&ndash;89 as the entrance to the&nbsp;<a style=\"text-decoration: none; color: #0b0080; background: none;\" title=\"Exposition Universelle (1889)\" href=\"https://en.wikipedia.org/wiki/Exposition_Universelle_(1889)\">1889 World\'s Fair</a>, it was initially criticized by some of France\'s leading artists and intellectuals for its design, but it has become a global&nbsp;<a style=\"text-decoration: none; color: #0b0080; background: none;\" title=\"Cultural icon\" href=\"https://en.wikipedia.org/wiki/Cultural_icon\">cultural icon</a>&nbsp;of France and one of the most recognisable structures in the world.<sup id=\"cite_ref-Key_figures_3-0\" class=\"reference\" style=\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px;\"><a style=\"text-decoration: none; color: #0b0080; background: none;\" href=\"https://en.wikipedia.org/wiki/Eiffel_Tower#cite_note-Key_figures-3\">[3]</a></sup>&nbsp;The Eiffel Tower is the most-visited paid monument in the world; 6.91&nbsp;million people ascended it in 2015.</p>', 34),
(64, 'Античен театър', '<p style=\"margin: 0.5em 0px; line-height: inherit; color: #252525; font-family: sans-serif;\"><strong>Античният театър</strong>&nbsp;на&nbsp;<a class=\"mw-redirect\" style=\"text-decoration: none; color: #0b0080; background: none;\" title=\"Филипополис\" href=\"https://bg.wikipedia.org/wiki/%D0%A4%D0%B8%D0%BB%D0%B8%D0%BF%D0%BE%D0%BF%D0%BE%D0%BB%D0%B8%D1%81\">Филипополис</a>&nbsp;е сред най-добре запазените антични&nbsp;<a style=\"text-decoration: none; color: #0b0080; background: none;\" title=\"Театър\" href=\"https://bg.wikipedia.org/wiki/%D0%A2%D0%B5%D0%B0%D1%82%D1%8A%D1%80\">театри</a>&nbsp;в света и сред основните туристически атракции на&nbsp;<a style=\"text-decoration: none; color: #0b0080; background: none;\" title=\"Пловдив\" href=\"https://bg.wikipedia.org/wiki/%D0%9F%D0%BB%D0%BE%D0%B2%D0%B4%D0%B8%D0%B2\">Пловдив</a>. Построен е през 90-те години на първи век пр. Хр. и е разкрит при археологически разкопки от 1968 до 1979 г. от Археологически музей Пловдив. Разположен е между&nbsp;<a style=\"text-decoration: none; color: #0b0080; background: none;\" title=\"Джамбаз тепе\" href=\"https://bg.wikipedia.org/wiki/%D0%94%D0%B6%D0%B0%D0%BC%D0%B1%D0%B0%D0%B7_%D1%82%D0%B5%D0%BF%D0%B5\">Джамбаз тепе</a>&nbsp;и&nbsp;<a style=\"text-decoration: none; color: #0b0080; background: none;\" title=\"Таксим тепе\" href=\"https://bg.wikipedia.org/wiki/%D0%A2%D0%B0%D0%BA%D1%81%D0%B8%D0%BC_%D1%82%D0%B5%D0%BF%D0%B5\">Таксим тепе</a>. Театърът на&nbsp;<a style=\"text-decoration: none; color: #0b0080; background: none;\" title=\"Филипопол\" href=\"https://bg.wikipedia.org/wiki/%D0%A4%D0%B8%D0%BB%D0%B8%D0%BF%D0%BE%D0%BF%D0%BE%D0%BB\">Филипопол</a>&nbsp;e единствената запазена антична театрална сграда по българските земи. Сградата е адаптирана за съвременния културен живот на&nbsp;<a style=\"text-decoration: none; color: #0b0080; background: none;\" title=\"Пловдив\" href=\"https://bg.wikipedia.org/wiki/%D0%9F%D0%BB%D0%BE%D0%B2%D0%B4%D0%B8%D0%B2\">Пловдив</a>&nbsp;и в нея се провеждат различни по характер спектакли за около 3 500 зрители.<span id=\"cite_ref-1\" class=\"reference\" style=\"line-height: 1; vertical-align: baseline; font-size: 0.8em; position: relative; top: -0.4em; unicode-bidi: isolate; white-space: nowrap;\"><a style=\"text-decoration: none; color: #0b0080; background: none;\" href=\"https://bg.wikipedia.org/wiki/%D0%90%D0%BD%D1%82%D0%B8%D1%87%D0%B5%D0%BD_%D1%82%D0%B5%D0%B0%D1%82%D1%8A%D1%80_(%D0%9F%D0%BB%D0%BE%D0%B2%D0%B4%D0%B8%D0%B2)#cite_note-1\">[1]</a></span>&nbsp;Обявен е за археологически паметник в брой. 6 на Държавен вестник от 1995 г.</p>\r\n<p style=\"margin: 0.5em 0px; line-height: inherit; color: #252525; font-family: sans-serif;\">Античният театър е известен погрешно като &bdquo;Амфитеатъра&ldquo;, което е друг вид антична постройка (<a style=\"text-decoration: none; color: #0b0080; background: none;\" title=\"Амфитеатър\" href=\"https://bg.wikipedia.org/wiki/%D0%90%D0%BC%D1%84%D0%B8%D1%82%D0%B5%D0%B0%D1%82%D1%8A%D1%80\">амфитеатър</a>).</p>', 17);

-- --------------------------------------------------------

--
-- Структура на таблица `landmarks_images`
--

CREATE TABLE `landmarks_images` (
  `id` int(11) NOT NULL,
  `landmark_id` int(11) DEFAULT NULL,
  `path` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Схема на данните от таблица `landmarks_images`
--

INSERT INTO `landmarks_images` (`id`, `landmark_id`, `path`) VALUES
(1, 2, 'landmarks_photo/great_wall.jpg'),
(2, 2, 'landmarks_photo/great_wall2.jpg'),
(10, 42, 'landmarks_photo/grand_canyon_617_347.jpg'),
(12, 42, 'landmarks_photo/iStock_000042545368_Full.jpg'),
(13, 43, 'landmarks_photo/550054.jpg'),
(14, 43, 'landmarks_photo/Everest.-Film-2015_006.jpg'),
(15, 43, 'landmarks_photo/Everest_kalapatthar_crop.jpg'),
(16, 44, 'landmarks_photo/1024px-3Falls_Niagara.jpg'),
(17, 44, 'landmarks_photo/large.jpg'),
(18, 44, 'landmarks_photo/maxresdefault.jpg'),
(30, 62, 'landmarks_photo/Chrysanthemum.jpg'),
(31, 62, 'landmarks_photo/Desert.jpg'),
(32, 62, 'landmarks_photo/Hydrangeas.jpg'),
(33, 62, 'landmarks_photo/Jellyfish.jpg'),
(34, 62, 'landmarks_photo/Koala.jpg'),
(35, 62, 'landmarks_photo/Lighthouse.jpg'),
(36, 62, 'landmarks_photo/Penguins.jpg'),
(37, 62, 'landmarks_photo/Tulips.jpg'),
(38, 63, 'landmarks_photo/gallery-1444338501-eiffel-tower-at-night.jpg'),
(39, 63, 'landmarks_photo/РёР·С‚РµРіР»РµРЅ С„Р°Р№Р».jpg'),
(40, 64, 'landmarks_photo/Bulgaria_Bulgaria-0785_-_Roman_Theatre_of_Philippopolis_(7432772486).jpg'),
(41, 42, 'landmarks_photo/d2b9e107378b3d581d2847c46b9421a1.jpg'),
(42, 1, 'landmarks_photo/konnika08.05.2005.jpg'),
(57, 61, 'landmarks_photo/100_Shipka.jpeg');

-- --------------------------------------------------------

--
-- Структура на таблица `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `landmark_id` int(11) DEFAULT NULL,
  `comment` text,
  `date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Схема на данните от таблица `tags`
--

INSERT INTO `tags` (`id`, `user_id`, `landmark_id`, `comment`, `date`) VALUES
(5, 5, 61, 'pseudo cooment', '08-05-2017'),
(6, 5, 42, 'pseudo cooment', '13-05-2017'),
(7, 5, 61, 'pseudo cooment', '13-05-2017'),
(8, 5, 61, 'pseudo cooment', '13-05-2017'),
(9, 5, 43, 'pseudo cooment', '16-05-2017'),
(10, 1, 61, 'pseudo cooment', '16-05-2017'),
(11, 1, 61, 'pseudo cooment', '16-05-2017'),
(12, 1, 44, 'pseudo cooment', '16-05-2017'),
(13, 5, 64, 'pseudo cooment', '20-05-2017'),
(14, 5, 64, 'pseudo cooment', '20-05-2017'),
(15, 5, 2, 'pseudo cooment', '27-05-2017'),
(16, 18, 61, 'pseudo cooment', '28-05-2017'),
(17, 18, 42, 'pseudo cooment', '28-05-2017'),
(18, 18, 44, 'pseudo cooment', '28-05-2017'),
(19, 5, 42, 'pseudo cooment', '28-05-2017');

-- --------------------------------------------------------

--
-- Структура на таблица `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(60) NOT NULL,
  `role` varchar(45) NOT NULL,
  `image` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Схема на данните от таблица `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `image`) VALUES
(1, 'admin', 'admin@admin.com', 'qwerty', 'admin', '1_Anonymous.png'),
(2, 'dasda', 'qwerty', 'dsfsfsd@ssadas.com', 'user', NULL),
(3, 'asdadad', 'qwerty', 'test@dadas.com', 'user', NULL),
(4, 'testest', 'qwerty', 'test@dadas.com', 'user', NULL),
(5, 'ivan', 'ivan@abv.bg', 'qwerty', 'user', '5_5_Penguins.jpg'),
(6, 'dsadasda', 'dsaas@sdasda.com', 'qwerty', 'user', NULL),
(7, '&#1060;&#1080;&#1076;&#1072;&#1085;&#1095;&#1077;&#1090;&#1086;', 'fidanka@abv.bg', 'qwerty', 'user', NULL),
(8, '&#1057;&#1087;&#1080;&#1085;&#1076;&#1077;&#1088;&#1084;&#1072;&#1072;&#1085;', 'spinder@abv.bg', 'qwerty', 'user', NULL),
(9, 'test', 'test@test.com', 'qwerty', 'user', NULL),
(10, 'test2', 'test2@test.com', 'qwerty', 'user', NULL),
(11, 'asads', 'asd@asd.com', 'qwerty', 'user', NULL),
(12, 'asd1', 'asd1@test.com', 'qwerty', 'user', NULL),
(13, 'dasdad', 'test@test123.com', 'qwerty', 'user', NULL),
(14, 'sdaa', 'test22@test.com', 'qwerty', 'user', NULL),
(15, 'dasdasd@eada.com', 'qwerty@dasda.com', 'qwerty', 'user', NULL),
(16, 'dfsfsfsd', 'dasdsa@das.com', 'qwerty', 'user', NULL),
(17, 'dasda', 'dasdas@casdasd.com', 'qwerty', 'user', NULL),
(18, 'daniela', 'daniela@abv.bg', 'qwerty', 'user', '18_5_Tulips.jpg');

-- --------------------------------------------------------

--
-- Структура на таблица `user_landmarks`
--

CREATE TABLE `user_landmarks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `landmark_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Схема на данните от таблица `user_landmarks`
--

INSERT INTO `user_landmarks` (`id`, `user_id`, `landmark_id`) VALUES
(26, 1, 1),
(27, 1, 64),
(3, 5, 2),
(6, 5, 42),
(19, 5, 43),
(7, 8, 1),
(9, 8, 2),
(8, 8, 42),
(24, 8, 61),
(13, 9, 2),
(14, 9, 42),
(15, 9, 44),
(17, 10, 2),
(16, 10, 42),
(20, 11, 42),
(21, 12, 61),
(23, 13, 44),
(22, 13, 61),
(25, 14, 61),
(28, 15, 61),
(30, 16, 44),
(29, 16, 61),
(32, 18, 42),
(31, 18, 61);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `landmarks`
--
ALTER TABLE `landmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `c_id_idx` (`country_id`);

--
-- Indexes for table `landmarks_images`
--
ALTER TABLE `landmarks_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `l_id_idx` (`landmark_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_landmarks`
--
ALTER TABLE `user_landmarks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `INDEX` (`user_id`,`landmark_id`),
  ADD KEY `u_id_idx` (`user_id`),
  ADD KEY `l_id_idx` (`landmark_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `landmarks`
--
ALTER TABLE `landmarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `landmarks_images`
--
ALTER TABLE `landmarks_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `user_landmarks`
--
ALTER TABLE `user_landmarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- Ограничения за дъмпнати таблици
--

--
-- Ограничения за таблица `landmarks`
--
ALTER TABLE `landmarks`
  ADD CONSTRAINT `c_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения за таблица `landmarks_images`
--
ALTER TABLE `landmarks_images`
  ADD CONSTRAINT `l_id` FOREIGN KEY (`landmark_id`) REFERENCES `landmarks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения за таблица `user_landmarks`
--
ALTER TABLE `user_landmarks`
  ADD CONSTRAINT `l_id2` FOREIGN KEY (`landmark_id`) REFERENCES `landmarks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `u_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
