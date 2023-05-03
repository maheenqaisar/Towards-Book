-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 11, 2023 at 08:53 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `BookCollection`
--

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_img` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`id`, `category_name`, `category_img`) VALUES
(1, 'Fiction', 'http://localhost/BookCollection/CategoryAssets/Fiction.png'),
(2, 'Romance', 'http://localhost/BookCollection/CategoryAssets/Romance.png'),
(3, 'Poetry', 'http://localhost/BookCollection/CategoryAssets/Poetry.png'),
(4, 'Fantasy', 'http://localhost/BookCollection/CategoryAssets/Fantasy.png'),
(5, 'Memories', 'http://localhost/BookCollection/CategoryAssets/Memories.png'),
(6, 'Cooking', 'http://localhost/BookCollection/CategoryAssets/Cooking.png'),
(7, 'Sports', 'http://localhost/BookCollection/CategoryAssets/Sports.png'),
(8, 'Travel', 'http://localhost/BookCollection/CategoryAssets/Travel.png'),
(9, 'Art', 'http://localhost/BookCollection/CategoryAssets/Art.png'),
(10, 'Food', 'http://localhost/BookCollection/CategoryAssets/Food.png'),
(11, 'Mind', 'http://localhost/BookCollection/CategoryAssets/Mind.png');

-- --------------------------------------------------------

--
-- Table structure for table `Favorites`
--

CREATE TABLE `Favorites` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Favorites`
--

INSERT INTO `Favorites` (`id`, `productId`, `userId`) VALUES
(1, 2, 1),
(2, 11, 1),
(3, 12, 1),
(4, 13, 1),
(5, 14, 1),
(6, 3, 1),
(7, 8, 1),
(8, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Popular`
--

CREATE TABLE `Popular` (
  `id` int(11) NOT NULL,
  `popular_name` varchar(100) NOT NULL,
  `popular_description` varchar(5000) NOT NULL,
  `popular_img` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Popular`
--

INSERT INTO `Popular` (`id`, `popular_name`, `popular_description`, `popular_img`) VALUES
(1, 'Tana French', 'American-Irish writer known for her crime fiction novel.', 'http://localhost/BookCollection/PopularCategoryAssets/TanaFrench.png'),
(2, 'Stephen King', 'Stephen King unveiled some of his favorite books. ', 'http://localhost/BookCollection/PopularCategoryAssets/StephenKing.png'),
(3, 'Amy Tan', 'Amy Tan has explored intergenerational familial relationships.', 'http://localhost/BookCollection/PopularCategoryAssets/AmyTan.png'),
(4, 'Atul Gawande', 'Known for being an American surgeon and public health researcher.', 'http://localhost/BookCollection/PopularCategoryAssets/AtulGawande.png'),
(5, 'Brit Bennett', 'Brit Bennett has become a reckoning force with her debut novel.', 'http://localhost/BookCollection/PopularCategoryAssets/BritBennett.png'),
(6, 'Danzy Senna', 'She has won many awards, including a Whiting Award.', 'http://localhost/BookCollection/PopularCategoryAssets/DanzySenna.png'),
(7, 'George R.R Martin', 'American novelist and short-story writer in the fantasy and many more.', 'http://localhost/BookCollection/PopularCategoryAssets/George.png'),
(8, 'George Saunders', 'Best known for his novellas and children’s books.', 'http://localhost/BookCollection/PopularCategoryAssets/GeorgeSaunders.png'),
(9, 'Gillian Flynn', 'The American author has become a force to reckon with in the literary world.', 'http://localhost/BookCollection/PopularCategoryAssets/GillianFlynn.png'),
(10, 'William Shakesper ', 'William Shakespeare was an English playwright, poet and actor.', 'http://localhost/BookCollection/PopularCategoryAssets/WilliamShakesper.png'),
(11, 'Ken Follett', 'He has written Spy thrillers including Edge of Eternity.', 'http://localhost/BookCollection/PopularCategoryAssets/KenFollett.png'),
(12, 'J.K. Rowling', 'Harry Potter series has become the favorite book of peoples.', 'http://localhost/BookCollection/PopularCategoryAssets/Rowling.png'),
(13, 'Khaled Hosseini', 'Khaled Hosseini is known for his many bestseller novels.', 'http://localhost/BookCollection/PopularCategoryAssets/KhaledHosseini.png');

-- --------------------------------------------------------

--
-- Table structure for table `PopularFavorites`
--

CREATE TABLE `PopularFavorites` (
  `id` int(11) NOT NULL,
  `popularproductId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `PopularFavorites`
--

INSERT INTO `PopularFavorites` (`id`, `popularproductId`, `userId`) VALUES
(1, 6, 1),
(2, 33, 1),
(3, 10, 1),
(4, 1, 1),
(5, 34, 1),
(6, 15, 1),
(7, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `PopularProduct`
--

CREATE TABLE `PopularProduct` (
  `id` int(11) NOT NULL,
  `Popular_id` int(11) NOT NULL,
  `PopularProduct_name` varchar(250) NOT NULL,
  `popular_descrb` varchar(5000) NOT NULL,
  `price` tinytext NOT NULL,
  `img` varchar(1000) NOT NULL,
  `link` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `PopularProduct`
--

INSERT INTO `PopularProduct` (`id`, `Popular_id`, `PopularProduct_name`, `popular_descrb`, `price`, `img`, `link`) VALUES
(1, 1, 'A Florida Sketch-Book', 'None', '6.44', 'http://localhost/BookCollection/PopularCategoryAssets/cover-59608.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/A-Florida-Sketch-Book.pdf'),
(2, 1, 'A Ramblers lease', 'None', '10.30', 'http://localhost/BookCollection/PopularCategoryAssets/cover-36173.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/A-Ramblers-lease.pdf'),
(3, 1, 'Spring notes from Tennessee', 'None', '8.99', 'http://localhost/BookCollection/PopularCategoryAssets/cover-45708.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/Spring-notes-from-Tennessee.pdf'),
(4, 1, 'The Foot-path Way', 'None', '10.12', 'http://localhost/BookCollection/PopularCategoryAssets/cover-orig-22661.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/The-Foot-path-Way.pdf'),
(5, 2, 'Different season', 'Different Seasons is a collection of four horror novellas by Stephen King. First published in 1982, the collection takes place over four seasons, moving from a man seeking revenge after wrongful imprisonment to a woman fighting against death.', '10.22', 'http://localhost/BookCollection/PopularCategoryAssets/Stephenkingdifferentseason.jpeg', 'http://localhost/BookCollection/PopularCategoryAssets/Differentseason.pdf'),
(6, 2, 'Needful Things', 'Needful Things is a 1991 horror novel by American author Stephen King. It is the first novel King wrote after his rehabilitation from drug and alcohol addiction. It was made into a film of the same name in 1993 which was directed by Fraser C. Heston.', '12.32', 'http://localhost/BookCollection/PopularCategoryAssets/needful-things-9781501147418_hr.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/Needful_things.pdf'),
(7, 2, 'Nightmares & Dreamscapes', 'Includes the story “It Grows on You”—set in the fictional town of Castle Rock, Maine. The classic short story collection from #1 New York Times bestselling author Stephen King.', '8.20', 'http://localhost/BookCollection/PopularCategoryAssets/nightmarestephen.png', 'http://localhost/BookCollection/PopularCategoryAssets/Nightmareanddreams.pdf'),
(8, 3, 'Twentieth-Century Literature in English', 'Oxford Companions are known for their authority, comprehensiveness, and browsability the best reference books in the language according to Harpers. Perhaps the most well-known Companion of all has been The Oxford Companion to English Literature, now in its revised fifth edition.', '2.77', 'http://localhost/BookCollection/PopularCategoryAssets/51Shh0ax2BL._SY291_BO1,204,203,200_QL40_FMwebp_.webp', 'http://localhost/BookCollection/PopularCategoryAssets/Twentieth-Century.pdf'),
(9, 3, 'THE KITCHEN GODS WIFE', 'Winnie and Helen have kept each others worst secrets for more than fifty years. Now, because she believes she is dying, Helen wants to expose everything. And Winnie angrily determines that she must be the one to tell her daughter, Pearl, about the past—including the terrible truth even Helen does not know. And so begins Winnies story of her life on a small island outside Shanghai in the 1920s, and other places in China during World War II, and traces the happy and desperate events that led to Winnies coming to America in 1949. ', '9.45', 'http://localhost/BookCollection/PopularCategoryAssets/12557._SY475_.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/Kitechengodwife.pdf'),
(10, 4, 'Being Mortal', 'Being Mortal: Medicine and What Matters in the End are a 2014 non-fiction book by American surgeon Atul Gawande. The book addresses end-of-life care and hospice care and contains Gawandes reflections and personal stories. He suggests that medical care should focus on well-being rather than survival.', '2.31', 'http://localhost/BookCollection/PopularCategoryAssets/51rX8pT2fWL.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/BeingMortalMedicine.pdf'),
(11, 4, 'Better', 'In this book, Atul Gawande explores how doctors strive to close the gap between best intentions and best performance in the face of obstacles that sometimes seem insurmountable.', '2.63', 'http://localhost/BookCollection/PopularCategoryAssets/213233._SX318_.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/Better.pdf'),
(12, 4, 'Complications', 'Complications: A Surgeons Notes on an Imperfect Science is a collection of stories based on the experiences of a surgical resident at a major teaching hospital in Boston. The author, Atul Gawande, M.D., presents a refreshingly humanistic approach to both surgery and to the care of patients in general.', '1.00', 'http://localhost/BookCollection/PopularCategoryAssets/4477.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/Complications.pdf'),
(13, 4, 'The Checklist Manifesto', 'The Checklist Manifesto chronicles Gawandes discoveries about checklists, the insights he learned from various industries and his personal experiences, with specific tips and examples on how you can develop and use checklists.', '1.00', 'http://localhost/BookCollection/PopularCategoryAssets/4147ot1F09L.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/Checklist.pdf'),
(14, 7, 'A Dance with Dragons', 'A Dance with Dragons is the fifth novel of seven planned in the epic fantasy series A Song of Ice and Fire by American author George R. R. Martin. In some areas, the paperback edition was published in two parts, titled Dreams and Dust and After the Feast.', '3.11', 'http://localhost/BookCollection/PopularCategoryAssets/download.jpeg', 'http://localhost/BookCollection/PopularCategoryAssets/dancewithdragon.pdf'),
(15, 7, 'Game of Thrones: A Feast for Crows', 'Crows will fight over a dead mans flesh, and kill each other for his eyes.\r\nBloodthirsty, treacherous and cunning, the Lannisters are in power on the Iron Throne in the name of the boy-king Tommen. The war in the Seven Kingdoms has burned itself out, but in its bitter aftermath new conflicts spark to life.', '12.34', 'http://localhost/BookCollection/PopularCategoryAssets/13497._SY475_.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/AFeastCrows.pdf'),
(16, 7, 'A Storm of Swords', 'Here is the third volume in George R. R. Martins magnificent cycle of novels that includes A Game of Thrones and A Clash of Kings. As a whole, this series comprises a genuine masterpiece of modern fantasy, bringing together the best the genre has to offer. Magic, mystery, intrigue, romance, and adventure fill these pages and transport us to a world unlike any we have ever experienced. Already hailed as a classic, George R. R. Martin’s stunning series is destined to stand as one of the great achievements of imaginative fiction.', '4.00', 'http://localhost/BookCollection/PopularCategoryAssets/9780553573428.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/AStormofSwords.pdf'),
(17, 7, 'A Clash of Kings', 'A Clash of Kings depicts the Seven Kingdoms of Westeros in civil war, while the Nights Watch mounts a reconnaissance to investigate the mysterious people known as wildlings. Meanwhile, Daenerys Targaryen continues her plan to conquer the Seven Kingdoms.', '4.74', 'http://localhost/BookCollection/PopularCategoryAssets/a-clash-of-kings-book-buy-1', 'http://localhost/BookCollection/PopularCategoryAssets/ClashofKings.pdf'),
(18, 7, 'The Hedge Knight: The Graphic Novel', 'In this comic book/graphic novel adaptation set one hundred years before the events in George R.R. Martins epic fantasy series, A Song of Ice and Fire, The Hedge Knight chronicles a young squire as he travels the cruel and complex path to knighthood in the Seven Kingdoms.', '2.98', 'http://localhost/BookCollection/PopularCategoryAssets/61nLLByF1zS.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/ThehedgeNovel.pdf'),
(19, 9, 'Dark Places', 'Dark Places is a mystery novel by Gillian Flynn published in 2009. The novel deals with class issues in rural America, intense poverty and the Satanic cult hysteria that swept the United States in the 1980s.', '15.22', 'http://localhost/BookCollection/PopularCategoryAssets/91_d16bI4xL_3ca185ad-9709-41a1-a408-eed238797d5d_2000x.webp', 'http://localhost/BookCollection/PopularCategoryAssets/darkplaces.pdf'),
(20, 9, 'Gone Girl', 'Gone Girl by Gillian Flynn centers its story about Nick and Amy Dunnes strained marriage relationship. Nick used to work as a journalist, but loses his job. With his broke financial status, Nick decides to relocate from New York City to his smaller home town, North Carthage.', '11.89', 'http://localhost/BookCollection/PopularCategoryAssets/71Q0+4VG1YL.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/GoneGirl.pdf'),
(21, 9, 'Sharp Objects', 'Fresh from a brief stay at a psych hospital, reporter Camille Preaker faces a troubling assignment: she must return to her tiny hometown to cover the murders of two preteen girls.', '12.44', 'http://localhost/BookCollection/PopularCategoryAssets/9780753822210-640x996.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/SharpObject.pdf'),
(22, 12, 'Fantastic Beasts and Where to Find Them', 'Fantastic Beasts & Where to Find Them first appeared as the title of one of Harry Potters school books within the novels. It was published by Bloomsbury Childrens Books and Scholastic along with Quidditch Through The Ages in March 2001 in aid of Comic Relief.', '12.44', 'http://localhost/BookCollection/PopularCategoryAssets/51rVHgjc2aL.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/Fantasticbeast.pdf'),
(23, 12, 'Fantastic Beasts: The Crimes of Grindelwald ― The Original Screenplay (Harry Potter)', 'At the end of Fantastic Beasts and Where to Find Them, the powerful Dark wizard Gellert Grindelwald was captured in New York with the help of Newt Scamander. But, making good on his threat, Grindelwald escapes custody and sets about gathering followers, most unsuspecting of his true agenda: to raise pure-blood wizards up to rule over all non-magical beings. In an effort to thwart Grindelwald’s plans, Albus Dumbledore enlists Newt, his former Hogwarts student, who agrees to help once again, unaware of the dangers that lie ahead. Lines are drawn as love and loyalty are tested, even among the truest friends and family, in an increasingly divided wizarding world. This second original screenplay from J.K. Rowling, illustrated with stunning line art from MinaLima, expands on earlier events that helped shape the wizarding world, with some surprising nods to the Harry Potter stories that will delight fans of both the books and films.', '11.23', 'http://localhost/BookCollection/PopularCategoryAssets/9781408711705.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/thecrime.pdf'),
(24, 12, 'Harry Potter and the Cursed Child', 'Harry Potter and the Cursed Child is a play written by Jack Thorne from an original story by J. K. Rowling, John Tiffany, and Thorne. Previews of the play began at the Palace Theatre, London, on 7 June 2016 as a two-part play, and it premiered on 30 July 2016.', '12.66', 'http://localhost/BookCollection/PopularCategoryAssets/Cursed_Child_new_poster.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/Happrypotter.pdf'),
(25, 12, 'Quidditch Through the Ages', 'An overview of the most popular sport in the wizarding world details required equipment and rules of play, examining the evolution of quidditch as well as the finer points of modern play.', '34.22', 'http://localhost/BookCollection/PopularCategoryAssets/111450.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/quidditch.pdf'),
(26, 12, 'The Tales of Beedle the Bard', 'The Tales of Beedle the Bard is a book of childrens stories by the author J. K. Rowling. There is a storybook of the same name mentioned in Harry Potter and the Deathly Hallows, the last book of the Harry Potter series.', '15.33', 'http://localhost/BookCollection/PopularCategoryAssets/9781408883099.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/thetale.pdf'),
(27, 13, 'A Thousand Splendid Suns', 'The epic story of three generations of Afghan women and their remarkable resilience, A Thousand Splendid Suns is set in the war-torn neighborhoods of 1990s Kabul. When battle upends her family, beautiful Laila must seek shelter, first in the home and then in the arms of her older neighbors.', '12.34', 'http://localhost/BookCollection/PopularCategoryAssets/9781526604767-8-640x996.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/AhousandSplendi.pdf'),
(28, 13, 'Sea Prayer', 'A short, powerful, illustrated book written by Khaled Hosseini in response to the current refugee crisis, Sea Prayer is composed in the form of a letter, from a father to his son, on the eve of their journey. Watching over his sleeping son, the father reflects on the dangerous sea-crossing that lies before them. It is also a vivid portrait of their life in Homs, Syria, before the war, and of that citys swift transformation from a home into a deadly war zone.', '12.22', 'http://localhost/BookCollection/PopularCategoryAssets/38664775._SY475_.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/seaplayers.pdf'),
(29, 13, 'The Kite Runner Graphic Novel', 'The Kite Runner, written by Khaled Hosseini, tells the extraordinary story of an unlikely friendship between a wealthy Afghan boy, named Amir, and Hassan, the son of his fathers servant — who he later finds out, after Hassan death, has always been his half-brother.', '12.33', 'http://localhost/BookCollection/PopularCategoryAssets/81p7Fgu66FL._AC_UL900_SR615,900_.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/kiterunner.pdf'),
(30, 10, 'A Midsummer Night Dream', 'The dominant theme in A Midsummer Night Dream is love, a subject to which Shakespeare returns constantly in his comedies. Shakespeare explores how people tend to fall in love with those who appear beautiful to them.', '5.33', 'http://localhost/BookCollection/PopularCategoryAssets/52512001.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/Midsummer.PDF'),
(31, 10, 'Romeo and Juliet', 'According to the legend, Romeo and Juliet met at a masquerade ball, fell in love and decided to get married in secret, against the will of their two rival families. But a cruel fate seemed to be plotting against their happiness. Juliets cousin Tybalt, during a street brawl kills Romeos best friend Mercutio.', '12.33', 'http://localhost/BookCollection/PopularCategoryAssets/KH12Khz4jKmutRboZRJQUQuL9DKAffO7wt5GflY-52w-MEDIUM.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/romeoandjuilet.pdf'),
(32, 10, 'CliffsComplete Shakespeares Hamlet', 'In the CliffsComplete guides, the novels complete text and a glossary appear side-by-side with coordinating numbered lines to help you understand unusual words and phrasing. You will also find all the commentary and resources of a standard CliffsNotes for Literature.', '0.00', 'http://localhost/BookCollection/PopularCategoryAssets/41ERCSEH2AL.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/helmat.pdf'),
(33, 5, 'The Vanishing Half', 'The Vanishing Half highlights the human tendency to yearn for support and companionship. As identical twins, Desiree and Stella are used to depending on each other, especially in the aftermath of their father murder. However, the novel suggests that companionship shouldnt be taken for granted.', '12.44', 'http://localhost/BookCollection/PopularCategoryAssets/51791252.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/The-Vanishing.pdf'),
(34, 6, 'Caucasia', 'Birdie and Cole are the daughters of a black father and a white mother, intellectuals and activists in the Civil Rights Movement in 1970s Boston. The sisters are so close that they speak their own language, yet Birdie, with her light skin and straight hair, is often mistaken for white, while Cole is dark enough to fit in with the other kids at school. Despite their differences, Cole is Birdie’s confidant, her protector, the mirror by which she understands herself. Then their parents’ marriage collapses. One night Birdie watches her father and his new girlfriend drive away with Cole. Soon Birdie and her mother are on the road as well, drifting across the country in search of a new home. But for Birdie, home will always be Cole. Haunted by the loss of her sister, she sets out a desperate search for the family that left her behind.', '0.00', 'http://localhost/BookCollection/PopularCategoryAssets/512k9r1dzRL._AC_SY1000_.jpg', 'http://localhost/BookCollection/PopularCategoryAssets/ThePassingNovel.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `Product_name` varchar(100) NOT NULL,
  `category_descrb` varchar(5000) NOT NULL,
  `price` tinytext NOT NULL,
  `img` varchar(1000) NOT NULL,
  `link` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`id`, `category_id`, `Product_name`, `category_descrb`, `price`, `img`, `link`) VALUES
(1, 1, 'Lord of the Flies', 'At the dawn of the next world war, a plane crashes on an uncharted island, stranding a group of schoolboys. At first, with no adult supervision, their freedom is something to celebrate. This far from civilization they can do anything they want. Anything. But as order collapses, as strange howls echo in the night, as terror begins its reign, the hope of adventure seems as far removed from reality as the hope of being rescued.', '5.20', 'http://localhost/BookCollection/CategoryAssets/LordOfFiles.jpg', 'http://localhost/BookCollection/CategoryAssets/LordOfFiles.pdf'),
(2, 1, 'The Adventures of Sherlock Holmes', 'A delight for a public which enjoys incident, mystery, and above all that matching of the wits of a clever man against the dumb resistance of the secrecy of inanimate things, which results in the triumph of the human intelligence.', '5.20', 'http://localhost/BookCollection/CategoryAssets/adventures-of-sherlock-holmes-redux.jpg', 'http://localhost/BookCollection/CategoryAssets/The-Adventures-of-Sherlock-Holmes.pdf'),
(3, 2, 'The Romance of the Forest', 'Interspersed with some Pieces of Poetry.', '12.40', 'http://localhost/BookCollection/CategoryAssets/cover-cust-11595.jpg', 'http://localhost/BookCollection/CategoryAssets/The-Romance-of-the-Forest.pdf'),
(4, 2, 'The Wagnerian Romances', 'The attempt has been made in the following to give an idea of the charm and interest of the original text of the Wagner operas, of Wagner extraordinary power and fertility as a dramatist. It is not critique or commentary, it is presentation, picture, narrative; it offers nothing that is not derived directly and exclusively from the Wagner libretti and scores.', '7.60', 'http://localhost/BookCollection/CategoryAssets/cover-orig-22646.jpg', 'http://localhost/BookCollection/CategoryAssets/The-Wagnerian-Romances.pdf'),
(5, 3, 'The Art of English Poetry (1708)', 'to give. Now I imagin that a Man might have both these, and yet sometimes, for the sake of a Syllable or two more or less, to give a Verse its true Measure, be at a stand for Epithets and Synonymes, with which I have seen Books of this Nature in several Languages plentifully furnished.', '11.00', 'http://localhost/BookCollection/CategoryAssets/cover-auto-30338.jpg', 'http://localhost/BookCollection/CategoryAssets/The-Art-of-English-Poetry-1708.pdf'),
(6, 3, 'Satires, Epistles, and Art of Poetry', 'f writing. Here it is that the imitator has the advantage of the translator: a certain parallelism between his own time and the time of the author he imitates is postulated in the fact of his imitating at all, and if he is a dexterous writer, like Pope or Johnson, he is sure to be able to introduce a number of small equivalents, some of them perhaps actual improvements on the original, while he is at liberty to throw into the shade those points of which he despairs of being able to make anything.', '9.12', 'http://localhost/BookCollection/CategoryAssets/cover-auto-3647.jpg', 'http://localhost/BookCollection/CategoryAssets/Satires-Epistles-and-Art-of-Poetry.pdf'),
(7, 4, 'The Call of Cthulhu', 'Three independent narratives linked together by the device of a narrator discovering notes left by a deceased relative. Piecing together the whole truth and disturbing significance of the information he possesses, the narrators final line is The most merciful thing in the world, I think, is the inability of the human mind to correlate all its contents.', '4.12', 'http://localhost/BookCollection/CategoryAssets/cover-cust-13095.jpg', 'http://localhost/BookCollection/CategoryAssets/The-Call-of-Cthulhu.pdf'),
(8, 4, 'Healing Her Heart', 'Dr. Gabe Allen has a rule about dating colleagues but when he meets ER nurse Larissa Brockman he is tempted to break his vow. Larissa faith draws him back to the church he would left behind, but when their lives are on the line Gabe discovers that Larissa is the one who needs to learn about the true meaning of forgiveness. And only Gabe can help heal her heart.', '12.33', 'http://localhost/BookCollection/CategoryAssets/LauraScott_HealingHerHeart_2500.jpg', 'http://localhost/BookCollection/CategoryAssets/Healing-Her-Heart.pdf'),
(9, 5, 'Assimilative Memory', 'Assimilative Memory By Marcus Dwight Larrowe Here we see that there is nothing in common in the meaning of the words, but there is the syllable \"Par\" belonging to both alike. It is the same in spelling in both words, and virtually the same in pronunciation, the same by Sight and by sound, represented by In. by capital S for In. by sight, and In.', '40.12', 'http://localhost/BookCollection/CategoryAssets/cover-auto-20789.jpg', 'http://localhost/BookCollection/CategoryAssets/Assimilative-Memory.pdf'),
(10, 5, 'Memorials of Old Lincolnshire', 'In this book, Annie Matheson discusses the life and legacy of the great Florence Nightingale considered as the first nurse theorist. It discusses the principles held by this incredible woman and her impact on the world of nursing and education. Read to understand and follow the path of great leaders like Florence Nightingale.', '10.53', 'http://localhost/BookCollection/CategoryAssets/cover-65653.jpg', 'http://localhost/BookCollection/CategoryAssets/Memorials-of-Old-Lincolnshire.pdf'),
(11, 6, 'Captain Cook', 'This book is not a series of fictitious adventures of the great Captain Cook, the eighteenth century navigator and explorer, but a straightforward statement of his life and achievements. It is therefore more of a biography than an adventure book for boys. However, the man was so great that his biography can indeed be read as a well-written book of adventures.', '15.00', 'http://localhost/BookCollection/CategoryAssets/cover-orig-20233.jpg', 'http://localhost/BookCollection/CategoryAssets/Captain-Cook.pdf'),
(12, 6, 'Cloud City Cook-Book', 'Cloud City Cook-Book is a work by Mrs. William H. Nash. A cookbook brimming with interesting recipes from Colorado, USA. Wets the appetite for lover of gourmet food!', '10.40', 'http://localhost/BookCollection/CategoryAssets/cover-35506.jpg', 'http://localhost/BookCollection/CategoryAssets/Cloud-City-Cook-Book.pdf'),
(13, 7, 'An Almanac of Twelve Sports', 'An album of twelve wood cuts by William Nicholson and verses by Rudyard Kipling, with a calendar for 1898', '12.99', 'http://localhost/BookCollection/CategoryAssets/cover-orig-29334.jpg', 'http://localhost/BookCollection/CategoryAssets/An-Almanac-of-Twelve-Sports.pdf'),
(14, 7, 'Life and Sport in China', 'Oliver George Ready was the author of: Life and Sport in China (1904), Chun-Kwang: A Tale of Chinese Love and Tragedy (1905), Countryman on the Broads (1910) and Life and Sport on the Norfolk Broads (1910). In this little work I have endeavoured to place before readers a sketch of things as I saw them, and to convey to their minds an idea of how Europeans live there, of their amusements, of their work, and of those things which are matters of daily interest to them, so that my book may serve as a kind of preface to that enthralling volume, the current history of China, as it is daily revealed in the press, in magazines and in learned works.', '12.77', 'http://localhost/BookCollection/CategoryAssets/cover-orig-21859.jpg', 'http://localhost/BookCollection/CategoryAssets/Life-and-Sport-in-China.pdf'),
(15, 8, 'Travels in Alaska', 'Descriptions glowing with color, thrilling stories of adventures on mountains, glaciers, and the sea, and sympathetic accounts of the life of the Indians make this account of the wonders of our Northern possessions one of the most interesting of recent travel books, while as the crowning volume of Muirs works it will take and hold a permanent place in American literature.', '8.99', 'http://localhost/BookCollection/CategoryAssets/cover-orig-5222.jpg', 'http://localhost/BookCollection/CategoryAssets/Travels-in-Alaska.pdf'),
(16, 8, 'Gullibles Travels', 'Five long short stories--excerpts from the life of one zany couple--detail the traumas of breaking into society, a visit from a maiden sister, an evening at the opera, and a couple of exceptional games of bridge, all told in the popular, uncultured vernacular of early twentieth century Chicago.', '7.40', 'http://localhost/BookCollection/CategoryAssets/cover-cust-10885.jpg', 'http://localhost/BookCollection/CategoryAssets/GullibleTravels.pdf'),
(17, 9, 'The Art of Writing & Speaking the English Language', 'If there is a subject of really universal interest and utility, it is the art of writing and speaking ones own language effectively', '15.99', 'http://localhost/BookCollection/CategoryAssets/cover-orig-15160.jpg', 'http://localhost/BookCollection/CategoryAssets/The-Art-of-WritingSpeaking-the-English-Language.pdf'),
(18, 9, 'The Art of Money Getting', 'In the United States, where we have more land than people, it is not at all difficult for persons in good health to make money. In this comparatively new field there are so many avenues of success open, so many vocations which are not crowded, that any person of either sex who is willing, at least for the time being, to engage in any respectable occupation that offers, may find lucrative employment.\r\n', '14.20', 'http://localhost/BookCollection/CategoryAssets/cover-orig-891.jpg', 'http://localhost/BookCollection/CategoryAssets/The-Art-of-Money-Getting.pdf'),
(19, 10, 'Food for the Mind', 'Mind Food is a delicious and revolutionary invitation to eating whole foods, with a mind-nourishing twist – inspired by years of research around how food can make us happy and boost our moods.', '12.77', 'http://localhost/BookCollection/CategoryAssets/cover-47335.jpg', 'http://localhost/BookCollection/CategoryAssets/Food-for-the-Mind.pdf'),
(20, 10, 'Food and Health', 'An accessible and balanced account, Food Politics laid the groundwork for todays food revolution and changed the way we respond to food industry marketing practices. ', '12.88', 'http://localhost/BookCollection/CategoryAssets/cover-orig-11465.jpg', 'http://localhost/BookCollection/CategoryAssets/Food-and-Health.pdf'),
(21, 11, 'How to Use Your Mind', 'Educational leaders are seeing with increasing clearness the necessity of teaching students not only the subject-matter of study but also methods of study. The recognition of this condition is taking the form of the movement toward \'\'supervised study,\'\' which attempts to acquaint the student with principles of economy and directness in using his mind.', '6.72', 'http://localhost/BookCollection/CategoryAssets/cover-orig-7949.jpg', 'http://localhost/BookCollection/CategoryAssets/How-to-Use-Your-Mind.pdf'),
(22, 11, 'Mind + Body', 'Chris leads an entirely normal life until his father, a researcher for the Marine Corps working in Quantico, mysteriously dies and leaves Chris with a suspiciously large life insurance payout. Then, when Chris gets in a fight at school and puts his attackers into the hospital, his principal tries to cover it up. Trying to discover the answers to the compounding mysteries in his life, Chris uses social engineering, high tech espionage, and physical intimidation he never thought he would be capable.', '5.34', 'http://localhost/BookCollection/CategoryAssets/cover-orig-22538.jpg', 'http://localhost/BookCollection/CategoryAssets/Mind-+-Body.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `Recommend`
--

CREATE TABLE `Recommend` (
  `id` int(11) NOT NULL,
  `recommend_name` varchar(100) NOT NULL,
  `recommend_description` varchar(5000) NOT NULL,
  `recommend_img` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Recommend`
--

INSERT INTO `Recommend` (`id`, `recommend_name`, `recommend_description`, `recommend_img`) VALUES
(1, 'Francis Rose', 'Francis Rose MBE was an English field botanist and conservationist.', 'http://localhost/BookCollection/RecommendCategoryAssets/FrancisRose.png'),
(2, 'Michelle Skeen', 'Michelle Skeen, PsyD, has a doctorate in clinical psychology.', 'http://localhost/BookCollection/RecommendCategoryAssets/MichelleSkeen.png');

-- --------------------------------------------------------

--
-- Table structure for table `RecommendFavorites`
--

CREATE TABLE `RecommendFavorites` (
  `id` int(11) NOT NULL,
  `recommendproductId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `RecommendProduct`
--

CREATE TABLE `RecommendProduct` (
  `id` int(11) NOT NULL,
  `Recommend_id` int(11) NOT NULL,
  `RecommendProduct_name` varchar(250) NOT NULL,
  `recc_descrb` varchar(5000) NOT NULL,
  `price` tinytext NOT NULL,
  `img` varchar(1000) NOT NULL,
  `link` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `RecommendProduct`
--

INSERT INTO `RecommendProduct` (`id`, `Recommend_id`, `RecommendProduct_name`, `recc_descrb`, `price`, `img`, `link`) VALUES
(1, 1, 'Caravaggio: A Life Sacred and Profane', 'The worlds of Milan and Rome through which Caravaggio moved and which Andrew Graham-Dixon describes brilliantly in this book, are those of cardinals and prostitutes, prayer and violence. Graham-Dixon puts the murder of a pimp, Ranuccio Tomassoni, at the centre of his story. It occurred at the height of Caravaggie fame in Rome and probably brought about his flight through Malta and Sicily, which led to his death in suspicious circumstances off the coast of Naples. Graham-Dixon shows how Caravaggio paintings emerged from this extraordinarily wild and troubled life: his detailed readings of them explain their originality and Caravaggio mentality better than any of his predecessors.', '4.40', 'http://localhost/BookCollection/RecommendCategoryAssets/caravaggio.png', 'http://localhost/BookCollection/RecommendCategoryAssets/CaravaggioMiracles.pdf'),
(2, 1, 'The Secrets of High Magic', 'The great magicians, alchemists, and other masters of high magic may no longer be among us, but their wisdom remains intact in often-obscure documents for careful researchers like Francis Melville to uncover and gather. In this new Vintage Edition of The Secrets of High Magic, Melville enlightens his readers with the fruits of his investigations. High magic encompasses many doctrines and techniques, including the conjuring of spirits and nonhuman entities, ritual divination, the making and consecration of talismans, and exploration of other universes. This book is a practical guide to a wide array of occult traditions. Readers learn how to make a magic alter, read tarot cards, discover the secrets of alchemy, learn divination methods of geomancy and I-Ching, and much more. This favorite B.E.S. inspirational volume has been updated, given a handsome new cover, and set in an attractive new Vintage Edition format. The text is enhanced with attractive color illustrations.', '2.10', 'http://localhost/BookCollection/RecommendCategoryAssets/thesecretofmagic.jpeg', 'http://localhost/BookCollection/RecommendCategoryAssets/TheSecretsofHighMagic.pdf'),
(3, 1, 'The Wild Flower Key', 'This wild flower identification guide was first published in 1981 and is still widely accepted as the best of its kind for its combination of meticulous illustrations and the use of keys to aid recognition. For this new edition the Latin names have been revised in accordance with the current classification system. It is now published as the ideal book for the serious student of British and north-west European wild plants, providing a bridge between picture identification guides and the non-illustrated academic floras.', '8.00', 'http://localhost/BookCollection/RecommendCategoryAssets/wildflower.jpeg', 'http://localhost/BookCollection/RecommendCategoryAssets/TheWildFlower.pdf'),
(4, 2, 'The CBT Anxiety Solution Workbook', 'This book has been selected as an Association for Behavioral and Cognitive Therapies Self-Help Book Recommendation—an honor bestowed on outstanding self-help books that are consistent with cognitive behavioral therapy (CBT) principles and that incorporate scientifically tested strategies for overcoming mental health difficulties. Used alone or in conjunction with therapy, our books offer powerful tools readers can use to jump-start changes in their lives.', '9.00', 'http://localhost/BookCollection/RecommendCategoryAssets/CBT.jpeg', 'http://localhost/BookCollection/RecommendCategoryAssets/CBTAnxity.pdf'),
(5, 2, 'Love Me, Dont Leave Me', 'Everyone thrives on love, comfort, and the safety of family, friends, and community. But if you are denied these basic comforts early in life, whether, through a lack of physical affection or emotional bonding, you may develop intense fears of abandonment that can last well into adulthood―fears so powerful that they can cause you to push people away. If you suffer from fears of abandonment, you may have underlying feelings of anger, shame, fear, anxiety, depression, and grief. If you are ready to break the self-fulfilling cycle of mistrust, clinginess, and heartbreak and start building lasting, trusting relationships, this book will be your guide.', '6.00', 'http://localhost/BookCollection/RecommendCategoryAssets/Loveme.jpeg', 'http://localhost/BookCollection/RecommendCategoryAssets/lovemedontovercoming.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`id`, `full_name`, `email`, `phone`, `password`) VALUES
(1, 'maheen qaisar', 'maheen@gmail.com', '0000000', 'mm'),
(2, 'Maheen Qaisar', 'mahiqaiser@gmail.com', '00', 'mm'),
(3, 'Mahi', 'mmmm@gmail.com', '7654', 'mmmm'),
(4, 'Maheen Mughal', 'mahi@gmail.com', '123', '12'),
(5, 'Maheeeeennn', 'mahimahi@gmail.com', '09090', '12'),
(6, 'MAHEEN', 'MAHEENMAHI@gmail.com', '09876', '09876'),
(7, 'MAHEEN', 'maheenmahimaheen@gmail.com', '09876', '09876'),
(8, 'MAHEENMM', 'mahimaheen@gmail.com', '09876', '09876'),
(9, 'MM', 'MMNN@gmail.com', '87', '6767'),
(10, 'Maheen New', 'maheennew@gmail.com', '090000', '123'),
(11, 'Maheen Qaiser Mughal', 'maheenqaisarmughal@gmail.com', '0909', '0000'),
(12, 'dcdscdwv', 'vcdsvdwvdwv@gmail.com', '234', '324324');

-- --------------------------------------------------------

--
-- Table structure for table `UserStatus`
--

CREATE TABLE `UserStatus` (
  `id` int(11) NOT NULL,
  `age` varchar(100) NOT NULL,
  `gender` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `UserStatus`
--

INSERT INTO `UserStatus` (`id`, `age`, `gender`) VALUES
(1, '11', 'Female');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Favorites`
--
ALTER TABLE `Favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Popular`
--
ALTER TABLE `Popular`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `PopularFavorites`
--
ALTER TABLE `PopularFavorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `PopularProduct`
--
ALTER TABLE `PopularProduct`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Recommend`
--
ALTER TABLE `Recommend`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `RecommendFavorites`
--
ALTER TABLE `RecommendFavorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `RecommendProduct`
--
ALTER TABLE `RecommendProduct`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `UserStatus`
--
ALTER TABLE `UserStatus`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Category`
--
ALTER TABLE `Category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `Favorites`
--
ALTER TABLE `Favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Popular`
--
ALTER TABLE `Popular`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `PopularFavorites`
--
ALTER TABLE `PopularFavorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `PopularProduct`
--
ALTER TABLE `PopularProduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `Product`
--
ALTER TABLE `Product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `Recommend`
--
ALTER TABLE `Recommend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `RecommendFavorites`
--
ALTER TABLE `RecommendFavorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `RecommendProduct`
--
ALTER TABLE `RecommendProduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `UserStatus`
--
ALTER TABLE `UserStatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
