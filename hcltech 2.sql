create database hcltech;

use hcltech; 

-- Q2 
CREATE TABLE support_tickets (
    id INT PRIMARY KEY,
    customer_id INT,
    created_at VARCHAR(19),
    resolved_at VARCHAR(19)
);

INSERT INTO support_tickets (id, customer_id, created_at, resolved_at) VALUES
(1, 1, '2023-12-21 05:42:00', '2024-01-01 05:42:00'),
(2, 2, '2023-07-08 14:22:00', NULL),
(3, 3, '2023-05-22 08:54:00', '2023-06-17 08:54:00');

select round(avg(timestampdiff(hour , created_at , resolved_at)),2)
as average_response_time from support_tickets 
where resolved_at is not null ; 

-- Q7

CREATE TABLE devices (
    id INT NOT NULL PRIMARY KEY,
    mac_address VARCHAR(255)
);

INSERT INTO devices (id, mac_address) VALUES
(1, '66-0F-84-41-8B-8E'),
(2, 'A6-1A-2F-3A-7B-83'),
(3, '76-CD-24-4B-F0-DD');

CREATE TABLE scanned_files (
    device_id INT,
    filename VARCHAR(255),
    is_infected SMALLINT,
    FOREIGN KEY (device_id) REFERENCES devices(id)
);

INSERT INTO scanned_files (device_id, filename, is_infected) VALUES
(1, 'File1.mp3', 0),
(1, 'File2.xls', 1),
(2, 'File3.doc', 0),
(2, 'File4.ppt', 1),
(2, 'File5.mp3', 1),
(3, 'File6.xls', 0),
(3, 'File7.doc', 1),
(3, 'File8.ppt', 0),
(3, 'File9.mp3', 1),
(3, 'File10.xls', 0);

select d.mac_address , count(*) as total_sacnned_files, 
count(case when s.is_infected=1 then 1 end) as total_infected_files 

from devices d join scanned_files s on d.id=s.device_id
 
 group by s.device_id ;
 
 
 -- Q9
 
 CREATE TABLE customers (
    id INT NOT NULL PRIMARY KEY,
    email VARCHAR(255)
);

CREATE TABLE domains (
    customer_id INT,
    name VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO customers (id, email) VALUES
    (1, 'ebaydon0@washingtonpost.com'),
    (2, 'agammade1@comcast.net'),
    (3, 'goloshkin2@reference.com'),
    (4, 'cantonescu3@earthlink.net'),
    (5, 'fparzis4@ow.ly'),
    (6, 'cpetroulis5@shutterfly.com'),
    (7, 'tbeels6@bbb.org'),
    (8, 'zmacturlough7@4shared.com'),
    (9, 'eshury8@skype.com'),
    (10, 'jfehners9@github.io');
    
    
    INSERT INTO domains (customer_id, name) VALUES
    (1, 'bfiilipa.net'),
    (1, 'gsparsholti.net'),
    (1, 'jhughsr.org'),
    (2, 'scopas8.net'),
    (2, 'cglison1u.org'),
    (3, 'tginiz.com'),
    (3, 'arubinowitsch2l.net'),
    (3, 'clockyear2m.org'),
    (4, 'sfinnigand.com'),
    (4, 'vborrelt.net');
    
select c.email , count(d.name) as total_domains 

from customers c join domains d   

on c.id=d.customer_id group by c.email 

order by c.email asc ; 


-- Q10

CREATE TABLE products (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(255),
    price DECIMAL(6, 2),
    in_stock SMALLINT
);

CREATE TABLE wishlists (
    product_id INT,
    customer_email VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO products (id, name, price, in_stock) VALUES
    (1, 'TechGadget Pro X', 324.24, 1),
    (2, 'LuxuryHome Decor Set', 884.90, 1),
    (3, 'FitnessTracker Elite', 698.59, 0);
    
    INSERT INTO wishlists (product_id, customer_email) VALUES
    (1, 'user1@example.com'),
    (1, 'user2@example.com'),
    (2, 'user3@example.com'),
    (2, 'user4@example.com'),
    (2, 'user5@example.com'),
    (3, 'user6@example.com'),
    (1, 'user7@example.com'),
    (2, 'user8@example.com'),
    (1, 'user9@example.com'),
    (3, 'user10@example.com');
    
    select p.name as product_name , p.price,
    
    round(count(w.product_id) , 2) as total_wishlist_count
    
    from products p join wishlists w on
    
    p.id=w.product_id where p.in_stock=1 group by p.id 
    
    order by p.name asc 
    
    
-- Q12

CREATE TABLE lots (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE offers (
    lot_id INT,
    amount DECIMAL(6, 2),
    FOREIGN KEY (lot_id) REFERENCES lots(id)
);

INSERT INTO lots (id, name) VALUES
    (1, 'Acacia parramattensis Tindale'),
    (2, 'Poa arctica R. Br. ssp. aperta (Scribn. & Merr.) Soreng'),
    (3, 'Calophyllum inophyllum L.');
    
    INSERT INTO offers (lot_id, amount) VALUES
    (1, 260.91),
    (1, 802.83),
    (1, 986.78),
    (2, 814.57),
    (2, 999.06),
    (2, 414.67),
    (3, 200.41),
    (3, 593.07),
    (3, 701.88),
    (3, 972.87);
    
    select l.name as lot_name , round(max(o.amount),2) as highest_offer , count(o.amount)
    
    as total_offer 
    
    from lots l join offers o on l.id=o.lot_id
    
    group by l.name order by l.name asc;
    
    
    -- Q13
    
    CREATE TABLE accounts (
    id INT NOT NULL PRIMARY KEY,
    iban VARCHAR(255)
);

CREATE TABLE transactions (
    account_id INT,
    dt CHAR(19),
    amount DECIMAL(5, 2),
    FOREIGN KEY (account_id) REFERENCES accounts(id)
);

INSERT INTO accounts (id, iban) VALUES
    (1, 'BG40 RFFX 4896 53DD CZD6 KQ'),
    (2, 'PT42 5267 0592 8451 8001 2180 3'),
    (3, 'FR96 8758 8909 81LR DJ71 ERKN D56');

INSERT INTO transactions (account_id, dt, amount) VALUES
    (1, '2022-09-02 06:33:39', 33.31),
    (1, '2022-09-20 08:14:39', 31.77),
    (1, '2022-09-25 06:41:45', 72.84),
    (2, '2022-09-04 22:28:12', 35.26),
    (2, '2022-09-17 07:57:29', 33.27),
    (2, '2022-09-27 22:30:36', 70.78),
    (3, '2022-09-16 21:54:12', 75.04),
    (3, '2022-09-19 18:27:39', 71.19),
    (3, '2022-09-28 01:38:56', 14.34),
    (3, '2022-09-30 01:35:31', 69.19);
    
    SELECT
    a.iban AS IBAN,
    ROUND(MIN(t.amount), 2) AS min_transaction,
    ROUND(MAX(t.amount), 2) AS max_transaction,
    ROUND(AVG(t.amount), 2) AS avg_transaction,
    COUNT(t.amount) AS total_transaction
FROM
    accounts a
JOIN
    transactions t ON a.id = t.account_id
where
     t.dt LIKE '2022-09-%'
GROUP BY
    a.iban
ORDER BY
    a.iban ASC;
    
    
    -- Q14
        
    CREATE TABLE products(
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(255),
    price DECIMAL(6, 2),
    in_stock SMALLINT
);

CREATE TABLE wishlists (
    product_id INT,
    customer_email VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO products (id, name, price, in_stock) VALUES
    (1, 'TechGadget Pro X', 274.80, 1),
    (2, 'LuxuryHome Decor Set', 262.84, 1),
    (3, 'FitnessTracker Elite', 637.92, 0),
    (4, 'GourmetCookware Set', 535.34, 1),
    (5, 'Fashionista Wardrobe Collection', 525.44, 1);

INSERT INTO wishlists (product_id, customer_email) VALUES
    (1, 'crabbage@redcross.org'),
    (1, 'efindlow2@tinypic.com'),
    (1, 'jmachoste5@issuu.com'),
    (1, 'nselle@simplemachines.org'),
    (2, 'aonn1@ebay.co.uk'),
    (2, 'bbolton0@google.cn'),
    (2, 'ebockett3@storify.com'),
    (2, 'fdunguyg@symantec.com'),
    (2, 'slowried@cbsnews.com'),
    (3, 'jgately7@goo.ne.jp'),
    (3, 'ospearetti@bandcamp.com'),
    (3, 'rpahonsb@paypal.com'),
    (3, 'ydevauxh@toplist.cz'),
    (3, 'zbabbage9@imageshack.us'),
    (4, 'dpauleyac@cnbc.com'),
    (4, 'jletterick4@dailymotion.com'),
    (4, 'jrimmsett6@princeton.edu'),
    (4, 'skernell@uiuc.edu'),
    (5, 'blodina@wikimedia.org'),
    (5, 'lyusupovi@nps.gov');
    
    
    select p.name , p.price ,
    count(w.product_id) as total_wishes
    
    from products p join wishlists w 
    
    on p.id=w.product_id 
    
    where p.in_stock=1
    
    group by p.id 
    
    order by count(w.product_id) desc , p.name asc
    
    limit 3;

-- Q15

CREATE TABLE customers1 (
    id INT NOT NULL PRIMARY KEY,
    email VARCHAR(255)
);

CREATE TABLE purchases1 (
    customer_id INT,
    dt VARCHAR(19),
    amount DECIMAL(6, 2),
    FOREIGN KEY (customer_id) REFERENCES customers1(id)
);

INSERT INTO customers1 (id, email) VALUES
    (1, 'floggie0@newsvine.com'),
    (2, 'sgillbe1@ca.gov'),
    (3, 'jgohn2@elegantthemes.com');

INSERT INTO purchases1 (customer_id, dt, amount) VALUES
    (2, '2024-02-21 02:56:12', 778.58),
    (2, '2024-02-23 09:52:47', 972.41),
    (1, '2024-03-14 15:50:13', 109.16),
    (1, '2024-03-17 00:31:44', 1.49),
    (1, '2024-03-17 06:15:42', 692.64),
    (2, '2024-03-01 06:35:09', 589.74),
    (2, '2024-03-14 14:12:23', 506.75),
    (2, '2024-03-17 07:51:38', 933.93),
    (2, '2024-03-19 08:24:38', 188.26),
    (2, '2024-03-21 23:33:54', 55.07),
    (3, '2024-03-01 17:34:30', 816.67),
    (3, '2024-03-08 23:46:02', 672.93),
    (3, '2024-03-15 18:09:56', 260.66),
    (3, '2024-03-20 15:18:11', 321.07),
    (3, '2024-03-20 17:46:35', 29.06),
    (3, '2024-03-23 20:23:49', 314.85),
    (3, '2024-03-25 11:41:07', 67.12),
    (1, '2024-04-05 03:05:10', 817.78),
    (2, '2024-04-09 08:16:17', 697.53),
    (3, '2024-04-02 07:56:48', 156.27);
    
    select c.email , count(p.customer_id) as total_purchases ,
    round(sum(p.amount),2) as total_purchase_amount
    from customers1 c join purchases1 p 
    on c.id=p.customer_id
    where p.dt like '2024-03-%'
    group by c.email 
    order by c.email asc;
    
    -- Q16
    
    CREATE TABLE applicants (
    id INT NOT NULL PRIMARY KEY,
    email VARCHAR(255)
);

CREATE TABLE appointments (
    applicant_id INT,
    dt VARCHAR(19),
    is_received BOOLEAN,
    FOREIGN KEY (applicant_id) REFERENCES applicants(id)
);

INSERT INTO applicants (id, email) VALUES
    (1, 'nkienzle0@spiegel.de'),
    (2, 'alaste1@bbc.co.uk'),
    (3, 'jjochanany2@ow.ly'),
    (4, 'bsenn3@salon.com'),
    (5, 'bwhittall4@nhs.uk');

INSERT INTO appointments (applicant_id, dt, is_received) VALUES
    (1, '2024-04-27', FALSE),
    (2, '2024-04-01', FALSE),
    (3, '2024-04-15', FALSE),
    (4, '2024-03-27', FALSE),
    (5, '2024-03-26', TRUE);
    
    select app.email , appo.dt as scheduled_appoinments ,
    DATEDIFF('2024-04-10', appo.dt) AS days_of_delay
    from applicants app join appointments appo 
    on app.id=appo.applicant_id
    where appo.is_received=0 and appo.dt < '2024-04-10'
    order by  appo.dt asc , app.email asc;
    


-- Q17

CREATE TABLE applicants1 (
  id INT PRIMARY KEY,
  email VARCHAR(255)
);

CREATE TABLE appointments1 (
  applicant_id INT,
  dt VARCHAR(19),
  FOREIGN KEY (applicant_id) REFERENCES applicants1(id)
);

INSERT INTO applicants1 (id, email) VALUES
(1, 'rastlatto0@instagram.com'),
(2, 'gcarmody1@stanford.edu'),
(3, '_mgreenset2@state.tx.us');

INSERT INTO appointments1 (applicant_id, dt) VALUES
(1, '2024-05-26 01:36:43'),
(2, '2024-05-27 16:30:28'),
(3, '2024-05-18 19:28:52');

select app.email , 
dayname(appo.dt) as scheduled_appoinment
from applicants1 app join appointments1 appo on 
app.id=appo.applicant_id
where dayname(appo.dt) in ('Saturday','Sunday')
order by app.email asc;


-- Q18

CREATE TABLE countries (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE domains1 (
  country_id INT,
  name VARCHAR(255),
  is_active BOOLEAN,
  FOREIGN KEY (country_id) REFERENCES countries(id)
);

INSERT INTO countries (id, name) VALUES
(1, 'Azerbaijan'),
(2, 'Colombia'),
(3, 'China');

INSERT INTO domains1 (country_id, name, is_active) VALUES
(1, 'angelfire.com', 1),
(1, 'free.fr', 1),
(1, 'google.cn', 1),
(1, 'nationalgeographic.com', 1),
(1, 'ovh.net', 1),
(1, 'surveymonkey.com', 1),
(1, 'twitpic.com', 1),
(2, 'ameblo.jp', 1),
(2, 'berkeley.edu', 1),
(2, 'mulishly.com', 1),
(2, 'redcross.org', 1),
(2, 'sourceforg.e.net', 1),
(3, 'tv360.com', 1),
(3, 'tiventeme.ru', 1),
(3, 'squidoo.com', 1),
(3, 'technorati.com', 1),
(3, 'webnode.com', 1),
(3, 'yahoo.co.jp', 1),
(1, 'tuni.dt.de', 0),
(1, 'qq.com', 0);

select c.name as country_name ,
count(d.name) as total_domains
from countries c join domains1 d
on c.id=d.country_id
where d.is_active = 1
group by c.name 
order by c.name asc;


-- Q19

CREATE TABLE domains2 (
  name VARCHAR(255),
  next_renewal_date VARCHAR(19)
);

INSERT INTO domains2 (name, next_renewal_date) VALUES
('wired.com', '2024-06-14 00:10:12'),
('blogger.com', '2024-07-18 05:54:57'),
('com.com', '2024-07-21 02:57:25');

select d.name ,
'2024-04-10' as today_date,
date(d.next_renewal_date) ,
datediff(d.next_renewal_date,'2024-04-10') as days_until_renewal
from domains2 d 
order by datediff(d.next_renewal_date,'2024-04-10') asc,
d.name asc;


-- Q20

CREATE TABLE users4 (
  id INT PRIMARY KEY,
  email VARCHAR(255)
);

CREATE TABLE transactions4 (
  user_id INT,
  dt VARCHAR(19),
  amount DECIMAL(5, 2),
  FOREIGN KEY (user_id) REFERENCES users4(id)
);

INSERT INTO users4 (id, email) VALUES
(1, 'bblaszczynski0@devhub.com'),
(2, 'dwoodey1@chronoengine.com'),
(3, 'flerway2@wikpedia.org');

INSERT INTO transactions4 (user_id, dt, amount) VALUES
(1, '2024-02-23 19:30:03', 942.50),
(1, '2024-03-07 09:01:15', 855.22),
(1, '2024-04-01 04:18:41', 253.35),
(1, '2024-04-07 02:40:58', 886.88),
(2, '2024-02-25 05:11:39', 957.77),
(2, '2024-03-06 03:00:40', 413.39),
(2, '2024-03-07 14:41:03', 906.16),
(2, '2024-03-10 00:58:13', 116.59),
(2, '2024-09-13 23:18:29', 550.31),
(2, '2024-01-22 03:07:49', 196.23),
(2, '2024-03-24 03:25:14', 899.76),
(2, '2024-03-25 12:28:18', 398.07),
(2, '2024-03-27 09:11:15', 212.31),
(2, '2024-04-09 00:33:26', 97.85),
(3, '2024-03-01 17:24:46', 323.11),
(3, '2024-03-03 10:16:06', 673.23),
(3, '2024-03-08 16:19:46', 236.74),
(3, '2024-03-23 15:37:47', 234.87),
(3, '2024-04-05 20:35:45', 989.35),
(3, '2024-04-07 05:26:35', 369.20);

select u.email ,
count(t.user_id) as total_transactions,
min(t.amount) as min_amount,
max(t.amount) as max_amount,
sum(t.amount) as total_amount
from users4 u join transactions4 t
on u.id=t.user_id
where t.dt like '2024-03-%'
group by u.email
order by u.email





-- Q21

CREATE TABLE users5 (
  id INT PRIMARY KEY,
  email VARCHAR(255)
);

CREATE TABLE transactions5 (
  user_id INT,
  dt VARCHAR(19),
  amount DECIMAL(5, 2),
  FOREIGN KEY (user_id) REFERENCES users5(id)
);

INSERT INTO users5 (id, email) VALUES
(1, 'lvasilevich0@google.co.uk'),
(2, 'hscholey1@sina.com.cn'),
(3, 'mmcjury2@hibu.com');


INSERT INTO transactions5 (user_id, dt, amount) VALUES
(3, '2022-12-05 00:16:56', 162.11),
(1, '2023-05-20 03:20:58', 81.58),
(1, '2023-06-08 19:24:02', 52.46),
(1, '2023-06-27 21:16:07', 447.59),
(1, '2023-07-20 08:19:32', 136.68),
(1, '2023-12-11 17:08:05', 857.55),
(1, '2023-12-15 04:45:54', 77.11),
(1, '2023-12-22 00:46:34', 670.71),
(1, '2023-12-29 12:43:23', 948.46),
(2, '2023-01-04 00:51:46', 793.50),
(2, '2023-04-07 16:29:14', 762.52),
(2, '2023-06-17 17:42:50', 527.18),
(2, '2023-10-10 11:16:51', 733.47),
(2, '2023-10-18 23:32:00', 920.14),
(3, '2023-03-27 18:31:41', 408.13),
(3, '2023-04-08 09:57:55', 817.88),
(3, '2023-05-18 09:47:14', 916.98),
(3, '2023-09-14 14:00:54', 53.30),
(3, '2023-09-30 01:34:01', 589.37),
(3, '2024-01-27 15:13:58', 666.37);

select u.email,
count(t.user_id) as total_transactions,
sum(t.amount) as total_amount 
from users5 u join transactions5 t 
on u.id=t.user_id
where year (t.dt) =2023
group by u.email 
order by u.email asc 





-- Q22

CREATE TABLE coins1 (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions1 (
  coin_id INT,
  dt VARCHAR(19),
  amount DECIMAL(5, 2),
  FOREIGN KEY (coin_id) REFERENCES coins1(id)
);

INSERT INTO coins1 (id, name) VALUES
(1, 'BitCash'),
(2, 'Etherium'),
(3, 'Litecoin'),
(4, 'Ripple'),
(5, 'Dogecoin');

INSERT INTO transactions1 (coin_id, dt, amount) VALUES
(1, '2022-12-09 19:40:17', 60.91),
(1, '2023-01-02 09:35:37', 76.35),
(1, '2023-03-21 09:34:39', 23.11),
(1, '2023-08-11 03:43:27', 80.20),
(1, '2023-10-21 19:42:46', 29.59),
(2, '2023-07-08 19:47:20', 69.49),
(2, '2023-09-22 14:23:40', 23.13),
(3, '2023-01-08 10:22:10', 72.45),
(3, '2023-01-28 00:54:51', 98.72),
(3, '2023-02-24 00:13:32', 70.36),
(3, '2023-05-16 15:13:19', 93.59),
(4, '2023-05-24 13:43:44', 9.34),
(4, '2023-07-25 14:59:09', 78.52),
(5, '2023-01-20 15:49:38', 81.66),
(5, '2023-08-21 17:19:45', 94.89),
(5, '2023-10-25 00:44:42', 64.40),
(5, '2023-11-30 02:38:47', 86.84),
(5, '2023-12-31 03:26:39', 58.99),
(2, '2024-01-21 10:25:26', 29.36),
(5, '2024-01-08 03:09:00', 95.25);

select c.name ,
round(avg(t.amount),2) as avg_transaction_amount 
from coins1 c join transactions1 t
on c.id = t.coin_id
where year (t.dt) = 2023
group by c.name 
order by avg(t.amount) asc
limit 3;

-- Q 24

CREATE TABLE suspicious_files (
  filename VARCHAR(255),
  extension VARCHAR(255),
  scan_dt VARCHAR(19),
  is_suspicious BOOLEAN
);

INSERT INTO suspicious_files (filename, extension, scan_dt, is_suspicious) VALUES
('Mauris.pdf', '.pdf', '2024-04-05 23:55:27', 1),
('Augue.xls', '.xls', '2024-02-28 18:11:28', 1),
('Sapien.avi', '.avi', '2024-03-30 12:24:10', 1),
('Pulvinar.doc', '.doc', '2024-03-08 22:00:41', 1),
('TemporConvallisNulla.gif', '.gif', '2024-03-29 21:32:41', 1),
('InFaucibus.mp3', '.mp3', '2024-03-20 14:18:32', 1),
('EleifendPedeLibero.ppt', '.ppt', '2024-03-05 04:47:56', 1),
('VestibulumAntelpsum.ppt', '.ppt', '2024-03-05 17:34:34', 1),
('IntegerPece.ppt', '.ppt', '2024-03-12 17:11:28', 1),
('VenenatisNon.tiff', '.tiff', '2024-03-20 18:04:47', 1),
('IaculisDiam.xls', '.xls', '2024-03-01 05:18:03', 1),
('QuisqueArcuLibero.xls', '.xls', '2024-03-09 09:00:32', 1),
('MaurisSic.png', '.png', '2024-04-03 23:20:03', 0),
('SitAmetsm.mp3', '.mp3', '2024-02-23 22:06:43', 0),
('Nisi.mp3', '.mp3', '2024-02-29 09:40:45', 0),
('Magna.tiff', '.tiff', '2024-02-27 00:25:16', 0),
('EratVestibulum.gif', '.gif', '2024-03-30 04:19:52', 0),
('Neque.jpeg', '.jpeg', '2024-03-07 07:11:26', 0),
('VolutpatQuam.ppt', '.ppt', '2024-03-23 04:33:43', 0),
('NonQuam.xls', '.xls', '2024-03-10 19:12:29', 0);

select s.extension , count(s.filename) as total_suspicious_files
from suspicious_files s
where s.is_suspicious = 1 
group by s.extension
order by count(s.filename) desc , s.extension asc
limit 5;

-- Q26

CREATE TABLE customers6 (
  id INT PRIMARY KEY,
  email VARCHAR(255)
);

CREATE TABLE site_metrics (
  customer_id INT,
  cpu_usage DECIMAL(5, 2),
  memory_usage DECIMAL(5, 2),
  disk_usage DECIMAL(5, 2),
  FOREIGN KEY (customer_id) REFERENCES customers6(id)
);

INSERT INTO customers6 (id, email) VALUES
(1, 'lrathke0@usa.gov'),
(2, 'epearsall1@fema.gov'),
(3, 'sivasechko2@cisco.com');

INSERT INTO site_metrics (customer_id, cpu_usage, memory_usage, disk_usage) VALUES
(1, 31.53, 80.84, 1.51),
(1, 12.54, 26.47, 47.74),
(1, 12.38, 46.24, 34.43),
(1, 26.64, 84.98, 17.56),
(2, 80.45, 50.05, 10.63),
(2, 40.14, 86.67, 15.98),
(2, 30.14, 34.38, 17.67),
(2, 1.11, 83.44, 2.95),
(3, 30.60, 18.60, 28.02),
(3, 41.64, 33.64, 5.20),
(3, 31.88, 7.37, 91.34),
(3, 43.20, 9.56, 40.40),
(3, 2.33, 34.29, 18.65),
(3, 11.50, 32.99, 71.39),
(3, 39.57, 4.19, 48.05),
(3, 25.06, 23.77, 33.00),
(3, 32.81, 1.59, 25.85),
(3, 48.38, 79.21, 8.31),
(3, 11.62, 26.75, 71.71),
(3, 54.43, 6.46, 4.86);

select c.email ,
avg( s.cpu_usage) as average_cpu_usage,
avg( s.memory_usage) as average_memory_usage,
avg( s.disk_usage) as average_disk_usage
from customers6 c join site_metrics s 
on c.id= s.customer_id
group by c.email
HAVING
  AVG(s.cpu_usage) > 50
  OR AVG(s.memory_usage) > 50
  OR AVG(s.disk_usage) > 50
order by c.email

-- here we use having beacuse we need filter after aggregation like avg 

-- Q27

CREATE TABLE customers7 (
  id INT PRIMARY KEY,
  email VARCHAR(255)
);

CREATE TABLE sites (
  customer_id INT,
  url VARCHAR(255),
  is_active BOOLEAN,
  FOREIGN KEY (customer_id) REFERENCES customers7(id)
);

INSERT INTO customers7 (id, email) VALUES
(1, 'dcristofol0@slashdot.org'),
(2, 'mbillanie1@japanpost.jp'),
(3, 'hmainz2@utexas.edu');

INSERT INTO sites (customer_id, url, is_active) VALUES
(1, 'https://reuters.com', 1),
(1, 'https://www.google.de', 1),
(1, 'https://merriam-webster.com', 1),
(1, 'https://wordpress.com', 1),
(1, 'https://www.gov.au', 1),
(1, 'https://www.barnesandnoble.com', 1),
(1, 'https://www.yahoo.com', 1),
(2, 'https://cloudflare.com', 0),
(2, 'https://www.drupal.org', 1),
(2, 'https://www.unesco.org', 1),
(3, 'https://www.sina.com.cn', 0),
(3, 'https://xinhuanet.com', 1),
(3, 'https://cybershims.com', 1),
(3, 'https://eaa.com', 1),
(3, 'https://businessinsider.com', 1),
(3, 'https://www.daily.co.uk', 1),
(3, 'https://www.guardian.co.uk', 1),
(3, 'https://www.microsoft.com', 1),
(3, 'https://www.armada6.com', 1),
(3, 'https://www.163.com', 1);

select c.email ,
count(customer_id) as total_active_sites
from customers7 c join sites s 
on c.id=s.customer_id
where s.is_active = 1
group by c.email
order by c.email asc ; 

-- Q 28

CREATE TABLE accounts2 (
  id INT PRIMARY KEY,
  iban VARCHAR(255)
);

CREATE TABLE income2 (
  account_id INT,
  dt VARCHAR(19),
  amount DECIMAL(6, 2),
  FOREIGN KEY (account_id) REFERENCES accounts2(id)
);

INSERT INTO accounts2 (id, iban) VALUES
(1, 'FR55 4477 6154 73ND TN3F HMOU T36'),
(2, 'DK46 1272 1831 2573 01'),
(3, 'RS53 5237 5794 6016 5411 43');

INSERT INTO income2 (account_id, dt, amount) VALUES
(1, '2022-12-31 10:03:42', 2779.19),
(1, '2023-02-04 08:50:14', 1777.68),
(1, '2023-02-13 04:22:07', 1954.81),
(1, '2023-03-04 14:46:04', 1547.79),
(1, '2023-05-23 15:42:13', 1208.49),
(1, '2023-05-24 23:24:07', 1521.72),
(1, '2023-07-28 11:01:46', 1792.75),
(1, '2023-12-07 14:19:49', 2374.25),
(1, '2024-01-27 05:55:36', 2803.39),
(2, '2022-12-03 18:04:34', 1826.65),
(2, '2023-02-17 00:59:57', 3074.11),
(2, '2023-03-01 08:17:15', 1007.30),
(2, '2023-08-19 09:16:41', 4515.04),
(2, '2024-01-08 04:14:22', 3321.78),
(2, '2024-01-10 15:16:28', 2033.87),
(3, '2023-05-09 07:28:27', 3158.66),
(3, '2023-05-22 04:39:34', 3851.20),
(3, '2023-07-21 19:51:14', 4152.29),
(3, '2023-10-05 05:42:49', 4722.20),
(3, '2023-11-11 02:42:59', 1592.16);

select a.iban ,
sum(i.amount) as total_income,
' 20 % ' as tax_rate ,
round(sum(i.amount) * 0.20 ,2)  as calculated_tax
from accounts2 a join income2 i 
on a.id=i.account_id 
where year(i.dt)=2023
group by a.iban
order by a.iban asc;

-- 29

CREATE TABLE customers9(
  id INT PRIMARY KEY,
  email VARCHAR(255)
);

CREATE TABLE expenses (
  customer_id INT,
  dt VARCHAR(19),
  amount DECIMAL(6, 2),
  FOREIGN KEY (customer_id) REFERENCES customers9(id)
);

CREATE TABLE income (
  customer_id INT,
  dt VARCHAR(19),
  amount DECIMAL(6, 2),
  FOREIGN KEY (customer_id) REFERENCES customers9(id)
);

INSERT INTO customers9 (id, email) VALUES
(1, 'otoohey0@elpais.com'),
(2, 'egrebbin1@state.gov'),
(3, 'arides2@sohu.com');

INSERT INTO expenses (customer_id, dt, amount) VALUES
(1, '2024-02-21 22:12:12', 90.41),
(1, '2024-02-27 05:48:37', 792.88),
(1, '2024-03-10 05:19:43', 442.01),
(1, '2024-03-11 19:48:25', 327.35),
(1, '2024-03-24 22:03:06', 639.62),
(1, '2024-03-29 00:37:46', 150.12),
(1, '2024-04-02 03:36:50', 257.67),
(2, '2024-02-21 06:11:26', 400.22),
(2, '2024-03-11 15:34:19', 298.41),
(2, '2024-03-25 04:36:27', 376.87),
(2, '2024-03-29 19:05:51', 530.07),
(2, '2024-03-30 07:07:28', 287.84),
(2, '2024-03-02 15:46:12', 198.81),
(2, '2024-03-06 10:07:47', 73.30),
(2, '2024-03-20 00:11:58', 398.11),
(3, '2024-03-16 23:54:48', 968.05),
(3, '2024-03-25 15:19:33', 70.55),
(3, '2024-03-31 06:51:13', 198.17),
(3, '2024-04-03 12:11:56', 836.82),
(3, '2024-03-31 17:54:37', 140.99);

INSERT INTO income (customer_id, dt, amount) VALUES
(1, '2024-02-21 00:23:05', 766.66),
(1, '2024-03-11 03:23:04', 709.18),
(1, '2024-03-15 20:49:55', 84.38),
(1, '2024-03-24 15:32:51', 199.48),
(1, '2024-03-29 11:34:13', 733.95),
(1, '2024-04-01 22:34:04', 15.69),
(1, '2024-04-02 11:45:49', 203.16),
(2, '2024-03-29 14:02:15', 212.78),
(2, '2024-03-30 19:57:32', 272.21),
(2, '2024-04-09 23:56:47', 24.08),
(3, '2024-03-20 16:54:34', 898.34),
(3, '2024-03-26 22:28:28', 936.14),
(3, '2024-03-29 10:23:33', 418.82),
(3, '2024-03-29 08:25:31', 462.85),
(3, '2024-03-01 02:18:42', 562.00),
(3, '2024-03-04 12:27:34', 30.21),
(3, '2024-03-19 12:12:09', 60.00),
(3, '2024-03-21 00:32:19', 674.76),
(3, '2024-03-23 14:14:31', 463.39),
(3, '2024-04-08 13:37:03', 51.42);

select c.email ,
sum(e.amount) as total_expanses,
sum(i.amount) as total_income
from customers9 c join expenses e
on c.id=e.customer_id
join  income i
on e.customer_id = i.customer_id
where e.dt like '2024-03-%' and i.dt like '2024-03-%'
group by c.email
order by c.email asc;

-- Q30

CREATE TABLE accounts1 (
    id INT PRIMARY KEY,
    iban VARCHAR(255)
);

CREATE TABLE income1 (
    account_id INT,
    dt VARCHAR(19),
    amount DECIMAL(6,2),
    FOREIGN KEY (account_id) REFERENCES accounts1(id)
);


INSERT INTO accounts1 (id, iban) VALUES
(1, 'SK39 8924 2092 2997 1101 4161'),
(2, 'PL28 9141 8610 8442 2367 7521 0000'),
(3, 'CH93 8418 0F7G KQK4 NEHF Q'),
(4, 'GT41 TBM8 DPFH MTNS BVW5 D4CX VIRR'),
(5, 'IT27 Y015 0159 036T W7E5 I6ZD EQZ');


INSERT INTO income1 (account_id, dt, amount) VALUES
(1, '2024-01-17 16:43:20', 4061.53),
(1, '2024-02-28 05:30:15', 4488.11),
(1, '2024-04-07 05:41:27', 4001.91),
(2, '2023-12-21 07:38:45', 4313.69),
(2, '2024-01-08 04:48:45', 3640.82),
(2, '2024-01-20 17:31:20', 3385.15),
(3, '2024-01-06 23:18:30', 2347.15),
(3, '2024-03-08 12:53:20', 3814.86),
(3, '2024-04-01 21:18:16', 2764.27),
(4, '2024-02-05 23:52:06', 3526.08),
(4, '2024-02-04 12:32:28', 2221.91),
(4, '2024-02-11 19:44:53', 4197.07),
(4, '2024-03-06 06:28:34', 1357.44),
(4, '2024-03-16 16:13:49', 1854.52),
(5, '2023-12-31 22:08:57', 2819.54),
(5, '2024-01-14 18:03:47', 2641.20),
(5, '2024-01-23 07:50:22', 3692.56),
(5, '2024-02-28 23:43:28', 1999.09),
(5, '2024-03-20 10:29:44', 1670.18),
(5, '2024-03-27 11:12:04', 1193.15);

select a.iban ,
round(avg (i.amount),2) as average_income,
round(sum(i.amount),2) as total_income
from accounts1 a join income1 i
on a.id=i.account_id 
where i.dt  between '2024-01-01' and '2024-03-31'
group by a.iban
order by avg (i.amount) desc , a.iban asc
limit 3;































