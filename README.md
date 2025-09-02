--31
CREATE TABLE customers (
    id INT PRIMARY KEY,
    email VARCHAR(255)
);

CREATE TABLE expenses (
    customer_id INT,
    amount DECIMAL(6,2)
);

CREATE TABLE income (
    customer_id INT,
    amount DECIMAL(6,2)
);

INSERT INTO customers VALUES
(1, 'dtollmache0@typepad.com'),
(2, 'eclutterbuck1@baidu.com'),
(3, 'mdensun2@ustream.tv');

-- Sample expenses
INSERT INTO expenses VALUES
(1, 136.18), (1, 323.28), (1, 383.37), (1, 505.41), (1, 841.21),
(2, 5.23), (2, 408.33), (2, 489.45), (2, 545.40), (2, 591.43),
(3, 152.26), (3, 211.30), (3, 447.57), (3, 685.03), (3, 966.89),
(1, 136.18),
(1, 323.28),
(1, 383.37),
(1, 505.41),
(1, 841.21),
(2, 5.23),
(2, 408.33),
(2, 489.45),
(2, 545.40),
(2, 591.43),
(2, 706.13),
(2, 716.82),
(2, 761.75),
(2, 796.30),
(3, 152.26),
(3, 211.30),
(3, 447.57),
(3, 685.03),
(3, 966.89),
(3, 967.30);

-- Sample income
INSERT INTO income VALUES
(1, 39.44), (1, 49.49), (1, 292.19), (1, 419.36),
(2, 139.42), (2, 422.18), (2, 506.59), (2, 566.00),
(3, 304.66), (3, 345.03), (3, 371.86), (3, 371.88),
(1, 39.44),
(1, 49.49),
(1, 292.19),
(1, 419.36),
(1, 529.26),
(1, 695.43),
(1, 763.72),
(1, 797.92),
(1, 833.34),
(2, 139.42),
(2, 422.18),
(2, 506.59),
(2, 566.00),
(2, 697.92),
(2, 938.51),
(3, 304.66),
(3, 345.03),
(3, 371.86),
(3, 371.88),
(3, 552.08);


-------------------------------------
--32
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE sales (
    product_id INT,
    dt VARCHAR(19),
    amount DECIMAL(7,2),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
INSERT INTO products VALUES
(1, 'Luxury Gold Watch'),
(2, 'Smartphone Holder Stand'),
(3, 'Stainless Steel Water Bottle');

INSERT INTO sales VALUES
(1, '2024-01-13 17:12:22', 7008.16),
(1, '2024-01-03 03:15:27', 6191.64),
(1, '2024-01-22 18:29:09', 4527.86),
(1, '2024-01-26 19:38:53', 7828.36),
(1, '2024-02-17 09:27:13', 5273.16),
(1, '2024-02-11 09:51:24', 3364.73),
(1, '2024-02-22 23:53:15', 8584.33),
(2, '2024-01-28 11:33:58', 3710.06),
(2, '2024-01-25 14:47:25', 5221.02),
(2, '2024-01-21 07:58:53', 2525.72),
(2, '2024-03-15 14:16:18', 8158.08),
(2, '2024-03-12 17:02:01', 6760.77),
(3, '2024-01-13 19:27:51', 1942.79),
(3, '2024-02-15 08:04:40', 9186.38),
(3, '2024-03-06 08:02:37', 5821.97),
(3, '2024-03-03 15:39:18', 8676.24);
-------------------------------------------------------
--33
CREATE TABLE projects33 (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE employees33 (
    id INT PRIMARY KEY,
    ein VARCHAR(255),
    experience_years INT
);

CREATE TABLE projects_employees (
    project_id INT,
    employee_id INT,
    FOREIGN KEY (project_id) REFERENCES projects33(id),
    FOREIGN KEY (employee_id) REFERENCES employees33(id)
);

INSERT INTO projects33 VALUES
(1, 'Project X'),
(2, 'Sunshine Project'),
(3, 'Blue Sky Initiative');

INSERT INTO employees33 VALUES
(1, '62-0524667', 4),
(2, '62-1435366', 1),
(3, '29-3144922', 1),
(4, '80-9606443', 1),
(5, '63-6630813', 1);

INSERT INTO projects_employees VALUES
(1, 1), (1, 1), (1, 2), (1, 3), (1, 5),
(2, 1), (2, 1), (2, 2), (2, 5),
(3, 1), (3, 1), (3, 2), (3, 3), (3, 3), (3, 4), (3, 4), (3, 5), (3, 5), (3, 5), (3, 5);

SELECT p.name AS project_name,COUNT(*)AS employee_count,
ROUND(AVG(e.experience_years)) AS avg_experience,
CASE
	WHEN COUNT(*)<5 THEN 'YES'
	ELSE 'NO'
END AS is_understaffed FROM projects_employees pe 
JOIN projects33 p ON pe.project_id=p.id
JOIN employees33 e ON pe.employee_id=e.id 
GROUP BY p.name HAVING AVG(e.experience_years)>2
ORDER BY employee_count DESC,project_name ASC;

-----------------------------------------------
--34
CREATE TABLE transactions34 (
    dt VARCHAR(19),
    wallet VARCHAR(255),
    amount DECIMAL(4,2)
);

INSERT INTO transactions34 VALUES
('2024-02-28 06:20:04', '0x1a2b3c4d5e6f7a8b9c0d1e2f3a4b5c', -7.36),
('2024-02-12 07:45:28', '0x1a2b3c4d5e6f7a8b9c0d1e2f3a4b5c', -3.71),
('2024-02-25 10:49:54', '0x1a2b3c4d5e6f7a8b9c0d1e2f3a4b5c', -3.53),
('2024-02-03 19:43:00', '0x1a2b3c4d5e6f7a8b9c0d1e2f3a4b5c', 4.01),
('2024-02-14 08:55:30', '0x1a2b3c4d5e6f7a8b9c0d1e2f3a4b5c', 8.20),
('2024-02-16 04:31:26', '0x3a4FbC5Df2E1bBfDdE5c4fA7bF8dE7aC1F', -8.96),
('2024-02-06 23:45:31', '0x3a4FbC5Df2E1bBfDdE5c4fA7bF8dE7aC1F', -7.88),
('2024-02-11 01:00:35', '0x3a4FbC5Df2E1bBfDdE5c4fA7bF8dE7aC1F', -7.66),
('2024-02-25 09:39:01', '0x3a4FbC5Df2E1bBfDdE5c4fA7bF8dE7aC1F', -7.45),
('2024-02-14 04:04:15', '0x3a4FbC5Df2E1bBfDdE5c4fA7bF8dE7aC1F', 4.17),
('2024-02-15 11:47:23', '0x3a4FbC5Df2E1bBfDdE5c4fA7bF8dE7aC1F', 7.56),
('2024-02-24 14:58:54', '0x9B8aDc2eFf4cC3DdEe5f6a7B8dE9aC1F', -1.45),
('2024-02-18 21:17:24', '0x9B8aDc2eFf4cC3DdEe5f6a7B8dE9aC1F', 1.05),
('2024-02-19 11:12:32', '0x9B8aDc2eFf4cC3DdEe5f6a7B8dE9aC1F', 3.67);
SELECT wallet,COUNT(*) AS total_transactions,
ROUND(SUM(CASE WHEN amount>0 THEN amount ELSE 0 END),2) AS total_bought,
ROUND(SUM(CASE WHEN amount<0 THEN amount ELSE 0 END),2) AS total_sold
 FROM transactions34 WHERE dt LIKE '2024-02%' GROUP BY wallet ORDER BY wallet;
---------------------------------------------------------------------------
--35
CREATE TABLE employees35 (
    id INT PRIMARY KEY,
    email VARCHAR(255)
);

CREATE TABLE leave_records35 (
    employee_id INT,
    leave_dt VARCHAR(19),
    days_taken INT,
    FOREIGN KEY (employee_id) REFERENCES employees35(id)
);
INSERT INTO employees35 VALUES
(1, 'jquartly0@macromedia.com'),
(2, 'cchastand1@stanford.edu'),
(3, 'lpuckrin2@creativecommons.org');
DROP TABLE IF EXISTS leave_records35;

INSERT INTO leave_records35 (employee_id, leave_dt, days_taken) VALUES
(1, '2022-11-10 11:52:14', 4),
(1, '2022-09-07 23:22:46', 1),
(2, '2022-11-11 01:47:50', 7),
(3, '2022-11-06 23:12:27', 7),
(3, '2022-11-17 07:43:18', 7),
(1, '2023-05-19 04:40:25', 2),
(1, '2023-12-25 16:29:51', 7),
(1, '2023-03-12 18:54:29', 1),
(1, '2023-08-23 12:33:56', 6),
(2, '2023-04-20 04:19:10', 5),
(2, '2023-04-28 00:41:50', 7),
(3, '2023-06-11 18:49:25', 2),
(3, '2023-12-23 15:53:10', 7),
(3, '2023-03-13 13:46:16', 2),
(3, '2023-10-08 11:57:43', 2),
(3, '2023-04-12 07:49:02', 4),
(3, '2023-01-17 06:05:35', 6),
(1, '2024-02-05 16:01:59', 1),
(1, '2024-01-05 22:15:30', 7),
(2, '2024-02-21 00:50:11', 4);
SELECT e.email AS email,SUM(l.days_taken)AS leave_days_taken,
CASE
	WHEN SUM(l.days_taken)<20 THEN 'WITHIN LIMIT'
	ELSE 'EXCEEDED'
END
AS leave_status
FROM employees35 e JOIN leave_records35 l 
ON e.id=l.employee_id WHERE l.leave_dt LIKE '2023%'
GROUP BY email ORDER BY email ASC;

-------------------------------------------------
--36
CREATE TABLE campaigns36 (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE email_stats36 (
    campaign_id INT,
    emails_sent INT,
    emails_opened INT,
    FOREIGN KEY (campaign_id) REFERENCES campaigns36(id)
);

INSERT INTO campaigns36 VALUES
(1, 'SummerSale2021'),
(2, 'FallPromo'),
(3, 'WinterWonderland');

INSERT INTO email_stats36 VALUES
(1, 1749, 775), (1, 641, 423), (1, 976, 598), (1, 756, 121),
(1, 975, 107), (1, 752, 367), (1, 1068, 809), (1, 1046, 589),
(1, 1212, 939), (1, 567, 214), (2, 1084, 283), (2, 992, 478),
(2, 1505, 604), (3, 899, 315), (3, 742, 554), (3, 1744, 917),
(3, 1163, 423), (3, 1501, 948), (3, 736, 451), (3, 537, 434);

SELECT c.name AS name,SUM(e.emails_sent)AS total_emails_sent,
SUM(e.emails_opened)AS total_emails_opened,
ROUND(SUM(e.emails_opened)*100.0/SUM(e.emails_sent),2)
AS open_rate FROM campaigns36 c JOIN email_stats36 e
ON c.id=e.campaign_id GROUP BY c.name 
HAVING ROUND(SUM(e.emails_opened)*100.0/SUM(e.emails_sent),2)>50 
ORDER BY open_rate DESC ,name ASC;

---------------------------------
--37
CREATE TABLE bonds37 (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE maturities37 (
    bond_id INT,
    maturity DATE,
    FOREIGN KEY (bond_id) REFERENCES bonds37(id)
);

INSERT INTO bonds37 VALUES
(1, 'Alpha Mortgage Bond'),
(2, 'Beta Mortgage Bond'),
(3, 'Gamma Mortgage Bond');

INSERT INTO maturities37 VALUES
(1, '2024-01-26'), (1, '2024-02-22'), (1, '2024-03-26'), (1, '2024-05-13'),
(1, '2024-07-06'), (1, '2024-08-23'), (1, '2024-09-06'), (1, '2024-11-30'),
(1, '2024-12-30'), (1, '2025-04-30'), (1, '2025-05-03'), (2, '2024-07-25'),
(2, '2024-12-07'), (3, '2023-12-16'), (3, '2024-01-25'), (3, '2024-01-26'),
(3, '2024-05-04'), (3, '2024-10-02'), (3, '2024-12-14'), (3, '2025-01-15');

SELECT b.name AS name,COUNT(*)AS maturity_dates,
AS earliest_maturity,AS latest_maturity,AS avg_maturity
FROM bonds37 b JOIN maturities37 m ON b.id=m.bond_id WHERE m.maturity IN '2023-09-13'
GROUP BY b.name ORDER BY name ASC;
-------------------------------------
--38
CREATE TABLE bonds (
    id INT PRIMARY KEY,       
    name VARCHAR(255)         
);
CREATE TABLE interest_rates (
    bond_id INT,
    rate DECIMAL(2,1),
    FOREIGN KEY (bond_id) REFERENCES bonds(id)
);
INSERT INTO bonds (id, name) VALUES
(1, 'Alpha Mortgage Bond'),
(2, 'Beta Mortgage Bond'),
(3, 'Gamma Mortgage Bond');

INSERT INTO interest_rates VALUES
(1, 1.4), (1, 1.8), (1, 2.0), (1, 2.4), (1, 3.4), (1, 4.6), (1, 4.7), (1, 4.9),
(2, 2.0), (2, 2.1), (2, 3.0), (2, 3.2), (2, 4.0),
(3, 1.2), (3, 1.3), (3, 1.4), (3, 2.1), (3, 2.5), (3, 3.5), (3, 4.0);

SELECT b.name AS name,ROUND(COUNT(i.rate))AS interest_rates,
MIN(i.rate)AS lowest_rate,MAX(i.rate)AS highest_rate,
ROUND(AVG(i.rate),2)AS avg_rate FROM bonds b JOIN interest_rates i 
ON b.id=i.bond_id GROUP BY b.name HAVING AVG(i.rate)>3 
ORDER BY name ASC;

-------------------------------------
--39
CREATE TABLE bondholders (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE bonds39 (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    annual_coupon DECIMAL(5,2),
    coupons_remaining INT
);

CREATE TABLE bondholders_bonds (
    bondholder_id INT,
    bond_id INT,
    FOREIGN KEY (bondholder_id) REFERENCES bondholders(id),
    FOREIGN KEY (bond_id) REFERENCES bonds39(id)
);
INSERT INTO bondholders VALUES
(1, 'Alex Smith'), (2, 'Taylor Johnson'), (3, 'Jordan Davis');

INSERT INTO bonds39 VALUES
(1, 'Golden Bonds', 150.00, 4), (2, 'Silver Lining', 200.00, 2),
(3, 'Diamond Trust', 100.00, 4), (4, 'Emerald Wealth', 350.00, 5),
(5, 'Ruby Returns', 150.00, 8), (6, 'Sapphire Security', 450.00, 5),
(7, 'Amber Assurance', 100.00, 8), (8, 'Topaz Treasury', 100.00, 2),
(9, 'Opal Opportunities', 150.00, 5), (10, 'Pearl Prosperity', 450.00, 5),
(11, 'Platinum Promise', 450.00, 9), (12, 'Jade Investments', 350.00, 1),
(13, 'Garnet Growth', 150.00, 4), (14, 'Onyx Returns', 350.00, 2),
(15, 'Quartz Capital', 100.00, 2), (16, 'Citrine Securities', 250.00, 2),
(17, 'Aquamarine Assets', 250.00, 2), (18, 'Peridot Portfolio', 300.00, 8),
(19, 'Tourmaline Trust', 100.00, 6), (20, 'Moonstone Money', 150.00, 9);

INSERT INTO bondholders_bonds VALUES
(1, 1), (1, 2), (1, 6), (1, 8), (1, 9), (1, 13), (1, 14), (1, 16), (1, 17),
(2, 4), (2, 5), (2, 7), (2, 11), (2, 15), (2, 18),
(3, 3), (3, 10), (3, 12), (3, 19), (3, 20);
SELECT b1.name AS name,
SUM(b2.annual_coupon*b2.coupons_remaining) AS total_cash_flow FROM bondholders_bonds bb
JOIN bondholders b1 ON bb.bondholder_id=b1.id
JOIN bonds39 b2 ON bb.bond_id=b2.id 
GROUP BY b1.name HAVING SUM(b2.annual_coupon*b2.coupons_remaining)>10000 
ORDER BY total_cash_flow DESC;
----------------------------------------
--40
CREATE TABLE investors (
    id INT PRIMARY KEY,
    email VARCHAR(255) UNIQUE
);

CREATE TABLE cash_flows (
    investor_id INT,
    cash_flow DECIMAL(8,2),
    FOREIGN KEY (investor_id) REFERENCES investors(id)
);
INSERT INTO investors VALUES
(1, 'ematson0@ebay.co.uk'),
(2, 'lsalvadore1@msn.com'),
(3, 'aclowser2@patch.com');
DROP TABLE IF EXISTS cash_flows;
INSERT INTO cash_flows (investor_id, cash_flow) VALUES
(1, 184040.12),
(1, 179280.08),
(1, 179374.42),
(1, 79302.21),
(1, 87466.20),
(1, 194588.36),
(1, 153563.92),
(1, 56377.92),
(2, 59039.14),
(2, 167247.23),
(2, 59311.03),
(2, 183883.00),
(2, 118851.21),
(3, 58868.62),
(3, 96909.26),
(3, 103735.73),
(3, 171261.97),
(3, 86463.11),
(3, 56931.73),
(3, 194699.58);

SELECT i.email AS email,COUNT(*)AS investments,
MIN(c.cash_flow)AS min_cash_flow,MAX(c.cash_flow)AS max_cash_flow,
ROUND(AVG(c.cash_flow),2)AS avg_cash_flow FROM investors i JOIN cash_flows c
ON i.id=c.investor_id GROUP BY email 
HAVING SUM(c.cash_flow)>1000000 ORDER BY email ASC;
----------------------------------------------------

-- 41
SELECT i.email AS email,
COUNT(*)AS investment_count,SUM(c.expected_flow)AS total_expected_flow,
AS range_expected_flow FROM investors i
JOIN cash_flows c ON i.id=c.investor_id
GROUP BY email HAVING  SUM(c.expected_flow)>100000
ORDER BY email ASC;

-- 42
SELECT AS coupon_code,c.description AS description,
COUNT(*)AS total_uses,MIN(cu.amount)AS min_discount,
MAX(cu.amount)AS max_discount,AVG(cu.amount)AS avg_discount 
FROM coupons c
JOIN coupon_uses cu ON c.id=cu.coupon_id 
WHERE c.is_enabled =1
GROUP BY coupon_code
ORDER BY coupon_code ASC;

-- 43
SELECT AS title,COUNT(p1.id)AS total_projects,
SUM(p1.income)AS total_income,COUNT(f.id)AS total_feeelancers,
AS average_income_per_freelancer FROM freelancers f
JOIN professions p ON p.id=f.profession_id 
JOIN projects p1 ON f.profession_id=p1.freelancer_id
GROUP BY title
ORDER BY total_income DESC;

-- 44
SELECT p.name AS category,c.title AS title,SUM(p.stock_number) AS total_stock 
FROM categories c JOIN products p
ON c.id=p.category_id GROUP BY p.name HAVING SUM(p.stock_number)>10
ORDER BY category ASC,title ASC,total_stock DESC;
-- 45

SELECT q.domain_name AS domain_name,t.threat_type AS threat_type,
COUNT(*)AS total_occurrences,SUM(q.users_affected)AS total_users_affected
FROM threat_types t JOIN quarantine_urls q
ON t.id=q.threat_id 
GROUP BY t.threat_type ORDER BY total_users_affected DESC;

-- 46
SELECT c.mac_address AS mac_address,
COUNT(s.client_id) AS streams_total,SUM(s.traffic)AS total_traffic
FROM clients c JOIN streams s ON c.id=s.client_id
WHERE s.quality IN('720p','1080p','1440p','2160p') 
GROUP BY mac_address
ORDER BY total_traffic DESC;

-- 47

-- 50
SELECT a.username AS username,a.email AS email,
MAX(t.cost)AS highest_traffic,SUM(r.amount)AS consumption,SUM(t.cost)AS total_cost
FROM readings50 r JOIN traffis50 t ON r.account_id=t.id
JOIN accounts50 a ON r.traffic_id=a.id GROUP BY username 
HAVING SUM(r.amount)=SUM(t.cost)
ORDER BY username ASC;
-- 51
SELECT a.username AS username,a.email AS email,
COUNT(*)AS items,SUM(i.weight)AS total_weight
FROM accounts_items ai JOIN accounts a ON ai.account_id=a.id
JOIN items i ON ai.item_id=i.id GROUP BY a.username
ORDER BY total_weight DESC
,username ASC;

-- 52
SELECT c.name AS city,COUNT(*) AS banner,MIN()AS min_area,
AVG()AS avg_area,MAX()AS max_area,SUM()AS total_area
FROM cities c JOIN banners b ON c.id=b.city_id
ORDER BY city ASC;

-- 53
SELECT AS name,COUNT(*)AS offers,ROUND(MIN(o.amount),2)AS min_offer,
ROUND(AVG(o.amount),2)AS avg_offer,ROUND(MAX(o.amount),2)AS max_offer
FROM lots l JOIN offers o ON l.id=o.lot_id
GROUP BY name
ORDER BY offers DESC;

-- 54
SELECT CONCAT(a.first_name,a.last_name) AS full_name ,
a.iban AS iban , SUM(d.income)AS income,'10%'AS rate,
SUM(d.income*0.10)AS tax
FROM accounts a JOIN declarations d
ON a.id=d.account_id 
GROUP BY a.iban ORDER BY full_name ASC;
-- 55

SELECT CONCAT(p.first_name,p.last_name) AS full_name ,
p.email AS email , AS total_relations,
SUM(
CASE 
	WHEN r.is_approved IS TRUE THEN 1
	ELSE 0
END
)AS approved_relations,
SUM(
CASE 
	WHEN r.is_approved IS FALSE THEN 1
	ELSE 0
END
)
AS pending_relations
FROM accounts a JOIN declarations d
ON a.id=d.account_id 
GROUP BY a.iban ORDER BY full_name ASC;

-- 56
SELECT AS iban,COUNT(*)AS transactions,SUM(t.amount)AS total
FROM accounts a JOIN transactions t
ON a.id=t.account_id WHERE MONTHNAME(t.dt)='september'
GROUP BY a.iban ORDER BY total DESC;

-- 57
SELECT c.mac AS mac,COUNT(*)AS traffic,SUM(t.amount)AS cost 
FROM clients c JOIN traffic t ON c.id=t.client_id
WHERE t.dt LIKE '2022-05%'
GROUP BY mac 
ORDER BY cost DESC;

-- 58
SELECT c.name AS name,c.address AS address,c.phone AS phone
,AS overall_review_rating
FROM companies c JOIN categories t ON c.id=t.company_id

GROUP BY 
ORDER BY cost DESC; 

-- 59
SELECT AS username,AS domains,AS nearest_expiration
FROM accounts a JOIN domains d ON a.id=d.account_id
WHERE d.expiration_date LIKE '2022-07-15'
GROUP BY a.id,a.username
ORDER BY username ASC;

-- 60
SELECT AS campaign, COUNT(*)AS events,AVG(e.value)AS average_value
FROM campaign c JOIN events e ON c.id=e.campaign_id
WHERE DATE(e.dt)='2022-07-15' 
GROUP BY c.id,c.name HAVING AVG(e.value)>=0.7 
ORDER BY average_value DESC;

-- 61
SELECT SUM(d.amount)AS total FROM profiles p 
JOIN deals d ON p.id=d.profile_id
WHERE d.dt LIKE '2022-06' GROUP BY p.id ORDER BY total DESC LIMIT 3;

-- 62
SELECT p.first_name AS first_name,p.last_name AS last_name,
p.email AS email,
SUM(s.job_success_score)AS job_success_score
FROM profiles p JOIN stats s ON p.id=s.profile_id
GROUP BY p.id HAVING SUM(s.job_success_score)>90
ORDER BY job_success_score DESC,first_name ASC,last_name ASC;

-- 63
SELECT c.name AS configuration,COUNT(*)AS deployments
FROM configurations c JOIN deployments d
ON c.id=d.configuration_id
WHERE d.dt LIKE '2021%' GROUP BY c.id ORDER BY deployments DESC;

-- 64
SELECT COUNT(*) AS purchases  FROM events 
WHERE e.dt LIKE '2022-05%' AND type='buy'
GROUP BY type;
-- 65
SELECT AS company_name,SUM(c.revenue)-SUM(c.expenses)AS profit
FROM companies c JOIN campaigns t
ON c.id=t.company_id GROUP BY c.id,c.name 
HAVING SUM(c.revenue)-SUM(c.expenses)>0
ORDER BY profit DESC;

-- 66
SELECT AS mac,AS upstream_rate,AS downstream_rate,AS downtime_rate
FROM clients c JOIN 





-- 70
SELECT AS ,AS ,AS FROM JOIN ON 

-- 71
SELECT c.customer_name AS customer_name,
SUM(o.order_amount)AS total_fees FROM customers71 c JOIN orders71 o 
ON c.id=o.customer_id
ORDER BY customer_name ASC;

-- 72
SELECT c.customer_name AS full_name,
SUM(o.order_amount)AS dues FROM credit_holders72 c 
JOIN transactions71 t 
ON c.id=t.transaction_id
ORDER BY customer_name ASC;

-- 73
SELECT  account_holder,
AS interest FROM accounts73 a 
ORDER BY customer_name ASC;
-- 74
SELECT AS year,
AS month FROM transactions74 t 
ON c.id=t.transaction_id
ORDER BY year ASC,month ASC;
-- 75
SELECT CONCAT(first_name,last_name)AS full_name,
AS average_gpa FROM results75 r
-- 76
SELECT AS month,AS fund_name,AS total_investments 
FROM funds76 
-- 77
SELECT protocol ,traffic_in,traffic_out FROM traffic77 








