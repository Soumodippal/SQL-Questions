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
CREATE TABLE projects (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    ein VARCHAR(255),
    experience_years INT
);

CREATE TABLE projects_employees (
    project_id INT,
    employee_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(id),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

INSERT INTO projects VALUES
(1, 'Project X'),
(2, 'Sunshine Project'),
(3, 'Blue Sky Initiative');

INSERT INTO employees VALUES
(1, '62-0524667', 4),
(2, '62-1435366', 1),
(3, '29-3144922', 1),
(4, '80-9606443', 1),
(5, '63-6630813', 1);

INSERT INTO projects_employees VALUES
(1, 1), (1, 1), (1, 2), (1, 3), (1, 5),
(2, 1), (2, 1), (2, 2), (2, 5),
(3, 1), (3, 1), (3, 2), (3, 3), (3, 3), (3, 4), (3, 4), (3, 5), (3, 5), (3, 5), (3, 5);

-----------------------------------------------
--34
CREATE TABLE transactions (
    dt VARCHAR(19),
    wallet VARCHAR(255),
    amount DECIMAL(4,2)
);

INSERT INTO transactions VALUES
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
---------------------------------------------------------------------------
--35
CREATE TABLE employees (
    id INT PRIMARY KEY,
    email VARCHAR(255)
);

CREATE TABLE leave_records (
    employee_id INT,
    leave_dt VARCHAR(19),
    days_taken INT,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);
INSERT INTO employees VALUES
(1, 'jquartly0@macromedia.com'),
(2, 'cchastand1@stanford.edu'),
(3, 'lpuckrin2@creativecommons.org');

INSERT INTO leave_records VALUES
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
(1, '2024-01-05 22:15:30', 7),
(1, '2024-02-05 16:01:59', 1);
-------------------------------------------------
--36
CREATE TABLE campaigns (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE email_stats (
    campaign_id INT,
    emails_sent INT,
    emails_opened INT,
    FOREIGN KEY (campaign_id) REFERENCES campaigns(id)
);

INSERT INTO campaigns VALUES
(1, 'SummerSale2021'),
(2, 'FallPromo'),
(3, 'WinterWonderland');

INSERT INTO email_stats VALUES
(1, 1749, 775), (1, 641, 423), (1, 976, 598), (1, 756, 121),
(1, 975, 107), (1, 752, 367), (1, 1068, 809), (1, 1046, 589),
(1, 1212, 939), (1, 567, 214), (2, 1084, 283), (2, 992, 478),
(2, 1505, 604), (3, 899, 315), (3, 742, 554), (3, 1744, 917),
(3, 1163, 423), (3, 1501, 948), (3, 736, 451), (3, 537, 434);
---------------------------------
--37
CREATE TABLE bonds (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE maturities (
    bond_id INT,
    maturity DATE,
    FOREIGN KEY (bond_id) REFERENCES bonds(id)
);

INSERT INTO bonds VALUES
(1, 'Alpha Mortgage Bond'),
(2, 'Beta Mortgage Bond'),
(3, 'Gamma Mortgage Bond');

INSERT INTO maturities VALUES
(1, '2024-01-26'), (1, '2024-02-22'), (1, '2024-03-26'), (1, '2024-05-13'),
(1, '2024-07-06'), (1, '2024-08-23'), (1, '2024-09-06'), (1, '2024-11-30'),
(1, '2024-12-30'), (1, '2025-04-30'), (1, '2025-05-03'), (2, '2024-07-25'),
(2, '2024-12-07'), (3, '2023-12-16'), (3, '2024-01-25'), (3, '2024-01-26'),
(3, '2024-05-04'), (3, '2024-10-02'), (3, '2024-12-14'), (3, '2025-01-15');
-------------------------------------
--38
CREATE TABLE interest_rates (
    bond_id INT,
    rate DECIMAL(2,1),
    FOREIGN KEY (bond_id) REFERENCES bonds(id)
);

INSERT INTO interest_rates VALUES
(1, 1.4), (1, 1.8), (1, 2.0), (1, 2.4), (1, 3.4), (1, 4.6), (1, 4.7), (1, 4.9),
(2, 2.0), (2, 2.1), (2, 3.0), (2, 3.2), (2, 4.0),
(3, 1.2), (3, 1.3), (3, 1.4), (3, 2.1), (3, 2.5), (3, 3.5), (3, 4.0);
-------------------------------------
--39
CREATE TABLE bondholders (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE bonds (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    annual_coupon DECIMAL(5,2),
    coupons_remaining INT
);

CREATE TABLE bondholders_bonds (
    bondholder_id INT,
    bond_id INT,
    FOREIGN KEY (bondholder_id) REFERENCES bondholders(id),
    FOREIGN KEY (bond_id) REFERENCES bonds(id)
);
INSERT INTO bondholders VALUES
(1, 'Alex Smith'), (2, 'Taylor Johnson'), (3, 'Jordan Davis');

INSERT INTO bonds VALUES
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

INSERT INTO cash_flows VALUES
(1, 184040.12), (1, 179280.08), (1, 179374.42), (1, 79302.21),
(1, 87466.20), (1, 194588.36), (1, 153563.92), (1, 56377.92),
(2, 59039.00), (2, 120000.00), (2, 134000.00), (2, 145000.00),
(3, 100000.00), (3, 110000.00), (3, 120000.00),
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
(3, 194699.58)
(3,103735.73);
----------------------------------------------------
