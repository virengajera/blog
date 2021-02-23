-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2021 at 04:22 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `blogid` int(11) NOT NULL,
  `blogtitle` mediumtext NOT NULL,
  `blogdate` text NOT NULL,
  `blogdescription` mediumtext NOT NULL,
  `markdown` longtext NOT NULL,
  `blogcontent` longtext NOT NULL,
  `blogimage` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`blogid`, `blogtitle`, `blogdate`, `blogdescription`, `markdown`, `blogcontent`, `blogimage`) VALUES
(12, '1', '2021-02-22 15:54:53.068', '1', 'An h1 header\r\n============\r\n\r\nParagraphs are separated by a blank line.\r\n\r\n2nd paragraph. *Italic*, **bold**, and `monospace`. Itemized lists\r\nlook like:\r\n\r\n  * this one\r\n  * that one\r\n  * the other one\r\n\r\nNote that --- not considering the asterisk --- the actual text\r\ncontent starts at 4-columns in.\r\n\r\n> Block quotes are\r\n> written like so.\r\n>\r\n> They can span multiple paragraphs,\r\n> if you like.\r\n\r\nUse 3 dashes for an em-dash. Use 2 dashes for ranges (ex., "it''s all\r\nin chapters 12--14"). Three dots ... will be converted to an ellipsis.\r\nUnicode is supported. ?', '<h1 id="an-h1-header">An h1 header</h1>\n<p>Paragraphs are separated by a blank line.</p>\n<p>2nd paragraph. <em>Italic</em>, <strong>bold</strong>, and <code>monospace</code>. Itemized lists\nlook like:</p>\n<ul>\n<li>this one</li>\n<li>that one</li>\n<li>the other one</li>\n</ul>\n<p>Note that --- not considering the asterisk --- the actual text\ncontent starts at 4-columns in.</p>\n<blockquote>\n<p>Block quotes are\nwritten like so.</p>\n<p>They can span multiple paragraphs,\nif you like.</p>\n</blockquote>\n<p>Use 3 dashes for an em-dash. Use 2 dashes for ranges (ex., "it''s all\nin chapters 12--14"). Three dots ... will be converted to an ellipsis.\nUnicode is supported. ?</p>\n', 'blogimage-2021-02-22T10-24-53.028ZChrysanthemum.jpg'),
(13, '2', '2021-02-22 15:55:24.195', '2', 'An h2 header\r\n------------\r\n\r\nHere''s a numbered list:\r\n\r\n 1. first item\r\n 2. second item\r\n 3. third item\r\n\r\nNote again how the actual text starts at 4 columns in (4 characters\r\nfrom the left side). Here''s a code sample:\r\n\r\n    # Let me re-iterate ...\r\n    for i in 1 .. 10 { do-something(i) }\r\n\r\nAs you probably guessed, indented 4 spaces. By the way, instead of\r\nindenting the block, you can use delimited blocks, if you like:\r\n\r\n~~~\r\ndefine foobar() {\r\n    print "Welcome to flavor country!";\r\n}\r\n~~~\r\n\r\n(which makes copying & pasting easier). You can optionally mark the\r\ndelimited block for Pandoc to syntax highlight it:\r\n\r\n~~~python\r\nimport time\r\n# Quick, count to ten!\r\nfor i in range(10):\r\n    # (but not *too* quick)\r\n    time.sleep(0.5)\r\n    print(i)\r\n~~~\r\n', '<h2 id="an-h2-header">An h2 header</h2>\n<p>Here''s a numbered list:</p>\n<ol>\n<li>first item</li>\n<li>second item</li>\n<li>third item</li>\n</ol>\n<p>Note again how the actual text starts at 4 columns in (4 characters\nfrom the left side). Here''s a code sample:</p>\n<pre><code># Let me re-iterate ...\nfor i in 1 .. 10 { do-something(i) }\n</code></pre>\n<p>As you probably guessed, indented 4 spaces. By the way, instead of\nindenting the block, you can use delimited blocks, if you like:</p>\n<pre><code>define foobar() {\n    print "Welcome to flavor country!";\n}\n</code></pre>\n<p>(which makes copying &amp; pasting easier). You can optionally mark the\ndelimited block for Pandoc to syntax highlight it:</p>\n<pre><code class="language-python">import time\n# Quick, count to ten!\nfor i in range(10):\n    # (but not *too* quick)\n    time.sleep(0.5)\n    print(i)\n</code></pre>\n', 'blogimage-2021-02-22T10-25-24.151ZDesert.jpg'),
(14, '3', '2021-02-22 15:58:15.548', '3', '### An h3 header ###\r\n\r\nNow a nested list:\r\n\r\n 1. First, get these ingredients:\r\n\r\n      * carrots\r\n      * celery\r\n      * lentils\r\n\r\n 2. Boil some water.\r\n\r\n 3. Dump everything in the pot and follow\r\n    this algorithm:\r\n\r\n        find wooden spoon\r\n        uncover pot\r\n        stir\r\n        cover pot\r\n        balance wooden spoon precariously on pot handle\r\n        wait 10 minutes\r\n        goto first step (or shut off burner when done)\r\n\r\n    Do not bump wooden spoon or it will fall.\r\n\r\nNotice again how text always lines up on 4-space indents (including\r\nthat last line which continues item 3 above).\r\n\r\nHere''s a link to [a website](http://foo.bar), to a [local\r\ndoc](local-doc.html), and to a [section heading in the current\r\ndoc](#an-h2-header). Here''s a footnote [^1].\r\n\r\n[^1]: Some footnote text.\r\n\r\nTables can look like this:\r\n\r\n| Syntax      | Description |\r\n| ----------- | ----------- |\r\n| Header      | Title       |\r\n| Paragraph   | Text        |', '<h3 id="an-h3-header">An h3 header</h3>\n<p>Now a nested list:</p>\n<ol>\n<li><p>First, get these ingredients:</p>\n<ul>\n<li>carrots</li>\n<li>celery</li>\n<li>lentils</li>\n</ul>\n</li>\n<li><p>Boil some water.</p>\n</li>\n<li><p>Dump everything in the pot and follow\nthis algorithm:</p>\n<pre><code>find wooden spoon\nuncover pot\nstir\ncover pot\nbalance wooden spoon precariously on pot handle\nwait 10 minutes\ngoto first step (or shut off burner when done)\n</code></pre>\n<p>Do not bump wooden spoon or it will fall.</p>\n</li>\n</ol>\n<p>Notice again how text always lines up on 4-space indents (including\nthat last line which continues item 3 above).</p>\n<p>Here''s a link to <a href="http://foo.bar">a website</a>, to a <a href="local-doc.html">local\ndoc</a>, and to a <a href="#an-h2-header">section heading in the current\ndoc</a>. Here''s a footnote [^1].</p>\n<p>[^1]: Some footnote text.</p>\n<p>Tables can look like this:</p>\n<table>\n<thead>\n<tr>\n<th>Syntax</th>\n<th>Description</th>\n</tr>\n</thead>\n<tbody><tr>\n<td>Header</td>\n<td>Title</td>\n</tr>\n<tr>\n<td>Paragraph</td>\n<td>Text</td>\n</tr>\n</tbody></table>\n', 'blogimage-2021-02-22T10-28-15.497ZPenguins.jpg'),
(15, '4', '2021-02-22 15:56:53.320', '4', '--------  -----------------------\r\nKeyword   Text\r\n--------  -----------------------\r\nred       Sunsets, apples, and\r\n          other red or reddish\r\n          things.\r\n\r\ngreen     Leaves, grass, frogs\r\n          and other things it''s\r\n          not easy being.\r\n--------  -----------------------\r\n\r\nA horizontal rule follows.\r\n\r\n***\r\n\r\nHere''s a definition list:\r\n\r\napples\r\n  : Good for making applesauce.\r\n\r\noranges\r\n  : Citrus!\r\n\r\ntomatoes\r\n  : There''s no "e" in tomatoe.\r\n\r\nAgain, text is indented 4 spaces. (Put a blank line between each\r\nterm and  its definition to spread things out more.)\r\n\r\nHere''s a "line block" (note how whitespace is honored):\r\n\r\n| Line one\r\n|   Line too\r\n| Line tree\r\n\r\nand images can be specified like so:', '<hr>\n<p>Keyword   Text</p>\n<hr>\n<p>red       Sunsets, apples, and\n          other red or reddish\n          things.</p>\n<p>green     Leaves, grass, frogs\n          and other things it''s\n          not easy being.</p>\n<hr>\n<p>A horizontal rule follows.</p>\n<hr>\n<p>Here''s a definition list:</p>\n<p>apples\n  : Good for making applesauce.</p>\n<p>oranges\n  : Citrus!</p>\n<p>tomatoes\n  : There''s no "e" in tomatoe.</p>\n<p>Again, text is indented 4 spaces. (Put a blank line between each\nterm and  its definition to spread things out more.)</p>\n<p>Here''s a "line block" (note how whitespace is honored):</p>\n<p>| Line one\n|   Line too\n| Line tree</p>\n<p>and images can be specified like so:</p>\n', 'blogimage-2021-02-22T10-26-53.299ZJellyfish.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `commentid` int(11) NOT NULL,
  `blogid` int(11) NOT NULL,
  `commentusername` mediumtext NOT NULL,
  `commentcontent` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`commentid`, `blogid`, `commentusername`, `commentcontent`) VALUES
(1, 12, 'John', 'Nice Photo'),
(2, 12, 'Jen', 'Great Blog'),
(3, 13, 'Xin', 'Error in code'),
(4, 14, 'ABC User', 'Penguins also eat .....'),
(5, 14, 'DEF User', 'They also eat .......');

-- --------------------------------------------------------

--
-- Table structure for table `reply`
--

CREATE TABLE `reply` (
  `replyid` int(11) NOT NULL,
  `commentid` int(11) NOT NULL,
  `replyusername` mediumtext NOT NULL,
  `replycontent` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reply`
--

INSERT INTO `reply` (`replyid`, `commentid`, `replyusername`, `replycontent`) VALUES
(1, 1, 'Jen', 'True said'),
(2, 1, 'Xin', 'Prefect Image'),
(3, 3, 'Jen', 'Giving error while running program'),
(4, 5, 'Jet', 'Correct');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`blogid`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`commentid`);

--
-- Indexes for table `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`replyid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `blogid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `commentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `reply`
--
ALTER TABLE `reply`
  MODIFY `replyid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
